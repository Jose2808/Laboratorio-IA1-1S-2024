import os


def main() -> None:
    grafo = {
                'a': [('p',4),('j',15),('b',1)],
                'b': [('a',1),('d',2),('e',2),('c',3)],
                'j': [('a',15)],
                'p': [('a',4)],
                'd': [('b',2),('g',3)],
                'e': [('b',2),('g',4),('f',5),('c',2)],
                'c': [('b',3),('e',2),('f',5),('i',20)],
                'g': [('d',3),('e',4),('f',10),('h',1)],
                'f': [('g',10),('e',5),('c',5)],
                'i': [('c',20)],
                'h': [('g',1)],
    }

    print("Mostrar el grafo antes del recorrido: \n")
    for key, lista in grafo.items():
        print(key)
        print(lista)

    print()
    os.system("pause")

    visitados = []
    cola = []

    origen = input("Ingrese el nodo origen: ")
    destino = input("Ingresa el nodo destino: ")
    print("\nLista de recorrido por anchura\n:")

    cola.append(origen)
    bandera = True

    while bandera:
        actual = cola.pop(0)
        if actual == destino:
            print(actual)
            bandera = False

        else:
            if actual not in visitados:
                print("Vertice actual -> ", actual)
                visitados.append(actual)

            contador = 1
            menor = 10000

            for key, lista in grafo[actual]:
                if key != destino:
                    if key not in visitados:
                        if lista < menor:
                            menor = lista
                            arista = key
                    contador = contador + 1

                else:
                    arista = key

            cola.append(arista)

    print()
    os.system("pause")

if __name__ == '__main__':
    main()