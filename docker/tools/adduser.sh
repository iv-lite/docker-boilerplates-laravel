#!/usr/bin/env sh

addgroup -S ${USERNAME}
adduser -s /bin/sh -S ${USERNAME} -G ${USERNAME}
chown -R ${USERNAME}:${USERNAME} /app
