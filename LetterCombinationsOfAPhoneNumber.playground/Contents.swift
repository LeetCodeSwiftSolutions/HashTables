/* COMBINACIONES DE LETRAS DE UN NÚMERO TELEFÓNICO
Dada una cadena de dígitos del 2 al 9, devuelve todas las combinaciones posibles de letras según el mapeo telefónico tradicional (ej: 2→abc, 3→def, etc.). La longitud de entrada está entre 1 y 4 dígitos, y solo contiene números del 2 al 9.

Given a string of digits from 2 to 9, return all possible letter combinations based on traditional telephone keypad mapping (e.g., 2→abc, 3→def, etc.). The input length ranges from 1 to 4 digits and contains only numbers from 2 to 9. */

/// Solución original
import Foundation

func letterCombinations(_ digits: String) -> [String] {
    // Creamos un diccionario para almacenar las letras relacionadas a cada número
    var keyboard = [String : [String]]()
    // Agregamos las letras al diccionario
    keyboard["2"] = ["a", "b", "c"] // keyboard[2]![0] = "a"
    keyboard["3"] = ["d", "e", "f"] // keyboard[3]![1] = "e"
    keyboard["4"] = ["g", "h", "i"] // keyboard[4]![2] = "i"
    keyboard["5"] = ["j", "k", "l"]
    keyboard["6"] = ["m", "n", "o"]
    keyboard["7"] = ["p", "q", "r", "s"]
    keyboard["8"] = ["t", "u", "v"]
    keyboard["9"] = ["w", "x", "y", "z"]
    
    // Si digits solo incluye un dígito, retornamos el valor del diccionario correspondiente
    guard digits.count > 1 else { return keyboard[digits] ?? [] }
    
    // Creamos variables para los índices de digits
    let indexA = digits.startIndex
    let indexB = digits.index(after: indexA)
    let firstLetters = keyboard[String(digits[indexA])]!
    let secondLetters = keyboard[String(digits[indexB])]!
    
    // Variable para almacenar los resultados y movernos a través del arreglo
    var result = [String]()
    
    // Comenzamos con los ciclos anidados
    for i in 0..<firstLetters.count {
        for j in 0..<secondLetters.count {
            if digits.count == 2 {
                result.append(firstLetters[i] + secondLetters[j])
            }
            if digits.count > 2 {
                let indexC = digits.index(after: indexB)
                let thirdLetters = keyboard[String(digits[indexC])]!
                for k in 0..<thirdLetters.count {
                    if digits.count == 3 {
                        result.append(firstLetters[i] + secondLetters[j] + thirdLetters[k])
                    }
                    if digits.count > 3 {
                        let indexD = digits.index(after: indexC)
                        let fourthLetters = keyboard[String(digits[indexD])]!
                        for l in 0..<fourthLetters.count {
                            result.append(firstLetters[i] + secondLetters[j] + thirdLetters[k] + fourthLetters[l])
                        }
                    }
                }
            }
        }
    }
    return result
}

/// Pruebas
print(letterCombinations("7294"))
