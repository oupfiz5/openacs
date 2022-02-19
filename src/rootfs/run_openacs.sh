#!/bin/bash
_CONF="${1:-'/usr/local/ns/conf/openacs-config.tcl'}"


until PGPASSWORD="${PGPASSWORD}" pg_isready -h "${PGHOST}" -U "${PGUSER}"; do
    >&2 echo "Postgres db is unavailable - sleeping"
    sleep 1
done

>&2 echo "Postgres is up - Starting OpenACS Now"
/usr/local/ns/bin/nsd -f -u nsadmin -g nsadmin -t "${_CONF}"
