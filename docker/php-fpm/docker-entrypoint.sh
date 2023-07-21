#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e
# Start cron
cron
# Execute CMD
exec "$@"
