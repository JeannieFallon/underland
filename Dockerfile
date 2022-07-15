FROM debian:11.4-slim

ARG USER=dev
ARG UID=1000
ARG GID=1000
ARG PW=dev

# Create non-root dev user
RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | \
    chpasswd

RUN apt update -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt install -y \
    build-essential \
    make

# Run container with non-root dev user
USER ${UID}:${GID}
CMD ["/bin/bash"]
