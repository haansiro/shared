# jun/08/2019 22:16:10 by RouterOS 6.43.14
# software id = BTEB-C0C5
#
# model = RouterBOARD 941-2nD
# serial number = 8CE50817143A
/interface bridge
add admin-mac=6C:3B:6B:5C:4C:F8 auto-mac=no name=gratis protocol-mode=none
add name=keluarga
add name=service
/interface ethernet
set [ find default-name=ether1 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full mac-address=\
    6C:3B:6B:5C:4C:F7 name="ether1 int"
set [ find default-name=ether2 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full comment=\
    gratis mac-address=6C:3B:6B:5C:4C:F8
set [ find default-name=ether3 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full comment=\
    service mac-address=6C:3B:6B:5C:4C:F9
set [ find default-name=ether4 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full comment=\
    keluarga mac-address=6C:3B:6B:5C:4C:FA
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa2-psk eap-methods="" \
    supplicant-identity=MikroTik wpa2-pre-shared-key=lareloro
add authentication-types=wpa2-psk eap-methods="" management-protection=\
    allowed mode=dynamic-keys name=keluarga supplicant-identity="" \
    wpa2-pre-shared-key=netwoking
add authentication-types=wpa2-psk eap-methods="" management-protection=\
    allowed mode=dynamic-keys name=service supplicant-identity="" \
    wpa2-pre-shared-key=12345678
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n disabled=no mode=ap-bridge \
    security-profile=service ssid=Service_HaaNSirO wps-mode=disabled
add disabled=no keepalive-frames=disabled mac-address=CE:2D:E0:5C:9E:69 \
    master-interface=wlan1 multicast-buffering=disabled name=wlan2 ssid=\
    "gratis haansiro.com" wds-cost-range=0 wds-default-cost=0 wps-mode=\
    disabled
add disabled=no keepalive-frames=disabled mac-address=CE:2D:E0:5C:9E:6A \
    master-interface=wlan1 multicast-buffering=disabled name=wlan3 \
    security-profile=keluarga ssid=keluarga.haansiro.com wds-cost-range=0 \
    wds-default-cost=0 wps-mode=disabled
/ip hotspot profile
set [ find default=yes ] dns-name=haansiro.com hotspot-address=192.168.0.1 \
    login-by=cookie,http-chap,mac-cookie
/ip hotspot user profile
add keepalive-timeout=5h mac-cookie-timeout=4w2d name=profile_jam rate-limit=\
    1M/2M shared-users=1000
/ip pool
add name=dhcp_pool0 ranges=192.168.111.2-192.168.111.25
add name=dhcp_pool1 ranges=192.168.112.2-192.168.112.25
add name=dhcp_pool2 ranges=192.168.113.2-192.168.113.25
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=service name=dhcp1
add address-pool=dhcp_pool1 disabled=no interface=keluarga name=dhcp2
add address-pool=dhcp_pool2 disabled=no interface=gratis name=dhcp3
/ip hotspot
add address-pool=dhcp_pool0 addresses-per-mac=1 idle-timeout=none interface=\
    wlan1 name=server1
/interface l2tp-client
add connect-to=103.80.80.219 name=l2tp-out1 password=gratis123 profile=\
    default user=ofchaans
/interface pptp-client
add connect-to=103.80.80.219 disabled=no name=pptp-out1 password=gratis123 \
    profile=default user=ofchaans
/queue simple
add max-limit=10M/20M name=Total_BW packet-marks=packet-bypass-icmp target=\
    192.168.0.0/16
add max-limit=10M/10M name="1. service" parent=Total_BW target=\
    192.168.111.0/24
add max-limit=2M/10M name="3. keluarga" parent=Total_BW target=\
    192.168.112.0/24
add max-limit=2M/10M name="2. gratis" parent=Total_BW target=192.168.113.0/24
add max-limit=1M/3M name=queue-2 packet-marks=packet-bypass-icmp parent=\
    "1. service" target=192.168.111.2/32
add max-limit=1M/3M name=queue-3 parent="1. service" target=192.168.111.3/32
add max-limit=1M/3M name=queue-4 parent="1. service" target=192.168.111.4/32
add max-limit=1M/3M name=queue-5 parent="1. service" target=192.168.111.5/32
add max-limit=1M/3M name=queue-6 parent="1. service" target=192.168.111.6/32
add max-limit=1M/3M name=queue-7 parent="1. service" target=192.168.111.7/32
add max-limit=1M/3M name=queue-8 parent="1. service" target=192.168.111.8/32
add max-limit=1M/3M name=queue-9 parent="1. service" target=192.168.111.9/32
add max-limit=1M/3M name=queue-10 parent="1. service" target=\
    192.168.111.10/32
add max-limit=1M/3M name=queue-11 parent="1. service" target=\
    192.168.111.11/32
add max-limit=1M/3M name=queue-12 parent="1. service" target=\
    192.168.111.12/32
add max-limit=1M/3M name=queue-13 parent="1. service" target=\
    192.168.111.13/32
add max-limit=1M/3M name=queue-14 parent="1. service" target=\
    192.168.111.14/32
add max-limit=1M/3M name=queue-15 parent="1. service" target=\
    192.168.111.15/32
add max-limit=1M/3M name=queue-16 parent="1. service" target=\
    192.168.111.16/32
add max-limit=1M/3M name=queue-17 parent="1. service" target=\
    192.168.111.17/32
add max-limit=1M/3M name=queue-18 parent="1. service" target=\
    192.168.111.18/32
add max-limit=1M/3M name=queue-19 parent="1. service" target=\
    192.168.111.19/32
add max-limit=1M/3M name=queue-20 parent="1. service" target=\
    192.168.111.20/32
add max-limit=1M/3M name=queue-21 parent="1. service" target=\
    192.168.111.21/32
add max-limit=1M/3M name=queue-22 parent="1. service" target=\
    192.168.111.22/32
add max-limit=1M/3M name=queue-23 parent="1. service" target=\
    192.168.111.23/32
add max-limit=1M/3M name=queue-24 parent="1. service" target=\
    192.168.111.24/32
add max-limit=1M/3M name=queue-25 parent="1. service" target=\
    192.168.111.25/32
add max-limit=1M/2M name=queuek-2 parent="3. keluarga" target=\
    192.168.112.2/32
add max-limit=1M/2M name=queuek-3 parent="3. keluarga" target=\
    192.168.112.3/32
add max-limit=1M/2M name=queuek-4 parent="3. keluarga" target=\
    192.168.112.4/32
add max-limit=1M/2M name=queuek-5 parent="3. keluarga" target=\
    192.168.112.5/32
add max-limit=1M/2M name=queuek-6 parent="3. keluarga" target=\
    192.168.112.6/32
add max-limit=1M/2M name=queuek-7 parent="3. keluarga" target=\
    192.168.112.7/32
add max-limit=1M/2M name=queuek-8 parent="3. keluarga" target=\
    192.168.112.8/32
add max-limit=1M/2M name=queuek-9 parent="3. keluarga" target=\
    192.168.112.9/32
add max-limit=1M/2M name=queuek-10 parent="3. keluarga" target=\
    192.168.112.10/32
add max-limit=1M/2M name=queuek-11 parent="3. keluarga" target=\
    192.168.112.11/32
add max-limit=1M/2M name=queuek-12 parent="3. keluarga" target=\
    192.168.112.12/32
add max-limit=1M/2M name=queuek-13 parent="3. keluarga" target=\
    192.168.112.13/32
add max-limit=1M/2M name=queuek-14 parent="3. keluarga" target=\
    192.168.112.14/32
add max-limit=1M/2M name=queuek-15 parent="3. keluarga" target=\
    192.168.112.15/32
add max-limit=1M/2M name=queuek-16 parent="3. keluarga" target=\
    192.168.112.16/32
add max-limit=1M/2M name=queuek-17 parent="3. keluarga" target=\
    192.168.112.17/32
add max-limit=1M/2M name=queuek-18 parent="3. keluarga" target=\
    192.168.112.18/32
add max-limit=1M/2M name=queuek-19 parent="3. keluarga" target=\
    192.168.112.19/32
add max-limit=1M/2M name=queuek-20 parent="3. keluarga" target=\
    192.168.112.20/32
add max-limit=1M/2M name=queuek-21 parent="3. keluarga" target=\
    192.168.112.21/32
add max-limit=1M/2M name=queuek-22 parent="3. keluarga" target=\
    192.168.112.22/32
add max-limit=1M/2M name=queuek-23 parent="3. keluarga" target=\
    192.168.112.23/32
add max-limit=1M/2M name=queuek-24 parent="3. keluarga" target=\
    192.168.112.24/32
add max-limit=1M/2M name=queuek-25 parent="3. keluarga" target=\
    192.168.112.25/32
add max-limit=1M/2M name=queueg-2 parent="2. gratis" target=192.168.113.2/32
add max-limit=1M/2M name=queueg-3 parent="2. gratis" target=192.168.113.3/32
add max-limit=1M/2M name=queueg-4 parent="2. gratis" target=192.168.113.4/32
add max-limit=1M/2M name=queueg-5 parent="2. gratis" target=192.168.113.5/32
add max-limit=1M/2M name=queueg-6 parent="2. gratis" target=192.168.113.6/32
add max-limit=1M/2M name=queueg-7 parent="2. gratis" target=192.168.113.7/32
add max-limit=1M/2M name=queueg-8 parent="2. gratis" target=192.168.113.8/32
add max-limit=1M/2M name=queueg-9 parent="2. gratis" target=192.168.113.9/32
add max-limit=1M/2M name=queueg-10 parent="2. gratis" target=\
    192.168.113.10/32
add max-limit=1M/2M name=queueg-11 parent="2. gratis" target=\
    192.168.113.11/32
add max-limit=1M/2M name=queueg-12 parent="2. gratis" target=\
    192.168.113.12/32
add max-limit=1M/2M name=queueg-13 parent="2. gratis" target=\
    192.168.113.13/32
add max-limit=1M/2M name=queueg-14 parent="2. gratis" target=\
    192.168.113.14/32
add max-limit=1M/2M name=queueg-15 parent="2. gratis" target=\
    192.168.113.15/32
add max-limit=1M/2M name=queueg-16 parent="2. gratis" target=\
    192.168.113.16/32
add max-limit=1M/2M name=queueg-17 parent="2. gratis" target=\
    192.168.113.17/32
add max-limit=1M/2M name=queueg-18 parent="2. gratis" target=\
    192.168.113.18/32
add max-limit=1M/2M name=queueg-19 parent="2. gratis" target=\
    192.168.113.19/32
add max-limit=1M/2M name=queueg-20 parent="2. gratis" target=\
    192.168.113.20/32
add max-limit=1M/2M name=queueg-21 parent="2. gratis" target=\
    192.168.113.21/32
add max-limit=1M/2M name=queueg-22 parent="2. gratis" target=\
    192.168.113.22/32
add max-limit=1M/2M name=queueg-23 parent="2. gratis" target=\
    192.168.113.23/32
add max-limit=1M/2M name=queueg-24 parent="2. gratis" target=\
    192.168.113.24/32
add max-limit=1M/2M name=queueg-25 parent="2. gratis" target=\
    192.168.113.25/32
/ip hotspot user profile
set [ find default=yes ] mac-cookie-timeout=1d name=1hari on-login=":local pen\
    gguna \$user;\r\
    \n:local date [/sys cl get date];\r\
    \n:local time [/sys cl get time];\r\
    \n:log warning \"\$pengguna telah login pada jam \$time\";\r\
    \n{\r\
    \n:if ([/sys sch find name=\$pengguna]=\"\") do={\r\
    \n/sys sch add name=\$pengguna interval=1d on-event=\"/ip h u rem [find na\
    me=\$pengguna] \\r\\n/ip h ac rem [find user=\$pengguna]\\r\\n/system sch \
    rem [find name=\$pengguna]\"\r\
    \n}\r\
    \n}" parent-queue=Total_BW rate-limit=1m/2200k
add address-pool=dhcp_pool0 mac-cookie-timeout=1d name=1mggu on-login=":local \
    pengguna \$user;\r\
    \n:local date [/sys cl get date];\r\
    \n:local time [/sys cl get time];\r\
    \n:log warning \"\$pengguna telah login pada jam \$time\";\r\
    \n{\r\
    \n:if ([/sys sch find name=\$pengguna]=\"\") do={\r\
    \n/sys sch add name=\$pengguna interval=7d on-event=\"/ip h u rem [find na\
    me=\$pengguna] \\r\\n/ip h ac rem [find user=\$pengguna]\\r\\n/system sch \
    rem [find name=\$pengguna]\"\r\
    \n}\r\
    \n}" parent-queue=Total_BW rate-limit=1m/2200k
add address-pool=dhcp_pool0 mac-cookie-timeout=1d name=3hari on-login=":local \
    pengguna \$user;\r\
    \n:local date [/sys cl get date];\r\
    \n:local time [/sys cl get time];\r\
    \n:log warning \"\$pengguna telah login pada jam \$time\";\r\
    \n{\r\
    \n:if ([/sys sch find name=\$pengguna]=\"\") do={\r\
    \n/sys sch add name=\$pengguna interval=3d on-event=\"/ip h u rem [find na\
    me=\$pengguna] \\r\\n/ip h ac rem [find user=\$pengguna]\\r\\n/system sch \
    rem [find name=\$pengguna]\"\r\
    \n}\r\
    \n}" parent-queue=Total_BW rate-limit=1m/2200k
/interface bridge port
add bridge=gratis interface=ether2
add bridge=gratis interface=wlan2
add bridge=keluarga interface=ether4
add bridge=keluarga interface=wlan3
add bridge=service interface=ether3
add bridge=service interface=wlan1
/ip address
add address=192.168.2.251/24 interface="ether1 int" network=192.168.2.0
add address=192.168.111.1/24 interface=service network=192.168.111.0
add address=192.168.1.251/24 interface="ether1 int" network=192.168.1.0
add address=192.168.3.251/24 interface="ether1 int" network=192.168.3.0
add address=192.168.4.251/24 interface="ether1 int" network=192.168.4.0
add address=192.168.5.251/24 interface="ether1 int" network=192.168.5.0
add address=192.168.6.251/24 interface="ether1 int" network=192.168.6.0
add address=192.168.7.251/24 interface="ether1 int" network=192.168.7.0
add address=192.168.8.251/24 interface="ether1 int" network=192.168.8.0
add address=192.168.112.1/24 interface=keluarga network=192.168.112.0
add address=192.168.113.1/24 interface=gratis network=192.168.113.0
add address=192.168.0.251/24 interface="ether1 int" network=192.168.0.0
add address=192.168.20.251/24 interface="ether1 int" network=192.168.20.0
add address=192.168.77.251/24 interface="ether1 int" network=192.168.77.0
/ip dhcp-server network
add address=192.168.111.0/24 gateway=192.168.111.1
add address=192.168.112.0/24 gateway=192.168.112.1
add address=192.168.113.0/24 gateway=192.168.113.1
/ip dns
set allow-remote-requests=yes servers=1.1.1.1,1.0.0.1
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip firewall mangle
add action=mark-connection chain=forward comment="Mangle untuk bypass ICMP" \
    dst-address=192.168.0.0/16 new-connection-mark=conn-bypass-icmp \
    passthrough=yes protocol=!icmp
add action=mark-connection chain=forward new-connection-mark=conn-bypass-icmp \
    passthrough=yes protocol=!icmp src-address=192.168.0.0/16
add action=mark-packet chain=forward connection-mark=conn-bypass-icmp \
    new-packet-mark=packet-bypass-icmp passthrough=no
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    out-interface="ether1 int"
# l2tp-out1 not ready
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    out-interface=l2tp-out1
/ip hotspot user
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=6723 password=3276
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=8284 password=1715
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=9124 password=0875
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=4526 password=5473
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=1748 password=8251
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=4236 password=5763
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=3396 password=6603
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=6705 password=3294
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=0724 password=9275
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=4259 password=5740 \
    profile=3hari
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=7913 password=2086 \
    profile=3hari
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=6001 password=3998 \
    profile=3hari
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=5509 password=4490 \
    profile=3hari
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=6007 password=3992 \
    profile=3hari
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=8485 password=1514 \
    profile=3hari
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=0654 password=9345 \
    profile=3hari
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=9678 password=0321 \
    profile=3hari
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=1270 password=8729 \
    profile=3hari
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=0090 password=9909 \
    profile=3hari
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=2591 password=7408 \
    profile=1mggu
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=7306 password=2693 \
    profile=1mggu
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=4265 password=5734 \
    profile=1mggu
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=7639 password=2360 \
    profile=1mggu
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=6970 password=3029 \
    profile=1mggu
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=3216 password=6783 \
    profile=1mggu
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=3620 password=6379 \
    profile=1mggu
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=4663 password=5336 \
    profile=1mggu
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=3044 password=6955 \
    profile=1mggu
add comment="5j1h : \"2000\" 1" limit-uptime=5h name=8408 password=1591 \
    profile=1mggu
add comment="Created with Mikroticket. - Plan: jam - 11/05/19 13.46" \
    limit-uptime=5h name=1948 password=5771 profile=profile_jam server=\
    server1
/ip route
add distance=1 gateway=192.168.2.1
add distance=1 dst-address=11.11.11.0/24 gateway=11.11.11.1
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Jakarta
/system clock manual
set time-zone=+07:00
/system identity
set name=office_haans
#error exporting /system note
#interrupted
