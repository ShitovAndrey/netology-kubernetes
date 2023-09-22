# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 1»

### Цель задания

В тестовой среде Kubernetes необходимо обеспечить доступ к приложению, установленному в предыдущем ДЗ и состоящему из двух контейнеров, по разным портам в разные контейнеры как внутри кластера, так и снаружи.

------

### Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера

1. Создать Deployment приложения, состоящего из двух контейнеров (nginx и multitool), с количеством реплик 3 шт.  

    **Deployment manifest:** [app14-task1.yaml](/1.4/app14-task1.yaml)  

2. Создать Service, который обеспечит доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — nginx 80, по 9002 — multitool 8080.

    **Service manifest:** [svc14-task1.yaml](/1.4/svc14-task1.yaml)  

3. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры.  

    **Pod manifest:** [pod14-task1.yaml](/1.4/pod14-task1.yaml)  

4. Продемонстрировать доступ с помощью `curl` по доменному имени сервиса.

    ```bash
    andy@ubu18:~/netology/git/netology-kubernetes/1.4$ k exec -it multitool -- bash
    
    #Curl app nginx on port 9001
    multitool:/# curl http://svc14-task1:9001
    <!DOCTYPE html>
    <html>
    <head>
    <title>Welcome to nginx!</title>
    <style>
        body {
            width: 35em;
            margin: 0 auto;
            font-family: Tahoma, Verdana, Arial, sans-serif;
        }
    </style>
    </head>
    <body>
    <h1>Welcome to nginx!</h1>
    <p>If you see this page, the nginx web server is successfully installed and
    working. Further configuration is required.</p>

    <p>For online documentation and support please refer to
    <a href="http://nginx.org/">nginx.org</a>.<br/>
    Commercial support is available at
    <a href="http://nginx.com/">nginx.com</a>.</p>

    <p><em>Thank you for using nginx.</em></p>
    </body>
    </html>
    
    #Curl app multitool on port 9002
    multitool:/# curl http://svc14-task1:9002
    WBITT Network MultiTool (with NGINX) - app14-task1-64b599c995-l92fn - 10.1.206.188 - HTTP: 8080 , HTTPS: 11443 . (Formerly praqma/network-multitool)
    ```

5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

------

### Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

1. Создать отдельный Service приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.  

    **Service NodePort manifest:** [svc14-task2.yaml](/1.4/svc14-task2.yaml)  

2. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.

    ```bash
    #Get a ip address k8s nodes
    andy@ubu18:~/netology/git/netology-kubernetes/1.4$ k get nodes -o wide
    NAME        STATUS   ROLES    AGE   VERSION   INTERNAL-IP    EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
    nx-k8m001   Ready    <none>   8d    v1.27.5   192.168.1.51   <none>        Ubuntu 22.04.1 LTS   6.2.0-32-generic   containerd://1.6.15
    
    #Curl app nginx on NodePort 30001
    andy@ubu18:~/netology/git/netology-kubernetes/1.4$ curl http://192.168.1.51:30001
    <!DOCTYPE html>
    <html>
    <head>
    <title>Welcome to nginx!</title>
    <style>
        body {
            width: 35em;
            margin: 0 auto;
            font-family: Tahoma, Verdana, Arial, sans-serif;
        }
    </style>
    </head>
    <body>
    <h1>Welcome to nginx!</h1>
    <p>If you see this page, the nginx web server is successfully installed and
    working. Further configuration is required.</p>

    <p>For online documentation and support please refer to
    <a href="http://nginx.org/">nginx.org</a>.<br/>
    Commercial support is available at
    <a href="http://nginx.com/">nginx.com</a>.</p>

    <p><em>Thank you for using nginx.</em></p>
    </body>
    </html>

    #Curl app multitool on NodePort 30002
    andy@ubu18:~/netology/git/netology-kubernetes/1.4$ curl http://192.168.1.51:30002
    WBITT Network MultiTool (with NGINX) - app14-task1-64b599c995-l92fn - 10.1.206.188 - HTTP: 8080 , HTTPS: 11443 . (Formerly praqma/network-multitool)
    ```

3. Предоставить манифест и Service в решении, а также скриншоты или вывод команды п.2.

------