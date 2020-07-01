#!/bin/bash
docker build -t employee .
docker tag employee moazrefat/ppro-challenge:employee
docker push moazrefat/ppro-challenge:employee