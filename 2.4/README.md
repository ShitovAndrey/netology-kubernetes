# Домашнее задание к занятию «Управление доступом»

------

### Задание 1. Создайте конфигурацию для подключения пользователя

1. Создайте и подпишите SSL-сертификат для подключения к кластеру.  

    ![](/2.4/images/01-create_user.png)  

2. Настройте конфигурационный файл kubectl для подключения.  

    ![](/2.4/images/02-kubeconfig.png)  

3. Создайте роли и все необходимые настройки для пользователя.  

    ClusterRole manifest: [ClusterRole.yaml](/2.4/ClusterRole.yaml)  
    ClusterRoleBinding manifest: [ClusterRoleBinding.yaml](/2.4/ClusterRoleBinding.yaml)  

4. Предусмотрите права пользователя. Пользователь может просматривать логи подов и их конфигурацию (`kubectl logs pod <pod_id>`, `kubectl describe pod <pod_id>`).

    ![](/2.4/images/04-show-work-roles.png)  

5. Предоставьте манифесты и скриншоты и/или вывод необходимых команд.

------
