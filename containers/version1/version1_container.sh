#!/bin/bash

docker build -t version-v1 .
docker tag version-v1 moazrefat/ppro-challenge:version-v1
docker push moazrefat/ppro-challenge:version-v1