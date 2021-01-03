# EPAM University Programs

## DevOps education program
### Module 4 Networking Fundamentals


#### TASK 4.2

##### Завдання 1

> Необхідно змоделювати корпоративну мережу організації, яка містить 2  будинки  по  2  поверхи  в  кожному.  Горизонтальна  підсистема  поверху складається з однієї робочої групи по 5 комп'ютерів.Провести аналіз працездатності мережі і її трафіку.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.4bonus/screens/1.jpg)

Subnet table:

| LAN № 	| Address Network 	| Prefix 	| Mask            	| Range                       	| Broadcast    	| DHCP Pool     	| Reserved      	|
|-------	|-----------------	|--------	|-----------------	|-----------------------------	|--------------	|---------------	|---------------	|
| LAN_1 	|    179.90.0.0   	|   /25  	| 255.255.255.128 	|  179.90.0.1 - 179.90.0.126  	| 179.90.0.127 	| *.11 - *.126  	| *.1 - *.10    	|
| LAN_2 	|   179.90.0.128  	|   /25  	| 255.255.255.128 	| 179.90.0.129 - 179.90.0.254 	| 179.90.0.255 	| *.140 - *.254 	| *.129 - *.139 	|
| LAN_3 	|   179.179.0.0   	|   /28  	| 255.255.255.240 	|  179.179.0.1 - 179.179.0.14 	| 179.179.0.15 	| *.11 - *.14   	| *.1 - *.10    	|
| LAN_4 	|   179.179.0.16  	|   /28  	| 255.255.255.240 	| 179.179.0.17 - 179.179.0.30 	| 179.179.0.31 	| *.21 - *.30   	| *.17 - *.20   	|
| LAN_5 	|   199.199.0.0   	|   /30  	| 255.255.255.224 	|  199.199.0.1 - 199.199.0.2  	| 199.199.0.3  	| ---------     	| --------      	|

Table of network devices:

|         DeviceName        	|  GW Address  	| Prefix 	|  DHCP/StaticIP 	| DHCP/StaticIP 2nd Int 	| Prefix 	|
|:-------------------------:	|:------------:	|:------:	|:--------------:	|:---------------------:	|--------	|
| PC 1-5                    	| 179.90.0.129 	|   25   	|      DHCP      	|          ---          	|   ---  	|
| PC 6-10                   	|  179.90.0.1  	|   25   	|      DHCP      	|          ---          	|   ---  	|
| PC 11-15                  	| 179.179.0.17 	|   28   	|      DHCP      	|          ---          	|   ---  	|
| PC 16-20                  	|  179.179.0.1 	|   28   	|      DHCP      	|          ---          	|   ---  	|
| Router Buildin1           	|      ---     	|   30   	|   192.192.0.2  	|          ---          	|   ---  	|
| Router Building2          	|      ---     	|   30   	|   192.192.0.1  	|     209.165.20.226    	|   28   	|
| ISP                       	|      ---     	|   28   	| 209.165.20.225 	|          ---          	|   ---  	|
| Switch_LAN1 - Switch_LAN4 	|     AUTO     	|  AUTO  	|       ---      	|          ---          	|   ---  	|

Building 1 router was configured using the command line. The configuration you can see below:

```
Router(config)#hostname Building1
Building1(config)#enable secret cisco
Building1(config)#service password-encryption 
Building1(config)#line vty 0 15
Building1(config-line)#password cisco
Building1(config-line)#line console 0
Building1(config-line)#password cisco
Building1(config-line)#login
Building1(config-line)#exit
Building1(config)#interface gigabitEthernet 0/0
Building1(config-if)#ip address 179.90.0.1 255.255.255.128
Building1(config-if)#no shutdown
Building1(config)#interface gigabitEthernet 0/1
Building1(config-if)#ip address 179.90.0.129 255.255.255.128
Building1(config-if)#no shutdown
Building1(config)#interface Serial0/0/0
Building1(config-if)#ip address 192.192.0.2 255.255.255.252
Building1(config-if)#clock rate 2000000
Building1(config-if)#no shutdown
Building1(config-if)#exit
Building1(config)#ip dhcp excluded-address 179.90.0.1 179.90.0.10
Building1(config)#ip dhcp excluded-address 179.90.0.129 179.90.0.139
Building1(config)#ip dhcp pool Net1
Building1(dhcp-config)#network 179.90.0.0 255.255.255.128
Building1(dhcp-config)#default-router 179.90.0.1
Building1(dhcp-config)#exit
Building1(config)#ip dhcp pool Net2
Building1(dhcp-config)#network 179.90.0.128 255.255.255.128
Building1(dhcp-config)#default-router 179.90.0.129
Building1(dhcp-config)#exit
Building1(config)#router eigrp 200
Building1(config-router)#network 179.91.0.0
Building1(config-router)#network 179.90.0.0
Building1(config-router)#exit
Building1(config)#router rip
Building1(config-router)#network 179.90.0.0
Building1(config-router)#network 179.179.0.0
Building1(config-router)#network 192.192.0.0
Building1(config-router)#exit
Building1(config)#exit
Building1#write memory 
Building1#reload
```


