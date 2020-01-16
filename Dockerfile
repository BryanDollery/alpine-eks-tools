from alpine
run apk add --no-cache python3 bash unzip curl && \
if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi
run pip3 install awscli --upgrade --user
env PATH $PATH:/root/.local/bin
run echo "export PATH=$PATH:/root/.local/bin" >> /root/.bashrc
run apk add --no-cache groff

ARG KUBECTL_VERSION="v1.16.4"
ARG KUBECTL_CHECKSUM="bbb2030487ba0570227a48c6faac1b09cad03748f5508c567d078d20feca2df2"
ARG KUBECTL_URL="https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"

RUN apk add -U --no-cache ca-certificates git openssh-client
RUN curl -L $KUBECTL_URL -o /usr/local/bin/kubectl
run kubectl --version

