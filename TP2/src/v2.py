import sys

r_type = {}
r_type["add"] = {}
r_type["add"]["opcode"] = "0110011"
r_type["add"]["funct3"] = "000"
r_type["add"]["funct7"] = "0000000"

r_type["sub"] = {}
r_type["sub"]["opcode"] = "0110011"
r_type["sub"]["funct3"] = "000"
r_type["sub"]["funct7"] = "0100000"

r_type["and"] = {}
r_type["and"]["opcode"] = "0110011"
r_type["and"]["funct3"] = "111"
r_type["and"]["funct7"] = "0000000"

r_type["or"] = {}
r_type["or"]["opcode"] = "0110011"
r_type["or"]["funct3"] = "110"
r_type["or"]["funct7"] = "0000000"

r_type["xor"] = {}
r_type["xor"]["opcode"] = "0110011"
r_type["xor"]["funct3"] = "100"
r_type["xor"]["funct7"] = "0000000"

r_type["sll"] = {}
r_type["sll"]["opcode"] = "0110011"
r_type["sll"]["funct3"] = "001"
r_type["sll"]["funct7"] = "0000000"

r_type["srl"] = {}
r_type["srl"]["opcode"] = "0110011"
r_type["srl"]["funct3"] = "101"
r_type["srl"]["funct7"] = "0000000"

i_type = {}
i_type["addi"] = {}
i_type["addi"]["opcode"] = "0010011"
i_type["addi"]["funct3"] = "000"

i_type["andi"] = {}
i_type["andi"]["opcode"] = "0010011"
i_type["andi"]["funct3"] = "111"

i_type["ori"] = {}
i_type["ori"]["opcode"] = "0010011"
i_type["ori"]["funct3"] = "110"


registers = {}

registers["x0"] = 0
registers["x1"] = 1
registers["x2"] = 2
registers["x3"] = 3
registers["x4"] = 4
registers["x5"] = 5
registers["x6"] = 6
registers["x7"] = 7
registers["x8"] = 8
registers["x9"] = 9
registers["x10"] = 10
registers["x11"] = 11
registers["x12"] = 12
registers["x13"] = 13
registers["x14"] = 14
registers["x15"] = 15
registers["x16"] = 16
registers["x17"] = 17
registers["x18"] = 18
registers["x19"] = 19
registers["x20"] = 20
registers["x21"] = 21
registers["x22"] = 22
registers["x23"] = 23
registers["x24"] = 24
registers["x25"] = 25
registers["x26"] = 26
registers["x27"] = 27
registers["x28"] = 28
registers["x29"] = 29
registers["x30"] = 30
registers["x31"] = 31

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

    if command in r_type:
        f7 = r_type[command]["funct7"]
        rs2 = change_reg_to_bin(regs[2]) # terceiro reg
        rs1 = change_reg_to_bin(regs[1]) # segundo reg
        rd = change_reg_to_bin(regs[0])  # primeiro reg
        f3 = r_type[command]["funct3"]
        opcode = r_type[command]["opcode"]

        rs2 = add_zero(rs2, 5)
        rs1 = add_zero(rs1, 5)
        rd = add_zero(rd, 5)

        machine_code = f7 + rs2 + rs1 + f3 + rd + opcode


    elif command in i_type:
        immd = regs[2] # valor imediato
        ''' 
        - & = and bit a bit 
        - reseta um ou mais bits sem afetar o estado dos demais 
        - operação i -> complemento de dois 
        '''
        immd = (bin(int(immd) & 0b111111111111))
        immd = immd.replace("0b", "") # retira valores da transformação para binário
        
        rs1 = change_reg_to_bin(regs[1])
        f3 = i_type[command]["funct3"]
        rd = change_reg_to_bin(regs[0])
        opcode = i_type[command]["opcode"]

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