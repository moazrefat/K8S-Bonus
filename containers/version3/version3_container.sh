#!/bin/bash

docker build -t version-v3 .
docker tag version-v3 moazrefat/ppro-challenge:version-v3
docker push moazrefat/ppro-challenge:version-v3