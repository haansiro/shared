# apr/15/2020 20:41:27 by RouterOS 6.45.6
# software id = FXH4-LVM4
#
# model = 1100AH
# serial number = 319F024EA8D3
/interface bridge
add disabled=yes name=bridge1
/interface ethernet
set [ find default-name=ether10 ] comment=conf
/interface vlan
add interface=ether2 name=100-Remote-OLT vlan-id=100
add interface=ether2 name=600-PPPoE vlan-id=600
add interface=ether6 name=vlan102 vlan-id=102
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=PPPoE ranges=192.168.8.2-192.168.8.254
/queue type
add kind=pcq name=Down pcq-classifier=dst-address pcq-dst-address6-mask=64 \
    pcq-rate=3M pcq-src-address6-mask=64
add kind=pcq name=UP pcq-classifier=src-address pcq-dst-address6-mask=64 \
    pcq-rate=1M pcq-src-address6-mask=64
/queue simple
add max-limit=100M/155M name=PPPOE queue=default/default target=\
    192.168.8.0/24
/ppp profile
add change-tcp-mss=yes dns-server=8.8.8.8,8.8.4.4 insert-queue-before=bottom \
    local-address=192.168.8.1 name=PPPoE only-one=yes parent-queue=PPPOE \
    rate-limit="3m/3m 0/0 0/0 0/0 8 1m/1m" remote-address=PPPoE
add change-tcp-mss=yes dns-server=8.8.8.8,8.8.4.4 insert-queue-before=bottom \
    local-address=192.168.8.1 name=PPPoE10m only-one=yes parent-queue=PPPOE \
    rate-limit=10m/10m remote-address=PPPoE
/interface bridge port
add bridge=bridge1 disabled=yes interface=100-Remote-OLT
add bridge=bridge1 disabled=yes interface=vlan102
/interface pppoe-server server
add disabled=no interface=600-PPPoE max-mru=1500 max-mtu=1500 \
    one-session-per-host=yes service-name=Jontro-Bella-Net
/ip address
add address=192.168.255.254/24 comment=olt interface=100-Remote-OLT network=\
    192.168.255.0
add address=192.168.3.9/24 comment=in1 interface=ether3 network=192.168.3.0
add address=136.1.1.1/24 interface=ether10 network=136.1.1.0
/ip dns
set allow-remote-requests=yes cache-max-ttl=1h servers=8.8.8.8,8.8.4.4
/ip firewall nat
add action=redirect chain=dstnat dst-port=53 protocol=udp to-ports=53
add action=masquerade chain=srcnat disabled=yes out-interface=ether10
# no interface
add action=masquerade chain=srcnat out-interface=*F
add action=masquerade chain=srcnat disabled=yes out-interface=ether6 \
    src-address=!192.168.255.0/24 to-addresses=103.80.82.33
add action=masquerade chain=srcnat out-interface=ether3 src-address=\
    !192.168.255.0/24
add action=masquerade chain=srcnat out-interface=ether4 src-address=\
    !192.168.255.0/24
add action=dst-nat chain=dstnat dst-address=11.11.11.15 dst-port=2323 \
    protocol=tcp to-addresses=136.1.1.100 to-ports=23
