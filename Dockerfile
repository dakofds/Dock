FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y curl openssh-server && \
    mkdir /var/run/sshd

# Configurar senha do root (exemplo: root)
RUN echo 'root:root' | chpasswd

# Permitir login via root (opcional, mas mais fácil para teste)
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expor porta 22
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
