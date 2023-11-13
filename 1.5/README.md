# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2»

------

### Задание 1. Создать Deployment приложений backend и frontend

1. Создать Deployment приложения _frontend_ из образа nginx с количеством реплик 3 шт.  

    Deployment Frontend: [app-frontend.yaml](/1.5/app-frontend.yaml)

2. Создать Deployment приложения _backend_ из образа multitool. 

    Deployment Backend: [app-backend.yaml](/1.5/app-backend.yaml)

3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера.  

    Frontend Service: [svc-frontend.yaml](/1.5/svc-frontend.yaml)  
    Backend Service:  [svc-backend.yaml](/1.5/svc-backend.yaml)  

4. Продемонстрировать, что приложения видят друг друга с помощью Service.

    ![](/1.5/images/4-curl_frontend.png)  

5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

------

### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

1. Включить Ingress-controller в MicroK8S.
2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался _frontend_ а при добавлении /api - _backend_.  

    Ingress: [app-ingress.yaml](/1.5/app-ingress.yaml)

3. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.  

    ![](/1.5/images/5-curl_ingress.png)  

4. Предоставить манифесты и скриншоты или вывод команды п.2.

------
