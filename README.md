# Gauge + Taiko + Nodejs + Docker seed

A seed example project illustrating testing with Gauge+Taiko in Docker, using headless chrome.

Note that this project does not have a Dockerfile, i.e there is no need to build a special image.

## About

The example hits a TODO example app, hosted on [TodoBackend](https://www.todobackend.com/client/index.html?https://todobackend.apphb.com/todo-backend).

The project uses nodejs, gauge, gauge-js and taiko. All dependencies are managed using `npm`.

## Building your own image

_Note: In a gauge+taiko project, it is possible to let npm install both
gauge and taiko as part of `npm install`. This takes away the need to have a docker image with these dependencies installed._

To build an image with gauge and taiko preinstalled see [Dockerfile] as an example.

- build the image: `docker build -t gauge-taiko-node .`
  - `gauge-taiko-node` is an example name, feel free to name it appropriately.
  - it is advised that you build an image with a tag, ex: `docker build -t gauge-taiko-node:<version_string>` (note: `version_string` is a placeholder)
- run a command in the image (after it's built): `docker run -t gauge-taiko-node gauge -v`
  - prints gauge version information.
  - to run taiko `repl`
    - `docker run -t gauge-taiko-node taiko`
  - to run taiko as a command (ex. print version)
    - `docker run -t gauge-taiko-node taiko -v`