/ip route
add distance=2 gateway=192.168.2.1 routing-mark=jalur2
add distance=1 gateway=192.168.3.1
add distance=1 dst-address=11.11.11.0/24 gateway=11.11.11.1
add distance=1 dst-address=103.80.80.116/32 gateway=11.11.11.1
add distance=1 dst-address=103.80.80.117/32 gateway=11.11.11.1
/ip route rule
add dst-address=192.168.0.0/16 table=main
add dst-address=10.0.0.0/8 table=main
add dst-address=172.16.0.0/12 table=main
add disabled=yes src-address=192.168.8.254/32 table=jalur2
add disabled=yes src-address=192.168.8.220/32 table=jalur2
add disabled=yes src-address=192.168.8.221/32 table=jalur2
add disabled=yes src-address=192.168.8.222/32 table=jalur2
add disabled=yes src-address=192.168.8.223/32 table=jalur2
add disabled=yes src-address=192.168.8.224/32 table=jalur2
add disabled=yes src-address=192.168.8.225/32 table=jalur2
add disabled=yes src-address=192.168.8.226/32 table=jalur2
add disabled=yes src-address=192.168.8.227/32 table=jalur2
add disabled=yes src-address=192.168.8.228/32 table=jalur2
add disabled=yes src-address=192.168.8.229/32 table=jalur2
add disabled=yes src-address=192.168.8.230/32 table=jalur2
add disabled=yes src-address=192.168.8.231/32 table=jalur2
add disabled=yes src-address=192.168.8.232/32 table=jalur2
add disabled=yes src-address=192.168.8.233/32 table=jalur2
add disabled=yes src-address=192.168.8.234/32 table=jalur2
add disabled=yes src-address=192.168.8.235/32 table=jalur2
add disabled=yes src-address=192.168.8.236/32 table=jalur2
add disabled=yes src-address=192.168.8.237/32 table=jalur2
add disabled=yes src-address=192.168.8.238/32 table=jalur2
add disabled=yes src-address=192.168.8.239/32 table=jalur2
add disabled=yes src-address=192.168.8.240/32 table=jalur2
add disabled=yes src-address=192.168.8.241/32 table=jalur2
add disabled=yes src-address=192.168.8.242/32 table=jalur2
add disabled=yes src-address=192.168.8.243/32 table=jalur2
add disabled=yes src-address=192.168.8.244/32 table=jalur2
add disabled=yes src-address=192.168.8.245/32 table=jalur2
add disabled=yes src-address=192.168.8.246/32 table=jalur2
add disabled=yes src-address=192.168.8.247/32 table=jalur2
add disabled=yes src-address=192.168.8.248/32 table=jalur2
add disabled=yes src-address=192.168.8.249/32 table=jalur2
add disabled=yes src-address=192.168.8.250/32 table=jalur2
add disabled=yes src-address=192.168.8.251/32 table=jalur2
add disabled=yes src-address=192.168.8.252/32 table=jalur2
add disabled=yes src-address=192.168.8.253/32 table=jalur2
add disabled=yes src-address=192.168.8.254/32 table=jalur2
/ip service
set telnet disabled=yes
set www disabled=yes
set ssh disabled=yes
set api disabled=yes
set winbox port=5432
set api-ssl disabled=yes
/ppp secret
add name=igm2@jontro password=12345678 profile=PPPoE
add name=igm3@jontro password=12345678 profile=PPPoE
add name=igm4@jontro password=12345678 profile=PPPoE
add name=igm5@jontro password=12345678 profile=PPPoE
add name=igm6@jontro password=12345678 profile=PPPoE
add name=igm7@jontro password=12345678 profile=PPPoE
add name=igm8@jontro password=12345678 profile=PPPoE
add name=igm9@jontro password=12345678 profile=PPPoE
add name=igm10@jontro password=12345678 profile=PPPoE
add name=igm11@jontro password=12345678 profile=PPPoE
add name=igm13@jontro password=12345678 profile=PPPoE
add name=igm14@jontro password=12345678 profile=PPPoE
add name=igm15@jontro password=12345678 profile=PPPoE
add name=igm16@jontro password=12345678 profile=PPPoE
add name=igm17@jontro password=12345678 profile=PPPoE
add name=igm18@jontro password=12345678 profile=PPPoE
add name=igm19@jontro password=12345678 profile=PPPoE
add name=igm20@jontro password=12345678 profile=PPPoE
add name=igm21@jontro password=12345678 profile=PPPoE
add name=igm22@jontro password=12345678 profile=PPPoE
add name=igm23@jontro password=12345678 profile=PPPoE
add name=igm24@jontro password=12345678 profile=PPPoE
add name=igm25@jontro password=12345678 profile=PPPoE
add name=igm26@jontro password=12345678 profile=PPPoE
add name=igm27@jontro password=12345678 profile=PPPoE
add name=igm28@jontro password=12345678 profile=PPPoE
add name=igm29@jontro password=12345678 profile=PPPoE
add name=igm30@jontro password=12345678 profile=PPPoE
add name=igm31@jontro password=12345678 profile=PPPoE
add name=igm32@jontro password=12345678 profile=PPPoE
add name=igm33@jontro password=12345678 profile=PPPoE
add name=igm34@jontro password=12345678 profile=PPPoE
add name=igm35@jontro password=12345678 profile=PPPoE
add name=igm36@jontro password=12345678 profile=PPPoE
add name=igm37@jontro password=12345678 profile=PPPoE
add name=igm38@jontro password=12345678 profile=PPPoE
add name=igm39@jontro password=12345678 profile=PPPoE
add name=igm40@jontro password=12345678 profile=PPPoE
add name=igm41@jontro password=12345678 profile=PPPoE
add name=igm42@jontro password=12345678 profile=PPPoE
add name=igm43@jontro password=12345678 profile=PPPoE
add name=igm44@jontro password=12345678 profile=PPPoE
add name=igm45@jontro password=12345678 profile=PPPoE
add name=igm46@jontro password=12345678 profile=PPPoE
add name=igm47@jontro password=12345678 profile=PPPoE
add name=igm48@jontro password=12345678 profile=PPPoE
add name=igm49@jontro password=12345678 profile=PPPoE
add name=igm50@jontro password=12345678 profile=PPPoE
add name=igm51@jontro password=12345678 profile=PPPoE
add name=igm52@jontro password=12345678 profile=PPPoE
add name=igm53@jontro password=12345678 profile=PPPoE
add name=igm54@jontro password=12345678 profile=PPPoE
add name=igm55@jontro password=12345678 profile=PPPoE
add name=igm56@jontro password=12345678 profile=PPPoE
add name=igm57@jontro password=12345678 profile=PPPoE
add name=igm58@jontro password=12345678 profile=PPPoE
add name=igm59@jontro password=12345678 profile=PPPoE
add name=igm60@jontro password=12345678 profile=PPPoE
add name=igm61@jontro password=12345678 profile=PPPoE
add name=igm62@jontro password=12345678 profile=PPPoE
add name=igm63@jontro password=12345678 profile=PPPoE
add name=igm64@jontro password=12345678 profile=PPPoE
add name=igm65@jontro password=12345678 profile=PPPoE
add name=igm66@jontro password=12345678 profile=PPPoE
add name=igm67@jontro password=12345678 profile=PPPoE
add name=igm68@jontro password=12345678 profile=PPPoE
add name=igm69@jontro password=12345678 profile=PPPoE
add name=igm70@jontro password=12345678 profile=PPPoE
add name=igm71@jontro password=12345678 profile=PPPoE
add name=igm72@jontro password=12345678 profile=PPPoE
add name=igm73@jontro password=12345678 profile=PPPoE
add name=igm74@jontro password=12345678 profile=PPPoE
add name=igm75@jontro password=12345678 profile=PPPoE
add name=igm76@jontro password=12345678 profile=PPPoE
add name=igm77@jontro password=12345678 profile=PPPoE
add name=igm78@jontro password=12345678 profile=PPPoE
add name=igm79@jontro password=12345678 profile=PPPoE
add name=igm80@jontro password=12345678 profile=PPPoE
add name=igm81@jontro password=12345678 profile=PPPoE
add name=igm82@jontro password=12345678 profile=PPPoE
add name=igm83@jontro password=12345678 profile=PPPoE
add name=igm84@jontro password=12345678 profile=PPPoE
add name=igm85@jontro password=12345678 profile=PPPoE
add name=igm86@jontro password=12345678 profile=PPPoE
add name=igm87@jontro password=12345678 profile=PPPoE
add name=igm88@jontro password=12345678 profile=PPPoE
add name=igm89@jontro password=12345678 profile=PPPoE
add name=igm90@jontro password=12345678 profile=PPPoE
add name=igm91@jontro password=12345678 profile=PPPoE
add name=igm92@jontro password=12345678 profile=PPPoE
add name=igm93@jontro password=12345678 profile=PPPoE
add name=igm94@jontro password=12345678 profile=PPPoE
add name=igm95@jontro password=12345678 profile=PPPoE
add name=igm96@jontro password=12345678 profile=PPPoE
add name=igm97@jontro password=12345678 profile=PPPoE
add name=igm98abehbuah@jontro password=12345678 profile=PPPoE
add name=igm99@jontro password=12345678 profile=PPPoE
add name=igm100@jontro password=12345678 profile=PPPoE
add name=igm101yuni@jontro password=12345678 profile=PPPoE
add name=igm102@jontro password=12345678 profile=PPPoE
add name=igm103mbeka@jontro password=12345678 profile=PPPoE
add name=igm104@jontro password=12345678 profile=PPPoE
add name=igm105@jontro password=12345678 profile=PPPoE
add name=igm106@jontro password=12345678 profile=PPPoE
add name=igm107@jontro password=12345678 profile=PPPoE
add name=igm108@jontro password=12345678 profile=PPPoE
add name=igm109@jontro password=12345678 profile=PPPoE
add name=igm110@jontro password=12345678 profile=PPPoE
add name=igm111@jontro password=12345678 profile=PPPoE
add name=igm112@jontro password=12345678 profile=PPPoE
add name=igm113@jontro password=12345678 profile=PPPoE
add name=igm114@jontro password=12345678 profile=PPPoE
add name=igm115@jontro password=12345678 profile=PPPoE
add name=igm116@jontro password=12345678 profile=PPPoE
add name=igm117@jontro password=12345678 profile=PPPoE
add name=igm118@jontro password=12345678 profile=PPPoE
add name=igm119@jontro password=12345678 profile=PPPoE
add name=igm120@jontro password=12345678 profile=PPPoE
add name=igm121cipox@jontro password=12345678 profile=PPPoE
add name=igm122agungmjid@jontro password=12345678 profile=PPPoE
add name=igm123pudbengkel@jontro password=12345678 profile=PPPoE
add name=igm124mamankasan@jontro password=12345678 profile=PPPoE
add name=igm125anggawinong@jontro password=12345678 profile=PPPoE
add name=igm127masmulwinong@jontro password=12345678 profile=PPPoE
add name=igm128nduknisgopdes@jontro password=12345678 profile=PPPoE
add name=igm129Masdidikkedai@jontro password=12345678 profile=PPPoE10m
add name=igm130tino@jontro password=12345678 profile=PPPoE
add name=igm131ra@jontro password=12345678 profile=PPPoE
add name=igm132oom@jontro password=12345678 profile=PPPoE
add name=igm133ndoyosgpds@jontro password=12345678 profile=PPPoE
add name=igm134nanikmjid@jontro password=12345678 profile=PPPoE
add name=igm135mikosari@jontro password=12345678 profile=PPPoE
add name=igm136surtiwinong@jontro password=12345678 profile=PPPoE
add name=igm137tamirtalun@jontro password=12345678 profile=PPPoE
add name=igm138uliltekong@jontro password=12345678 profile=PPPoE
add name=igm139danikidul@jontro password=12345678 profile=PPPoE
add name=igm140andisyaa@jontro password=12345678 profile=PPPoE
add name=igm141puji@jontro password=12345678 profile=PPPoE
add name=igm142budistik@jontro password=12345678 profile=PPPoE
add name=igm143adineuliltekong@jontro password=12345678 profile=PPPoE
add name=igm144zamrony@jontro password=12345678 profile=PPPoE
add name=igm12pidris@jontro password=12345678 profile=PPPoE
add name=igm1agussd@jontro password=12345678 profile=PPPoE
add name=igm145garengtalun@jontro password=12345678 profile=PPPoE
add name=igm126supriwinong@jontro password=12345678 profile=PPPoE
add name=igm6ipinjonggol@jontro password=12345678 profile=PPPoE
add name=igm146yadimanndanu@jontro password=12345678 profile=PPPoE
add name=igm147pakwahid@jontro password=12345678 profile=PPPoE
add name=igm148pakqomar@jontro password=12345678 profile=PPPoE
add name=igm149utomotalun@jontro password=12345678 profile=PPPoE
add name=igm150lasno@jontro password=12345678 profile=PPPoE
add name=igm151gilok2@jontro password=12345678 profile=PPPoE
add name=igm152idristalun@jontro password=12345678 profile=PPPoE
add name=igm153broto@jontro password=12345678 profile=PPPoE
add name=igm154wartoyow@jontro password=12345678 profile=PPPoE
add name=igm155karmani@jontro password=12345678 profile=PPPoE
/system clock
set time-zone-name=Asia/Jakarta
/system console
set [ find ] disabled=yes
/system identity
set name=mik1100
/system scheduler
add disabled=yes name=port4 on-event="conf t\
    \n\
    \ninterface gpon-olt_1/2/4\
    \nonu 60 type ZTE-F660 sn ZTEGC8906D82\
    \nexit\
    \ninterface gpon-onu_1/2/4:123\
    \n  sn-bind enable sn\
    \n  tcont 1 name HSI profile 100M\
    \n  tcont 2 name HOT profile 100M\
    \n  gemport 1 name HSI unicast tcont 1 dir both\
    \n  gemport 1 traffic-limit upstream UP100M downstream DW100M\
    \n  gemport 2 name HOT unicast tcont 1 dir both\
    \n  gemport 2 traffic-limit upstream UP100M downstream DW100M\
    \n  switchport mode hybrid vport 1\
    \n  switchport mode hybrid vport 2\
    \n  service-port 1 vport 1 user-vlan 600 vlan 600\
    \n  service-port 2 vport 2 user-vlan 500 vlan 500\
    \n  port-location format dsl-forum sport 1\
    \n  port-location sub-option remote-id enable sport 1\
    \n  port-location sub-option remote-id name 600 sport 1\
    \n  port-location ft-cid 600 sport 1\
    \n  pppoe-plus enable sport 1\
    \n  pppoe-plus trust true replace sport 1\
    \nexit\
    \npon-onu-mng gpon-onu_1/2/4:60\
    \n  service HSI type internet gemport 1 vlan 600\
    \n  service HOT type internet gemport 2 vlan 500\
    \n  wan-ip 1 mode pppoe username igm60@jontro password 12345678 vlan-profi\
    le PPPoE host 1\
    \n  wan-ip 1 ping-response enable traceroute-response enable\
    \nend\
    \nwrite\
    \n" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=nov/20/2019 start-time=13:56:58
