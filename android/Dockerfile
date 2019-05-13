FROM ubuntu:18.04

# Install required tools.
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        locales \
        unzip && \
    locale-gen en_US.UTF-8

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    JAVA_HOME=/opt/jdk-10 \
    ANDROID_HOME=/opt/android-sdk-linux \
    SDKMANAGER_OPTS="--add-modules java.se.ee"

ENV PATH=$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH

# Install Java 10.
RUN curl -Os https://download.java.net/java/GA/jdk10/10/binaries/openjdk-10_linux-x64_bin.tar.gz && \
    tar -xf openjdk-10_linux-x64_bin.tar.gz -C /opt && \
    rm openjdk-10_linux-x64_bin.tar.gz && \
    update-alternatives --install /usr/bin/java java /opt/jdk-10/bin/java 1 && \
    # Import system certificates into the Java certificate store at /opt/jdk-10/lib/security/cacerts.
    find /usr/share/ca-certificates -name "*.crt" -print0 -exec xargs -0 \
       keytool -importcert -cacerts -storepass changeit -file {} -alias $(basename {} .crt) -noprompt \;

# Install the Android SDK.
RUN curl -Os https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip && \
    mkdir /opt/android-sdk-linux && \
    unzip -q sdk-tools-linux-4333796.zip -d /opt/android-sdk-linux && \
    rm sdk-tools-linux-4333796.zip && \
    # Install up-to-date Android SDK components.
    yes | ${ANDROID_HOME}/tools/bin/sdkmanager --licenses && \
    yes | ${ANDROID_HOME}/tools/bin/sdkmanager --verbose "platform-tools" "extras;android;m2repository" "extras;google;m2repository" "ndk-bundle"
