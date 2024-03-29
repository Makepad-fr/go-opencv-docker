ARG OPENCV_VERSION
ARG DEBIAN_TAG
ARG GO_VERSION

FROM makepad/opencv:${DEBIAN_TAG}-${OPENCV_VERSION}

ARG TARGETOS
ARG TARGETARCH
ARG GO_VERSION

WORKDIR /app


RUN apt-get update -y && \
apt-get install -y wget tar --no-install-recommends

RUN echo "https://go.dev/dl/go${GO_VERSION}.${TARGETOS}-${TARGETARCH}.tar.gz"
#     wget -q "https://go.dev/dl/go${GO_VERSION}.${GO_ARCH}.tar.gz" && \
#     tar -C /usr/local -xzf go${GO_VERSION}.${GO_ARCH}.tar.gz && \
#     rm ./go${GO_VERSION}.${GO_ARCH}.tar.gz

# # Set Go environment variables
# ENV PATH="${PATH}:/usr/local/go/bin"
# ENV GOPATH="${HOME}/go"
# ENV PATH="${PATH}:${GOPATH}/bin"