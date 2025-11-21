FROM vaultwarden/server:latest

# Скрипт для дампа env в stdout (логи HA)
RUN echo '#!/bin/sh' > /entrypoint.sh && \
    echo 'echo "=== DUMPING ENV VARS ===" && env | sort' >> /entrypoint.sh && \
    echo 'echo "DOMAIN specifically: $DOMAIN"' >> /entrypoint.sh && \
    echo 'exec "$@"' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["server"]
