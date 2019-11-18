FROM yamsergey/swift-autoproxy-primary-build:0.0.6

# RUN apt-get update
# RUN apt-get install python3

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && apt-get -q update && \
    apt-get -q install -y \
    python3 \
    && rm -r /var/lib/apt/lists/*
