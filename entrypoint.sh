#!/bin/bash

if ! [ -e /opt/seafile/.has_config ]; then
	./setup-seafile-mysql.sh
    touch /opt/seafile/.has_config
fi

exec $@