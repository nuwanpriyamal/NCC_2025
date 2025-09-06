# MySQL Setup for Task 1

## Database Setup Instructions

### 1. Install MySQL (if not already installed)

**On macOS:**
```bash
# Using Homebrew
brew install mysql
brew services start mysql

# Or download from: https://dev.mysql.com/downloads/mysql/
```

**On Windows:**
- Download MySQL Installer from: https://dev.mysql.com/downloads/installer/
- Follow installation wizard

**On Linux (Ubuntu/Debian):**
```bash
sudo apt update
sudo apt install mysql-server
sudo systemctl start mysql
sudo systemctl enable mysql
```

### 2. Create Database

```bash
# Login to MySQL
mysql -u root -p

# Create database
CREATE DATABASE gscomp268;
USE gscomp268;

# Show databases to verify
SHOW DATABASES;
```

### 3. Import SQL Backup File

**If you have the backup file:**
```bash
# Import the backup file
mysql -u root -p gscomp268 < backup_file.sql
```

**If you don't have the backup file:**
```bash
# Use the sample setup
mysql -u root -p gscomp268 < mysql-setup.sql
```

### 4. Verify Setup

```sql
-- Connect to your database
mysql -u root -p gscomp268

-- Show tables
SHOW TABLES;

-- Check data
SELECT * FROM your_table_name;
```

### 5. Create MySQL User (Optional but Recommended)

```sql
-- Create user for your application
CREATE USER 'gscomp268'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON gscomp268.* TO 'gscomp268'@'localhost';
FLUSH PRIVILEGES;
```

## Troubleshooting

### Common Issues:

1. **MySQL not starting:**
   ```bash
   # Check status
   sudo systemctl status mysql
   
   # Start service
   sudo systemctl start mysql
   ```

2. **Access denied:**
   ```bash
   # Reset root password
   sudo mysql_secure_installation
   ```

3. **Port already in use:**
   ```bash
   # Check what's using port 3306
   sudo lsof -i :3306
   ```

## Verification Commands

```bash
# Check MySQL version
mysql --version

# Check if MySQL is running
sudo systemctl status mysql

# Test connection
mysql -u root -p -e "SELECT VERSION();"

# List databases
mysql -u root -p -e "SHOW DATABASES;"
```

## Next Steps

1. ✅ Create database `gscomp268`
2. ✅ Import SQL backup file (or use sample)
3. ✅ Verify data is imported correctly
4. ✅ Document the process

Once MySQL is set up, you'll have completed Task 1 entirely!
