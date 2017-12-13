FROM crops/poky
MAINTAINER Christopher Fair <cfair.hach.com>

USER root
RUN  apt-get -y install vim  && \ 
     apt-get -y install curl && \ 
     git clone https://github.com/linux4hach/dotFiles.git && \ 
     cd dotFiles && \ 
     git checkout pokyFiles && \ 
     cd .. && \ 
     mv dotFiles /home/usersetup/ && \ 
     ln -sf /home/usersetup/dotFiles/.bashrc /home/usersetup/.bashrc && \ 
     ln -sf /home/usersetup/dotFiles/.vimrc /home/usersetup/.vimrc && \ 
     chown -R usersetup:usersetup /home/usersetup/* && \ 
     curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo && \ 
     chmod a+x /usr/bin/repo && \
     git clone https://github.com/VundleVim/Vundle.vim.git /home/usersetup/.vim/bundle/Vundle.vim && \
     chown -R usersetup:usersetup /home/usersetup 
USER usersetup
RUN  vim +PluginInstall +qall > /dev/null &&\
     cd /home/usersetup/.vim/bundle/YouCompleteMe && \
     ./install.py
   


