#!/usr/bin/with-contenv bash
echo "===== DEBUG S6 STRUCTURE AT RUNTIME =====" >&2
find /etc/s6 -maxdepth 5 -print >&2 || true
echo "===== END DEBUG =====" >&2
