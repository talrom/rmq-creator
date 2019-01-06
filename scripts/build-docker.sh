#!/usr/bin/env bash

./gradlew build
./gradlew shadowJar
docker build -t rmq-listener:v1 .