ARG BUILD_FROM=vaultwarden/server:latest

# Используем HA base для bashio (apk add bash jq openssl)
FROM $BUILD_FROM

# Установка зависимостей для run.sh
RUN apk add --no-cache \
    bash \
    jq \
    openssl

# Копируем run.sh
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Запуск через run.sh (парсит config и запускает Vaultwarden)
ENTRYPOINT ["/run.sh"]
