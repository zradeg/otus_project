# Выпускной проект курса OTUS Администратор Linux
#### поток 2020-01

## Тема: Отказоустойчивый почтовый сервер на базе postfix + dovecot
#### Создание проекта основано на знаниях, полученных в ходе обучения на курсе.

### Использованные opensource-технологии
* DRBD
* Pacemaker
* Corosync
* Percona XtraDB Cluster
* Nginx
* Keepalived



### Условия, в которых создавался стенд:
* Vagrant v.2.2.7
* ansible v.2.9.7
* VirtualBox v.5.2.36

### Минимальные требования к железу для развертывания
* Intel Core i5
* RAM 16 GB
* Подключение к сети Internet 20 Mbit/s

### Рекомендуемые требования к железу для развертывания
* Intel Core i7
* RAM 16 GB
* Подключение к сети Internet 100 Mbit/s



### В качестве операционной системы на всех хостах стенда используется Centos 7


### Схема стенда
![schema](otus-project.svg)


### Развертывание стенда
Производится путем последовательного выполнения следующих команд:

```
git clone https://github.com/zradeg/otus_project

cd otus_project

vagrant up

ansible-playbook playbook.yml
```











1. postfixadmin setup
http://192.168.11.113/setup.php
Setup password postfix2020
Администратор: admin@postfix.loc
Пароль: произвольный





* Использованная документация:
https://www.linbit.com/drbd-user-guide/drbd-guide-9_0-en/
https://clusterlabs.org/pacemaker/doc/en-US/Pacemaker/1.1/html-single/Clusters_from_Scratch/index.html
https://www.percona.com/doc/percona-xtradb-cluster/LATEST/index.html
https://github.com/roundcube/roundcubemail/wiki
https://postfix-configuration.readthedocs.io/en/latest/postfixadmin/
