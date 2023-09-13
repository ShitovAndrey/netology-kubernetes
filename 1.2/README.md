# Домашнее задание к занятию «Базовые объекты K8S»

------

### Задание 1. Создать Pod с именем hello-world

<em>**1. Создать манифест (yaml-конфигурацию) Pod.**</em>  
``` yaml
---
apiVersion: v1
kind: Pod
metadata:
labels:
    app: echoserver
name: echoserver
namespace: netology
spec:
containers:
- name: echoserver
    image: gcr.io/kubernetes-e2e-test-images/echoserver:2.2
    ports:
    - containerPort: 8080
...

```  

<em>**2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.**</em>  

<em>**3. Подключиться локально к Pod с помощью `kubectl port-forward` и вывести значение (curl или в браузере).**</em>  
    ![](/1.2/images/01-03-port_forward_to_pod01.png)  
    ![](/1.2/images/01-03-port_forward_to_pod02.png)  

------

### Задание 2. Создать Service и подключить его к Pod

<em>**1. Создать Pod с именем netology-web.**</em>  
```yaml
---
apiVersion: v1
kind: Pod
metadata:
  labels:
    app: netology-web
  name: netology-web
  namespace: netology
spec:
  containers:
  - name: netology-web
    image: gcr.io/kubernetes-e2e-test-images/echoserver:2.2
    ports:
    - containerPort: 8080
...
```  

![](/1.2/images/02-03_get_pods.png)  

<em>**2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.**</em>  

<em>**3. Создать Service с именем netology-svc и подключить к netology-web.**</em>  
```yaml
---
apiVersion: v1
kind: Service
metadata:
  name: netology-svc
  namespace: netology
spec:
  selector:
    app: netology-web
  ports:
    - name: web
      protocol: TCP
      port: 80
      targetPort: 8080
...
``` 

<em>**4. Подключиться локально к Service с помощью `kubectl port-forward` и вывести значение (curl или в браузере).**</em>  
![](/1.2/images/02-04-port_forward_to_service01.png)  
![](/1.2/images/02-04-port_forward_to_service02.png)  

------
