-- Grant privileges to devuser
GRANT ALL PRIVILEGES ON *.* TO 'devuser'@'%' WITH GRANT OPTION;

-- Apply changes
FLUSH PRIVILEGES;

