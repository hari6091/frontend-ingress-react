#!/bin/sh

cd /app && git pull

nginx -g 'daemon off;'
