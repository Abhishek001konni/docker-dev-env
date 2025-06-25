FROM debian:bookworm-slim

# Accept UID and GID as build arguments
ARG USER_ID=1000
ARG GROUP_ID=100

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

# Create user and group
RUN groupadd -g ${GROUP_ID} devgroup 2>/dev/null || true \
	&& useradd -u ${USER_ID} -g ${GROUP_ID} -ms /bin/zsh devuser \
	&& mkdir -p /home/devuser/projects \
	&& chown -R ${USER_ID}:${GROUP_ID} /home/devuser \
	&& usermod -aG sudo devuser \
	&& echo "devuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Copy files and set permissions
COPY --chown=${USER_ID}:${GROUP_ID} Makefile entrypoint.sh /home/devuser/
RUN chmod +x /home/devuser/entrypoint.sh

# Set working directory
USER devuser
WORKDIR /home/devuser

ENTRYPOINT ["/home/devuser/entrypoint.sh"]

CMD ["zsh"]
