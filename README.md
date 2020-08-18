* Отказоустойчивый почтовый сервер (postfix+dovecot), на базе pacemaker + corosync c распределенным дисковым хранилищем на базе drbd.








1. postfixadmin setup
http://192.168.11.113/setup.php
Setup password postfix2020
Администратор: admin@postfix.loc
Пароль: произвольный


config['emailcheck_resolve_domain']='NO';