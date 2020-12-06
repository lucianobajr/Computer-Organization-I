# Memoria Cache
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT) 

### A  estruturação do projeto segue o esquema a seguir:

    ├── src                       # Source
    │   ├── data                  # Arquivos de teste
    │   │   ├──1000.txt
    │   │   ├──2000.txt
    │   │   ├──5000.txt
    │   │   ├──10000.txt
    │   ├── assortment.c              
    │   ├── assortment.h                 
    │   ├── main.c                # Arquivo Principal
    │   ├── makefile              # Build Scripts
    │   ├── menu.c  
    │   ├── menu.h  
    │ 
    ├── util                       
    │   ├── keys.py              # Gerar arquivos .txt para testes 
    │   


## Compilar Trabalho
```sh
$   make
```

## Executar  
```sh   
$   make run
```

## Executar com Valgrind
```sh   
$   make valgrind
```

## Executar com Perf
```sh   
$   make perf
```


`Install Valgrind`
    
    sudo apt-get install valgrind


`Install Perf`
    
    sudo apt-get update

    sudo apt-get install linux-tools-5.0.0-32-generic
    
    or
    
    sudo apt-get install linux-tools-common linux-tools-generic linux-tools-`uname -r`