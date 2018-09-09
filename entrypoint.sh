#!/bin/sh

if [ -n "$ICECAST_SOURCE_PASSWORD_FILE" ]; then
  export ICECAST_SOURCE_PASSWORD=$(cat $ICECAST_SOURCE_PASSWORD_FILE)
fi

if [ -n "$ICECAST_SOURCE_PASSWORD" ]; then
  sed -i "s/<source-password>[^<]*<\/source-password>/<source-password>$ICECAST_SOURCE_PASSWORD<\/source-password>/g" /etc/icecast.xml
fi
unset ICECAST_SOURCE_PASSWORD

if [ -n "$ICECAST_RELAY_PASSWORD_FILE" ]; then
  export ICECAST_RELAY_PASSWORD=$(cat $ICECAST_RELAY_PASSWORD_FILE)
fi
if [ -n "$ICECAST_RELAY_PASSWORD" ]; then
    sed -i "s/<relay-password>[^<]*<\/relay-password>/<relay-password>$ICECAST_RELAY_PASSWORD<\/relay-password>/g" /etc/icecast.xml
fi
unset ICECAST_RELAY_PASSWORD

if [ -n "$ICECAST_ADMIN_PASSWORD_FILE" ]; then
  export ICECAST_ADMIN_PASSWORD=$(cat $ICECAST_ADMIN_PASSWORD_FILE)
fi
if [ -n "$ICECAST_ADMIN_PASSWORD" ]; then
  sed -i "s/<admin-password>[^<]*<\/admin-password>/<admin-password>$ICECAST_ADMIN_PASSWORD<\/admin-password>/g" /etc/icecast.xml
fi
unset ICECAST_ADMIN_PASSWORD

if [ -n "$ICECAST_ADMIN_USERNAME_FILE" ]; then
  export ICECAST_ADMIN_USERNAME=$(cat $ICECAST_ADMIN_USERNAME_FILE)
fi
if [ -n "$ICECAST_ADMIN_USERNAME" ]; then
  sed -i "s/<admin-user>[^<]*<\/admin-user>/<admin-user>$ICECAST_ADMIN_USERNAME<\/admin-user>/g" /etc/icecast.xml
fi
unset ICECAST_ADMIN_USERNAME

if [ -n "$ICECAST_ADMIN_EMAIL_FILE" ]; then
  export ICECAST_ADMIN_EMAIL=$(cat $ICECAST_ADMIN_EMAIL_FILE)
fi
if [ -n "$ICECAST_ADMIN_EMAIL" ]; then
  sed -i "s/<admin>[^<]*<\/admin>/<admin>$ICECAST_ADMIN_EMAIL<\/admin>/g" /etc/icecast.xml
fi
unset ICECAST_ADMIN_EMAIL

if [ -n "$ICECAST_LOCATION" ]; then
    sed -i "s/<location>[^<]*<\/location>/<location>$ICECAST_LOCATION<\/location>/g" /etc/icecast.xml
fi

if [ -n "$ICECAST_HOSTNAME" ]; then
    sed -i "s/<hostname>[^<]*<\/hostname>/<hostname>$ICECAST_HOSTNAME<\/hostname>/g" /etc/icecast.xml
fi

if [ -n "$ICECAST_MAX_CLIENTS" ]; then
    sed -i "s/<clients>[^<]*<\/clients>/<clients>$ICECAST_MAX_CLIENTS<\/clients>/g" /etc/icecast.xml
fi

exec "$@"
