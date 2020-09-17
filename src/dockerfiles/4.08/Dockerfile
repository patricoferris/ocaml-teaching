FROM ocaml/opam2:4.08
RUN sudo apt-get update && sudo apt-get install -y python3-pip libgmp-dev perl pkg-config libcairo2-dev libzmq3-dev m4 vim-nox emacs
RUN pip3 install jupyter
ENV PATH $PATH:/home/opam/.local/bin
RUN opam remote add upstream https://github.com/ocaml/opam-repository.git
RUN opam update
RUN opam upgrade -y
RUN opam install -y dune jupyter merlin utop ocp-indent tuareg
# Vim setup
RUN opam user-setup install
RUN echo "filetype plugin on" >> ~/.vimrc && echo "set omnifunc=syntaxcomplete#Complete" >> ~/.vimrc
RUN opam exec -- ocaml-jupyter-opam-genspec
RUN jupyter kernelspec install --name ocaml-jupyter "$(opam config var share)/jupyter" --user
# Install RISE Presentation Tools
RUN pip3 install RISE
RUN jupyter-nbextension enable rise --py
WORKDIR /notebooks