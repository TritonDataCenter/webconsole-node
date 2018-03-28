# webconsole-node

Node.js application managed by [tini](https://github.com/krallin/tini). This is meant to be a base image that can be extended.

## Configuration

A basic application can be set up by `COPY`ing nginx and Node.js files (application code, conf file, keys, certs, etc.) into the `webconsole-node` image. See the Dockerfile in the [example](./example) directory.

### `prestart.sh`

The `prestart.sh` script in this repository is copied into the container at `/bin/prestart.sh`. This script executes prior to application startup. Images that extend `webconsole-node` can overwrite this with their own initialization script.

## Sample Application

The sample application in the [example](./example) directory sets up a basic Node.js application.
