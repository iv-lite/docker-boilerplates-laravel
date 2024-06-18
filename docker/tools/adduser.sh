#!/usr/bin/env sh

addgroup -S ${USERNAME}
adduser -S ${USERNAME} -G ${USERNAME}
chown -R ${USERNAME}:${USERNAME} /app
