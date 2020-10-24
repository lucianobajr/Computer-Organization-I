<h1>Montador RISC-V</h1>  

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT) 


<code><h1 align="center">Instalação</h1></code>

### Atualizar o sistema com o apt

 
    $  sudo apt update
    $  sudo apt -y upgrade


### Para gerenciar pacotes de software para Python, vamos instalar o pip , uma ferramenta que irá instalar e gerenciar pacotes de programação que podemos querer usar em nossos projetos de desenvolvimento

    $   sudo apt install -y python3-pip


### Existem mais alguns pacotes e ferramentas de desenvolvimento para instalar para garantir que tenhamos uma configuração robusta para nosso ambiente de programação:

    $   sudo apt install -y build-essential libssl-dev libffi-dev python3-dev

### Instalação do Pacote JSON


    $   pip install json

<code><h1 align="center">Execução</h1></code>

### Os códigos do trabalho estão localizados no diretório 'src', além disso possui um makefile para compilação, sendo necessário apenas a execução do comando a seguir:

    $  make

<code><h1 align="center">Makefile</h1></code>

### O makefile da aplicação possui os campos 'input' com o arquivo de entrada para teste em assembly, 'output' arquivo de saída em binário e 'assembler' com o arquivo principal do programa  

    INPUT=./tests/input.asm
    OUTPUT=./tests/output

    # assembler
    ASSEMBLER = main.py

    all:
        python3 $(ASSEMBLER) -o $(INPUT) $(OUTPUT)

    clear:
        rm $(OUTPUT)

<code ><h1 align="center">Estrutura de Projeto</h1></code>

### A  estruturação do projeto segue o esquema a seguir:

    ├── src                       # Source
    │   ├── makefile              # Build Scripts
    │   ├── data                  # Source with jsons
    |   |    ├──instructions.json                
    │   ├── tests                 # Source with assymbly examples and binary outputs
    │   |    ├── input.asm
    |   |    ├── output    
    │   ├── main.py               # Aplication code
    |

<code><h1 align="center">Exemplo</h1></code>

### Utilizando alguns dos exemplos vistos durante as aulas, podemos perceber que o trabalho prático atingiu os objetivos esperados, assim como mostrado a seguir:
    
    input.asm

        add x2, x0, x1
        sll x1, x2, x2
        or x2, x2, x1
        andi x2, x1, 16
        addi x3, x2, -243 

    output

        00000000000100000000000100110011
        00000000001000010001000010110011
        00000000000100010110000100110011
        00000001000000001111000100010011
        11110000110100010000000110010011


 