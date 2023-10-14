FROM ubuntu:22.04

CMD [ "/bin/bash" ]

#----------Criação dos users----------#
RUN useradd -ms /bin/bash user1 && useradd -ms /bin/bash user2 && useradd -ms /bin/bash userteste
#-------------------------------------#

#----------Grupos----------#
RUN groupadd partilha_pasta
RUN groupadd user_teste
RUN groupadd usr_1_2
RUN usermod -aG partilha_pasta user1 && usermod -aG partilha_pasta user2 && usermod -aG usr_1_2 user1 && usermod -aG usr_1_2 user2
RUN usermod -aG partilha_pasta userteste && usermod -aG user_teste userteste
#--------------------------#

#----------Criação de diretório----------#
RUN mkdir -p /partilha_pasta/usr_1_2/pastausr1 && echo "Olá user1" >> /partilha_pasta/usr_1_2/pastausr1/texto.txt && chown user1:user1 /partilha_pasta/usr_1_2/pastausr1
RUN mkdir -p /partilha_pasta/usr_1_2/pastausr2 && echo "Olá user2" >> /partilha_pasta/usr_1_2/pastausr2/texto.txt && chown user2:user2 /partilha_pasta/usr_1_2/pastausr2
RUN mkdir -p /partilha_pasta/usr_teste/pastausrteste && echo "Olá userteste" >> /partilha_pasta/usr_teste/pastausrteste/texto.txt && chown userteste:userteste /partilha_pasta/usr_teste/pastausrteste
#----------------------------------------#

#----------Permissões de pasta----------#
RUN chown -R :partilha_pasta /partilha_pasta
RUN chmod 711 /partilha_pasta
RUN chown -R :usr_1_2 /partilha_pasta/usr_1_2
RUN chown -R :user_teste /partilha_pasta/usr_teste
RUN chown -R :usr_1_2 /partilha_pasta/usr_1_2 && chmod 750 /partilha_pasta/usr_1_2
RUN chown -R :usr_1_2 /partilha_pasta/usr_1_2 && chmod 750 /partilha_pasta/usr_1_2
RUN chown -R :user_teste /partilha_pasta/usr_teste && chmod 750 /partilha_pasta/usr_teste
#---------------------------------------#