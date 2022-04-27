#!/bin/bash

unset VAULT_TOKEN

mkdir -p ./vault/data

vault server -config=config.hcl


