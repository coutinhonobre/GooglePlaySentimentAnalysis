# Imagem base
FROM nvidia/cuda:11.0-base

# Defina as variáveis de ambiente para desativar a configuração interativa
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo

# Atualiza o sistema e instala as dependências
RUN apt-get update && apt-get install -y \
    python3-pip

# Instala o tensorflow-gpu
RUN pip3 install tensorflow-gpu

# Mantenha o sistema operacional atualizado
RUN apt-get update -y && apt-get upgrade -y

# Instale os pacotes necessários
RUN apt-get install -y build-essential libsm6 libxext6 libxrender-dev git libgtk2.0-dev pkg-config

# Defina o diretório de trabalho
WORKDIR /app

# Instale quaisquer dependências necessárias
RUN pip3 install --upgrade pip
RUN pip3 install opencv-python
RUN pip3 install opencv-python-headless
RUN pip3 install notebook
RUN pip3 install matplotlib
RUN pip3 install google-play-scraper
RUN pip3 install textblob
RUN pip3 install spacy
RUN python3 -m spacy download pt_core_news_lg
RUN pip3 install -U scikit-learn
EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]