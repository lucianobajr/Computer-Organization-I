from matplotlib import pyplot as plt
computers = ["2-ULA", "4-ULA", "8-ULA","16-ULA","2-UPF", "4-UPF", "8-UPF","16-UPF"]
values = [1.96, 0.98, 0.49,0.245,12.65,6.325,3.1625,1.58125]
# barras possuem o tamanho padrão de 0.8, então adicionaremos 0.1 às
# coordenadas à esquerda para que cada barra seja centralizada
xs = [i + 0.1 for i, _ in enumerate(computers)]
# as barras do gráfico com as coordenadas x à esquerda [xs], alturas [values]
plt.bar(xs, values)
plt.ylabel("#  Tempo de Resposta")
plt.title("Tempo de resposta para Diferentes quantidades de ULAs e UPFs")
# nomeia o eixo x
plt.xticks([i + 0.5 for i, _ in enumerate(computers)], computers)
plt.show()

#mflops