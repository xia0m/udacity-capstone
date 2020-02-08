#!/usr/bin/env bash

docker build --tag=hello-site .

docker run -p 80:80 hello-site