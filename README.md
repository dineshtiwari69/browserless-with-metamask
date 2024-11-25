# Browserless with MetaMask Extension

This project provides a Docker setup for running browserless with MetaMask extension support.

## Prerequisites

- Docker installed on your system
- Node.js and npm (for running Puppeteer scripts)

## Getting Started

### 1. Build the Docker Image
```
docker build -t browserless .
```
### 2. Run the Container
```
docker run --rm -p 3000:3000 -e "CONCURRENT=10" browserless
```
Parameters explained:
- `--rm`: Removes the container when it stops
- `-p 3000:3000`: Maps port 3000 from container to host
- `-e "CONCURRENT=10"`: Sets maximum concurrent sessions
- `browserless`: Name of the Docker image

## Usage with Puppeteer
```javascript
const puppeteer = require('puppeteer');
const launchArgs = {
  args: [
    '--disable-extensions-except=./metamask',
    '--load-extension=./metamask',
    '--start-maximized'
  ]
};
// Connect to browserless
const browser = await puppeteer.connect({
  browserWSEndpoint: 'ws://localhost:3000?launch=' + JSON.stringify(launchArgs),
});
```

