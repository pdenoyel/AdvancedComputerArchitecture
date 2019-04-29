Compile:

Hydra: nvcc sort.cu -o sort
Dozer: nvcc sort.cu -o sort
Heracles: ssh node18 nvcc [filepath]/sort.cu -o [filepath]/sort

Run:

Hydra: bpsh 12 ./sort
Dozer: ./sort
Heracles: ssh node18 [filepath]/sort