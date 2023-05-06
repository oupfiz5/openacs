#!/bin/bash
NS_CONF="${NS_CONF:-'/usr/local/ns/conf/openacs-config.tcl'}"

until PGPASSWORD="${PGPASSWORD}" pg_isready -h "${PGHOST}" -U "${PGUSER}"; do
    echo >&2 "Postgres db is unavailable - sleeping"
    sleep 1
done

echo >&2 "Postgres is up - Starting OpenACS Now"
echo >&2 "/usr/local/ns/bin/nsd -f -u nsadmin -g nsadmin -t ${NS_CONF}"
/usr/local/ns/bin/nsd -f -u nsadmin -g nsadmin -t "${NS_CONF}"
