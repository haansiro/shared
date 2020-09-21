# sep/21/2020 11:22:16 by RouterOS 6.46.7
# software id = FXH4-LVM4
#
# model = 1100AH
# serial number = 319F024EA8D3
/interface bridge
add name=lo
/interface ethernet
set [ find default-name=ether1 ] comment=PortLinkError disabled=yes
set [ find default-name=ether5 ] comment=METRO
/interface pppoe-client
add add-default-route=yes disabled=no interface=ether2 name=bkasSD password=\
    106331592 user=146551100895@telkom.net
/interface l2tp-client
add connect-to=103.80.81.128 disabled=no name=JSN-1 password=!QAZ2wsx user=\
    1100x2Jontro-1
add connect-to=103.80.81.129 disabled=no name=JSN-2 password=!QAZ2wsx user=\
    1100x2Jontro-2
add add-default-route=yes connect-to=103.80.81.134 default-route-distance=10 \
    name=l2tp-out1 password=123456 user=1100x2
/interface gre
add disabled=yes local-address=36.65.161.93 name=JSN-GRE-1 remote-address=\
    103.80.81.128
/interface ipip
add local-address=36.65.161.93 name=JSN-IPIP-1 remote-address=103.80.81.128
add local-address=36.65.166.139 name=JSN-IPIP-2 remote-address=103.80.81.129
/interface list
add name=JSN
add name=WAN
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=PPPoE ranges=192.168.8.100-192.168.21.21
/ppp profile
add change-tcp-mss=yes name=INET1 on-down=\
    "/interface l2tp-client disable JSN-1\r\
    \n" on-up="/interface l2tp-client disable JSN-1\r\
    \n/ip rou rule set [find comment=\"INET1\"] src-address=\$\"local-address\
    \"\r\
    \n/int gre set JSN-GRE-1 local-address=\$\"local-address\"\r\
    \n/int l2tp-client en JSN-1\r\
    \n"
add change-tcp-mss=yes name=INET2 on-down=\
    "/interface l2tp-client disable JSN-2\r\
    \n" on-up="/interface l2tp-client disable JSN-2\r\
    \n/ip rou rule set [find comment=\"INET2\"] src-address=\$\"local-address\
    \"\r\
    \n/int ipip set JSN-IPIP-2 local-address=\$\"local-address\"\r\
    \n/int l2tp-client en JSN-2\r\
    \n"
add change-tcp-mss=yes dns-server=8.8.8.8,8.8.4.4 local-address=192.168.21.1 \
    name=kap only-one=yes remote-address=192.168.21.10
/interface pppoe-client
add disabled=no interface=ether4 name=INET1 password=604638633 profile=INET1 \
    user=142551105931@telkom.net
add disabled=no interface=ether3 name=INET2 password=912544775 profile=INET2 \
    user=146551110129@telkom.net
/queue type
add kind=pcq name=Down pcq-classifier=dst-address pcq-dst-address6-mask=64 \
    pcq-rate=3M pcq-src-address6-mask=64
add kind=pcq name=UP pcq-classifier=src-address pcq-dst-address6-mask=64 \
    pcq-rate=1M pcq-src-address6-mask=64
/routing ospf instance
set [ find default=yes ] in-filter=ospf redistribute-connected=as-type-1
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add disabled=yes interface=*11
add disabled=yes interface=*13
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/interface list member
add interface=JSN-1 list=JSN
add interface=JSN-IPIP-1 list=JSN
add interface=JSN-2 list=JSN
add interface=JSN-IPIP-2 list=JSN
add interface=INET1 list=WAN
add interface=INET2 list=WAN
add interface=ether1 list=JSN
add interface=ether5 list=JSN
add interface=JSN-GRE-1 list=JSN
/interface pppoe-server server
add disabled=no interface=ether9 max-mru=1500 max-mtu=1500 \
    one-session-per-host=yes service-name=HaaNSirO-Bella-Net
/ip address
add address=192.168.21.1/24 comment=output disabled=yes interface=ether9 \
    network=192.168.21.0
add address=103.80.81.152 interface=lo network=103.80.81.152
add address=172.31.253.25 interface=JSN-IPIP-1 network=172.31.252.25
add address=172.31.253.26 interface=JSN-IPIP-2 network=172.31.252.26
add address=172.31.251.2 interface=ether5 network=172.31.250.2
/ip dns
set allow-remote-requests=yes cache-max-ttl=1h max-concurrent-queries=1000 \
    max-concurrent-tcp-sessions=200 servers=103.80.80.231,103.80.80.232
