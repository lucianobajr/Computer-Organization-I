import random
from random import seed
seed(100)
t=int(input("Digite a quantidade de itens no arquivo:"))
arq=open("../src/data/%d.txt"%t,"w")
chave=[random.randint(0,100)for i in range(t)]
for i in range(t):
    arq.write("%d, "%(chave[i]))
arq.close()