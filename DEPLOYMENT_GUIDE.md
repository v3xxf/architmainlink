# Deployment Guide - GitHub & Vercel

This guide will help you push your project to GitHub and deploy it to Vercel.

## Step 1: Install Git (if not already installed)

1. Download Git from: https://git-scm.com/download/win
2. Install it with default settings
3. Restart your terminal/PowerShell after installation

## Step 2: Initialize Git Repository

Open PowerShell or Command Prompt in your project folder and run:

```bash
# Initialize git repository
git init

# Add all files
git add .

# Create your first commit
git commit -m "Initial commit: Trading profile website"
```

## Step 3: Create GitHub Repository

1. Go to https://github.com and sign in (or create an account)
2. Click the "+" icon in the top right → "New repository"
3. Name your repository (e.g., `archit-trading-profile` or `architmainlink`)
4. **DO NOT** initialize with README, .gitignore, or license (we already have these)
5. Click "Create repository"

## Step 4: Push to GitHub

After creating the repository, GitHub will show you commands. Run these in your terminal:

```bash
# Add your GitHub repository as remote (replace YOUR_USERNAME and REPO_NAME)
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# Rename branch to main (if needed)
git branch -M main

# Push to GitHub
git push -u origin main
```

**Note:** You'll be prompted for your GitHub username and password. For password, use a Personal Access Token (not your GitHub password):
- Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
- Generate new token with `repo` permissions
- Use this token as your password

## Step 5: Deploy to Vercel

### Option A: Deploy via GitHub (Recommended)

1. Go to https://vercel.com and sign in (or create an account)
2. Click "Add New..." → "Project"
3. Import your GitHub repository
4. Vercel will auto-detect your project settings
5. Click "Deploy"
6. Your site will be live in seconds!

### Option B: Deploy via Vercel CLI

1. Install Vercel CLI:
   ```bash
   npm install -g vercel
   ```

2. Login to Vercel:
   ```bash
   vercel login
   ```

3. Deploy:
   ```bash
   vercel
   ```

4. Follow the prompts (press Enter for defaults)

## Step 6: Custom Domain (Optional)

After deployment:
1. Go to your project in Vercel dashboard
2. Click "Settings" → "Domains"
3. Add your custom domain
4. Follow DNS configuration instructions

## Future Updates

Whenever you make changes:

```bash
# Add changed files
git add .

# Commit changes
git commit -m "Description of your changes"

# Push to GitHub
git push
```

Vercel will automatically redeploy when you push to GitHub!

## Troubleshooting

### Git not recognized
- Make sure Git is installed and added to PATH
- Restart your terminal after installation

### Authentication issues
- Use Personal Access Token instead of password
- Or use GitHub Desktop for easier authentication

### Vercel deployment fails
- Make sure `index.html` is in the root directory
- Check that `vercel.json` is properly formatted
- Vercel should auto-detect static sites, but the config file helps

## Need Help?

- Git documentation: https://git-scm.com/doc
- GitHub guides: https://guides.github.com
- Vercel docs: https://vercel.com/docs


