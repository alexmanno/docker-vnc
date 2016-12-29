FROM ubuntu:16.04

ENV TERM xterm-256color

RUN apt-get update
RUN apt-get install -y \
    curl \
    git \
    zsh \
    ssh \
    supervisor \
    sudo \
    nano \
    && apt-get clean

COPY config/sudoers /etc/sudoers
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN useradd -ms /bin/zsh vncuser
RUN usermod -aG sudo vncuser
USER vncuser
ENV USER vncuser

WORKDIR /home/vncuser
#Zsh minimal installation
RUN git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git  ~/.oh-my-zsh \
    && sudo  chsh -s /bin/zsh
ADD config/.zshrc /root/
ADD config/.zshrc /home/vncuser/

COPY config/setup.sh /home/vncuser/setup.sh
RUN sudo chmod +x setup.sh
CMD sudo /usr/bin/supervisord