import sys
import json

with open('data/instructions.json', 'r') as json_file:
    instructions = json.load(json_file)

with open('data/registers.json', 'r') as json_file:
    registers = json.load(json_file)    

'''
    Adiciona 0's até o comando possuir o 
    seu devido número de bits
 '''
def add_zero(binStr, size):  
    while len(binStr) < size:
        binStr = "0" + binStr
    return binStr

'''
    transforma o valor correspondente do 
    registrador em decimal para binário
 '''
def change_reg_to_bin(register):
    return str(bin(registers[register]))[2:]  # apatir da 2 posição do string

''' Torna código assembly em binário'''

def assembler(statement):
    command = statement[: statement.find(" ")]  # até o espaço
    regs = statement[statement.find(" "):].split(",")
    for i in range(len(regs)):
        regs[i] = regs[i].strip() # retira o espaço e o '\n' de cada registrador

    machine_code = ""

    if instructions[command]['type'] == 'r':
        f7 = instructions[command]['funct7']
        rs2 = change_reg_to_bin(regs[2]) # terceiro reg
        rs1 = change_reg_to_bin(regs[1]) # segundo reg
        rd = change_reg_to_bin(regs[0])  # primeiro reg
        f3 = instructions[command]['funct3']
        opcode = instructions[command]["opcode"]

        rs2 = add_zero(rs2, 5)
        rs1 = add_zero(rs1, 5)
        rd = add_zero(rd, 5)

        machine_code = f7 + rs2 + rs1 + f3 + rd + opcode


    elif instructions[command]['type'] == 'i':
        immd = regs[2] # valor imediato
        ''' 
        - & = and bit a bit 
        - reseta um ou mais bits sem afetar o estado dos demais 
        - operação i -> complemento de dois 
        '''
        immd = (bin(int(immd) & 0b111111111111))
        immd = immd.replace("0b", "") # retira valores da transformação para binário
        
        rs1 = change_reg_to_bin(regs[1])
        f3 = instructions[command]["funct3"]
        rd = change_reg_to_bin(regs[0])
        opcode = instructions[command]["opcode"]

        immd = add_zero(immd, 12)
        rs1 = add_zero(rs1, 5)
        rd = add_zero(rd, 5)

        machine_code = immd + rs1 + f3 + rd + opcode

    return machine_code

if __name__ == "__main__":
    with open(str(sys.argv[2]), "r") as f: #valor de input do
        arq = open(str(sys.argv[3]), "w")
        while True:
            statement = f.readline()
            if not statement:
                break
            arq.write(assembler(statement)+'\n')
            print(assembler(statement))