/system script
add dont-require-permissions=no name="input olt" owner=haansiro policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="c\
    onf t\r\
    \n\r\
    \ninterface gpon-olt_1/2/2\r\
    \nonu 128 type ZTE-F660 sn ZTEGC8906D29\r\
    \nexit\r\
    \ninterface gpon-onu_1/2/2:128\r\
    \n  sn-bind enable sn\r\
    \n  tcont 1 name HSI profile 100M\r\
    \n  tcont 2 name HOT profile 100M\r\
    \n  gemport 1 name HSI unicast tcont 1 dir both\r\
    \n  gemport 1 traffic-limit upstream UP100M downstream DW100M\r\
    \n  gemport 2 name HOT unicast tcont 1 dir both\r\
    \n  gemport 2 traffic-limit upstream UP100M downstream DW100M\r\
    \n  switchport mode hybrid vport 1\r\
    \n  switchport mode hybrid vport 2\r\
    \n  service-port 1 vport 1 user-vlan 600 vlan 600\r\
    \n  service-port 2 vport 2 user-vlan 500 vlan 500\r\
    \n  port-location format dsl-forum sport 1\r\
    \n  port-location sub-option remote-id enable sport 1\r\
    \n  port-location sub-option remote-id name 600 sport 1\r\
    \n  port-location ft-cid 600 sport 1\r\
    \n  pppoe-plus enable sport 1\r\
    \n  pppoe-plus trust true replace sport 1\r\
    \nexit\r\
    \npon-onu-mng gpon-onu_1/2/2:128\r\
    \n  service HSI type internet gemport 1 vlan 600\r\
    \n  service HOT type internet gemport 2 vlan 500\r\
    \n  wan-ip 1 mode pppoe username igm128nduknisgopdes@jontro password 12345\
    678 vlan-profile PPPoE host 1\r\
    \n  wan-ip 1 ping-response enable traceroute-response enable\r\
    \nend\r\
    \nwrite\r\
    \n"
add dont-require-permissions=no name="input pppoe clien" owner=haansiro \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source="/ppp secret\r\
    \nadd name=igm1xxx@jontro password=12345678 profile=PPPoE\r\
    \n"
/tool romon
set enabled=yes secrets=BellaNet
/tool romon port
set [ find default=yes ] secrets=BellaNet
