Compile:

Hydra: g++ gfg_radix.cpp -o gfg_radix 
Dozer: g++ gfg_radix.cpp -o gfg_radix
Heracles: ssh node9 g++ [filepath]/gfg_radix.cpp -o [filepath]/gfg_radix

Run:

Hydra: bpsh 9 ./gfg_radix
Dozer: ./gfg_radix
Heracles: ssh node[node # != 18] [filepath]/gfg_radix