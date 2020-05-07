# Simple Masquerade of Machines on Network through a WAN Interface

Need a simple (no firewall) isolated network within your network where those machines need to "talk outside".     

My use case is a stand alone IOT system that had more than one host machine.  By isolating that with a "gateway" sbc with dual nic (used usb/ethernet) I can have consistent IP addressing no matter where the system is deployed.  

This really is only appropriate within a private LAN.  If the WAN side is going to be public facing then you need a more robust firewall like firehol.

Included in repo are three bash scripts and Systemd Service file.

1. clone repo

2. edit the scripts changing the wan/lan Nic names

3. edit service file changing the path to scripts

4.  link or copy the service file to `/etc/systemd/system`


Then to start, stop, persist

```
sudo systemctl start masquerade
sudo systemctl stop masquerade  
sudo systemctl enable masquerade  
```

try starting the service then ping something "outside" from a host "inside" (not the gateway)

if it works then enable it and you are set.

inspired by this post
https://superuser.com/a/939657/430020