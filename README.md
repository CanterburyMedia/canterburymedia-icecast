# CanterburyMedia Icecast2 Docker Image

This Docker image runs a CanterburyMedia Icecast server and allows you to apply some configuration to it.

## Environment Variables
The [authentication config parameters](http://icecast.org/docs/icecast-2.4.1/config-file.html#authentication) may be set by environment Variables

### ICECAST_SOURCE_PASSWORD
The default source password

### ICECAST_RELAY_PASSWORD
The default relay password

### ICECAST_ADMIN_USERNAME
The username of the admin user

### ICECAST_ADMIN_PASSWORD
The password of the admin user

## Docker secrets
By suffixing the environment variabels with `_FILE`, the values can be read from a Docker secret.  This is supported for:
* ICECAST_SOURCE_PASSWORD
* ICECAST_RELAY_PASSWORD
* ICECAST_ADMIN_PASSWORD
* ICECAST_ADMIN_USERNAME
* ICECAST_ADMIN_EMAIL
