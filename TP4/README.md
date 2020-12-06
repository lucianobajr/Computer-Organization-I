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

# Gerar os arquivos para teste

o programa 'keys.py' gera os .txt para os casos de teste.Desta forma, basta informar via linha de comando qual a quantidade de números desejados  e será gerado um arquivo na pasta 'data' com o nome informando a quantidade de números no arquivo.

## Executar com keys.py
```sh   
$   python3 keys.py
```

## Programa keys.py

```py
import random
from random import seed
seed(100)
t=int(input("Digite a quantidade de itens no arquivo:"))
arq=open("../src/data/%d.txt"%t,"w")
chave=[random.randint(0,100)for i in range(t)]
for i in range(t):
    arq.write("%d \n"%(chave[i]))
arq.close()
```


## Instalação do Perf e do Valgrind

`Install Valgrind`
    
    sudo apt-get install valgrind


`Install Perf`
    
    sudo apt-get update

    sudo apt-get install linux-tools-5.0.0-32-generic
    
    or
    
    sudo apt-get install linux-tools-common linux-tools-generic linux-tools-`uname -r`

