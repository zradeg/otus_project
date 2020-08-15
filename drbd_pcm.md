# Добавляем репу 
rpm -ivh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org
yum -y install  pacemaker corosync pcs fence-agents-all psmisc policycoreutils-python  resource-agents drbd90-utils kmod-drbd90
#Выставляем пароль юзеру под которым будет сервис работать
passwd hacluster

- name: set password for user hacluster
  shell: echo {{ password_hacluster_user }} | passwd --stdin hacluster

# Автозагрузка
systemctl enable pcsd
systemctl enable corosync
systemctl enable pacemaker

systemctl start pcsd
systemctl start corosync
systemctl start pacemaker

- name: start and enable services
  service:
    name: "{{ item }}"
    state: started
    enabled: yes
    with_items:
      - corosync
      - pacemaker
      - pcsd

#Файл hosts Приводим к виду

127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4

10.1.14.31      postfix1.mm.test postfix1
10.1.14.32      postfix2.mm.test postfix2
10.1.14.33      postfix3.mm.test postfix3

#Фаерволл добавляем порты

firewall-cmd --permanent --add-service=high-availability
firewall-cmd --add-service=high-availability
firewall-cmd --add-port=7788/tcp
firewall-cmd --permanent --add-port=7788/tcp
firewall-cmd --reload


# Модуль ядра в автозагрузку
echo drbd > /etc/modules-load.d/drbd.conf
modprobe drbd

Затем создаём файл на всех нодах файл общих настроек: /etc/drbd.d/global_common.conf
global {
 usage-count  yes;
}
common {
 net {
  protocol C;
 }
}


#Затем создаём файл на всех нодах /etc/drbd.d/data.res

 
resource data {
        
        net {
                      cram-hmac-alg sha1;
                      shared-secret "FooFunFactory";
            }
        volume 0 {
            device    /dev/drbd0;
            disk      /dev/sdb;
            meta-disk internal;
                 }
        on postfix1 {
                node-id 0;
                address 10.1.14.31:7788;
        }
        on postfix2  {
                node-id 1;
                address 10.1.14.32:7788;
        }
        on postfix3  {
                node-id 2;
                address 10.1.14.33:7788;
        }
        connection-mesh {

          hosts  postfix1  postfix2 postfix3;
          net {
              protocol C;
          }

        }

}







- name: Copy drbd resource file to all nodes
  template:
    src=src=drbd.d/{{ resource_drbd_name }}.res.j2 
    dest=/etc/drbd.d/{{ resource_drbd_name }}.res

    # Инициализируем массив
    drbdadm create-md postfix --force


- name: Create drbd resource on all nodes
  command: drbdadm create-md {{ resource_drbd_name }}
# 
drbdadm primary --force data


  - name: start drbd resource on all nodes
  command:  drbdadm up {{ resource_drbd_name }}

# drbdadm create-md postfix
# drbdadm up postfix
# drbdadm primary postfix --force




- name: configure node01 as the primary
  command: drbdadm primary --force {{ resource_drbd_name }}
  

- name: configure node01 as the primary
  filesystem:
    fstype: xfs
    dev: /dev/drbd0

##########################################################
- name: Check for replay (/opt/drbd_node_done exists)
  stat:
    path: /opt/drbd_node_done
  register: drbd_node_done
##########################################################

Переключение на другого мастера:
На прежнем мастере
[root@postfix01 ~]# umount /dev/drbd0
[root@postfix01 ~]# drbdadm secondary postfix
На новом мастере
[root@postfix02 ~]# drbdadm primary postfix --force
[root@postfix02 ~]# mount /dev/drbd0 /var/spool/postfix/




# Статус
watch cat /sys/kernel/debug/drbd/resources/data/connections/postfix2/0/proc_drbd
watch cat /sys/kernel/debug/drbd/resources/data/connections/postfix3/0/proc_drbd





# Авторизовываемся на любом сервере
 pcs cluster auth postfix1 postfix2 postfix3  -u hacluster

- name: Authentificate all nodes
  command: pcs cluster auth {{ node1 }} {{ node2 }} {{ node3 }} -u hacluster -p "{{ password_hacluster_user }}" --force
  
# Создаём кластер
pcs cluster setup --force --name CLUSTER postfix1 postfix2 postfix3

- name: create cluster name
  command: pcs cluster setup --name {{ cluster_name }} {{ node1 }} {{ node2 }} {{ node3 }}
 



pcs cluster cib drbd_cfg
pcs -f drbd_cfg resource create DrbdData ocf:linbit:drbd drbd_resource=data op monitor interval=60s
pcs -f drbd_cfg resource master DrbdDataClone DrbdData master-max=1 master-node-max=1 clone-max=3 clone-node-max=1 notify=true
pcs cluster cib-push drbd_cfg


pcs cluster cib fs_cfg
pcs  -f fs_cfg resource create DrbdFS Filesystem device="/dev/drbd0" directory="/var/spool/postfix" fstype="xfs"  
pcs  -f fs_cfg constraint colocation add DrbdFS with DrbdDataClone INFINITY with-rsc-role=Master
pcs  -f fs_cfg constraint order promote DrbdDataClone then start DrbdFS
pcs cluster cib-push fs_cfg


# Автозагрузка кластера и запускаем кластер
pcs cluster enable --all
pcs cluster start --all


#Создаем виртуальны ip
pcs resource create virtual_ip ocf:heartbeat:IPaddr2 ip=192.168.11.100 cidr_netmask=24 op monitor interval=10s

pcs resource create cluster_ip ocf:heartbeat:IPaddr2 ip=192.168.11.100 cidr_netmask=24 op monitor interval=30s

pcs resource delete virtual_ip




















Разрешение сплит-брейна

systemctl stop pacemaker
drbdadm invalidate <нода, данные с которой будут удалены>
systemctl start pacemaker
crm resource cleanup <имя ресурса>


















pcs status


pcs resource move virtual_ip postfix03



















[root@postfix01 ~]# pcs cluster standby pcm1
Error: Unable to update cib
Call cib_apply_diff failed (-62): Timer expired






pcs resource debug-start proxysql_ip
pcs resource refresh proxysql_ip
