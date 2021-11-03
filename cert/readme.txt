Данная директория (cert) содержит скрипты сертификационного задания.
Папки:
 cert/tf/ - скрипты Terrafrom для развертывания двух VM. 
   maven/config.tf   - VM dns name: terrafrom-maven - сборщик приложения. 
   tomcat/configt.tf - VM dns name: terrafrom-tomcat - web сервер с запущенным приложением.
 cert/ansible/ - скрипты ansible для настройки окружения, сборки приложения, деплоя:
   maven/hosts_maven      - ansible hosts file
   maven/maven.yml        - настройка окружения, сборка WEB приложения
   maven/docker_build.yml - настройка Docker окружения, сборка Docker image, push to registry (micheldir/cert)
   maven/dockerfile       - сборка Docker образа
 cert/jenkins/ - jenkins pipeline 
   pipeline.txt - Jenkins pipeline

Необходимые секреты для запуска pipeline
 PVK - Тип:File, приватный SSH ключ для доступа к VM. Public настраивается на уровне Cloud провайдера.
 DOCKER - Тип:String, пароль для доступа к Docker registry

Требования к Jankins Node выполняющей pipeline:
 terrafrom - installed
 ansible   - installed
 gcloud console - installed & configured

