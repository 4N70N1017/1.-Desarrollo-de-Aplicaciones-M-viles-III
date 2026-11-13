import Foundation

struct Articulo {
    let nombre: String
    let cantidad: Int
}

var inventario: [Articulo] = []

func leerTexto(_ mensaje: String) -> String? {
    while true {
        print(mensaje)

        guard let entrada = readLine() else {
            return nil
        }

        let texto = entrada.trimmingCharacters(in: .whitespacesAndNewlines)

        if !texto.isEmpty {
            return texto
        }

        print("El campo no puede estar vacío.")
    }
}

func leerNumero(_ mensaje: String, minimo: Int) -> Int? {
    while true {
        guard let texto = leerTexto(mensaje) else {
            return nil
        }

        if let numero = Int(texto), numero >= minimo {
            return numero
        }

        print("Ingresa un número entero mayor o igual a \(minimo).")
    }
}

func mostrarArticulos(_ articulos: [Articulo]) {
    if articulos.isEmpty {
        print("No hay artículos para mostrar.")
    } else {
        for (indice, articulo) in articulos.enumerated() {
            print("Artículo \(indice + 1): \(articulo.nombre)")
            print("Cantidad: \(articulo.cantidad)")
        }
    }
}

var ejecutando = true

while ejecutando {
    print("""

    MENÚ
    1. Registrar artículos
    2. Ver lista de artículos
    3. Consultar artículos en existencia
    4. Salir
    """)

    guard let opcion = leerTexto("Elige una opción:") else {
        break
    }

    switch opcion {
    case "1":
        guard let total = leerNumero(
            "¿Cuántos artículos deseas registrar?",
            minimo: 1
        ) else {
            ejecutando = false
            break
        }

        for indice in 1...total {
            print("\nRegistro del artículo \(indice)")

            guard let nombre = leerTexto("Ingresa el nombre:"),
                  let cantidad = leerNumero("Ingresa la cantidad:", minimo: 0) else {
                ejecutando = false
                break
            }

            inventario.append(Articulo(nombre: nombre, cantidad: cantidad))
            print("Artículo registrado.")
        }

        if ejecutando {
            print("Presiona Enter para regresar al menú.")
            if readLine() == nil {
                ejecutando = false
            }
        }

    case "2":
        print("\nLISTA DE ARTÍCULOS")
        mostrarArticulos(inventario)

    case "3":
        print("\nARTÍCULOS EN EXISTENCIA")
        let disponibles = inventario.filter { $0.cantidad > 0 }
        mostrarArticulos(disponibles)

    case "4":
        print("Saliendo del programa.")
        ejecutando = false

    default:
        print("Opción no válida. Elige un número del 1 al 4.")
    }
}
