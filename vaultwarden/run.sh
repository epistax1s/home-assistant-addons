#!/usr/bin/with-contenv bashio  # with-contenv = HA wrapper для env
set -e  # Выход при ошибке

# Логирование
bashio::log.info "Starting Vaultwarden add-on v1.0.5..."

# Чтение options из /data/options.json (bashio делает подстановку!)
DOMAIN=$(bashio::config 'domain')
ROCKET_PORT=$(bashio::config 'rocket_port')
ADMIN_TOKEN=$(bashio::config 'admin_token')
DATA_FOLDER=$(bashio::config 'data_folder')
DATABASE_URL=$(bashio::config 'database_url')
WEBSOCKET_ENABLED=$(bashio::config 'websocket_enabled')
SIGNUPS_ALLOWED=$(bashio::config 'signups_allowed')
INVITATIONS_ALLOWED=$(bashio::config 'invitations_allowed')
EMERGENCY_ACCESS_ALLOWED=$(bashio::config 'emergency_access_allowed')
SENDS_ALLOWED=$(bashio::config 'sends_allowed')

# Генерация ADMIN_TOKEN, если пусто (как в официальном Bitwarden add-on)
if [[ -z "$ADMIN_TOKEN" ]]; then
    ADMIN_TOKEN=$(openssl rand -base64 48)
    bashio::log.warning "No ADMIN_TOKEN set in UI! Generated: $ADMIN_TOKEN"
    bashio::log.info "Save this token for /admin access!"
fi

# Экспорт в env (теперь они доступны для Vaultwarden)
export DOMAIN
export ROCKET_PORT
export ADMIN_TOKEN
export DATA_FOLDER
export DATABASE_URL
export WEBSOCKET_ENABLED
export SIGNUPS_ALLOWED
export INVITATIONS_ALLOWED
export EMERGENCY_ACCESS_ALLOWED
export SENDS_ALLOWED

# Дамп для дебага (удали после теста)
bashio::log.info "=== DEBUG ENV EXPORTED ==="
bashio::log.info "DOMAIN: $DOMAIN"
bashio::log.info "ROCKET_PORT: $ROCKET_PORT"
bashio::log.info "ADMIN_TOKEN: ${ADMIN_TOKEN:0:20}..."  # Не полный
bashio::log.info "DATA_FOLDER: $DATA_FOLDER"
bashio::log.info "========================="

# Запуск Vaultwarden (оригинальный CMD)
exec /app/vaultwarden
