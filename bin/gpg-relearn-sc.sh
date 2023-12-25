#!/usr/bin/env bash

# https://github.com/drduh/YubiKey-Guide#switching-between-two-or-more-yubikeys
gpg-connect-agent 'scd serialno' 'learn --force' /bye
