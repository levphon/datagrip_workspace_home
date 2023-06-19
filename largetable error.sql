SHOW GLOBAL VARIABLES LIKE '%innodb_file%';
SET GLOBAL innodb_strict_mode = ON;
SET GLOBAL innodb_strict_mode = 0;
SET GLOBAL log_bin_trust_function_creators=TRUE;
FLUSH PRIVILEGES;

vim /etc/mysql/mysql.conf.d/mysqld.cnf
[mysqld]
max_allowed_packet      = 64M
innodb_log_file_size    = 30M
innodb_log_buffer_size  = 512M
innodb_strict_mode      = 0

