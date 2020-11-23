# Caminho de Dados - Datapath - RISC-V
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT) 


### A  estruturação do projeto segue o esquema a seguir:

    ├── src                       # Source
    │   ├── alu_control.v 
    │   ├── alu.v              
    │   ├── control.v                 
    │   ├── data_memory.v
    │   ├── datapath_tb.v         # Arquivo de testbench do datapath
    │   ├── imm_gen.v    
    │   ├── inst_memory.v       
    │   ├── instrucoes.bin        # Arquivo com as instruções em binário 
    │   ├── main.v                # Arquivo principal do datapath
    │   ├── makefile              # Build Scripts
    │   ├── mux.v  
    │   ├── pc.v  
    │   ├── reg_file.v  
    │   ├── shift_left.v  
    │   



## Compilar testbench do datapath
```sh
$   make
```


## Executar testbench 
```sh   
$   make run
```



## Executar Formato de onda (.vcd) 
```sh   
$   make gtk
```


### Para a leitura das instruções é necessário a mudança do parametro 'WIDTH', além disso, é no arquivo 'instrucoes.bin' que estão as instruções para execução em binário:

```v
module InstructionMemory(endereco, instrucaoOut);
     
     input [31:0] endereco;
     
     output [31:0] instrucaoOut;
     
     parameter WIDTH = 4;
     
     reg [31:0] RAM [0:WIDTH-1];
     
     initial
        begin
           $readmemb("instrucoes.bin", (RAM));  
        end 
     
     assign instrucaoOut = RAM[endereco/4];

endmodule
```
