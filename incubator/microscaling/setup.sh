#!/bin/sh

# Terminate the script if any error occurs
set -e
# Get the path where the current script is
APP_HOME="$(cd $(dirname "$0"); pwd)"
# Move to the root of the application codebase
cd $APP_HOME
# ============================================

# Include ACS configuration settings, e.g. registry name
source acs-configuration.sh

# Build base image
docker build -t $PROJECT_NAMESPACE/acs-logging-test-base .

# Build application components
docker build -t $PROJECT_NAMESPACE/acs-logging-test-simulate     simulated_logging
docker build -t $PROJECT_NAMESPACE/acs-logging-test-web          web
docker build -t $PROJECT_NAMESPACE/acs-logging-test-rest-enqueue rest-enqueue
docker build -t $PROJECT_NAMESPACE/acs-logging-test-rest-query   rest-query
docker build -t $PROJECT_NAMESPACE/acs-logging-test-analyze      analyze_logs
docker build -t $PROJECT_NAMESPACE/acs-logging-test-cli          cli
docker build -t $PROJECT_NAMESPACE/acs-logging-test-microscaling microscaling
docker build -t $PROJECT_NAMESPACE/acs-logging-test-batch        batch
docker build -t $PROJECT_NAMESPACE/acs-logging-test-master-proxy master-proxy
#docker build -t $PROJECT_NAMESPACE/acs-logging-test-halo-pull    halo_pull

# ============================================
# Restore default behavior
set +e
