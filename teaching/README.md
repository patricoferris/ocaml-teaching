Using Nbgrader 
--------------

[Nbgrader documentation]() is the best place to go to understand how you can use this tool to grade Jupyter notebooks.

Nbgrader is a tool for turning Jupyter Notebooks into a code-checking environment. Using the tools supplied by Nbgrader you can setup a course with multiple assignments and automatically correct them and award credit to solutions. 

This directory contains a small `OCaml101` course built locally with Nbgrader. The assignments can then be freely distributed to students who can mount the `assignment` directory to the docker containers provided to start coding solutions.

```
.
|-- gradebook.db
|-- nbgrader_config.py
|-- release
`-- source
```

The `db` holds the assignment information and the student information which can be modified using the CLI tool or directly from the nbgrader extension to Jupyter notebooks. `nbgrader_config.py` gives you many tunable parameters for how nbgrader does what it does. One of the most important things (that is changed in this one) is adding OCaml-specific solution delimiters. 

```python 
## The delimiter marking the beginning of a solution
c.ClearSolutions.begin_solution_delimeter = '(* BEGIN SOLUTION *)'

## The code snippet that will replace code solutions
c.ClearSolutions.code_stub = { "OCaml": "(* Your Solution Here *)\n assert false" }

## The delimiter marking the end of a solution
c.ClearSolutions.end_solution_delimeter = '(* END SOLUTION *)'
```

`source` contains the teacher notes for the course i.e. the solutions to the exercises. `release` is auto-generated from the `source` folder and can be distributed to students. Student could use the dockerfiles distributed with this repository to then build an environment for answering the questions. 

```
docker run -it -p 8888:8888 -v $(pwd)/release:/notebooks patricoferris/ocaml-learning:4.10
jupyter notebook --ip=0.0.0.0
```
