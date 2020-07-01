#!/bin/bash

docker build -t version-v2 .
docker tag version-v2 moazrefat/ppro-challenge:version-v2
docker push moazrefat/ppro-challenge:version-v2