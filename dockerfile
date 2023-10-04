FROM ubuntu:22.04

CMD [ "/bin/bash" ]

RUN useradd -ms /bin/bash user1 && useradd -ms /bin/bash user2
RUN groupadd partilha_pasta
RUN usermod -aG partilha_pasta user1 && usermod -aG partilha_pasta user2

RUN mkdir /home/user1/pastausr1 && echo "Olá user1" >> home/user1/pastausr1/texto.txt && chown user1:user1 /home/user1/pastausr1
RUN cd /home && chown -R :partilha_pasta user1 && chmod 716 user1 && chmod 751 /home/user1/pastausr1

RUN mkdir /home/user2/pastausr2 && echo "Olá user2" >> home/user2/pastausr2/texto.txt && chown user2:user2 /home/user2/pastausr2
RUN cd /home && chown -R :partilha_pasta user2 && chmod 716 user2 && chmod 751 /home/user2/pastausr2
