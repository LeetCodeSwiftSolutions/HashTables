/* CONVERTIR NÚMERO ENTERO A ROMANO.
Convierte un número entero (entre 1 y 3999) en un numeral romano utilizando las reglas de notación sustractiva (como IV, IX, XL, XC, CD, CM) y la adición de símbolos (I, V, X, L, C, D, M) sin repetir más de tres veces consecutivas los símbolos de potencia de 10.

Convert an integer (between 1 and 3999) to a Roman numeral using subtractive notation (like IV, IX, XL, XC, CD, CM) and symbol addition (I, V, X, L, C, D, M) without repeating power-of-ten symbols more than three consecutive times. */

/// Solución original
func intToRoman(_ num: Int) -> String {
    // Creamos un diccionario y guardamos todos los valores necesarios
    var romanD = [Int: String]()
    var num = num
    var result = ""
    
    // Valores para nùmeros entre 1 y 3
    romanD[1] = "I"
    romanD[2] = "II"
    romanD[3] = "III"
    romanD[10] = "X"
    romanD[20] = "XX"
    romanD[30] = "XXX"
    romanD[100] = "C"
    romanD[200] = "CC"
    romanD[300] = "CCC"
    romanD[1000] = "M"
    romanD[2000] = "MM"
    romanD[3000] = "MMM"
    // Valores para números 4 o 9
    romanD[4] = "IV"
    romanD[9] = "IX"
    romanD[40] = "XL"
    romanD[90] = "XC"
    romanD[400] = "CD"
    romanD[900] = "CM"
    // Valores para números 5
    romanD[5] = "V"
    romanD[50] = "L"
    romanD[500] = "D"
    // Valores para números entre 6 y 8
    romanD[6] = "VI"
    romanD[7] = "VII"
    romanD[8] = "VIII"
    romanD[60] = "LX"
    romanD[70] = "LXX"
    romanD[80] = "LXXX"
    romanD[600] = "DC"
    romanD[700] = "DCC"
    romanD[800] = "DCCC"
    
    // Iteramos sobre un arreglo de tuplas ordenadas, para restar el valor máximo posible (greedy), hasta llegar a cero
    for (key, value) in romanD.sorted(by: {$0.key > $1.key}) {
        if num >= key {
            num -= key
            result.append(value)
        }
    }
    return result
}


/// Pruebas
print(intToRoman(3872))



/* Versión optimizada (de la comunidad)
 func intToRoman(_ num: Int) -> String {
         var num = num
         let hash = [
             1 : "I",
             4 : "IV",
             5 : "V",
             9 : "IX",
             10 : "X",
             40 : "XL",
             50 : "L",
             90 : "XC",
             100 : "C",
             400 : "CD",
             500 : "D",
             900 : "CM",
             1000 : "M"
         ]

         var x = Array(hash.keys)
         x.sort(by: >)
         var i = 0
         var res: String = ""
         for i in 0..<x.count{
             while x[i] <= num{
                 res += hash[x[i]]!
                 num -= x[i]
             }
         }
         return res
     }
 */
