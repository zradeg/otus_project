

proxysql




На сервере mysql:

```
create user 'psql_mon'@'proxysql01' identified by 'psql_mon';
```




На psql:

Добавить сервера
```
INSERT INTO mysql_servers(hostgroup_id,hostname,port) VALUES (1,'pxc1',3306);
INSERT INTO mysql_servers(hostgroup_id,hostname,port) VALUES (1,'pxc2',3306);
INSERT INTO mysql_servers(hostgroup_id,hostname,port) VALUES (1,'pxc3',3306);
```


Настроить логин для мониторинга
```
update global_variables set variable_value='psql_mon' where variable_name='mysql-monitor_username';

update global_variables set variable_value='psql_mon' where variable_name='mysql-monitor_password';
```

Настроить интервалы мониторинга
```
update global_variables set variable_value='2000' where variable_name IN ('mysql-monitor_connect_interval','mysql-monitor_ping_interval','mysql-monitor_read_only_interval');
```

Сохранить переменные в текущую конфигурацию и затем на диск
```
LOAD MYSQL VARIABLES TO RUNTIME;
SAVE MYSQL VARIABLES TO DISK;
```

Проверить состояние мониторинга
```
SELECT * FROM monitor.mysql_server_connect_log ORDER BY time_start_us DESC LIMIT 10;
SELECT * FROM monitor.mysql_server_ping_log ORDER BY time_start_us DESC LIMIT 10;
```

Активировать сервера
```
LOAD MYSQL SERVERS TO RUNTIME;
```

