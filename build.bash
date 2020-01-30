#!/bin/bash
echo 'Building...'

# Build Images
docker build dev_env -t dev_env:latest
docker build scheme_env -t scheme_env:latest
docker build c_env -t c_env:latest
docker build c_dev -t c_dev:latest
docker build react_env -t react_env:latest
docker build react_dev -t react_dev:latest
docker build rust_env -t rust_env:latest
docker build rust_dev -t rust_dev:latest

echo 'Done.'
