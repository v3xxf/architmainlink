# How to Install Git on Windows

## Quick Installation Guide

### Step 1: Download Git
1. Go to: **https://git-scm.com/download/win**
2. The download should start automatically
3. Or click the download button for Windows

### Step 2: Install Git
1. Run the downloaded installer (Git-2.x.x-64-bit.exe)
2. Click "Next" through the installation wizard
3. **Important settings to check:**
   - ✅ "Git from the command line and also from 3rd-party software" (recommended)
   - ✅ "Use bundled OpenSSH"
   - ✅ "Use the OpenSSL library"
   - ✅ "Checkout Windows-style, commit Unix-style line endings" (default)
4. Click "Install"
5. Wait for installation to complete
6. Click "Finish"

### Step 3: Verify Installation
1. **Close and reopen PowerShell** (important!)
2. Run: `git --version`
3. You should see something like: `git version 2.x.x`

### Step 4: Configure Git (First Time Only)
```powershell
git config --global user.name "v3xxf"
git config --global user.email "your-email@example.com"
```
Replace `your-email@example.com` with your actual email address.

### Step 5: Run the Setup Script
Once Git is installed, run:
```powershell
.\setup-github.ps1
```

This script will:
- Initialize your Git repository
- Add all files
- Create the initial commit
- Set up the GitHub remote
- Guide you through pushing to GitHub

## Alternative: Use GitHub Desktop

If you prefer a graphical interface:
1. Download GitHub Desktop: https://desktop.github.com/
2. Sign in with your GitHub account (v3xxf)
3. Create a new repository
4. Add your files and commit
5. Push to GitHub

## Troubleshooting

### "Git is not recognized" after installation
- **Solution:** Close and reopen PowerShell/Command Prompt
- If still not working, restart your computer
- Check that Git was added to PATH during installation

### Authentication Issues
When pushing to GitHub, you'll need:
- **Username:** v3xxf
- **Password:** Use a Personal Access Token (NOT your GitHub password)

To create a Personal Access Token:
1. Go to: https://github.com/settings/tokens
2. Click "Generate new token" → "Generate new token (classic)"
3. Give it a name (e.g., "Vercel Deployment")
4. Select scopes: ✅ `repo` (full control of private repositories)
5. Click "Generate token"
6. **Copy the token immediately** (you won't see it again!)
7. Use this token as your password when Git prompts you

## Need Help?

- Git documentation: https://git-scm.com/doc
- GitHub guides: https://guides.github.com
- GitHub Desktop: https://desktop.github.com/

