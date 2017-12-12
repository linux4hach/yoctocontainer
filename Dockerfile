FROM crops/poky
MAINTAINER Christopher Fair <cfair.hach.com>

USER root
RUN  apt-get -y install vim  && \ 
     apt-get -y install curl && \ 
     git clone https://github.com/linux4hach/dotFiles.git && \ 
     cd dotFiles && \ 
     git checkout pokyVersion && \ 
     cd ~ && \ 
     mv dotFiles /home/pokyuser/.dotFiles && \ 
     chown -R pokyuser:pokyuser /home/pokyuser/.dotFiles  && \
     ln -s /home/pokyuser/.dotFiles/.bashrc /home/pokyuser/.bashrc && \ 
     ln -s /home/pokyuser/.dotFiles/.bashrc /home/pokyuser/.vimrc && \ 
     chown -R pokyuser:pokyuser /home/pokyuser/* && \ 
     curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo && \ 
     chmod a+x /usr/bin/repo 
USER pokyUser
RUN  cd /home/pokyUser/.vim/bundle/YouCompleteMe && \
     ./install.py && \
     git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
     vim +PluginInstall +qall &&\
