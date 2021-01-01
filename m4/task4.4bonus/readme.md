# EPAM University Programs

## DevOps education program
### Module 4 Networking Fundamentals


#### TASK 4.4 bonus

##### 1.Завдання бонусне-не обов’язковедо виконання.

> За основу беремо будь яке завдання task4.2 або 4.3і у вашу існуючумережу додаєте роутер,такщоб їх в мережі було не менше двох. І треба налаштувати трафік між двома мережами.Якщо ж у вашій існуючій мережі вже присутньо 2 роутера і трафік налаштований, то виконання цього завдання не потрібно.

***

[English Version](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.4_bonus/readmeENG.md)

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.4bonus/screens/1.jpg)

Таблица подсетей:

| LAN № 	| Address Network 	| Prefix 	| Mask            	| Range                       	| Broadcast    	| DHCP Pool     	| Reserved      	|
|-------	|-----------------	|--------	|-----------------	|-----------------------------	|--------------	|---------------	|---------------	|
| LAN_1 	|    179.90.0.0   	|   /25  	| 255.255.255.128 	|  179.90.0.1 - 179.90.0.126  	| 179.90.0.127 	| *.11 - *.126  	| *.1 - *.10    	|
| LAN_2 	|   179.90.0.128  	|   /25  	| 255.255.255.128 	| 179.90.0.129 - 179.90.0.254 	| 179.90.0.255 	| *.140 - *.254 	| *.129 - *.139 	|
| LAN_3 	|   179.179.0.0   	|   /28  	| 255.255.255.240 	|  179.179.0.1 - 179.179.0.14 	| 179.179.0.15 	| *.11 - *.14   	| *.1 - *.10    	|
| LAN_4 	|   179.179.0.16  	|   /28  	| 255.255.255.240 	| 179.179.0.17 - 179.179.0.30 	| 179.179.0.31 	| *.21 - *.30   	| *.17 - *.20   	|
| LAN_5 	|   199.199.0.0   	|   /30  	| 255.255.255.224 	|  199.199.0.1 - 199.199.0.2  	| 199.199.0.3  	| ---------     	| --------      	|

Таблица сетевых устройств:

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

По средствам коммандной строки был сконфигурирован роутер Building1, упрощенная конфигурация изображена ниже:
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

Остальные роутеры были сконфигурированы на основе конфигурации роутера Building2 согласно своим подсетям.
Ксожалению я был ограничен в количестве времени на таску, это мне не дало в полной мере расскрыть остальные знания в бонусных проектах в том числе проектировка в физическом моде.

Демо работы сети:

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.4bonus/screens/1.gif)




#### TASK 4.4 bonus

##### 2.Завдання бонусне-не обов’язковедо виконання.

> Організувати 2 підмережі. Налаштувати DNS на серверах.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.4bonus/screens/2.jpg)

Роутер был сконфигурирован на основании предыдущих заданий.

Таблица сетевых устройств:

|  DeviceName  	|  GW Address 	| Prefix 	| DHCP/StaticIP 	| DHCP/StaticIP 2nd Int 	| Prefix 	|      DNS      	|
|:------------:	|:-----------:	|:------:	|:-------------:	|:---------------------:	|:------:	|:-------------:	|
|   PC 0 - 1   	| 192.168.1.1 	|   24   	|      DHCP     	|          ---          	|   ---  	| 192.168.1.254 	|
|   PC 3 - 4   	| 192.168.0.1 	|   24   	|      DHCP     	|          ---          	|   ---  	| 192.168.1.254 	|
|    Laptop0   	| 192.168.0.1 	|   24   	|      DHCP     	|          ---          	|   ---  	| 192.168.1.254 	|
|   DNSserver  	| 192.168.1.1 	|   24   	| 192.168.1.254 	|          ---          	|   ---  	|      ---      	|
|  HTTPserver  	| 192.168.0.1 	|   24   	| 192.168.0.254 	|          ---          	|   ---  	| 192.168.0.254 	|
| Switch 3 - 4 	|     AUTO    	|  AUTO  	|      ---      	|          ---          	|   ---  	|      ---      	|

Конфигурация DNS на серверах:

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.4bonus/screens/3.jpg)

Быстрая проверка через пинг:

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.4bonus/screens/4.jpg)

Демо работы HTTP + DNS серверов:

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.4bonus/screens/2.gif)
