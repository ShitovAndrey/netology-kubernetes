# Домашнее задание к занятию Troubleshooting

### Цель задания

Устранить неисправности при деплое приложения.

### Задание. При деплое приложение web-consumer не может подключиться к auth-db. Необходимо это исправить

1. Установить приложение по команде:
```shell
kubectl apply -f https://raw.githubusercontent.com/netology-code/kuber-homeworks/main/3.5/files/task.yaml
```

![](/3.5/images/01-apply.png)  

2. Выявить проблему и описать. 

В логах подов web-consumer наблюдается ошибка "curl: (6) Couldn't resolve host 'auth-db'",  
данная проблема связана с невозможностью DNS разрешить имя "auth-db" в ip адрес.  
Это нормальное поведение в данном случаи, т.к. сервис "auth-db" для подов web-consumer находится в другом namespace.  

![](/3.5/images/02-err.png)  


3. Исправить проблему, описать, что сделано.  

Были внесены изменения в deployment "web-consumer". К имени auth-db добавлен суфикс неймспейса data.  
Строка: `while true; do curl auth-db; sleep 5; done`  
заменена на: `while true; do curl auth-db.data; sleep 5; done`  

Выдержка из получившегося web-consumer deployment manifest:
```yaml
    spec:
      containers:
      - command:
        - sh
        - -c
        - while true; do curl auth-db.data; sleep 5; done
        image: radial/busyboxplus:curl
        imagePullPolicy: IfNotPresent
        name: busybox
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      terminationGracePeriodSeconds: 30
```

4. Продемонстрировать, что проблема решена.  

![](/3.5/images/04-ok.png)  
