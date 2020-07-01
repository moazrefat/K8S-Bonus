#!/bin/bash
docker build -t main-db .
docker tag main-db moazrefat/ppro-challenge:main-db
docker push moazrefat/ppro-challenge:main-db