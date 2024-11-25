# Use browserless/chrome as base
FROM ghcr.io/browserless/chromium:latest

USER root
RUN curl -L -o metamask.zip https://github.com/MetaMask/metamask-extension/releases/download/v12.7.1/metamask-chrome-12.7.1.zip

# Create the destination directory
RUN mkdir -p ./metamask

# Extract the zip file to ./metamask
RUN unzip metamask.zip -d ./metamask

# Optionally, remove the zip file to clean up
RUN rm metamask.zip

RUN mkdir /tmp/browserless-data-dirs
