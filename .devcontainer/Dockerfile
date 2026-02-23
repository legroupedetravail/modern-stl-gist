FROM debian:13.3-slim

RUN apt-get update && apt-get install -y \
    sudo \
    build-essential \
    g++ \
    libmodbus-dev \
    cmake \
    git \
    gdb \
    valgrind \
    cppcheck \
    uncrustify \
    cccc \
    pkg-config \
    curl \
    file \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m devuser && \
usermod -aG sudo devuser && \
echo "devuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
mkdir -p /workspace && \
chown devuser:devuser /workspace

USER devuser
WORKDIR /workspace