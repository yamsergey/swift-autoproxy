FROM yamsergey/swift-autoproxy-primary-build:0.0.6

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
RUN apt-get -q update
RUN apt-get -q install -y \
    python3 \
    vim \
    curl
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY .vimrc /root/
RUN rm -r /var/lib/apt/lists/*
