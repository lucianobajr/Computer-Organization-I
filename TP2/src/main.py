import sys
import json

# ----------------------JSONS--------------------------

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

# ----------------------JSONS--------------------------


# --------------------FUNCTIONS----------------------

'''
    Adiciona 0's até o comando possuir o
    seu devido número de bits.Extensão de sinal
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
    # apatir da 2 posição do string -> retirando 0b
    return str(bin(registers[register]))[2:]

# ------FUNCTIONS NUMERICAL BASES------


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
# ------FUNCTIONS NUMERICAL BASES------


''' Torna código assembly em binário'''


def assembler(file_line):
    # lê a linha até o  primeiro espaço
    command = file_line[: file_line.find(" ")]
    regs = file_line[file_line.find(" "):].split(",")
    for i in range(len(regs)):
        # retira o espaço e o '\n' de cada registrador
        regs[i] = regs[i].strip()

    binary_result = ""

    if instructions[command]['type'] == 'r':
        f7 = instructions[command]['funct7']
        rs2 = change_reg_to_bin(regs[2])  # terceiro reg
        rs1 = change_reg_to_bin(regs[1])  # segundo reg
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
        immediate = regs[2]  # valor imediato

        # Garante o suporte a outras bases numéricas
        if(immediate[0] is '0' and immediate[1] is 'b'):
            immediate = str(int(immediate, 2))
        elif (immediate[0] is '0' and immediate[1] is 'o'):
            immediate = str(int(immediate, 8))
        elif (immediate[0] is '0' and immediate[1] is 'x'):
            immediate = str(int(immediate, 16))


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

# --------------------FUNCTIONS----------------------

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
