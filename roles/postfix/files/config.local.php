<?php

$CONF['configured'] = true;
$CONF['setup_password'] = 'f4292ee7054b0f5481f6e08ed9ad0bd3:5fd98c73375833a5841caf0c95636f5a424426d5';
$CONF['default_language'] = 'ru';
$CONF['database_type'] = 'mysqli';
$CONF['database_host'] = 'proxysql01';
$CONF['database_port'] = '6033';
$CONF['database_user'] = 'postfix';
$CONF['database_password'] = 'postfix';
$CONF['database_name'] = 'postfix';
$CONF['encrypt'] = 'md5crypt';
$CONF['domain_path'] = 'YES';
$CONF['domain_in_mailbox'] = 'YES';
$CONF['transport_default'] = 'virtual';
$CONF['emailcheck_resolve_domain']='NO';
$CONF['default_aliases'] = array (
 'abuse' => 'root',
 'hostmaster' => 'root',
 'postmaster' => 'root',
 'webmaster' => 'root'
);

?>