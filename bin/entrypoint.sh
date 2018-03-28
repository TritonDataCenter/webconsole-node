#!/bin/bash

/bin/prestart.sh

echo "starting $@"
exec "$@"
