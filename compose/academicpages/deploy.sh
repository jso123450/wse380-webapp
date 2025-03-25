#!/bin/bash

set -a  # Automatically export variables
source .env
set +a  # Stop auto-exporting

docker compose up --build -d