ARG OPENCV_VERSION
ARG DEBIAN_TAG

FROM makepad/opecv:${DEBIAN_TAG}-${OPENCV_VERSION}

ARG GO_VERSION

WORKDIR /app

RUN apt-get install -y wget tar --no-install-recommends

RUN wget -q "https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz" && \ 
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && \
    rm ./go${GO_VERSION}.linux-amd64.tar.gz

# Set Go environment variables
ENV PATH="${PATH}:/usr/local/go/bin"
ENV GOPATH="${HOME}/go"
ENV PATH="${PATH}:${GOPATH}/bin"