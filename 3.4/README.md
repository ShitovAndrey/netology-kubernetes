# Домашнее задание к занятию «Обновление приложений»

### Цель задания

Выбрать и настроить стратегию обновления приложения.

-----

### Задание 1. Выбрать стратегию обновления приложения и описать ваш выбор

1. Имеется приложение, состоящее из нескольких реплик, которое требуется обновить.
2. Ресурсы, выделенные для приложения, ограничены, и нет возможности их увеличить.
3. Запас по ресурсам в менее загруженный момент времени составляет 20%.
4. Обновление мажорное, новые версии приложения не умеют работать со старыми.
5. Вам нужно объяснить свой выбор стратегии обновления приложения.

**Вариант 1:**
Исходя из пункта 4 "Обновление мажорное, новые версии приложения не умеют работать со старыми.", если прям совсем не умеют и
паралельная работа этих версий приложения будет вызывать фатальные ошибки, то будем обновлять стретегией "Recreate" с downtime.  
**Вариант 2:**
Если всё таки можно одновременно принимать клиентские запросы на разные версии приложения, то засчёт простоя ресурсов в 20% будем
использовать стратегию "RollingUpdate" с параметром "maxUnavailable" 20%.

### Задание 2. Обновить приложение

1. Создать deployment приложения с контейнерами nginx и multitool. Версию nginx взять 1.19. Количество реплик — 5.  
```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: deploy34
  labels:
    app: deploy34
  namespace: netology
spec:
  replicas: 5
  selector:
    matchLabels:
      app: deploy34
  template:
    metadata:
      labels:
        app: deploy34
    spec:
      containers:
      - name: nginx
        image: nginx:1.19.0
        ports:
        - containerPort: 80
      - name: multitool
        image: wbitt/network-multitool
        ports:
        - name: "multitool-http"
          containerPort: 8180
        - name: "multitool-https"
          containerPort: 11443
        env:
        - name: HTTP_PORT
          value: "8180"
        - name: HTTPS_PORT
          value: "11443"
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 4
      maxSurge: 100%
...
```

2. Обновить версию nginx в приложении до версии 1.20, сократив время обновления до минимума. Приложение должно быть доступно.  

![](/3.4/images/01-up_version_1_20.png)  

3. Попытаться обновить nginx до версии 1.28, приложение должно оставаться доступным.

![](/3.4/images/01-up_version_1_28.png)  

4. Откатиться после неудачного обновления.

![](/3.4/images/01-down_to_version_1_20.png)  
