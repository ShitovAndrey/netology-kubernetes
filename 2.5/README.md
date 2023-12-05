# Домашнее задание к занятию «Helm»

### Задание 1. Подготовить Helm-чарт для приложения

1. Необходимо упаковать приложение в чарт для деплоя в разные окружения.  

![](/2.5/images/11-create_helm.png)  

2. Каждый компонент приложения деплоится отдельным deployment’ом или statefulset’ом.  

Deployment template manifest: [templates/deployment.yaml](/2.5/myhelm/templates/deployment.yaml)  
Service template manifest: [templates/service.yaml](/2.5/myhelm/templates/service.yaml)

3. В переменных чарта измените образ приложения для изменения версии.  

Chart variables: [values.yaml](/2.5/myhelm/values.yaml)  
```yaml
image:
  tag: "1.16.0"
```

------
### Задание 2. Запустить две версии в разных неймспейсах

1. Подготовив чарт, необходимо его проверить. Запуститe несколько копий приложения.  

![](/2.5/images/11-helm_lint.png)  

![](/2.5/images/21-helm_package.png)  

2. Одну версию в namespace=app1, вторую версию в том же неймспейсе, третью версию в namespace=app2.

![](/2.5/images/22-helm-install.png)  

3. Продемонстрируйте результат.

![](/2.5/images/23-show-status.png)  
