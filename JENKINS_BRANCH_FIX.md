# Jenkins Branch Fix Guide

## Problem
Jenkins is trying to clone from the original repository (`kasunkosala/NCC_2025`) instead of your forked repository (`nuwanpriyamal/NCC_2025`), and it can't find the `gscomp268` branch there.

## Solution Options

### Option 1: Update Existing Jenkins Job (Recommended)

1. **Go to Jenkins Dashboard**
2. **Click on your pipeline job**
3. **Click "Configure"**
4. **In the Pipeline section, update:**
   - **Repository URL**: `https://github.com/nuwanpriyamal/NCC_2025.git`
   - **Branch**: `*/gscomp268`
   - **Script Path**: `Jenkinsfile`
5. **Click "Save"**
6. **Run the pipeline again**

### Option 2: Create New Jenkins Job

1. **Go to Jenkins Dashboard**
2. **Click "New Item"**
3. **Enter name**: `NCC_2025_Pipeline_Fixed`
4. **Select "Pipeline"**
5. **Click "OK"**
6. **Configure the job:**
   - **Pipeline definition**: Pipeline script from SCM
   - **SCM**: Git
   - **Repository URL**: `https://github.com/nuwanpriyamal/NCC_2025.git`
   - **Branch**: `*/gscomp268`
   - **Script Path**: `Jenkinsfile`
7. **Click "Save"**
8. **Run the new pipeline**

### Option 3: Use Workspace-Based Pipeline

If you want to test without Git operations:

1. **Change Jenkins job configuration:**
   - **Pipeline definition**: Pipeline script
   - **Script**: Copy the content from `Jenkinsfile.workspace`
2. **Save and run**

## Quick Fix Commands

```bash
# Verify your repository and branch
git remote -v
git branch -a

# Push any local changes to your fork
git add .
git commit -m "Update Jenkinsfile for Jenkins pipeline"
git push origin gscomp268
```

## Verification Steps

1. **Check repository URL** in Jenkins job configuration
2. **Verify branch name** is `gscomp268`
3. **Ensure Jenkinsfile exists** in your forked repository
4. **Test the pipeline**

## Expected Result

After fixing the repository URL, the pipeline should:
- ✅ Clone from `https://github.com/nuwanpriyamal/NCC_2025.git`
- ✅ Checkout branch `gscomp268`
- ✅ Build Docker images
- ✅ Push to Docker Hub

## Troubleshooting

### If still getting branch errors:
- Check if `gscomp268` branch exists in your forked repository
- Verify the branch name is exactly `gscomp268`
- Make sure you've pushed your changes to the forked repository

### If Docker Hub push fails:
- Create repositories on Docker Hub first
- Verify Docker Hub credentials in Jenkins

The main issue is the repository URL - Jenkins needs to point to YOUR forked repository, not the original one!
