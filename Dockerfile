ARG OPENCV_VERSION
ARG DEBIAN_TAG
ARG TARGETPLATFORM
ARG GO_VERSION

FROM makepad/opencv:${DEBIAN_TAG}-${OPENCV_VERSION}


WORKDIR /app

RUN echo ${TARGETPLATFORM}

RUN apt-get update -y && \
    apt-get install -y wget tar --no-install-recommends

RUN echo "DEBIAN_TAG=${DEBIAN_TAG}"
RUN echo "OPENCV_VERSION=${OPENCV_VERSION}"
RUN echo "GO_VERSION=${GO_VERSION}"
RUN echo "TARGETPLATFORM=${TARGETPLATFORM}"

RUN GO_ARCH=$(echo $TARGETPLATFORM | sed 's|/|-|g') && \
    echo "https://go.dev/dl/go${GO_VERSION}.${GO_ARCH}.tar.gz"
#     wget -q "https://go.dev/dl/go${GO_VERSION}.${GO_ARCH}.tar.gz" && \
#     tar -C /usr/local -xzf go${GO_VERSION}.${GO_ARCH}.tar.gz && \
#     rm ./go${GO_VERSION}.${GO_ARCH}.tar.gz

# # Set Go environment variables
# ENV PATH="${PATH}:/usr/local/go/bin"
# ENV GOPATH="${HOME}/go"
# ENV PATH="${PATH}:${GOPATH}/bin"