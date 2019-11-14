
/interface bridge
add admin-mac=CC:2D:E0:93:5F:08 auto-mac=no fast-forward=no name=bridge1
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n disabled=no mode=ap-bridge \
    ssid=Veelice wps-mode=disabled
/interface ethernet
set [ find default-name=ether1 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full comment=wan \
    mac-address=CC:2D:E0:93:5F:07
set [ find default-name=ether2 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full mac-address=\
    CC:2D:E0:93:5F:08
set [ find default-name=ether3 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full mac-address=\
    CC:2D:E0:93:5F:09
set [ find default-name=ether4 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full mac-address=\
    CC:2D:E0:93:5F:0A
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa-psk,wpa2-psk eap-methods="" \
    mode=dynamic-keys supplicant-identity=MikroTik wpa-pre-shared-key=\
    sandaljepit wpa2-pre-shared-key=sandaljepit
/ip hotspot profile
add hotspot-address=192.168.0.1 http-cookie-lifetime=1d login-by=\
    cookie,http-chap,mac-cookie name=hsprof1
/ip hotspot
add interface=bridge1 name=hotspot1 profile=hsprof1
/ip pool
add name=dhcp_pool1 ranges=192.168.0.2-192.168.0.25
/ip dhcp-server
add address-pool=dhcp_pool1 authoritative=after-2sec-delay disabled=no \
    interface=bridge1 name=dhcp1
/queue simple
add max-limit=1M/6M name=Total_BW target=192.168.0.0/24
add max-limit=1M/5M name=queue-2 parent=Total_BW target=192.168.0.2/32
add max-limit=1M/5M name=queue-3 parent=Total_BW target=192.168.0.3/32
add max-limit=1M/5M name=queue-4 parent=Total_BW target=192.168.0.4/32
add max-limit=1M/5M name=queue-5 parent=Total_BW target=192.168.0.5/32
add max-limit=1M/5M name=queue-6 parent=Total_BW target=192.168.0.6/32
add max-limit=1M/5M name=queue-7 parent=Total_BW target=192.168.0.7/32
add max-limit=1M/5M name=queue-8 parent=Total_BW target=192.168.0.8/32
add max-limit=1M/5M name=queue-9 parent=Total_BW target=192.168.0.9/32
add max-limit=1M/5M name=queue-10 parent=Total_BW target=192.168.0.10/32
add max-limit=1M/5M name=queue-11 parent=Total_BW target=192.168.0.11/32
add max-limit=1M/5M name=queue-12 parent=Total_BW target=192.168.0.12/32
add max-limit=1M/5M name=queue-13 parent=Total_BW target=192.168.0.13/32
add max-limit=1M/5M name=queue-14 parent=Total_BW target=192.168.0.14/32
add max-limit=1M/5M name=queue-15 parent=Total_BW target=192.168.0.15/32
add max-limit=1M/5M name=queue-16 parent=Total_BW target=192.168.0.16/32
add max-limit=1M/5M name=queue-17 parent=Total_BW target=192.168.0.17/32
add max-limit=1M/5M name=queue-18 parent=Total_BW target=192.168.0.18/32
add max-limit=1M/5M name=queue-19 parent=Total_BW target=192.168.0.19/32
add max-limit=1M/5M name=queue-20 parent=Total_BW target=192.168.0.20/32
add max-limit=1M/5M name=queue-21 parent=Total_BW target=192.168.0.21/32
add max-limit=1M/5M name=queue-22 parent=Total_BW target=192.168.0.22/32
add max-limit=1M/5M name=queue-23 parent=Total_BW target=192.168.0.23/32
add max-limit=1M/5M name=queue-24 parent=Total_BW target=192.168.0.24/32
add max-limit=1M/5M name=queue-25 parent=Total_BW target=192.168.0.25/32
/ip hotspot user profile
set [ find default=yes ] mac-cookie-timeout=1d parent-queue=Total_BW \
    rate-limit=1m/3200k
/interface bridge port
add bridge=bridge1 interface=wlan1
add bridge=bridge1 interface=ether2
add bridge=bridge1 interface=ether3
add bridge=bridge1 interface=ether4
/ip address
add address=192.168.2.160/24 interface=ether1 network=192.168.2.0
add address=192.168.0.1/24 interface=bridge1 network=192.168.0.0
/ip dhcp-server network
add address=192.168.0.0/24 gateway=192.168.0.1
/ip dns
set allow-remote-requests=yes servers=8.8.8.8,8.8.4.4
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat comment="masquerade hotspot network"
/ip hotspot user
add name=admin password=admin123
/ip route
add distance=1 gateway=192.168.2.1
/system clock
set time-zone-name=Asia/Jakarta
/system ntp client
set enabled=yes primary-ntp=202.162.32.12 secondary-ntp=198.123.30.132
/system package update
set channel=long-term
