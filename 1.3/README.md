# Домашнее задание к занятию «Запуск приложений в K8S»

### Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

1. Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.  
    
    Deployment manifest: [app-task1.yaml](/1.3/app-task1.yaml)  
    
    ![](/1.3/images/01-01_k_get_deployment.png)  

2. После запуска увеличить количество реплик работающего приложения до 2.  
    
    ![](/1.3/images/01-02_k_scale_to_2.png)


3. Продемонстрировать количество подов до и после масштабирования.  

    ![](/1.3/images/01-03_k_get_pods01.png)  

    ![](/1.3/images/01-03_k_get_pods02.png)  

4. Создать Service, который обеспечит доступ до реплик приложений из п.1.  

    Service manifest: [svc-task1.yaml](/1.3/svc-task1.yaml)  

    ![](/1.3/images/01-04_k_get_svc.png)  

5. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложений из п.1.  

    Pod manifest: [pod-task1.yaml](/1.3/pod-task1.yaml)  

    ```bash
    multitool:/# curl http://app-task1:80
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

    multitool:/# curl http://app-task1:1180
    WBITT Network MultiTool (with NGINX) - app-task1-6bc78b857f-njxz4 - 10.1.206.172 - HTTP: 1180 , HTTPS: 11443 . (Formerly praqma/network-multitool)

    multitool:/# curl -k https://app-task1:11443
    WBITT Network MultiTool (with NGINX) - app-task1-6bc78b857f-njxz4 - 10.1.206.172 - HTTP: 1180 , HTTPS: 11443 . (Formerly praqma/network-multitool)
    ```

------

### Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

1. Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.  

    Deployment manifest: [app-task2.yaml](/1.3/app-task2.yaml)

2. Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.  

    ![](/1.3/images/02-02_k_get_pods.png)  

3. Создать и запустить Service. Убедиться, что Init запустился.  

    Service manifest: [svc-task2.yaml](/1.3/svc-task2.yaml)  

    ![](/1.3/images/02-03_k_get_svc.png)  

4. Продемонстрировать состояние пода до и после запуска сервиса.  
    **Соятояние до:**  
    ![](/1.3/images/02-02_k_get_pods.png)  

    **Состояние после:**  
    ![](/1.3/images/02-03_k_get_pods.png)  

------