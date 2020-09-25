from matplotlib import pyplot as plt
computers = ["L1-CompA", "L1-CompB", "L1-CompRef","L2-CompA", "L2-CompB", "L2-CompRef","Prin-CompA", "Prin-CompB", "Prin-CompRef"]
values = [2.22, 1.08, 1.78,5.2, 2.71, 4.1,155.2, 128.3, 40.8]
# barras possuem o tamanho padrão de 0.8, então adicionaremos 0.1 às
# coordenadas à esquerda para que cada barra seja centralizada
xs = [i + 0.1 for i, _ in enumerate(computers)]
# as barras do gráfico com as coordenadas x à esquerda [xs], alturas [values]
plt.bar(xs, values)
plt.ylabel("# nano segundos")
plt.title("Latência x Tipo de memória")
# nomeia o eixo x
plt.xticks([i + 0.5 for i, _ in enumerate(computers)], computers)
plt.show()