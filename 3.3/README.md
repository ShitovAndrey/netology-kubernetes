# Домашнее задание к занятию «Как работает сеть в K8s»

### Цель задания

Настроить сетевую политику доступа к подам.

-----

### Задание 1. Создать сетевую политику или несколько политик для обеспечения доступа

**1. Создать deployment'ы приложений frontend, backend и cache и соответсвующие сервисы.**  

Deployment frontend manifest: [app-frontend.yaml](/3.3/app-frontend.yaml)  
Deployment backend manifest: [app-backend.yaml](/3.3/app-backend.yaml)  
Deployment cache manifest: [app-cache.yaml](/3.3/app-cache.yaml)  

Service frontend manifest: [svc-frontend.yaml](/3.3/svc-frontend.yaml)  
Service backend manifest: [svc-backend.yaml](/3.3/svc-backend.yaml)  
Service cache manifest: [svc-cache.yaml](/3.3/svc-cache.yaml)  

**2. В качестве образа использовать network-multitool.**  

**3. Разместить поды в namespace App.**  

**4. Создать политики, чтобы обеспечить доступ frontend -> backend -> cache. Другие виды подключений должны быть запрещены.**  

Network Policies manifest: [np.yaml](/3.3/np.yaml)  

**5. Продемонстрировать, что трафик разрешён и запрещён.**  

![](/3.3/images/01-network.png)  