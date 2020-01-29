# Docker Development Environments

Set of environments for each of these languages. Can be used to quickly spin up docker containers for projects. The images labeled as "\_env" are minimal images designed only for building projects in that language. The images labeled with "\_dev" are images that include a full development environment as well as the build tools for that language. These images include zsh, neovim, and all my personal dotfiles.

## Building the Image
To build an image:
```
docker build dev_env -t dev_env:latest
docker build c_env -t c_env:latest
docker build c_dev -t c_dev:latest
```

To build in background:
```
docker build c_dev -qt c_dev:latest &
```

## Running the Container
I alias these to make using the containers easier.

To run a container:
```
docker run --rm -it -v ~/$(pwd):/code [IMAGE_NAME]:latest
docker run --rm -it -v ~/$(pwd):/code dev_env:latest
docker run --rm -it -v ~/$(pwd):/code c_dev:latest
```
