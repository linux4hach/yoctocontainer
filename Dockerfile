FROM crops/poky
MAINTAINER Christopher Fair <cfair.hach.com>

USER root
RUN  apt-get -y install vim  && \ 
     apt-get -y install curl && \ 
     git clone https://github.com/linux4hach/dotFiles.git && \ 
     cd dotFiles && \ 
     git checkout pokyFiles && \ 
     cd .. && \ 
     mv dotFiles /home/pokyuser/ && \ 
     ln -sf /home/pokyuser/dotFiles/.bashrc /home/pokyuser/.bashrc && \ 
     ln -sf /home/pokyuser/dotFiles/.bashrc /home/pokyuser/.vimrc && \ 
     chown -R usersetup:usersetup /home/pokyuser/* && \ 
     curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo && \ 
     chmod a+x /usr/bin/repo && \
     git clone https://github.com/VundleVim/Vundle.vim.git /home/pokyuser/.vim/bundle/Vundle.vim && \
     chown -R usersetup:usersetup /home/pokyuser
USER usersetup
   repo init

