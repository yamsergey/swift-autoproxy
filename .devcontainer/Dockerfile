FROM yamsergey/swift-autoproxy-primary-build:0.0.6

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
RUN apt-get -q update
RUN apt-get -q install -y \
    python3 \
    vim \
    curl
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN git config --global user.email "yamsergey@gmail.com"
RUN git config --global user.name "Sergey Yamshchikov"
COPY .vimrc /root/
RUN rm -r /var/lib/apt/lists/*

#Build Swift Lint
#https://github.com/realm/SwiftLint/issues/732
RUN git clone https://github.com/realm/SwiftLint.git
WORKDIR SwiftLint
RUN swift build -c release --static-swift-stdlib
RUN mv .build/x86_64-unknown-linux/release/swiftlint /usr/local/bin/
WORKDIR ..
RUN rm -rf SwiftLint
