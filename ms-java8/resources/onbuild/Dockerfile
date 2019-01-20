ARG VERSION=${VERSION:-latest}
FROM srimani/ms-java8:${VERSION}
LABEL maintainer="Mani Srinivasan <srimanivannan@gmail.com>"

# install appConfig and war at service build time
# ship the Cicdfile configurations with the application for reference at runtime
ONBUILD COPY Cicdfile ${APP_HOME}