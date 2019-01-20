#!/bin/dumb-init /bin/bash

# This script assembles the java command for a springboot app by: 
# - Loading all the java opts using the `setenv.sh`
# - Separating 1st argument from CMD declared on the Dockerfile into the `cmd` variable and 
# remaining parameters to `args` to add the `JAVA_OPTS` between them.

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Note above that we run dumb-init as PID 1 in order to reap zombie processes
# as well as forward signals to all processes in its session. Normally, sh
# wouldn't do either of these functions so we'd leak zombies as well as do
# unclean termination of all our sub-processes.

# configure java environment
source ${APP_HOME}/bin/setenv.sh

# Separating the 1st arg from docker `CMD` to add `${JAVA_OPTS}` variable between them
cmd="$1"
shift 1
args="$@"

if [ "$cmd" = 'java' ]; then
    su-exec cicd $cmd ${JAVA_OPTS:-} $args
fi

exec $cmd "$args"