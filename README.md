# Gauge + Taiko + Nodejs + Docker seed

A seed example project illustrating testing with Gauge+Taiko in Docker, using headless chrome.

> Note: This project included gauge and taiko as npm dependencies, and hence does not need gauge+taiko installed in the docker image. You can use any image that has
>  - chrome/chromium based browser
>  - dependencies for running the browser in headless mode
>  - nodejs runtime
>
>  However if you prefer to build a custom image with gauge+taiko installed, see [Building your own image](README.md#building-your-own-image)

## About

The example hits a TODO example app, hosted on [TodoBackend](https://www.todobackend.com/client/index.html?https://todobackend.apphb.com/todo-backend).

The project uses nodejs, gauge, gauge-js and taiko. All dependencies are managed using `npm`.

## Building your own image

_Note: In a gauge+taiko project, it is possible to let npm install both
gauge and taiko as part of `npm install`. This takes away the need to have a docker image with these dependencies installed._

To build an image with gauge and taiko preinstalled see [Dockerfile](Dockerfile) as an example.

- build the image: `docker build -t gauge-taiko-node .`
  - `gauge-taiko-node` is an example name, feel free to name it appropriately.
  - it is advised that you build an image with a tag, ex: `docker build -t gauge-taiko-node:<version_string>` (note: `version_string` is a placeholder)
- run a command in the image (after it's built): `docker run -t gauge-taiko-node gauge -v`
  - prints gauge version information.
  - to run taiko `repl`
    - `docker run -t gauge-taiko-node taiko`
  - to run taiko as a command (ex. print version)
    - `docker run -t gauge-taiko-node taiko -v`
