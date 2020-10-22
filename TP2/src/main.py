import sys
import json

#----------------------JSONS--------------------------

'''
    lê o json com as instruções do risc-v
'''
with open('data/instructions.json', 'r') as json_file:
    instructions = json.load(json_file)

'''
    lê o json com os registradores do risc-v
'''
with open('data/registers.json', 'r') as json_file:
    registers = json.load(json_file)    

'''
    lê o json com as pseudo-instruções do risc-v
'''   
with open('data/pseudo.json', 'r') as json_file:
    pseudo = json.load(json_file)
#----------------------JSONS--------------------------


#--------------------FUNCTIONS----------------------

'''
    Adiciona 0's até o comando possuir o 
    seu devido número de bits
'''
def add_zero(binary, number_command_bits):
    while len(binary) < number_command_bits:
        binary = "0" + binary
    return binary


'''
    transforma o valor correspondente do 
    registrador em decimal para binário
'''
def change_reg_to_bin(register):
    return str(bin(registers[register]))[2:]  # apatir da 2 posição do string -> retirando 0b

#------FUNCTIONS NUMERICAL BASES------
def IsNumericBase(s, base):
    try:
        v = int(s, base)

        if(v):
            return True
        else:
            return False

    except ValueError:
        return False

def IsBinaryString(s):
    return IsNumericBase(s, 2)

def IsOctalString(s):
    return IsNumericBase(s, 8)

def IsHexadecimalString(s):
    return IsNumericBase(s, 16)
#------FUNCTIONS NUMERICAL BASES------


''' Torna código assembly em binário'''
def assembler(file_line):
    command = file_line[: file_line.find(" ")]  #lê a linha até o  primeiro espaço
    regs = file_line[file_line.find(" "):].split(",")
    for i in range(len(regs)):
        regs[i] = regs[i].strip() # retira o espaço e o '\n' de cada registrador

    binary_result = ""

    if instructions[command]['type'] == 'r':
        f7 = instructions[command]['funct7']
        rs2 = change_reg_to_bin(regs[2]) # terceiro reg
        rs1 = change_reg_to_bin(regs[1]) # segundo reg
        rd = change_reg_to_bin(regs[0])  # primeiro reg
        f3 = instructions[command]['funct3']
        opcode = instructions[command]['opcode']

        ''' 
            rs2,rs1 e rd podem ainda não estar com o 
                tamanho correto de bits 
        '''

        rs2 = add_zero(rs2, 5)
        rs1 = add_zero(rs1, 5)
        rd = add_zero(rd, 5)

        binary_result = f7 + rs2 + rs1 + f3 + rd + opcode

    elif instructions[command]['type'] == 'i':
        immediate = regs[2] # valor imediato
        
        # Garante o suporte a outras bases numéricas
        if(IsBinaryString(immediate)):
            immediate = str(int(immediate,2))
        elif (IsOctalString(immediate)):
            immediate = str(int(immediate,8))
        elif (IsHexadecimalString(immediate)):
            immediate = str(int(immediate,16))

        ''' 
        - & = and bit a bit 
        - reseta um ou mais bits sem afetar o estado dos demais 
        - operação & -> complemento de dois 
        '''
        immediate = (bin(int(immediate) & 0b111111111111))
        immediate = immediate.replace('0b', "") # retira valores da transformação para binário
        
        rs1 = change_reg_to_bin(regs[1])
        f3 = instructions[command]['funct3']
        rd = change_reg_to_bin(regs[0])
        opcode = instructions[command]['opcode']

        immediate = add_zero(immediate, 12)
        rs1 = add_zero(rs1, 5)
        rd = add_zero(rd, 5)

        binary_result = immediate + rs1 + f3 + rd + opcode


    return binary_result

def print_output():
    print('\n')
    print('-----------  OUTPUT  -----------')
    print('\n')

#--------------------FUNCTIONS----------------------

if __name__ == "__main__":
    with open(str(sys.argv[2]), 'r') as file_input: # arquivo de input
        output = open(str(sys.argv[3]), 'w')   # arquivo de output
        print_output()
        while True:
            file_line = file_input.readline()
            if not file_line:
                print_output()
                break
            output.write(assembler(file_line)+'\n')
            print(assembler(file_line))
