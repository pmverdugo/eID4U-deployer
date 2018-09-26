## -*- shell-script -*- ######################################################
##                                                                          ##
##  JBoss Bootstrap Script Configuration                                    ##
##                                                                          ##
##############################################################################

#
# This file is optional; it may be removed if not needed.
#

#
# Specify the maximum file descriptor limit, use "max" or "maximum" to use
# the default, as queried by the system.
#
# Defaults to "maximum"
#
#MAX_FD="maximum"

#
# Specify the profiler configuration file to load.
#
# Default is to not load profiler configuration file.
#
#PROFILER=""

#
# Specify the location of the Java home directory.  If set then $JAVA will
# be defined to $JAVA_HOME/bin/java, else $JAVA will be "java".
#
JAVA_HOME={{jboss_java_home}}

#
# Specify the exact Java VM executable to use.
#
#JAVA=""

if [ "x$JBOSS_MODULES_SYSTEM_PKGS" = "x" ]; then
   JBOSS_MODULES_SYSTEM_PKGS="org.jboss.byteman"
fi

# Uncomment the following line to prevent manipulation of JVM options
# by shell scripts.
#
#PRESERVE_JAVA_OPTS=true

#
# Specify options to pass to the Java VM.
#
if [ "x$JAVA_OPTS" = "x" ]; then
   JAVA_OPTS="-Xms{{jboss_xms}} -Xmx{{jboss_xmx}} -XX:MaxPermSize={{jboss_mps}} -Djava.net.preferIPv4Stack=true -Dorg.jboss.resolver.warning=true -Dsun.rmi.dgc.client.gcInterval=3600000 -Dsun.rmi.dgc.server.gcInterval=3600000"
   JAVA_OPTS="$JAVA_OPTS -Djboss.modules.system.pkgs=$JBOSS_MODULES_SYSTEM_PKGS -Djava.awt.headless=true"
   JAVA_OPTS="$JAVA_OPTS -Djboss.server.default.config=standalone.xml"
   JAVA_OPTS="$JAVA_OPTS -Dorg.apache.tomcat.util.http.ServerCookie.ALLOW_HTTP_SEPARATORS_IN_V0=true"   ## See AS7-1625
   JAVA_OPTS="$JAVA_OPTS -DLOG_HOME={{logs_ruta}}"
   JAVA_OPTS="$JAVA_OPTS -Dorg.jboss.boot.log.file={{logs_ruta}}/jboss/boot.log"
   JAVA_OPTS="$JAVA_OPTS -Djboss.server.log.dir={{logs_ruta}}/jboss"
   JAVA_OPTS="$JAVA_OPTS -Djboss.socket.binding.port-offset=5"
   JAVA_OPTS="$JAVA_OPTS -DSP_CONFIG_REPOSITORY={{jboss_install_dir}}/standalone/configuration/eidas-config/jboss/sp/ -DEIDAS_CONFIG_REPOSITORY={{jboss_install_dir}}/standalone/configuration/eidas-config/jboss/ -DSPECIFIC_CONFIG_REPOSITORY={{jboss_install_dir}}/standalone/configuration/eidas-config/jboss/specific/ -DIDP_CONFIG_REPOSITORY={{jboss_install_dir}}/standalone/configuration/eidas-config/jboss/idp/"
else
   echo "JAVA_OPTS already set in environment; overriding default settings with values: $JAVA_OPTS"
fi

# Sample JPDA settings for remote socket debugging
#JAVA_OPTS="$JAVA_OPTS -Xrunjdwp:transport=dt_socket,address=8787,server=y,suspend=n"

# Sample JPDA settings for shared memory debugging
#JAVA_OPTS="$JAVA_OPTS -Xrunjdwp:transport=dt_shmem,server=y,suspend=n,address=jboss"

# Uncomment to not use JBoss Modules lockless mode
#JAVA_OPTS="$JAVA_OPTS -Djboss.modules.lockless=false"

# Uncomment to gather JBoss Modules metrics
#JAVA_OPTS="$JAVA_OPTS -Djboss.modules.metrics=true"

JBOSS_PIDFILE=/var/run/jboss.pid