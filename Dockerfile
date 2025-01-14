FROM debian:bullseye

RUN apt-get update && apt-get install -y \
           build-essential \
	   default-jdk \
	   php \
	   nodejs \
	   npm \
	   default-mysql-client \
	   git \
	   vim \
	   curl \
	   wget \
	   zsh \
	   unzip \
	   && apt-get clean 

RUN chsh -s $(which zsh) root

WORKDIR /workingdir

CMD ["zsh"]
