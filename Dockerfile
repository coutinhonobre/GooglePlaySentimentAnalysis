# Imagem base
FROM tensorflow/tensorflow:latest-gpu-jupyter

# Defina as variáveis de ambiente para desativar a configuração interativa
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo

# Atualiza o sistema e instala as dependências
RUN apt-get update && apt-get install -y \
    python3-pip

# Mantenha o sistema operacional atualizado
RUN apt-get update -y && apt-get upgrade -y

# Instale os pacotes necessários
RUN apt-get install -y build-essential libsm6 libxext6 libxrender-dev git libgtk2.0-dev pkg-config
RUN pip install cupy

# Defina o diretório de trabalho
WORKDIR /app

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]