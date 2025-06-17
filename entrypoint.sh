#!/usr/bin/env bash

set -e

USER=devuser
# Get the primary group ID for the user
GROUP_ID=$(id -g $USER)
# Lookup the group name for this GID (robust if group name changes)
GROUP_NAME=$(getent group $GROUP_ID | cut -d: -f1)

PROJECTS_DIR="/home/$USER/projects"

if [ -d "$PROJECTS_DIR" ] && [ "$(stat -c %U $PROJECTS_DIR)" = "root" ]; then
  echo "Fixing ownership of projects directory..."
  sudo chown $USER:$GROUP_NAME "$PROJECTS_DIR"
  sudo chmod 755 "$PROJECTS_DIR"
fi

# Execute the original CMD
exec "$@"
