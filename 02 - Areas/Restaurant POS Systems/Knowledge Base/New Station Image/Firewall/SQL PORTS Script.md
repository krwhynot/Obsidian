```powershell
# SQL Server Connection Diagnostic Script (Console Output Only)
# Purpose: Collect logs and information to diagnose why SQL Server is accessible on Private networks but not on Public networks
# Usage: Run this script with administrator privileges to collect detailed diagnostics

# Set variables
$SQLInstanceName = "Revent1\REVENTION"
$LogTimeFrame = (Get-Date).AddHours(-12) # Last 12 hours
$FirewallLogPath = "$env:SystemRoot\System32\LogFiles\Firewall\pfirewall.log"

function Write-SectionHeader {
    param($Title, $Number, $Total)
    
    Write-Host "`n=========================================================" -ForegroundColor Cyan
    Write-Host "[$Number/$Total] $Title" -ForegroundColor Cyan
    Write-Host "=========================================================" -ForegroundColor Cyan
}

function Write-SubHeader {
    param($Title)
    
    Write-Host "`n--- $Title ---" -ForegroundColor Yellow
}

Write-Host "Starting SQL Server connection diagnostics..." -ForegroundColor Cyan
Write-Host "This script will display all diagnostics directly in the console" -ForegroundColor Yellow

# Section 1: Gather basic system and SQL information
Write-SectionHeader -Title "Gathering system and SQL Server information" -Number 1 -Total 6

# Network connection profiles
Write-SubHeader -Title "Network Connection Profiles"
$networkProfiles = Get-NetConnectionProfile
$networkProfiles | Format-Table -Property InterfaceAlias, NetworkCategory, Name -AutoSize
Write-Host "Found $($networkProfiles.Count) network connection(s)"

# SQL Server configuration
Write-SubHeader -Title "SQL Server Network Configuration"
try {
    # Get SQL Server network protocol information using PowerShell's SQL provider (requires SQLPS module)
    Import-Module SQLPS -ErrorAction SilentlyContinue
    if (-not (Get-Module SQLPS)) {
        Write-Host "SQL Server PowerShell module not found, trying to use direct WMI instead" -ForegroundColor Yellow
        
        # Alternative method using WMI
        $path = "SQLSERVER:\SQL\$SQLInstanceName\DEFAULT\Protocols"
        if (Test-Path $path) {
            $protocols = Get-ChildItem $path | ForEach-Object {
                $protocol = $_
                [PSCustomObject]@{
                    ProtocolName = $protocol.Name
                    Enabled = $protocol.IsEnabled
                    Properties = $protocol | Get-ChildItem | Select-Object Name, Value
                }
            }
            $protocols | Format-List
        } else {
            Write-Host "Could not access SQL Server WMI provider, check if SQL Server Management tools are installed" -ForegroundColor Red
        }
    } else {
        # Using SQLPS module
        $path = "SQLSERVER:\SQL\$SQLInstanceName\DEFAULT\Protocols"
        $protocols = Get-ChildItem $path | ForEach-Object {
            $protocol = $_
            [PSCustomObject]@{
                ProtocolName = $protocol.Name
                Enabled = $protocol.IsEnabled
                Properties = $protocol | Get-ChildItem | Select-Object Name, Value
            }
        }
        $protocols | Format-List
    }
} catch {
    Write-Host "Error accessing SQL Server configuration: $_" -ForegroundColor Red
    # Fallback to checking TCP port using netstat
    Write-Host "Attempting to check SQL Server port using netstat..." -ForegroundColor Yellow
    $netstat = netstat -ano | Select-String -Pattern "LISTENING" | Select-String -Pattern "1433"
    $netstat | Format-Table
}

# Section 2: Checking Windows Firewall configuration
Write-SectionHeader -Title "Checking Windows Firewall configuration" -Number 2 -Total 6
$firewallRules = Get-NetFirewallRule -DisplayGroup "*SQL*" | Where-Object { $_.Enabled -eq $true }
if ($firewallRules.Count -eq 0) {
    Write-Host "No SQL Server firewall rules found. Checking for port 1433 rules..." -ForegroundColor Yellow
    $firewallRules = Get-NetFirewallRule | Where-Object {
        ($_.Enabled -eq $true) -and 
        (Get-NetFirewallPortFilter -AssociatedNetFirewallRule $_).LocalPort -eq 1433
    }
}

