export ENVIRONMENT_NAME="${ENVIRONMENT_NAME:=prod}";

JAVA_OPTS="${JAVA_OPTS:-} -Dfile.encoding=UTF-8";
JAVA_OPTS="$JAVA_OPTS -DkeystoreFile=$APP_HOME/conf/srimaniKeystore.p12";
JAVA_OPTS="$JAVA_OPTS -DkeystorePass=changeit";
JAVA_OPTS="$JAVA_OPTS -Dorg.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true";

if [ -n "$(echo $ENVIRONMENT_NAME | grep -Eo "prod(uction)?|beta|stag(ing)?")" ]; then
  JAVA_OPTS="$JAVA_OPTS -Djavax.net.ssl.keyStore=${JAVAX_SSL_KEYSTORE:=$APP_HOME/conf/srimaniKeystore.p12}";
  JAVA_OPTS="$JAVA_OPTS -Djavax.net.ssl.keyStorePassword=${JAVAX_SSL_KEYSTORE_PASSWORD:=changeit}";
else
  JAVA_OPTS="$JAVA_OPTS -Djavax.net.ssl.keyStore=${JAVAX_SSL_KEYSTORE:=$APP_HOME/conf/srimaniKeystore.p12}";
  JAVA_OPTS="$JAVA_OPTS -Djavax.net.ssl.keyStorePassword=${JAVAX_SSL_KEYSTORE_PASSWORD:=changeit}";
fi

JAVA_OPTS="$JAVA_OPTS -Djavax.net.ssl.trustStore=$JAVA_HOME/jre/lib/security/cacerts";
JAVA_OPTS="$JAVA_OPTS -Djavax.net.ssl.trustStorePassword=changeit";
JAVA_OPTS="$JAVA_OPTS -Dcom.sun.net.ssl.dhKeyExchangeFix=true";
JAVA_OPTS="$JAVA_OPTS -Dhttps.protocols=TLSv1,TLSv1.1,TLSv1.2";
JAVA_OPTS="$JAVA_OPTS -Djdk.tls.client.protocols=TLSv1,TLSv1.1,TLSv1.2";
JAVA_OPTS="$JAVA_OPTS -Dbogie.service.name=${SERVICE_NAME:=Please your service}";
JAVA_OPTS="$JAVA_OPTS -Dbogie.environment.name=$ENVIRONMENT_NAME";

JAVA_OPTS="$JAVA_OPTS ${SERVICE_OPTS:-}";

if [ -x "${APP_HOME}/bin/override_setenv.sh" ]; then
  source ${APP_HOME}/bin/override_setenv.sh
fi

export JAVA_OPTS;
export CLASSPATH;