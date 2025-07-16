**. SQL Query Method in `InstallXpertTool.ps1`**

The relevant section is within the `$button_OrderHistory_Click` event handler (lines 2547-2575). This handler prompts the user for an order number (`OrdNum`) and a business date (`BizDate`), then executes three SQL queries to gather order information.

The `Invoke-SQLButtonClick` function (lines 1695-1744) is responsible for connecting to the SQL Server and executing these queries. The actual SQL queries are defined as follows:

```powershell
# From InstallXpert/InstallXpertTool.ps1:2564
$queries = @(
    "SELECT O.*,OT.OrderTypeCategory FROM Ord O LEFT JOIN ORDTYPE OT ON OT.OrdType=O.OrdType WHERE BizDate = '$BizDate' AND OrdNumber = $OrdNum",
    "SELECT * FROM OrdItem WHERE BizDate = '$BizDate' AND OrdNumber = $OrdNum ORDER BY OrdItemNumber",
    "SELECT [OrdStageTimeKey], [BizDate], [OrdNum], [OrdType], [Stage], [StartTime], [EndTime], [EntSync], [SyncStatus], [EntID] FROM [dbo].[OrdStageTime] WHERE [OrdNum] = $OrdNum AND [BizDate] = '$BizDate'"
)
```



These queries retrieve:

- Basic order information from the `Ord` table, joined with `ORDTYPE` for order category.
- Details of items within the order from the `OrdItem` table.
- Stage and time information for the order from the `OrdStageTime` table.

**2. Separate Query for SSMS 2025**

To get the same information in SSMS 2025, you can combine these queries into a single script. You'll need to declare variables for `@OrdNum` and `@BizDate` at the beginning of the script.

```sql
-- Declare variables for Order Number and Business Date
DECLARE @OrdNum INT = 25; -- Replace with your desired Order Number
DECLARE @BizDate DATE = '2023-10-01'; -- Replace with your desired Business Date (YYYY-MM-DD)

-- Query 1: Basic Order Information
SELECT
    O.*,
    OT.OrderTypeCategory
FROM
    Ord O
LEFT JOIN
    ORDTYPE OT ON OT.OrdType = O.OrdType
WHERE
    O.BizDate = @BizDate
    AND O.OrdNumber = @OrdNum;

-- Query 2: Order Items Details
SELECT
    *
FROM
    OrdItem
WHERE
    BizDate = @BizDate
    AND OrdNumber = @OrdNum
ORDER BY
    OrdItemNumber;

-- Query 3: Order Stage Time Details
SELECT
    [OrdStageTimeKey],
    [BizDate],
    [OrdNum],
    [OrdType],
    [Stage],
    [StartTime],
    [EndTime],
    [EntSync],
    [SyncStatus],
    [EntID]
FROM
    [dbo].[OrdStageTime]
WHERE
    [OrdNum] = @OrdNum
    AND [BizDate] = @BizDate;
```

sql1c1c-queryabapactionscript-3adaadocangular-htmlangular-tsapacheapexaplapplescriptaraasciidocasmastroawkballerinabashbatbatchbebeancountberrybibtexbicepbladebslcc#c++cadencecairocdcclaritycljclojureclosure-templatescmakecmdcobolcodeownerscodeqlcoffeecoffeescriptcommon-lispconsolecoqcppcqlcrystalcscsharpcsscsvcuecypherddartdaxdesktopdiffdockerdockerfiledotenvdream-makeredgeelispelixirelmemacs-lisperberlerlangff#f03f08f18f77f90f95fennelfishfluentforfortran-fixed-formfortran-free-formfsfsharpfslftlgdresourcegdscriptgdshadergeniegherkingit-commitgit-rebasegjsgleamglimmer-jsglimmer-tsglslgnuplotgogqlgraphqlgroovygtshackhamlhandlebarshaskellhaxehbshclhjsonhlslhshtmlhtml-derivativehttphxmlhyimbainijadejavajavascriptjinjajisonjljsjsonjson5jsoncjsonljsonnetjssmjsxjuliakotlinkqlktktskustolatexleanlean4lessliquidlisplitllvmloglogolualuaumakemakefilemarkdownmarkomatlabmdmdcmdxmediawikimermaidmipsmipsasmmmdmojomovenarnarratnextflownfnginxnimnixnunushellobjcobjective-cobjective-cppocamlpascalperlperl6phpplsqlpopolarpostcsspotpotxpowerquerypowershellprismaprologpropertiesprotoprotobufpsps1pugpuppetpurescriptpypythonqlqmlqmldirqssrracketrakurazorrbregregexregexprelriscvrsrstrubyrustsassassscalaschemescsssdblshshadershaderlabshellshellscriptshellsessionsmalltalksoliditysoysparqlsplsplunksqlssh-configstatastylstylussvelteswiftsystem-verilogsystemdtalontalonscripttasltcltemplterraformtextftfvarstomltsts-tagstsptsvtsxturtletwigtyptypescripttypespectypstvvalavbverilogvhdlvimvimlvimscriptvuevue-htmlvyvyperwasmwenyanwgslwikiwikitextwitwlwolframxmlxslyamlymlzenscriptzigzsh文言

