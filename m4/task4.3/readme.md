# EPAM University Programs

## DevOps education program
### Module 4 Networking Fundamentals


#### TASK 4.3

> Завдання:Побудувати  локальну  мережу,  що  складається  з  сегмента  на  основікомутатора    з    5    комп'ютерів    і    сервера.    Комутатор    з'єднаний    з маршрутизатором, до якого також підключений сервер.Необхідно задати статичні IP адреси мережних інтерфейсів маршрутизаторів, локальних   комп'ютерів   і   серверів.   Налаштувати   маршрутизацію   по протоколу RIP.Домогтися  можливості  пересилання  даних  по  протоколу  ICMP  між усіма об'єктами мережі.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.3/screens/1.jpg)

* Сконфигурированы базовые параметры безопасности - пароли и шифрование
* Сконфигурированы интерфейсы под посети
* Настроен DHCP c пулом раздачи для ПК
* Сконфигурирован протокол RIP

```
enable
configure terminal

enable secret cisco
service password-encryption 
line vty 0 15
password cisco
exit
line console 0 
password cisco
login


interface GigabitEthernet1/0
ip address 192.168.0.1 255.255.255.0
exit
interface GigabitEthernet0/0
ip address 192.168.1.254 255.255.255.0
no shutdown
exit


configure terminal
ip dhcp pool Net1
network 192.168.0.0 255.255.255.0
dns-server 192.168.0.1
update arp
ip dhcp excluded-address 192.168.0.1 192.168.0.10
exit
router rip
network 192.168.1.0
network 192.168.0.0
exit
exit
wr mem
```
Задание статического адреса Server0

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.3/screens/2.jpg)

Сверка с параметрами в WEB режиме

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.3/screens/3.jpg)

Проверка работоспособности:

* LOCAL Server0

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.3/screens/serverlocal.gif)

* OUTSIDE Server1

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.3/screens/outside_server.gif)

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.3/screens/broadcast_all.jpg)

Сформированный конфиг роутера Router0

```

!
version 12.2
no service timestamps log datetime msec
no service timestamps debug datetime msec
service password-encryption
!
hostname Router
!
!
!
enable secret 5 $1$mERr$hx5rVt7rPNoS4wqbXKX7m0
!
!
ip dhcp excluded-address 192.168.0.1 192.168.0.10
!
ip dhcp pool Net1
 network 192.168.0.0 255.255.255.0
 default-router 192.168.0.1
!
!
!
no ip cef
no ipv6 cef
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
interface GigabitEthernet0/0
 description g0/0 ServerNetwork
 ip address 192.168.1.254 255.255.255.0
 duplex auto
 speed auto
!
interface GigabitEthernet1/0
 description g1/0 MainNetwork
 ip address 192.168.0.1 255.255.255.0
 duplex auto
 speed auto
!
interface FastEthernet5/0
 no ip address
 shutdown
!
router rip
 network 192.168.0.0
 network 192.168.1.0
!
ip classless
!
ip flow-export version 9
!
!
!
!
!
!
!
!
line con 0
 password 7 0822455D0A16
 login
!
line aux 0
!
line vty 0 4
 password 7 0822455D0A16
 login
line vty 5 15
 password 7 0822455D0A16
 login
!
!
!
end
```
