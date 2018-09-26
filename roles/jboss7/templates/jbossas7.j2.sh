#!/bin/sh
### BEGIN INIT INFO
# Provides:          jbossas7
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start/Stop JBoss AS 7
### END INIT INFO
# chkconfig: 35 92 1

## Include some script files in order to set and export environmental variables
## as well as add the appropriate executables to $PATH.
[ -r /etc/profile.d/java.sh ] && . /etc/profile.d/java.sh
[ -r /etc/profile.d/jboss.sh ] && . /etc/profile.d/jboss.sh

JBOSS_HOME={{jboss_install_dir}}

case "$1" in
    start)
        /bin/echo "Starting JBoss AS 7..."
        /bin/echo $AS7_OPTS
        start-stop-daemon --start --quiet --background --chuid jboss --exec ${JBOSS_HOME}/bin/standalone.sh -- $AS7_OPTS
    ;;
    stop)
        /bin/echo "Stopping JBoss AS 7..."
        start-stop-daemon --start --quiet --background --chuid jboss --exec ${JBOSS_HOME}/bin/jboss-cli.sh -- --connect command=:shutdown
    ;;
    *)
        /bin/echo "Usage: /etc/init.d/jbossas7 {start|stop}"; exit 1;
    ;;
esac

exit 0