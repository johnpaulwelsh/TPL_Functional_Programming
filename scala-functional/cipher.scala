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
        val inputStr = "John Paul Welsh".toUpperCase()
        val shiftAmt = 30
        val maxShiftVal = 15

        println("The input string is " + inputStr)
        println("The shift amount for encrypt and decrypt is " + shiftAmt)
        println("The maximum shift value for solve is " + maxShiftVal)
        println("Encrypted: " + encrypt(inputStr, shiftAmt))
        println("Decrypted: " + decrypt(inputStr, shiftAmt))
        solve(inputStr, maxShiftVal)
    }
}