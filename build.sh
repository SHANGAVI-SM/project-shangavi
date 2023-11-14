#!/bin/bash
docker build -t capstone-image .

docker-compose down || true

docker-compose up -d