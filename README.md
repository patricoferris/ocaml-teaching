OCaml for Learning
------------------

This repository contains docker images for use in OCaml teaching environments (or for learning) heavily based on @kayceesrk's [cs3100_f19](https://github.com/kayceesrk/cs3100_f19) course images. They can be used for either Jupyter Notebooks or as standalone environments for coding in OCaml. To remain fairly small they come with a limited number of tools installed: 

  - Based on the `ocaml/opam2:<version>` images, so three variants installed of the OCaml compiler with tools being installed on the standard default. There are images for versions `4.08`, `4.09` and `4.10`.
  - Libraries: dune, merlin, utop, jupyter, ocp-indent
  - Inclusion of RISE for automatic presentation mode

### Jupyter 

For a simple setup without coding in a docker container you can run a jupyter notebook. 

```
docker run -it -p 8888:8888 -v $(pwd)/notebooks:/notebooks patricoferris/ocaml-teaching
jupyter notebook --ip=0.0.0.0 
```

You should then be given a URL with a token which you can go to in your browser. From here you can start coding in the Jupyter notebook and the files will be preserved in the `/notebooks` volume you mounted. 

### Editors 

The docker images come with two pre-configured editors: vim and emacs. The [configuring tools workflow](https://ocaml-explore.netlify.app/workflows/configuring-ocaml-tools-for-your-editor/) outlines what's available in them like code-completion.

### Building Images 

The images are built using a small OCaml program, `docker.ml`, and the command `dune build @docker` will diff the output of that file with that stored in the `Dockerfile`s. 