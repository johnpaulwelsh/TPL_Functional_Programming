// Caesar Cipher - Scala (functional)
// Author: John Paul Welsh
object Cipher {
    
    def encrypt(inputStr, maxShiftVal): String {
        return "null"
    }

    def decrypt(inputStr, shiftAmt): String {
        return "null"
    }

    def solve(inputStr, maxShiftVal): Unit {
        println("null")
    }

    def main(args: Array[String]) {
        val inputStr = "abcdefghijklmnopqrstuvwxyz".toUpperCase()
        val shiftAmt = 5
        val maxShiftVal = 26

        println("The input string is " + inputStr)
        println("The shift amount for encrypt and decrypt is " + shiftAmt)
        println("The maximum shift value for solve is " + maxShiftVal)
        println("Encrypted: " + encrypt(inputStr, shiftAmt))
        println("Decrypted: " + decrypt(inputStr, shiftAmt))
        solve(inputStr, maxShiftVal)
    }
}