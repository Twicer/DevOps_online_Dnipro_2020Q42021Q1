# EPAM University Programs

## DevOps education program
### Module 6 Networking with Linux 


#### TASK 1
1.Create virtual machines connection according to figure 1

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/main.jpg)

2.VM2 has one interface (internal), VM1 has 2 interfaces (NAT and internal). Configure  all networkinterfaces in order to make VM2 has an access to the Internet (iptables, forward, masquerade).

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/0png)

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/0a.png)

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/2a.png)

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/2b.png)

>We can accept new connections by protocols DNS and ICMP. All other incoming connections on the outside interface will be blocked. Allowed DNS or ICMP only

* All packages on the local interface are allowed.
* Protection against ICMP flood and TСP flood is not implemented
* Scan protection not implemented
* Logging not implemented

3.Check the route from VM2 to Host.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/3.png)

4.Check the access to the Internet, (just ping, for example, 8.8.8.8).

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/4.png)

5.Determine, which  resource has an IP address 8.8.8.8.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/5a.png)

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/5b.png)

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/5c.png)

6.Determine, which  IP address belongs to resource epam.com.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/6.png)

7.Determine the default gateway for your HOST and display routing table. 

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/7.png)

8.Trace the route to google.com. 

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/8.png)

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/9.png)

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/9b.png)

I found my mistake I fogotten uncomment ```string net.ipv4.ip_forward=1``` in ```/etc/sysctl.conf```

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m6/task6.1/screens/10.png)