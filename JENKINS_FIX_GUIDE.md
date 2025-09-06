# Jenkins Pipeline Fix Guide

## Problem: `checkout scm` Error

**Error**: `'checkout scm' is only available when using "Multibranch Pipeline" or "Pipeline script from SCM"`

**Cause**: You're using a regular "Pipeline" job type, but `checkout scm` only works with:
- Multibranch Pipeline
- Pipeline script from SCM

## Solutions

### Option 1: Use Standalone Jenkinsfile (Recommended)

Replace your current Jenkinsfile with `Jenkinsfile.standalone`:

```bash
cp Jenkinsfile.standalone Jenkinsfile
```

**Important**: Update the repository URL in the Jenkinsfile:
```groovy
git branch: 'gscomp268', url: 'https://github.com/YOUR-USERNAME/NCC_2025.git'
```

### Option 2: Change Jenkins Job Type

1. **Delete current job** in Jenkins
2. **Create new job**:
   - Type: **Pipeline script from SCM**
   - SCM: Git
   - Repository URL: Your GitHub repository
   - Branch: `*/gscomp268`
   - Script Path: `Jenkinsfile`

### Option 3: Use No-Git Version (For Testing)

If you just want to test Docker build/push without Git:

```bash
cp Jenkinsfile.no-git Jenkinsfile
```

## Step-by-Step Fix

### 1. Update Repository URL

Edit the Jenkinsfile and replace `your-username` with your actual GitHub username:

```groovy
git branch: 'gscomp268', url: 'https://github.com/YOUR-ACTUAL-USERNAME/NCC_2025.git'
```

### 2. Test the Fixed Pipeline

1. **Update Jenkinsfile**:
   ```bash
   cp Jenkinsfile.standalone Jenkinsfile
   ```

2. **Edit repository URL**:
   ```bash
   # Replace YOUR-USERNAME with your actual GitHub username
   sed -i 's/your-username/YOUR-ACTUAL-USERNAME/g' Jenkinsfile
   ```

3. **Run pipeline** in Jenkins

### 3. Alternative: Manual Git Setup

If you want to keep using `checkout scm`, change your Jenkins job configuration:

1. **Go to Jenkins Dashboard**
2. **Click on your pipeline job**
3. **Click "Configure"**
4. **Change Pipeline definition to**: "Pipeline script from SCM"
5. **Set SCM to**: Git
6. **Enter your repository URL**
7. **Set branch to**: `*/gscomp268`
8. **Set Script Path to**: `Jenkinsfile`
9. **Save**

## Quick Fix Commands

```bash
# Use the standalone version
cp Jenkinsfile.standalone Jenkinsfile

# Update with your GitHub username (replace YOUR-USERNAME)
sed -i 's/your-username/YOUR-ACTUAL-USERNAME/g' Jenkinsfile

# Test locally
docker build -t gscomp268/backend2:latest ./backend2
docker build -t gscomp268/frontend2:latest ./frontend2
```

## Verification

After applying the fix, your pipeline should:

1. ✅ **Stage 1**: Successfully pull from Git repository
2. ✅ **Stage 2**: Build both Docker images
3. ✅ **Stage 3**: Push images to Docker Hub

## Troubleshooting

### If Git still fails:
- Check repository URL is correct
- Verify branch name exists
- Ensure Jenkins has access to the repository

### If Docker build fails:
- Check if Docker is installed on Jenkins
- Verify Docker daemon is running
- Check file permissions

### If Docker push fails:
- Verify Docker Hub credentials are configured
- Check if repository exists on Docker Hub
- Ensure proper permissions

## Recommended Approach

1. **Use `Jenkinsfile.standalone`** - Works with any Jenkins job type
2. **Update repository URL** with your actual GitHub username
3. **Test the pipeline** - Should work without errors
4. **Configure Docker Hub credentials** if not already done

This approach is the most reliable and works with any Jenkins setup!
