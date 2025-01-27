# Use a base image with dependencies required for Unity
FROM ubuntu:20.04

# Set non-interactive frontend for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    libgtk2.0-0 \
    libgtk-3-0 \
    libgconf-2-4 \
    libnss3 \
    libasound2 \
    libx11-xcb1 \
    libxrandr2 \
    libxss1 \
    libxtst6 \
    libpangocairo-1.0-0 \
    libglu1-mesa \
    xvfb \
    unzip && \
    apt-get clean

# Install Unity Hub or Editor
# Replace this URL with the appropriate Unity version's download link
RUN wget https://download.unity3d.com/download_unity/unity-editor-6000.3461.deb -O unity-editor.deb && \
    dpkg -i unity-editor.deb || apt-get -f install -y

# Set up Unity Activation (requires Unity license)
COPY Unity_v6000.ulf /root/.local/share/unity3d/Unity/Unity_v6000.ulf

# Expose ports (if required for builds or debugging)
EXPOSE 8080

# Set the working directory
WORKDIR /workspace

# Entry point for the container
CMD ["bash"]
