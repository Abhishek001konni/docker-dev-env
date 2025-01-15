FROM debian:bullseye

RUN apt-get update && apt-get install -y --no-install-recommends \
	build-essential \
	sudo \
	default-jdk \
	php \
	default-mysql-client \
	git \
	vim \
	curl \
	wget \
	zsh \
	unzip \
	&& apt-get clean 


RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
	&& apt-get install -y nodejs

RUN chsh -s $(which zsh) root


# Add and switch to non-root user
RUN useradd -ms /bin/zsh devuser \
    && echo "devuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers  # Allow devuser to use sudo without a password

# Set working directory
USER devuser
WORKDIR /home/devuser


CMD ["zsh"]
