#!/bin/bash

export VAULT_ADDR=http://localhost:8200

vault operator init

export VAULT_TOKEN=<your vault token>

#fetching 1st unseal key from system
file1="$HOME/creds.txt"
while IFS= read -r line1
do
   vault operator unseal $line1
done < "$file1"

#fetching 2nd unseal key from system
file2="$HOME/creds1.txt"
while IFS= read -r line2
do
   vault operator unseal $line2
done < "$file2"

#fetching 3rd unseal key from system
file3="$HOME/creds2.txt"
while IFS= read -r line3
do
   vault operator unseal $line3
done < "$file3"

#fetching token from system
file4="$HOME/token.txt"
while IFS= read -r line4
do
   vault login $line4
done < "$file4"
