# EPAM University Programs

## DevOps education program
### Module 4 Networking Fundamentals


#### TASK 4.1

1. > Зібрати наступний проект (рис 1), який містить в собі: 4 ПК типу PCPT, Концентратор (Hub-PT). Кожен комп'ютер повинен бути з'єднаний з
концентратором за допомогою крученої пари (Copper Straight-through).

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/1-8/1.jpg)

2. > Зберегти проект і його скріншот
3. > Кожному ПК привласнити унікальну IP адресу. Для її призначення
необхідно зайти в меню конфігурації ПК шляхом одноразового клацання по
ньому лівою кнопкою миші і вибору вкладки Config / Interface. В полі ip
address необхідно ввести відповідну адресу, а в полі Subnet Mask - відповідно
цьому адресу маску

[See below #10 ](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/9-11/)


4. > Перевірити працездатність отриманої мережі шляхом здійснення
Інтернет запитів (ICMP пакетів) від одного ПК до іншого. Для присвоєння
такого пакета ПК використовуйте кнопку ADD SIMPLE PDU в правій частині
робочого вікна. Після цього клацніть лівою кнопкою миші на локальну
машину-джерело, потім - на машину-одержувача. Перевірити працездатність
мережі.

5. > Перейти в режим Simulation і за допомогою кнопки Event List
викликати вікно відображення подій в мережі Simulation Panel.
Використовуючи кнопку Auto Capture / Play запустити симуляцію
роботи ICMP пакетів. Простежити просування пакетів по мережі і зберегти
даний скріншот.

6. > Простежити за порядком і шляхом проходження пакетів у вікні
Simulation Panel (рис. 3). Зберегти даний скріншот.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/1-8/9_step6.jpg)

7. > Переглянути інформацію о пакетах з вікна Simulation Panel і їх
відповідність моделі OSI шляхом подвійного клацання по пакету в вікні (рис.
4). Результати зберегти як скриншот.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/1-8/2.jpg)
![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/1-8/3.jpg)
![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/1-8/4.jpg)
![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/1-8/5.jpg)
![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/1-8/11_transmited.jpg)
![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/1-8/12_recieved_back.jpg)
![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/1-8/13.jpg)

8. > Видалити IP адреса з кожною локальною машини PC0 - PC3.
Повторити пункти 5 - 10. Проаналізувати відмінності в роботі мережі.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/1-8/10.jpg)
![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/1-8/14.jpg)

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/1-8/1.gif)

При отстуствии стевых адресов, комманда пинг не может выполнятся, т.к. находится на другом уровне сетевой модели OSI. Искл. комманда arping - которая работает на канальном уровне по-средством Broadcast расссылки и сбора своей таблицы.
Также всвязи с тем, что прогрмамма Packet Tracer не имеет того функционала, она отображает соотвествующее уведомление.

***

9. > Зібрати наступний проект (рис. 5). У нього входять: PC0-PC5, Server, 2  Hubs.  Однойменні  пристрої  з'єднуються  за  допомогою  кросового  кабелю (Copper Cross-over).
10. > Кожному мережному компоненту привласнити IP адресз наступної таблиці:
```
PC0 192.168.0.1
PC1 192.168.0.2
PC2 192.168.0.3
PC3 192.168.0.4
PC4 192.168.0.6
PC5 192.168.0.7
Server 192.168.0.5
```

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/9-11/1.jpg)
![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/9-11/2.jpg)
![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/9-11/3.jpg)
![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/9-11/4.jpg)
![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/9-11/5.jpg)
![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/9-11/6.jpg)
![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/9-11/7.jpg)

11. > Перевірити працездатність мережі.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/9-11/8.jpg)

На данном моменте можно увидеть коллизию, которая происходит при одновременном доступе к нескольким ресурсам. Например броадкасте.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/9-11/broadcast_traffic_and_collision.gif)

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/9-11/worked2.gif)
![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/9-11/worked.gif)

12. > Створити  новий  проект,  який  включає  в  себе:  4  ПК  типу  PC-PT, Комутатор    (Switch).    Кожен    комп'ютер    повинен    бути    з'єднаний    з ????концентратором???  за допомогою  крученоїпари  (Copper  Straight-through)  (рис. 6).
13. > Для   даної   топології   повторити   пункти   3-9.   Проаналізувати відмінності в роботі мережі Топології 1 і Топології 3.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/12-14/1.jpg)

C IP Адресом

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/12-14/with_ip.gif)

Без IP Адреса

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/12-14/without_ip.gif)

Аналогично как и в предыдущем задании. Комманда Пинг не может исполнятся корректно, по-причине отсутвия полностью сформированного сетевого уровня. Т.к. нету соотвествие пары IP - MAC в ARP таблице, на межсетевом уровне

14. > Розширити проект до такого вигляду (рис. 7). У нього входять: 8 ПК типу PC-PT, 2 комутатори (Switch). Кожен комп'ютер повинен бути з'єднаний з   комутатором   за   допомогою   крученоїпари   (Copper   Straight-through), комутатори  між  собою з'єднуються  за допомогою кросового кабелю (Copper Cross-over).
15. > Занеобхідністюдодати  додаткові  порти  на  комутатори.  Для  цього необхідно  у  вкладці  Physical  /  MODULES  кожного  з  них  перетягнути доступний порт Ethernet в порожнє гніздо, попередньо вимкнувши комутатор за допомогою кнопки вимкнення.
16. > Кожному мережному компоненту привласнити IP адресз наступної таблиці:

```
PC0 192.168.0.1
PC1 192.168.0.2
PC2 192.168.0.3
PC3 192.168.0.4
PC4 192.168.0.5
PC5 192.168.0.6
PC6 192.168.0.7
PC7 192.168.0.8
```

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/15-17/1.jpg)

17. > Перевірити працездатність мережі. 

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/15-17/2.gif)

18. > Існуючу мережу розбити на дві рівні підмережі. І з'єднати їх за
допомогою маршрутизатора Router-PT з декількома портами (рис. 8).
Маршрутизатор і комутатори з'єднати між собою за допомогою оптоволокна
(Fiber)
19. > Комп'ютерам РС4 – РС7 привласнити IP адреси з наступної
таблиці:
```
PC4 192.168.1.1
PC5 192.168.1.2
PC6 192.168.1.3
PC7 192.168.1.4
```
20. > Порти маршрутизатора слід включити (On) і призначити їм IP
адреси в діапазоні обраної підмережі.
21. > На кожному з комп'ютерів (РС0 - РС7) необхідно позначити шлюз.
Для його призначення необхідно зайти в меню Desktop / Ip Configuration і в
полі Default Gateway ввести адресу порту маршрутизатора, через який до
нього підключається підмережа, що включає даний ПК.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/18-22/1.jpg)

22. > Перевірити працездатність мережі.

![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/18-22/2.jpg)
![Image](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m4/task4.1/screens/18-22/3.gif)

23. > Проаналізувати відмінності в роботі мережі Топології 4 і Топології5. Оцінити можливості, які дає використання маршрутизатора.

Согласно параметрам и требованиям, указанным в процессе построения Топологии 4 и 5 конечные отличия в работе не сильно существенны.
* В сети появилось две подсети и Появился центральный шлюз в следствии которых, траффик отсекается согласно правилам указанным на шлюзе(роутере), в нашем случае он разделяет сети на подсети. Ограничивая их трафик.

 

© Oleksii Volchenko 
