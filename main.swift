print("Ingresa un número entero:")

if let entrada = readLine(), let numero = Int(entrada) {
    if numero % 2 == 0 {
        print("\(numero) es par.")
    } else {
        print("\(numero) es impar.")
    }
} else {
    print("Entrada no válida. Escribe un número entero.")
}
