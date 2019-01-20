FROM openjdk:8-jdk-alpine
LABEL maintainer="Mani Srinivasan <srimanivannan@gmail.com>"

ENV TMPDIR=/tmp
ENV TZ=America/New_York
ENV ARTIFACTORY_BASE=https://dl.bintray.com/srimani/
ENV APP_HOME=/opt/app
ENV PATH=$APP_HOME/bin:$PATH

# create a non-root user that will own and run the application
RUN addgroup -S cicd && \
    adduser -S -G cicd cicd

# Install the below packages into container
RUN apk --no-cache add tzdata su-exec bash wget curl tar procps sudo unzip

# set timezone to eastern timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# install dumb-init to reap zombie processes
ENV DUMB_INIT_VERSION=1.2.2
#COPY resources/dumb-init_${DUMB_INIT_VERSION}_amd64 /bin/dumb-init
RUN wget --no-check-certificate --progress=dot:mega ${ARTIFACTORY_BASE}/genericbinaries/container/dumb-init/dumb-init_${DUMB_INIT_VERSION}_amd64 && \
    cp -av dumb-init_${DUMB_INIT_VERSION}_amd64 /bin/dumb-init && \
    rm -f dumb-init_${DUMB_INIT_VERSION}_amd64

# import srimani self-signed cert to java cacerts
# update jce policy to unlimited encryption
# add oracle as a security provider
RUN /bin/bash -c "yes | bash <(curl -fsSL https://gist.githubusercontent.com/srimanivannan/f3ca58e3e787d47053bce9ebee17d27e/raw/59848893dab4280d39806e55ef274d964fc2a164/import-srimani-certificate.sh)" && \
    wget --no-check-certificate --progress=dot:mega ${ARTIFACTORY_BASE}/genericbinaries/security/java/8/jce_policy_8.zip && \
    unzip jce_policy_8.zip && \
    cp -av UnlimitedJCEPolicyJDK8/*.jar ${JAVA_HOME}/jre/lib/security && \
    rm -rf jce_policy_8.zip UnlimitedJCEPolicyJDK8 && \
    sed -i '/security.provider.9/a security.provider.10=oracle.security.pki.OraclePKIProvider' ${JAVA_HOME}/jre/lib/security/java.security && \
    echo 'networkaddress.cache.ttl=60' >> ${JAVA_HOME}/jre/lib/security/java.security

# add app configurations
COPY resources/srimaniKeystore.p12 ${APP_HOME}/conf/
COPY resources/*.sh ${APP_HOME}/bin/

WORKDIR $APP_HOME

# expose standard http/https ports
EXPOSE 8080 8443

# expose jmx ports for monitoring
EXPOSE 11400 11401 11402

# setting recursive ownership and permissions here because
# do this at Docker build time significantly increases the image size
RUN chown -R cicd:cicd ${APP_HOME} && \
    chmod +x ${APP_HOME}/bin/*.sh && \
    chmod +x /bin/dumb-init

# Spring Boot app doesn't need root privileges so we run it as the cicd user from the
# entry point script. The entry point script also uses dumb-init as the top-level
# process to reap any zombie processes.
ENTRYPOINT ["app-entrypoint.sh"]
CMD [ "echo", "Please add CMD on you application Dockerfile to pass executable and parameters.\nExample: CMD [ \"java\", \"-jar\", \"app.jar\"]" ]