# Get detailed firewall rule information
$firewallRuleDetails = $firewallRules | ForEach-Object {
    $rule = $_
    $portFilter = $rule | Get-NetFirewallPortFilter
    $addressFilter = $rule | Get-NetFirewallAddressFilter
    [PSCustomObject]@{
        Name = $rule.Name
        DisplayName = $rule.DisplayName
        Enabled = $rule.Enabled
        Direction = $rule.Direction
        Action = $rule.Action
        Profile = $rule.Profile
        Protocol = $portFilter.Protocol
        LocalPort = $portFilter.LocalPort
        RemotePort = $portFilter.RemotePort
        RemoteAddress = $addressFilter.RemoteAddress
    }
}

Write-SubHeader -Title "SQL Server Firewall Rules"
$firewallRuleDetails | Format-Table -AutoSize
Write-Host "Found $($firewallRules.Count) SQL Server related firewall rules"

# Check if logging is enabled and log file exists
Write-SubHeader -Title "Windows Firewall Logging Configuration"
$firewallLogging = Get-NetFirewallProfile | Select-Object Name, LogAllowed, LogBlocked, LogMaxSize, LogFileName
$firewallLogging | Format-Table -AutoSize

$loggingEnabled = $firewallLogging | Where-Object { $_.LogBlocked -eq $true -or $_.LogAllowed -eq $true }
if ($loggingEnabled.Count -eq 0) {
    Write-Host "Windows Firewall logging is not enabled for any profiles" -ForegroundColor Yellow
    Write-Host "Consider enabling logging for troubleshooting with this command:" -ForegroundColor Yellow
    Write-Host "Get-NetFirewallProfile | Set-NetFirewallProfile -LogBlocked True -LogAllowed True" -ForegroundColor White
} else {
    Write-Host "Windows Firewall logging is enabled for $($loggingEnabled.Count) profile(s)"
}

# Section 3: Extract Windows Firewall logs if they exist
Write-SectionHeader -Title "Extracting Windows Firewall logs" -Number 3 -Total 6
$firewallLogPaths = $firewallLogging | Select-Object -ExpandProperty LogFileName -Unique
foreach ($logPath in $firewallLogPaths) {
    if ([string]::IsNullOrEmpty($logPath)) { continue }
    if (Test-Path $logPath) {
        Write-SubHeader -Title "Firewall Log: $logPath"
        
        # Extract relevant entries (last 1000 lines to avoid huge output, then filter for SQL related entries)
        $logContent = Get-Content -Path $logPath -Tail 1000
        $sqlRelatedEntries = $logContent | Where-Object {
            $_ -match "TCP" -and ($_ -match "1433" -or $_ -match "SQL" -or $_ -match $SQLInstanceName)
        }
        
        if ($sqlRelatedEntries.Count -gt 0) {
            Write-Host "Found $($sqlRelatedEntries.Count) SQL Server related entries in the firewall log:"
            $sqlRelatedEntries | ForEach-Object { Write-Host $_ -ForegroundColor White }
        } else {
            Write-Host "No SQL Server related entries found in the firewall log" -ForegroundColor Yellow
            
            # If no SQL entries were found, show the last 20 DROP entries which might be relevant
            $dropEntries = $logContent | Where-Object { $_ -match "DROP" } | Select-Object -First 20
            if ($dropEntries.Count -gt 0) {
                Write-Host "Found $($dropEntries.Count) recent DROP entries from the firewall log:"
                $dropEntries | ForEach-Object { Write-Host $_ }
            }
        }
    } else {
        Write-Host "Firewall log file not found at: $logPath" -ForegroundColor Yellow
    }
}

