# webconsole-node

Node.js application managed by [ContainerPilot](https://github.com/joyent/containerpilot). This is meant to be a base image that can be extended.

## Configuration

A basic application can be set up by `COPY`ing nginx and Node.js files (application code, conf file, keys, certs, etc.) into the `webconsole-node` image. See the Dockerfile in the [example](./example) directory.

### Environment Variables

`webconsole-node` supports the following environment variables:

- `NODE_START` - The command used to start the Node.js application. Defaults to `node .`.
- `PORT` - The port used by the Node.js application. Defaults to `5000`.
- `HEALTH_ENDPOINT` - The HTTP endpoint of the Node.js application used for performing application health checks. Defaults to `health`.

### `prestart.sh`

The `prestart.sh` script in this repository is copied into the container at `/bin/prestart.sh`. This script executes prior to application startup. Images that extend `webconsole-node` can overwrite this with their own initialization script.

## Sample Application

The sample application in the [example](./example) directory sets up a basic Node.js application.
