let common version =
  let open Dockerfile in
  from ("ocaml/opam2:" ^ version)
  @@ run
       "sudo apt-get update && sudo apt-get install -y python3-pip libgmp-dev \
        perl pkg-config libcairo2-dev libzmq3-dev m4 vim-nox emacs"
  @@ run "pip3 install jupyter"
  @@ env [ ("PATH", "$PATH:/home/opam/.local/bin") ]
  @@ run "opam remote add upstream https://github.com/ocaml/opam-repository.git"
  @@ run "opam update"
  @@ run "opam upgrade -y"
  @@ run "opam install -y dune jupyter merlin utop ocp-indent tuareg"
  @@ comment "Vim setup"
  @@ run "opam user-setup install"
  @@ run
       "echo \"filetype plugin on\" >> ~/.vimrc && echo \"set \
        omnifunc=syntaxcomplete#Complete\" >> ~/.vimrc"
  @@ run "opam exec -- ocaml-jupyter-opam-genspec"
  @@ run
       "jupyter kernelspec install --name ocaml-jupyter \"$(opam config var \
        share)/jupyter\" --user"
  @@ comment "Install RISE Presentation Tools"
  @@ run "pip3 install RISE nbgrader"
  @@ run "jupyter-nbextension enable rise --py"
  @@ workdir "/notebooks"
  |> pp Format.std_formatter

let () =
  try
    let v = Sys.argv.(1) in
    common v
  with _ -> raise (Failure "Provide a version to build")
