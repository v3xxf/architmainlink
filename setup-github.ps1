# GitHub Setup Script
# Run this script AFTER installing Git

Write-Host "=== GitHub Setup Script ===" -ForegroundColor Green
Write-Host ""

# Check if Git is installed
try {
    $gitVersion = git --version
    Write-Host "✓ Git is installed: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Git is not installed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Git first:" -ForegroundColor Yellow
    Write-Host "1. Download from: https://git-scm.com/download/win" -ForegroundColor Cyan
    Write-Host "2. Run the installer with default settings" -ForegroundColor Cyan
    Write-Host "3. Restart PowerShell and run this script again" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Press any key to open the download page..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Start-Process "https://git-scm.com/download/win"
    exit
}

Write-Host ""
Write-Host "Initializing Git repository..." -ForegroundColor Yellow

# Initialize git repository
if (Test-Path .git) {
    Write-Host "✓ Git repository already initialized" -ForegroundColor Green
} else {
    git init
    Write-Host "✓ Git repository initialized" -ForegroundColor Green
}

Write-Host ""
Write-Host "Adding files to Git..." -ForegroundColor Yellow
git add .
Write-Host "✓ Files added" -ForegroundColor Green

Write-Host ""
Write-Host "Creating initial commit..." -ForegroundColor Yellow
git commit -m "Initial commit: Trading profile website"
Write-Host "✓ Initial commit created" -ForegroundColor Green

Write-Host ""
Write-Host "Setting up GitHub remote..." -ForegroundColor Yellow
Write-Host "Repository will be: https://github.com/v3xxf/architmainlink" -ForegroundColor Cyan

# Check if remote already exists
$remoteExists = git remote get-url origin 2>$null
if ($remoteExists) {
    Write-Host "Remote 'origin' already exists: $remoteExists" -ForegroundColor Yellow
    $update = Read-Host "Do you want to update it? (y/n)"
    if ($update -eq 'y' -or $update -eq 'Y') {
        git remote set-url origin https://github.com/v3xxf/architmainlink.git
        Write-Host "✓ Remote updated" -ForegroundColor Green
    }
} else {
    git remote add origin https://github.com/v3xxf/architmainlink.git
    Write-Host "✓ Remote added" -ForegroundColor Green
}

Write-Host ""
Write-Host "Renaming branch to 'main'..." -ForegroundColor Yellow
git branch -M main
Write-Host "✓ Branch renamed to 'main'" -ForegroundColor Green

Write-Host ""
Write-Host "=== IMPORTANT: Create GitHub Repository First ===" -ForegroundColor Yellow
Write-Host ""
Write-Host "Before pushing, you need to create the repository on GitHub:" -ForegroundColor Cyan
Write-Host "1. Go to: https://github.com/new" -ForegroundColor White
Write-Host "2. Repository name: architmainlink" -ForegroundColor White
Write-Host "3. Set to Public or Private (your choice)" -ForegroundColor White
Write-Host "4. DO NOT initialize with README, .gitignore, or license" -ForegroundColor White
Write-Host "5. Click 'Create repository'" -ForegroundColor White
Write-Host ""
$ready = Read-Host "Have you created the repository on GitHub? (y/n)"

if ($ready -eq 'y' -or $ready -eq 'Y') {
    Write-Host ""
    Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
    Write-Host "You may be prompted for your GitHub username and password." -ForegroundColor Cyan
    Write-Host "For password, use a Personal Access Token (not your GitHub password)" -ForegroundColor Cyan
    Write-Host ""
    
    git push -u origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "✓ Successfully pushed to GitHub!" -ForegroundColor Green
        Write-Host "Your repository: https://github.com/v3xxf/architmainlink" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "Next step: Deploy to Vercel" -ForegroundColor Yellow
        Write-Host "1. Go to: https://vercel.com" -ForegroundColor Cyan
        Write-Host "2. Sign in with GitHub" -ForegroundColor Cyan
        Write-Host "3. Click 'Add New Project'" -ForegroundColor Cyan
        Write-Host "4. Import your repository" -ForegroundColor Cyan
        Write-Host "5. Click 'Deploy'" -ForegroundColor Cyan
    } else {
        Write-Host ""
        Write-Host "✗ Push failed. Common issues:" -ForegroundColor Red
        Write-Host "- Repository doesn't exist on GitHub yet" -ForegroundColor Yellow
        Write-Host "- Authentication failed (use Personal Access Token)" -ForegroundColor Yellow
        Write-Host "- Network issues" -ForegroundColor Yellow
    }
} else {
    Write-Host ""
    Write-Host "Please create the repository first, then run this script again." -ForegroundColor Yellow
    Write-Host "Or manually run: git push -u origin main" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")


