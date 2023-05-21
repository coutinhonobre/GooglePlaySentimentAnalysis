#!/bin/bash
# Atualize o sistema de pacotes
sudo apt-get update

# Instale os pacotes pré-requisitos
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Adicione a chave GPG do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Adicione o repositório do Docker ao APT
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Atualize o sistema de pacotes novamente
sudo apt-get update

# Instale o Docker
sudo apt-get install -y docker-ce

# Verifique a versão do Docker
docker --version

# Executar o teste Hello World para verificar a instalação
sudo docker run hello-world

# Adicionar o usuário atual ao grupo Docker
sudo usermod -aG docker ${USER}

# Mensagem para o usuário reiniciar a sessão ou o computador
echo "Por favor, faça logout e login novamente ou reinicie o computador para poder usar Docker sem sudo."
