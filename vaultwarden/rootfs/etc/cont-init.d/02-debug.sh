#!/usr/bin/with-contenv bash
echo "--- RUN HEX ---" >&2
hexdump -C /etc/s6/services/vaultwarden/run | head >&2
echo "---------------" >&2