/ip firewall address-list
add address=31.13.24.0/21 comment=FB list=Content
add address=31.13.64.0/18 comment=FB list=Content
add address=36.91.0.0/16 comment=FB list=Content
add address=45.64.40.0/22 comment=FB list=Content
add address=66.220.144.0/20 comment=FB list=Content
add address=69.63.176.0/20 comment=FB list=Content
add address=69.171.224.0/19 comment=FB list=Content
add address=74.119.76.0/22 comment=FB list=Content
add address=103.4.96.0/22 comment=FB list=Content
add address=129.134.0.0/16 comment=FB list=Content
add address=157.240.0.0/17 comment=FB list=Content
add address=157.240.24.0/24 comment=FB list=Content
add address=173.252.64.0/18 comment=FB list=Content
add address=179.60.192.0/22 comment=FB list=Content
add address=185.60.216.0/22 comment=FB list=Content
add address=204.15.20.0/22 comment=FB list=Content
add address=8.8.4.0/24 comment=Google list=Content
add address=8.8.8.0/24 comment=Google list=Content
add address=8.15.202.0/24 comment=Google list=Content
add address=8.34.208.0/20 comment=Google list=Content
add address=8.35.192.0/20 comment=Google list=Content
add address=23.236.48.0/20 comment=Google list=Content
add address=23.251.128.0/19 comment=Google list=Content
add address=35.184.0.0/13 comment=Google list=Content
add address=35.192.0.0/12 comment=Google list=Content
add address=45.121.228.0/22 comment=Google list=Content
add address=64.15.112.0/20 comment=Google list=Content
add address=64.233.160.0/19 comment=Google list=Content
add address=66.102.0.0/20 comment=Google list=Content
add address=66.249.64.0/19 comment=Google list=Content
add address=70.32.128.0/19 comment=Google list=Content
add address=72.14.192.0/18 comment=Google list=Content
add address=74.114.24.0/21 comment=Google list=Content
add address=74.125.0.0/16 comment=Google list=Content
add address=103.62.64.0/22 comment=Google list=Content
add address=104.132.0.0/16 comment=Google list=Content
add address=104.133.0.0/17 comment=Google list=Content
add address=104.134.128.0/17 comment=Google list=Content
add address=104.154.0.0/15 comment=Google list=Content
add address=104.196.0.0/14 comment=Google list=Content
add address=107.167.160.0/19 comment=Google list=Content
add address=107.178.192.0/18 comment=Google list=Content
add address=108.59.80.0/20 comment=Google list=Content
add address=108.170.192.0/18 comment=Google list=Content
add address=108.177.0.0/17 comment=Google list=Content
add address=113.197.106.0/24 comment=Google list=Content
add address=130.211.0.0/16 comment=Google list=Content
add address=142.250.0.0/15 comment=Google list=Content
add address=146.148.0.0/17 comment=Google list=Content
add address=162.216.148.0/22 comment=Google list=Content
add address=162.222.176.0/21 comment=Google list=Content
add address=172.102.8.0/21 comment=Google list=Content
add address=172.110.32.0/21 comment=Google list=Content
add address=172.217.0.0/16 comment=Google list=Content
add address=172.253.0.0/16 comment=Google list=Content
add address=173.194.0.0/16 comment=Google list=Content
add address=173.255.112.0/20 comment=Google list=Content
add address=185.25.28.0/23 comment=Google list=Content
add address=185.150.148.0/22 comment=Google list=Content
add address=192.104.160.0/23 comment=Google list=Content
add address=192.158.28.0/22 comment=Google list=Content
add address=192.178.0.0/15 comment=Google list=Content
add address=199.192.112.0/22 comment=Google list=Content
add address=199.223.232.0/21 comment=Google list=Content
add address=207.223.160.0/20 comment=Google list=Content
add address=208.65.152.0/22 comment=Google list=Content
add address=208.68.108.0/22 comment=Google list=Content
add address=208.81.188.0/22 comment=Google list=Content
add address=208.117.224.0/19 comment=Google list=Content
add address=209.85.128.0/17 comment=Google list=Content
add address=209.107.176.0/20 comment=Google list=Content
add address=216.58.192.0/19 comment=Google list=Content
add address=216.73.80.0/20 comment=Google list=Content
add address=216.239.32.0/19 comment=Google list=Content
add address=216.252.220.0/22 comment=Google list=Content
add address=118.98.30.0/24 comment=Telkom list=Content
add address=118.98.36.0/24 comment=Telkom list=Content
add address=118.98.76.0/23 comment=Telkom list=Content
add address=118.98.106.0/24 comment=Telkom list=Content
add address=118.98.109.0/24 comment=Telkom list=Content
add address=118.98.110.0/23 comment=Telkom list=Content
add address=118.98.93.0/24 comment=Telkom list=Content
add address=118.98.95.0/24 comment=Telkom list=Content
add address=118.98.96.0/22 comment=Telkom list=Content
add address=118.98.97.0/24 comment=Telkom list=Content
add address=118.97.158.0/23 comment=Telkom list=Content
add address=117.102.117.0/24 comment=BIZNET list=Content
add address=182.253.60.0/24 comment=BIZNET list=Content
add address=182.253.80.0/24 comment=BIZNET list=Content
add address=182.253.220.0/24 comment=BIZNET list=Content
add address=13.104.0.0/14 comment=Microsoft list=Content
add address=www.youtube.com comment=YT list=JSN
add address=m.youtube.com comment=YT list=JSN
add address=redirector.c.youtube.com comment=YT list=JSN
add address=redirector.googlevideo.com comment=YT list=JSN
add address=redirector.gvt1.com comment=YT list=JSN
add address=redirector.c.googlevideo.com comment=YT list=JSN
add address=157.240.208.0/24 comment=FB list=JSN
add address=103.80.80.128/26 comment="GGC JSN" list=JSN
add address=203.207.55.0/24 comment="GGC CDIX" list=JSN
add address=10.0.0.0/8 list=RFC-1918
add address=192.168.0.0/16 list=RFC-1918
add address=172.16.0.0/12 list=RFC-1918
add address=speedtest.net list=JSN
add address=www.speedtest.net list=JSN
add address=detik.com list=JSN
add address=speedtest.cbn.id list=JSN
add address=speedtest.biznetnetworks.com list=JSN
add address=google.com list=JSN
add address=whatismyipaddress.com list=JSN
add address=www.whatismyip.com list=JSN
add address=www.whatsmyip.org list=JSN
add address=www.myip.com list=JSN
add address=www.instagram.com list=JSN
add address=www.tempo.co list=JSN
add address=www.antaranews.com list=JSN
add address=www.liputan6.com list=JSN
add address=www.kompas.com list=JSN
add address=news.okezone.com list=JSN
add address=www.whatismyip-address.com list=JSN
add address=bgp.he.net list=JSN
add address=ipsaya.com list=JSN
add address=www.cekipsaya.com list=JSN
add address=ipku.in list=JSN
add address=www.kaskus.co.id list=JSN
/ip firewall filter
add action=drop chain=input dst-port=53 in-interface-list=WAN protocol=tcp
add action=drop chain=input dst-port=53 in-interface-list=WAN protocol=udp
add action=drop chain=forward comment="BLOCK ARAH JSN" dst-port=\
    25,1443,445,137,139,8291,3389,8728,8729 out-interface-list=JSN protocol=\
    tcp src-address-list=RFC-1918
