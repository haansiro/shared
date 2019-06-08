# jun/08/2019 22:22:58 by RouterOS 6.40.4
# software id = FXH4-LVM4
#
# model = 1100AH
# serial number = 319F024EA8D3
/interface ethernet
set [ find default-name=ether1 ] comment=olt_out
set [ find default-name=ether6 ] comment=wan1
set [ find default-name=ether7 ] comment=wan2
set [ find default-name=ether10 ] comment=conf
/interface vlan
add interface=ether1 name=vlan100 vlan-id=100
add interface=ether1 name=vlan101 vlan-id=101
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=PPPoE ranges=192.168.8.2-192.168.8.254
/port
set 0 baud-rate=9600
/interface l2tp-client
add connect-to=103.80.80.219 disabled=no name=l2tp-out1 password=igm123 \
    profile=default user=igm
/queue type
add kind=pcq name=Down pcq-classifier=dst-address pcq-dst-address6-mask=64 \
    pcq-rate=3M pcq-src-address6-mask=64
add kind=pcq name=UP pcq-classifier=src-address pcq-dst-address6-mask=64 \
    pcq-rate=1M pcq-src-address6-mask=64
/queue simple
add max-limit=20M/100M name=PPPOE queue=default/default target=192.168.8.0/24
/ppp profile
add change-tcp-mss=yes dns-server=103.80.80.243,103.80.80.244 \
    insert-queue-before=bottom local-address=192.168.8.1 name=PPPoE only-one=\
    yes parent-queue=PPPOE rate-limit=2100k/3200k remote-address=PPPoE
add change-tcp-mss=yes dns-server=103.80.80.243,103.80.80.244 \
    insert-queue-before=bottom local-address=192.168.8.1 name=HaaNS10 \
    only-one=yes parent-queue=PPPOE rate-limit=2100k/10200k remote-address=\
    PPPoE
add change-tcp-mss=yes dns-server=103.80.80.243,103.80.80.244 \
    insert-queue-before=bottom local-address=192.168.8.1 name=HaaNS05 \
    only-one=yes parent-queue=PPPOE rate-limit=2100k/5200k remote-address=\
    PPPoE
add change-tcp-mss=yes dns-server=103.80.80.243,103.80.80.244 \
    insert-queue-before=bottom local-address=192.168.8.1 name=HaaNS04 \
    only-one=yes parent-queue=PPPOE rate-limit=2100k/4200k remote-address=\
    PPPoE
add change-tcp-mss=yes dns-server=103.80.80.243,103.80.80.244 \
    insert-queue-before=bottom local-address=192.168.8.1 name=HaaNS06 \
    only-one=yes parent-queue=PPPOE rate-limit=2100k/6200k remote-address=\
    PPPoE
/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/interface pppoe-server server
add disabled=no interface=vlan101 max-mru=1500 max-mtu=1500 service-name=\
    Jontro-Bella-Net
/ip address
add address=192.168.255.254/24 comment=olt interface=vlan100 network=\
    192.168.255.0
add address=192.168.2.253/24 comment="input backup" interface=ether6 network=\
    192.168.2.0
/ip dns
set allow-remote-requests=yes cache-max-ttl=1h servers=8.8.8.8,8.8.4.4
/ip firewall nat
add action=redirect chain=dstnat dst-port=53 protocol=udp to-ports=53
add action=masquerade chain=srcnat out-interface=ether6 src-address=\
    !192.168.255.0/24 to-addresses=103.80.82.33
add action=masquerade chain=srcnat out-interface=ether7 src-address=\
    !192.168.255.0/24 to-addresses=103.80.82.33
/ip route
add distance=1 gateway=192.168.2.1
add distance=1 dst-address=11.11.11.0/24 gateway=11.11.11.1
/ip route rule
add disabled=yes src-address=103.80.82.33/32 table=jsn
/ip service
set ftp disabled=yes
set www disabled=yes
set ssh disabled=yes
set api disabled=yes
set winbox port=5432
set api-ssl disabled=yes
/ppp secret
add name=testing@jontro password=123456 profile=PPPoE
add name=testing2@jontro password=123456 profile=PPPoE
add name=igm1@jontro password=12345678 profile=PPPoE
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
add name=igm12@jontro password=12345678 profile=PPPoE
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
add name=igm60@jontro password=12345678 profile=HaaNS10
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
add name=igm75@jontro password=12345678 profile=HaaNS05
add name=igm76@jontro password=12345678 profile=PPPoE
add name=igm77@jontro password=12345678 profile=PPPoE
add name=igm78@jontro password=12345678 profile=PPPoE
add name=igm79@jontro password=12345678 profile=HaaNS06
add name=igm80@jontro password=12345678 profile=PPPoE
add name=igm81@jontro password=12345678 profile=PPPoE
add name=igm82@jontro password=12345678 profile=PPPoE
add name=igm83@jontro password=12345678 profile=HaaNS10
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
add name=igm98@jontro password=12345678 profile=PPPoE
add name=igm99@jontro password=12345678 profile=PPPoE
add name=igm100@jontro password=12345678 profile=PPPoE
add name=igm101@jontro password=12345678 profile=PPPoE
add name=igm102@jontro password=12345678 profile=PPPoE
add name=igm103@jontro password=12345678 profile=PPPoE
add name=igm104@jontro password=12345678 profile=PPPoE
add name=igm105@jontro password=12345678 profile=PPPoE
add name=igm106@jontro password=12345678 profile=PPPoE
add name=igm107@jontro password=12345678 profile=PPPoE
add name=igm108@jontro password=12345678 profile=PPPoE
add name=igm109@jontro password=12345678 profile=PPPoE
add name=igm110@jontro password=12345678 profile=PPPoE
/system clock
set time-zone-name=Asia/Jakarta
/system console
set [ find ] disabled=yes
/system identity
set name=mik1100
/tool romon
set enabled=yes secrets=BellaNet
/tool romon port
set [ find default=yes ] secrets=BellaNet
/tool user-manager database
set db-path=user-manager