This SSMS script will provide the same detailed order information as the PowerShell script, allowing you to analyze it directly within your SQL Server Management Studio environment.

API Request

$0.0473

... **Confirming the Outcome** I've verified that the initial objectives have been met. Both the SQL query method from the `InstallXpertTool.ps1` and a separate query designed for SSMS 2025 have been identified and implemented. The task is complete.

Task Completed

I have reviewed the `InstallXpertTool.ps1` file and identified the SQL query method used to create a report on order details based on an order number and business date.

The relevant queries from `InstallXpertTool.ps1` are:

```powershell
$queries = @(
    "SELECT O.*,OT.OrderTypeCategory FROM Ord O LEFT JOIN ORDTYPE OT ON OT.OrdType=O.OrdType WHERE BizDate = '$BizDate' AND OrdNumber = $OrdNum",
    "SELECT * FROM OrdItem WHERE BizDate = '$BizDate' AND OrdNumber = $OrdNum ORDER BY OrdItemNumber",
    "SELECT [OrdStageTimeKey], [BizDate], [OrdNum], [OrdType], [Stage], [StartTime], [EndTime], [EntSync], [SyncStatus], [EntID] FROM [dbo].[OrdStageTime] WHERE [OrdNum] = $OrdNum AND [BizDate] = '$BizDate'"
)
```

powershell1c1c-queryabapactionscript-3adaadocangular-htmlangular-tsapacheapexaplapplescriptaraasciidocasmastroawkballerinabashbatbatchbebeancountberrybibtexbicepbladebslcc#c++cadencecairocdcclaritycljclojureclosure-templatescmakecmdcobolcodeownerscodeqlcoffeecoffeescriptcommon-lispconsolecoqcppcqlcrystalcscsharpcsscsvcuecypherddartdaxdesktopdiffdockerdockerfiledotenvdream-makeredgeelispelixirelmemacs-lisperberlerlangff#f03f08f18f77f90f95fennelfishfluentforfortran-fixed-formfortran-free-formfsfsharpfslftlgdresourcegdscriptgdshadergeniegherkingit-commitgit-rebasegjsgleamglimmer-jsglimmer-tsglslgnuplotgogqlgraphqlgroovygtshackhamlhandlebarshaskellhaxehbshclhjsonhlslhshtmlhtml-derivativehttphxmlhyimbainijadejavajavascriptjinjajisonjljsjsonjson5jsoncjsonljsonnetjssmjsxjuliakotlinkqlktktskustolatexleanlean4lessliquidlisplitllvmloglogolualuaumakemakefilemarkdownmarkomatlabmdmdcmdxmediawikimermaidmipsmipsasmmmdmojomovenarnarratnextflownfnginxnimnixnunushellobjcobjective-cobjective-cppocamlpascalperlperl6phpplsqlpopolarpostcsspotpotxpowerquerypowershellprismaprologpropertiesprotoprotobufpsps1pugpuppetpurescriptpypythonqlqmlqmldirqssrracketrakurazorrbregregexregexprelriscvrsrstrubyrustsassassscalaschemescsssdblshshadershaderlabshellshellscriptshellsessionsmalltalksoliditysoysparqlsplsplunksqlssh-configstatastylstylussvelteswiftsystem-verilogsystemdtalontalonscripttasltcltemplterraformtextftfvarstomltsts-tagstsptsvtsxturtletwigtyptypescripttypespectypstvvalavbverilogvhdlvimvimlvimscriptvuevue-htmlvyvyperwasmwenyanwgslwikiwikitextwitwlwolframxmlxslyamlymlzenscriptzigzsh文言

Additionally, I have created a separate SQL query that can be run in SSMS 2025 to obtain the same information:

```sql
-- Declare variables for Order Number and Business Date
DECLARE @OrdNum INT = 25; -- Replace with your desired Order Number
DECLARE @BizDate DATE = '2023-10-01'; -- Replace with your desired Business Date (YYYY-MM-DD)

-- Query 1: Basic Order Information
SELECT
    O.*,
    OT.OrderTypeCategory
FROM
    Ord O
LEFT JOIN
    ORDTYPE OT ON OT.OrdType = O.OrdType
WHERE
    O.BizDate = @BizDate
    AND O.OrdNumber = @OrdNum;

-- Query 2: Order Items Details
SELECT
    *
FROM
    OrdItem
WHERE
    BizDate = @BizDate
    AND OrdNumber = @OrdNum
ORDER BY
```