add action=drop chain=forward comment="BLOCK ARAH JSN" dst-port=445,139 \
    out-interface-list=JSN protocol=udp src-address-list=RFC-1918
/ip firewall mangle
add action=mark-routing chain=prerouting comment=YT dst-address-list=JSN \
    new-routing-mark=YT passthrough=yes
/ip firewall nat
add action=src-nat chain=srcnat dst-address-list=!RFC-1918 \
    out-interface-list=JSN protocol=!ospf src-address=!103.80.80.0/22 \
    src-address-list=RFC-1918 to-addresses=103.80.81.152
add action=redirect chain=dstnat dst-port=53,5353 protocol=udp to-ports=53
add action=redirect chain=dstnat dst-port=53,5353 protocol=tcp to-ports=53
add action=masquerade chain=srcnat out-interface-list=WAN
add action=src-nat chain=srcnat disabled=yes out-interface=ether5 \
    to-addresses=103.80.81.152
add action=masquerade chain=srcnat disabled=yes out-interface=ether10
add action=masquerade chain=srcnat disabled=yes out-interface=ether6 \
    src-address=!192.168.255.0/24 to-addresses=103.80.82.33
add action=dst-nat chain=dstnat dst-address=11.11.11.15 dst-port=2323 \
    protocol=tcp to-addresses=136.1.1.100 to-ports=23
add action=masquerade chain=srcnat out-interface=ether3 src-address=\
    !192.168.255.0/24
add action=masquerade chain=srcnat out-interface=ether4 src-address=\
    !192.168.255.0/24
