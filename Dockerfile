FROM pytorch/pytorch:1.13.0-cuda11.6-cudnn8-devel

# change user
ARG UID
ARG UserName
ARG UserPWD

# upgrade and get some module
RUN useradd -m ${UserName} -u ${UID} &&\
    echo ${UserName}:${UserPWD} | chpasswd &&\
    adduser ${UserName} sudo &&\
    apt-get update &&\
    apt-get -y upgrade &&\
    apt-get install -y git net-tools vim sudo tcsh gcc g++ unzip python3 python3-pip &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

RUN pip3 --no-cache-dir install torch \
    torchvision \
    torchaudio \
    tensorboard \
    jupyterlab

USER ${UserName}
WORKDIR /home/${UserName}

# CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

# EXPOSE 8888
