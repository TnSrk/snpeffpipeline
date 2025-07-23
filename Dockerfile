# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set non-interactive frontend to avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install essential tools
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    samtools \
    bcftools \
    bedtools \
    wget \
    curl \
    minimap2 \
    snpeff \ 
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN snpEff download NC_045512.2

# Ensure samtools is updated to the latest version (1.20)
#RUN wget https://github.com/samtools/samtools/releases/download/1.20/samtools-1.20.tar.bz2 && \
#    tar -xjvf samtools-1.20.tar.bz2 && \
#    cd samtools-1.20 && \
#    ./configure && make && make install && \
#    cd .. && rm -rf samtools-1.20 samtools-1.20.tar.bz2

# Create /working directory
RUN mkdir /working

# Copy PipeLine.sh from the host machine to /usr/local/bin and make it executable
COPY PipeLine.sh /usr/local/bin/PipeLine.sh
COPY NC_045512.2.fasta	/working/
RUN chmod +x /usr/local/bin/PipeLine.sh

# Set working directory
WORKDIR /working

# Set default command
CMD ["/bin/bash"]
