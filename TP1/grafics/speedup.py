from matplotlib import pyplot as plt
computers = ["CompA", "CompB","CompRef"]
values = [140.9, 128.8, 29.29]
# barras possuem o tamanho padrão de 0.8, então adicionaremos 0.1 às
# coordenadas à esquerda para que cada barra seja centralizada
xs = [i + 0.1 for i, _ in enumerate(computers)]
# as barras do gráfico com as coordenadas x à esquerda [xs], alturas [values]
plt.bar(xs, values)
plt.ylabel("# Tempo de Resposta")
plt.title("Computador x Tempo de Resposta")
# nomeia o eixo x
plt.xticks([i + 0.5 for i, _ in enumerate(computers)], computers)
plt.show()

#mflops 