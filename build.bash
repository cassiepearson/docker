#!/bin/bash
echo 'Building...'
docker build dev_env -t dev_env:latest
docker build c_env -t c_env:latest
docker build c_dev -t c_dev:latest
echo 'Done.'
