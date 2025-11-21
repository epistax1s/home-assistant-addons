# Dockerfile: Собирает образ аддона.
# ARG BUILD_FROM: Авто-подставляется HA для архитектуры (2025 стандарт).
# FROM: Официальный HA base с S6-overlay, bashio, with-contenv.
# COPY --from: Копируем только нужное из vaultwarden/server (бинарник и web-vault).
# COPY rootfs /: Копирует S6-структуру в контейнер.
# RUN chmod: Делает run исполняемым (хорошая практика, хотя S6 может обработать).

ARG BUILD_FROM=ghcr.io/home-assistant/amd64-addon-base:16.0.0
FROM ${BUILD_FROM}

COPY --from=vaultwarden/server:latest /vaultwarden /usr/bin/vaultwarden
COPY --from=vaultwarden/server:latest /web-vault /web-vault

# Копируем S6-структуру HA (правильную)
COPY rootfs /

# Делаем исполняемым (run + init)
RUN chmod -R a+x /etc/cont-init.d /etc/services.d

