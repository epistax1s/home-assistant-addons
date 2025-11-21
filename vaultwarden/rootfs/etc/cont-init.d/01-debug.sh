#!/usr/bin/with-contenv bash
echo "--- TYPE CONTENT ---" >&2
cat -A /etc/s6/services/vaultwarden/type >&2
echo "----------------------" >&2
