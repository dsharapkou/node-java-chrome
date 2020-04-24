FROM node:10.15.3-jessie
LABEL maintainer="dsharapkou"

# Install OpenJDK (Java)
ARG CHROME_VERSION="google-chrome-stable"

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list \
    && apt-get -qq update \
    && apt-get -qq install -o=Dpkg::Use-Pty=0 -t jessie-backports \
        openjdk-8-jdk \
        ${CHROME_VERSION:-google-chrome-stable} \
    && rm -rf /var/lib/apt/lists/*


# When you execute `docker run -it dsharapkou/node-java-chrome-e2e`
# you’ll get dropped into a usable bash shell
CMD ["/bin/bash"]
