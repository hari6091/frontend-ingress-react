#!/bin/sh

ls -la /app

cd /app

ls -la

git pull

nginx -g 'daemon off;'