# Section 4: Extract SQL Server error logs
Write-SectionHeader -Title "Extracting SQL Server error logs" -Number 4 -Total 6
try {
    # Try to get SQL error log using xp_readerrorlog if possible
    # This method requires SQL connectivity, which might not be possible if the issue is active
    $connectionString = "Server=$SQLInstanceName;Database=master;Integrated Security=True;Connect Timeout=5;"
    $connection = New-Object System.Data.SqlClient.SqlConnection($connectionString)
    
    try {
        $connection.Open()
        Write-Host "Successfully connected to SQL Server, extracting SQL logs..." -ForegroundColor Green
        
        Write-SubHeader -Title "SQL Server Error Log Entries"
        $command = $connection.CreateCommand()
        $command.CommandText = "EXEC xp_readerrorlog 0, 1, N'error', NULL, N'$($LogTimeFrame.ToString("yyyy-MM-dd HH:mm:ss"))', NULL, N'desc'"
        
        $adapter = New-Object System.Data.SqlClient.SqlDataAdapter($command)
        $dataset = New-Object System.Data.DataSet
        $adapter.Fill($dataset) | Out-Null
        
        $sqlErrors = $dataset.Tables[0]
        $sqlErrors | Format-Table -AutoSize
        Write-Host "Extracted $($sqlErrors.Rows.Count) error entries from SQL Server log"
        
        # Check for login failures specifically
        Write-SubHeader -Title "SQL Server Login-Related Entries"
        $command.CommandText = "EXEC xp_readerrorlog 0, 1, N'login', NULL, N'$($LogTimeFrame.ToString("yyyy-MM-dd HH:mm:ss"))', NULL, N'desc'"
        $adapter = New-Object System.Data.SqlClient.SqlDataAdapter($command)
        $dataset = New-Object System.Data.DataSet
        $adapter.Fill($dataset) | Out-Null
        
        $loginErrors = $dataset.Tables[0]
        $loginErrors | Format-Table -AutoSize
        Write-Host "Extracted $($loginErrors.Rows.Count) login-related entries from SQL Server log"
        
        $connection.Close()
    } catch {
        Write-Host "Could not connect to SQL Server: $_" -ForegroundColor Red
        
        # Alternative: Find SQL error logs directly in file system
        Write-Host "Attempting to locate SQL Server error logs in the file system..." -ForegroundColor Yellow
        $possibleLogFolders = @(
            "$env:ProgramFiles\Microsoft SQL Server",
            "${env:ProgramFiles(x86)}\Microsoft SQL Server",
            "C:\Program Files\Microsoft SQL Server",
            "C:\Program Files (x86)\Microsoft SQL Server"
        )
        
        $errorLogFound = $false
        foreach ($baseFolder in $possibleLogFolders) {
            if (-not (Test-Path $baseFolder)) { continue }
            
            $logFiles = Get-ChildItem -Path $baseFolder -Recurse -Filter "ERRORLOG" -ErrorAction SilentlyContinue | 
                Where-Object { $_.DirectoryName -match "MSSQL" }
            
            if ($logFiles.Count -gt 0) {
                Write-Host "Found $($logFiles.Count) SQL Server error log files"
                
                foreach ($logFile in $logFiles) {
                    Write-SubHeader -Title "SQL Error Log: $($logFile.FullName)"
                    $logContent = Get-Content -Path $logFile.FullName -ErrorAction SilentlyContinue |
                        Where-Object { $_ -match "error|login|fail|denied|network|connect" }
                    
                    if ($logContent.Count -gt 0) {
                        Write-Host "Extracted $($logContent.Count) relevant entries:"
                        $logContent | Select-Object -First 50 | ForEach-Object { Write-Host $_ }
                        if ($logContent.Count -gt 50) {
                            Write-Host "... additional entries truncated ..." -ForegroundColor Yellow
                        }
                        $errorLogFound = $true
                    }
                }
            }
        }
        
        if (-not $errorLogFound) {
            Write-Host "Could not locate SQL Server error logs in the file system" -ForegroundColor Red
        }
    }
} catch {
    Write-Host "Error extracting SQL Server logs: $_" -ForegroundColor Red
}

# Section 5: Extract relevant Windows Event logs
Write-SectionHeader -Title "Extracting relevant Windows Event logs" -Number 5 -Total 6

