# ===== Базовый образ Home Assistant Add-on =====
ARG BUILD_FROM=ghcr.io/home-assistant/amd64-addon-base:16.0.0
FROM ${BUILD_FROM}

# ===== Устанавливаем утилиты для отладки =====
RUN apk add --no-cache bash openssl file

# ===== Копируем бинарь и веб-интерфейс Vaultwarden =====
COPY --from=vaultwarden/server:latest /vaultwarden /usr/bin/vaultwarden
COPY --from=vaultwarden/server:latest /web-vault /web-vault

# ===== Копируем структуру HA add-on (S6 + cont-init) =====
COPY rootfs/ /

# ===== Делаем исполняемыми скрипты =====
RUN chmod -R a+x /etc/cont-init.d /etc/services.d

