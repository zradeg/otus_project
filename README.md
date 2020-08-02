* Развертывание высокодоступного почтового сервера с распределенным дисковым хранилищем с использованием Percona XtraDB Cluster


![otus-project.svg](./otus-project.svg)


Хосты
| Хост | IP-address |
|------|------------|
| ngx_vip: | 192.168.11.110 |
| ngx01: | 192.168.11.111 |
| ngx02: | 192.168.11.112 |
| postfix01: | 192.168.11.113 |
| postfix02: | 192.168.11.114 |
| postfix03: | 192.168.11.115 |
| proxysql01: | 192.168.11.116 |
| pxc1: | 192.168.11.120 |
| pxc2: | 192.168.11.121 |
| pxc3: | 192.168.11.122 |
| backup: | 192.168.11.123 |



Обращаю внимание на параметры ssl_protocols = !SSLv2 !SSLv3 и ssl = required. Они актуальны до версии Dovecot v2.2. В версии 2.3 и выше будет ошибка на этот параметр. Его надо будет заменить на ssl_min_protocol. В официальных репах centos как обычно старый софт, но возможно через некоторое время появится новая версия и конфиг надо будет поправить. Подробнее в документации dovecot.



Отправка почты посредством telnet:

```
Trying 192.168.11.113...
Connected to 192.168.11.113.
Escape character is '^]'.
220 mail.postfix.loc ESMTP Postfix
EHLO mail.postfix.loc
250-mail.postfix.loc
250-PIPELINING
250-SIZE 20000000
250-STARTTLS
250-AUTH PLAIN LOGIN
250-AUTH=PLAIN LOGIN
250-ENHANCEDSTATUSCODES
250-8BITMIME
250 DSN
mail from:<admin@postfix.loc>
250 2.1.0 Ok
rcpt to:<admin@postfix.loc>
250 2.1.5 Ok
DATA
354 End data with <CR><LF>.<CR><LF>
From: Admin <admin@postfix.loc>
To: Admin <admin@postfix.loc>
Subject: Test!!!
Content-Type: text/plain   

Test!!!
Bye
.
250 2.0.0 Ok: queued as 59453DF8E3B
quit
```