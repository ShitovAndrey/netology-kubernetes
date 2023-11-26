# Домашнее задание к занятию «Конфигурация приложений»

### Задание 1. Создать Deployment приложения и решить возникшую проблему с помощью ConfigMap. Добавить веб-страницу

1. Создать Deployment приложения, состоящего из контейнеров nginx и multitool.  

    Deployment manifest: [deploy23-1.yaml](/2.3/deploy23-1.yaml)  

2. Решить возникшую проблему с помощью ConfigMap.  

    **Проблема конфликт портов:**  
    ![](/2.3/images/11-error-deployment.png)  

    **Решение изменить порт nginx на 8080 через nginx.conf:**  
    ConfigMap manifest: [configmap21-1.yaml](/2.3/configmap21-1.yaml)  

3. Продемонстрировать, что pod стартовал и оба конейнера работают.  

    ![](/2.3/images/12-show-running.png)  

4. Сделать простую веб-страницу и подключить её к Nginx с помощью ConfigMap. Подключить Service и показать вывод curl или в браузере.  

    ConfigMap manifest: [configmap21-2.yaml](/2.3/configmap21-2.yaml)  
    Service manifest: [svc23-1.yaml](/2.3/svc23-1.yaml)  

    curl:  
    ![](/2.3/images/14-show-curl.png)  

5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

------

### Задание 2. Создать приложение с вашей веб-страницей, доступной по HTTPS 

1. Создать Deployment приложения, состоящего из Nginx.  

    Deployment manifest: [deploy23-2.yaml](/2.3/deploy23-2.yaml)  

2. Создать собственную веб-страницу и подключить её как ConfigMap к приложению.  

    ConfigMap manifest: [configmap21-3.yaml](/2.3/configmap21-3.yaml)  

3. Выпустить самоподписной сертификат SSL. Создать Secret для использования сертификата.  

    Secret manifest: [secret-nginx-tls.yaml](/2.3/secret-nginx-tls.yaml)  

4. Создать Ingress и необходимый Service, подключить к нему SSL в вид. Продемонстировать доступ к приложению по HTTPS. 

    Service manifest: [svc23-2.yaml](/2.3/svc23-2.yaml)    
    Ingress manifest: [ingress.yaml](/2.3/ingress.yaml)  

    curl https:  
    ![](/2.3/images/24-curl-https.png)  

5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

------