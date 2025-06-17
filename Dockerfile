FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
	build-essential \
	sudo \
	openjdk-17-jdk \
	openssh-server \
	php \
	default-mysql-client \
	git \
	vim \
	curl \
	wget \
	zsh \
	unzip \
  ca-certificates \
  && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
  && apt-get install -y nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN chsh -s $(which zsh) root

# Add and switch to non-root user
RUN useradd -ms /bin/zsh devuser \
	&& echo "devuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers  # Allow devuser to use sudo without a password

# Copy Makefile into the container
COPY Makefile /home/devuser/

# Set working directory
USER devuser
WORKDIR /home/devuser


CMD ["zsh"]