add action=dst-nat chain=dstnat comment=kap dst-address=192.168.21.1 \
    dst-port=8621 protocol=tcp to-addresses=192.168.21.10 to-ports=65432
/ip route
add check-gateway=ping comment=METRO distance=1 gateway=172.31.250.2 \
    routing-mark=JSN
add check-gateway=ping distance=2 gateway=172.31.252.25,172.31.252.26 \
    routing-mark=JSN
add check-gateway=ping comment=L2TP distance=3 gateway=\
    172.31.255.31,172.31.255.30 routing-mark=JSN
add check-gateway=ping comment=INET1 distance=1 gateway=INET1 routing-mark=\
    INET1
add check-gateway=ping comment=INET2 distance=1 gateway=INET2 routing-mark=\
    INET2
add comment=INET distance=1 gateway=INET1,INET2 routing-mark=INET
add check-gateway=ping distance=1 gateway=172.31.250.2
add check-gateway=ping distance=2 gateway=172.31.252.25,172.31.252.26
add check-gateway=ping distance=3 gateway=172.31.255.31,172.31.255.30
add distance=3 gateway=bkasSD
add check-gateway=ping comment=INET1 distance=11 gateway=INET1
add check-gateway=ping comment=INET2 distance=11 gateway=INET2
add comment="==INET1" distance=1 dst-address=103.80.81.128/32 gateway=INET1
add comment="==INET2" distance=1 dst-address=103.80.81.129/32 gateway=INET2
add check-gateway=ping distance=1 dst-address=103.80.81.136/32 gateway=\
    192.168.21.10
/ip route rule
add comment=YT routing-mark=YT table=JSN
add dst-address=192.168.0.0/16 table=main
add dst-address=172.16.0.0/12 table=main
add dst-address=10.0.0.0/8 table=main
add comment=INET1 src-address=36.65.161.93/32 table=INET1
add comment=INET2 src-address=36.65.166.139/32 table=INET2
add src-address=103.80.81.152/32 table=JSN
/ip service
set telnet disabled=yes
set ftp disabled=yes
set www port=8888
set ssh disabled=yes
set api disabled=yes
set winbox port=65432
set api-ssl disabled=yes
/ppp profile
add change-tcp-mss=yes dns-server=8.8.8.8,8.8.4.4 local-address=192.168.21.1 \
    name=PPPoE10m only-one=yes parent-queue=*1 rate-limit=10m/10m \
    remote-address=PPPoE
/ppp secret
add name=kap password=123456 profile=kap service=pppoe
/routing filter
add action=accept chain=ospf prefix=0.0.0.0/0
add action=accept chain=ospf prefix=10.0.0.0/8 prefix-length=8-32
add action=accept chain=ospf prefix=192.168.0.0/16 prefix-length=16-32
add action=accept chain=ospf prefix=172.16.0.0/12 prefix-length=12-32
add action=accept chain=ospf prefix=103.80.80.0/22 prefix-length=22-23
add action=accept chain=ospf-out
add action=discard chain=ospf
/routing ospf interface
add cost=5 interface=JSN-IPIP-1 network-type=point-to-point
add cost=5 interface=JSN-IPIP-2 network-type=point-to-point
/routing ospf network
add area=backbone disabled=yes network=172.31.255.0/24
add area=backbone disabled=yes network=172.31.252.0/24
add area=backbone disabled=yes network=103.80.81.152/32
/system clock
set time-zone-name=Asia/Jakarta
/system console
set [ find ] disabled=yes
/system identity
set name=1100X2Cadangan
/system package update
set channel=long-term
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
add interval=5s name=INET1 on-event=":if ( [/ip address get [find interface=\"\
    INET1\"] address] in 10.0.0.0/8) do={ \r\
    \n/int pppoe-client disable \"INET1\";\r\
    \ndelay 10\r\
    \n/int pppoe-client en \"INET1\";\r\
    \n}\r\
    \n" policy=reboot,read,write,test,password,sniff,sensitive,romon \
    start-time=startup
add interval=5s name=INET2 on-event=":if ( [/ip address get [find interface=\"\
    INET2\"] address] in 10.0.0.0/8) do={ \r\
    \n/int pppoe-client disable \"INET2\";\r\
    \ndelay 10\r\
    \n/int pppoe-client en \"INET2\";\r\
    \n}\r\
    \n" policy=reboot,read,write,test,password,sniff,sensitive,romon \
    start-time=startup
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
set enabled=yes secrets=JSN-Bersama
/tool romon port
set [ find default=yes ] secrets=JSN-Bersama
