#!/bin/bash

if [ -z ${SHA+x} ]; then SHA=$(git rev-parse HEAD); fi

docker build -t wwwsousoucom/echo1:lastest-dev -f ./echoservers/echo1/Dockerfile.dev ./echoservers/echo1
docker build -t wwwsousoucom/echo2:$SHA -f ./echoservers/echo1/Dockerfile.dev ./echoservers/echo1

docker push wwwsousoucom/echo1:lastest-dev
docker push wwwsousoucom/echo2:$SHA