# Define event log filters
$filters = @(
    # System log with relevant SQL and network errors
    @{LogName = 'System'; Level = @(1, 2, 3); ProviderName = @('*SQL*', 'Microsoft-Windows-Security-Netlogon', 'Microsoft-Windows-NetworkProfile', 'Microsoft-Windows-Firewall*'); StartTime = $LogTimeFrame},
    # Application log with SQL Server errors
    @{LogName = 'Application'; Level = @(1, 2, 3); ProviderName = @('*SQL*', 'MSSQLSERVER', 'SQLServerAgent'); StartTime = $LogTimeFrame},
    # Security log with logon failures
    @{LogName = 'Security'; ID = @(4625, 4624, 4634, 18456); StartTime = $LogTimeFrame}
)

foreach ($filter in $filters) {
    try {
        Write-SubHeader -Title "Event Log: $($filter.LogName)"
        $events = Get-WinEvent -FilterHashtable $filter -ErrorAction SilentlyContinue -MaxEvents 100
        
        if ($events -and $events.Count -gt 0) {
            # Format events for better readability
            $formattedEvents = $events | ForEach-Object {
                [PSCustomObject]@{
                    TimeCreated = $_.TimeCreated
                    ID = $_.Id
                    Level = $_.LevelDisplayName
                    Provider = $_.ProviderName
                    Message = ($_.Message -replace "`r`n", " " -replace "\s+", " ").Substring(0, [Math]::Min(100, ($_.Message -replace "`r`n", " " -replace "\s+", " ").Length)) + "..."
                }
            }
            
            $formattedEvents | Format-Table -AutoSize
            Write-Host "Extracted $($events.Count) events from $($filter.LogName) log"
            
            if ($events.Count -eq 100) {
                Write-Host "Results limited to 100 events. Use Get-WinEvent for more detailed analysis." -ForegroundColor Yellow
            }
        } else {
            Write-Host "No relevant events found in the $($filter.LogName) log" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "Error extracting $($filter.LogName) events: $_" -ForegroundColor Red
    }
}

# Section 6: Network connectivity tests
Write-SectionHeader -Title "Running network connectivity tests" -Number 6 -Total 6

# Extract SQL Server instance parts
if ($SQLInstanceName -match "\\") {
    $serverName = $SQLInstanceName.Split("\")[0]
    $instanceName = $SQLInstanceName.Split("\")[1]
} else {
    $serverName = $SQLInstanceName
    $instanceName = "MSSQLSERVER" # Default instance
}

# Check if it's a local or remote server
$isLocalServer = $serverName -eq "localhost" -or $serverName -eq "." -or $serverName -eq $env:COMPUTERNAME
Write-Host "SQL Server: $serverName, Instance: $instanceName, Location: $(if($isLocalServer){"Local"}else{"Remote"})" -ForegroundColor White

# Run basic network tests
if (-not $isLocalServer) {
    # Test basic connectivity
    Write-SubHeader -Title "Testing network connectivity to SQL Server host"
    $pingResults = Test-Connection -ComputerName $serverName -Count 4 -ErrorAction SilentlyContinue
    if ($pingResults) {
        $pingStats = $pingResults | Measure-Object -Property ResponseTime -Average -Maximum -Minimum
        $pingInfo = [PSCustomObject]@{
            TargetServer = $serverName
            Successful = $pingResults.Count
            Failed = 4 - $pingResults.Count
            MinimumResponseTime = $pingStats.Minimum
            AverageResponseTime = $pingStats.Average
            MaximumResponseTime = $pingStats.Maximum
        }
        $pingInfo | Format-List
        Write-Host "Ping test successful, average response time: $($pingStats.Average)ms" -ForegroundColor Green
    } else {
        Write-Host "Ping test failed, server is not responding" -ForegroundColor Red
    }
    
    # Test port 1433 connectivity
    Write-SubHeader -Title "Testing TCP port 1433 connectivity"
    $tcpTest = New-Object System.Net.Sockets.TcpClient
    try {
        $portConnect = $tcpTest.BeginConnect($serverName, 1433, $null, $null)
        $wait = $portConnect.AsyncWaitHandle.WaitOne(1000, $false)
        if ($wait) {
            $tcpTest.EndConnect($portConnect)
            Write-Host "TCP port 1433 is open and accessible" -ForegroundColor Green
        } else {
            Write-Host "TCP port 1433 is NOT accessible" -ForegroundColor Red
        }
    } catch {
        Write-Host "Error testing port 1433: $_" -ForegroundColor Red
    } finally {
        $tcpTest.Close()
    }
}

# Get current network profile settings and provide command to change if needed
Write-SectionHeader -Title "Network Profile Settings and Change Commands" -Number "✓" -Total 6
Write-SubHeader -Title "Current Network Profile Settings"
$networkProfiles | Format-Table -Property InterfaceAlias, NetworkCategory, Name -AutoSize

Write-SubHeader -Title "Commands to change Network Profile"
foreach ($profile in $networkProfiles) {
    Write-Host "To change $($profile.Name) ($($profile.InterfaceAlias)) to Private:" -ForegroundColor Yellow
    Write-Host "Set-NetConnectionProfile -InterfaceAlias '$($profile.InterfaceAlias)' -NetworkCategory Private" -ForegroundColor White
    
    Write-Host "To change $($profile.Name) ($($profile.InterfaceAlias)) to Public:" -ForegroundColor Yellow
    Write-Host "Set-NetConnectionProfile -InterfaceAlias '$($profile.InterfaceAlias)' -NetworkCategory Public" -ForegroundColor White
    Write-Host ""
}

# Display summary
Write-SectionHeader -Title "Diagnostic Summary" -Number "✓" -Total 6

Write-Host "Network Profile Analysis:" -ForegroundColor Cyan
foreach ($profile in $networkProfiles) {
    Write-Host "- $($profile.InterfaceAlias): $($profile.NetworkCategory)" -ForegroundColor White
    if ($profile.NetworkCategory -eq "Public") {
        Write-Host "  This Public network profile may be blocking SQL Server connections" -ForegroundColor Yellow
    }
}

Write-Host "`nFirewall Rules Analysis:" -ForegroundColor Cyan
$publicRules = $firewallRuleDetails | Where-Object { $_.Profile -match "Public" }
$privateRules = $firewallRuleDetails | Where-Object { $_.Profile -match "Private" }

if ($publicRules.Count -eq 0) {
    Write-Host "- WARNING: No SQL Server firewall rules for Public profiles found" -ForegroundColor Red
    Write-Host "  This is likely why SQL Server cannot be accessed on Public networks" -ForegroundColor Red
} else {
    Write-Host "- Public profile rules found: $($publicRules.Count)" -ForegroundColor Green
}

if ($privateRules.Count -eq 0) {
    Write-Host "- WARNING: No SQL Server firewall rules for Private profiles found" -ForegroundColor Red
} else {
    Write-Host "- Private profile rules found: $($privateRules.Count)" -ForegroundColor Green
}

Write-Host "`nRecommended actions:" -ForegroundColor Cyan
Write-Host "1. Add SQL Firewall Rules for Public Profile:" -ForegroundColor Yellow
Write-Host "   New-NetFirewallRule -DisplayName 'SQL Server Public Access' -Direction Inbound -Protocol TCP -LocalPort 1433 -Action Allow -Profile Public" -ForegroundColor White

Write-Host "`n2. Change Network Profile to Private (if appropriate for your environment):" -ForegroundColor Yellow
Write-Host "   Get-NetConnectionProfile | Set-NetConnectionProfile -NetworkCategory Private" -ForegroundColor White

Write-Host "`n3. Enable SQL Browser Service (for named instances):" -ForegroundColor Yellow
Write-Host "   Set-Service -Name 'SQLBrowser' -StartupType Automatic" -ForegroundColor White
Write-Host "   Start-Service -Name 'SQLBrowser'" -ForegroundColor White

Write-Host "`nDiagnostics completed. Based on the output above, you should be able to identify and resolve the connection issue." -ForegroundColor Green
```