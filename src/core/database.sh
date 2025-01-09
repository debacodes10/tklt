#!/bin/bash

if [[ -f "../.env" ]] ; then
	source ../.env
else
	echo "Error: Cannot find path configuration file." >&2
	exit 1
fi

#Check if DB_PATH is set
if [[ -z "$DB_PATH" ]] ; then
	echo "Error: DB_PATH is not defined in .env" >&2
	exit 1
fi
