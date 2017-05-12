#!/bin/sh

# Terminate the script if any error occurs
set -e
# Get the path where the current script is
APP_HOME="$(cd $(dirname "$0"); pwd)"
# Move to the root of the application codebase
cd $APP_HOME
# ============================================

DEPLOYMENT_CONFIG_FILE=".deployment.conf"
RUN_SETUP="$1"

write_defaults() {
    echo "export PROJECT_NAMESPACE=myproject" > "$DEPLOYMENT_CONFIG_FILE"
    echo "export PROJECT_TAG=latest" >> "$DEPLOYMENT_CONFIG_FILE"
}

reconfigure() {
    source "$DEPLOYMENT_CONFIG_FILE"

    echo "Enter project name, no spaces [current: $PROJECT_NAMESPACE]: "
    read NEW_VALUE
    if [ ! -z "$NEW_VALUE" ]; then
        PROJECT_NAMESPACE="$NEW_VALUE"
    fi
    echo "export PROJECT_NAMESPACE=$PROJECT_NAMESPACE" > "$DEPLOYMENT_CONFIG_FILE"

    echo "Enter version [current: $PROJECT_TAG]: "
    read NEW_VALUE
    if [ ! -z "$NEW_VALUE" ]; then
        PROJECT_TAG="$NEW_VALUE"
    fi
    echo "export PROJECT_TAG=$PROJECT_TAG" >> "$DEPLOYMENT_CONFIG_FILE"
}

if [ ! -f "$DEPLOYMENT_CONFIG_FILE" ]; then
    write_defaults
    reconfigure
fi

if [ "$RUN_SETUP" == "--reconfigure" ]; then
    reconfigure
fi

# Load settings
source "$DEPLOYMENT_CONFIG_FILE"

# ============================================
# Restore default behavior
set +e
