create database sxgdb default charset utf8mb4 collate utf8mb4_general_ci;

use xxx;


create user nacos@'172.17.46.54' identified by 'nacos2023)';

GRANT ALL PRIVILEGES ON nacos_config.* TO nacos@'172.17.46.54' IDENTIFIED BY 'nacos2023)';

# 高版本
grant all privileges on nacos_config.* to 'nacos'@'172.17.46.54' with grant option;

flush privileges;