# Домашнее задание к занятию «Kubernetes. Причины появления. Команда kubectl»

------

### Задание 1. Установка MicroK8S

<em>**1. Установить MicroK8S на локальную машину или на удалённую виртуальную машину.**</em>  
![](/1.1/images/01-01-microk8s_install01.png)  

![](/1.1/images/01-01-microk8s_install02.png)  

<em>**2. Установить dashboard.**</em>  
![](/1.1/images/01-02-install_dashboord.png)  

<em>**3. Сгенерировать сертификат для подключения к внешнему ip-адресу.**</em>  
![](/1.1/images/01-03-certs01.png)  

![](/1.1/images/01-03-certs02.png)  

------

### Задание 2. Установка и настройка локального kubectl
<em>**1. Установить на локальную машину kubectl.**</em>  
![](/1.1/images/02-01-kubectl_install01.png)  

<em>**2. Настроить локально подключение к кластеру.**</em>  
Результат команды `microk8s config` добавлен на локальный компьютер в файл `~/.kube/config`.  

<em>**3. Подключиться к дашборду с помощью port-forward.**</em>  
![](/1.1/images/02-03-kubectl_dashbord01.png)  

![](/1.1/images/02-03-kubectl_dashbord02.png)  
------