Demo:

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.4bonus/screens/1.gif)



##### Завдання 2

> Необхідно змоделювати корпоративну мережу організації, яка містить 1  будинок  з  чотирма  поверхами.  Горизонтальна  підсистема  поверху складається з двох робочих груп по 3 і 5 комп'ютерів відповідно.Провести логічну структуризацію мережі на 8 підмереж (відповідно до  кількості  робочих  груп).  Провести  аналіз  працездатності  мережі  і  її трафіку.

Subnet table:

| LAN Name  	| VLAN 	| Network        	| Prefix 	| Mask            	| Range                           	| Broadcast      	| DHCP Pool     	| Reserved       	|
|-----------	|------	|----------------	|--------	|-----------------	|---------------------------------	|----------------	|---------------	|----------------	|
| FL1       	| 1    	| 192.169.0.0    	| 26     	| 255.255.255.192 	| 192.169.0.1 - 192.169.0.62      	| 192.169.0.63   	| *.1 - *.62    	| 192.169.0.1    	|
| Admins    	| 10   	| 192.169.10.0   	| 26     	| 255.255.255.192 	| 192.169.10.1 - 192.169.10.62    	| 192.169.10.63  	| *.1 - *.62    	| 192.169.10.1   	|
| FL2       	| 1    	| 192.169.0.64   	| 26     	| 255.255.255.192 	| 192.169.0.65 - 192.169.0.126    	| 192.169.0.127  	| *.65 - *.126  	| 192.169.0.65   	|
| Directors 	| 20   	| 192.169.20.64  	| 26     	| 255.255.255.192 	| 192.169.20.65 - 192.169.20.126  	| 192.169.20.127 	| *.65 - *.126  	| 192.169.20.65  	|
| FL3       	| 1    	| 192.169.0.128  	| 26     	| 255.255.255.192 	|  192.169.0.129 - 192.169.0.190  	| 192.169.0.191  	| *.129 - *.190 	| 192.169.0.129  	|
| Room3     	| 30   	| 192.169.30.128 	| 26     	| 255.255.255.192 	| 192.169.30.129 - 192.169.30.190 	| 192.169.30.191 	| *.129 - *.190 	| 192.169.30.129 	|
| FL4       	| 1    	| 192.169.0.192  	| 26     	| 255.255.255.192 	| 192.169.0.193 - 192.169.0.254   	| 192.169.0.255  	| *.193 -*.254  	| 192.169.0.193  	|
| Room5     	| 40   	| 192.169.40.192 	| 26     	| 255.255.255.192 	| 192.169.40.193 - 192.169.40.254 	| 192.169.40.255 	| *.193 -*.254  	| 192.169.40.193 	| 

All PCs receive IP according to their VLAN.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.2/screens/23.jpg)

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.2/screens/22.jpg)

Router and switch configuration commands:

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.2/screens/24.jpg)

This is an example of a Switch0 config file:

```
!
version 12.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname Switch
!
!
!
!
!
!
spanning-tree mode pvst
spanning-tree extend system-id
!
interface GigabitEthernet0/1
 switchport mode trunk
!
interface GigabitEthernet1/1
!
interface GigabitEthernet2/1
!
interface GigabitEthernet3/1
!
interface GigabitEthernet4/1
 switchport access vlan 10
!
interface GigabitEthernet5/1
 switchport access vlan 10
!
interface GigabitEthernet6/1
 switchport access vlan 10
!
interface GigabitEthernet7/1
 switchport access vlan 10
!
interface GigabitEthernet8/1
 switchport access vlan 10
!
interface GigabitEthernet9/1
!
interface Vlan1
 no ip address
 shutdown
!
!
!
!
line con 0
!
line vty 0 4
 login
line vty 5 15
 login
!
!
!
!
end


```



Other switches were configured in the same way.
I would use DNS on the router, but it did not work properly as I wanted.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.2/screens/25.gif)

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.2/screens/lowerpc.gif)

Unfortunately, it was not possible to record a complete Demo of the functional network :(


##### Завдання 3

> Необхідно  змоделювати  локальну  мережу  комплексу  з  5 одноповерхових будівель. Одна будівля -1робочагрупапо 6 комп'ютерів. Мережа будується на основі маршрутизатора з одним портом.
