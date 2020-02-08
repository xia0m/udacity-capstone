#!/usr/bin/env bash

docker build --tag=static_website .

docker run -p 80:80 static_website