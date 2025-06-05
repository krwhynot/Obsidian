Ah, I see. Without admin rights, we'll need to use a different approach. Let's use a portable version of Node.js that doesn't require admin rights:

1. Download Portable Node.js:
   - Go to https://nodejs.org/dist/v20.10.0/ (current LTS version)
   - Download "node-v20.10.0-win-x64.zip"

2. Set up the portable version:
```bash
# Create a directory in your user space
mkdir -p ~/tools
cd ~/tools

# Extract the downloaded zip file here
# After extracting, you should have a folder like "node-v20.10.0-win-x64"
```

3. Add Node.js to your PATH in Git Bash. Create or edit your `.bashrc`:
```bash
# Open .bashrc in notepad
notepad ~/.bashrc
```

Add these lines:
```bash
# Node.js portable configuration
export NODE_HOME="$HOME/tools/node-v20.10.0-win-x64"
export PATH="$NODE_HOME:$PATH"
```

4. Reload your bash profile:
```bash
source ~/.bashrc
```

Would you like me to walk you through these steps one by one? Also, can you tell me:
1. Do you have permission to create folders in your user directory?
2. Can you download and extract zip files?
3. Can you edit files in your user directory?

This will help me provide the most appropriate solution for your permissions level.