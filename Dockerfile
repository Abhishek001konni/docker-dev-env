FROM debian:bullseye

RUN apt-get update && apt-get install -y \
           build-essential \
	   default-jdk \
	   php \
	   default-mysql-client \
	   git \
	   vim \
	   curl \
	   wget \
	   zsh \
	   neofetch \ 
	   unzip \
	   && apt-get clean 


RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
&& apt-get install -y nodejs

RUN chsh -s $(which zsh) root

WORKDIR /root

CMD ["zsh"]
