// Caesar Cipher - Scala (functional)
// Author: John Paul Welsh
object Cipher {
    
  def encrypt(input: List[Char], shiftAmt: Int): List[Char] = {
            
    def shiftWithBounds(num: Int, amt: Int): Int = {
    val temp = num + amt
    if (num == 32)      num
    else if (temp < 65) 91 - (65 % temp)
    else if (temp > 90) 64 + (temp % 90)
    else                temp
    }

    val inputInts = input.map(c => c.asInstanceOf[Int])
    val shiftedInts = inputInts.map(n => shiftWithBounds(n, shiftAmt))
    val backToChar = shiftedInts.map(n => n.asInstanceOf[Char])

    backToChar
  }

  def decrypt(input: List[Char], shiftAmt: Int): List[Char] =
    encrypt(input, -shiftAmt)

  def solve(input: List[Char], amt: Int): Unit = {
    if (amt >= 0) {
      println("Solve " + amt + ": " + decrypt(input, amt % 26).mkString)
      solve(input, amt - 1)
    }
  }

  def main(args: Array[String]) {
    val input = "John Paul Welsh".toUpperCase
    val shiftAmt = 15
    val maxShiftVal = 26

    println("The input string is " + input)
    println("The shift amount for encrypt and decrypt is " + shiftAmt)
    println("The maximum shift value for solve is " + maxShiftVal)
    println("Encrypted: " + encrypt(input.toList, shiftAmt % 26).mkString)
    println("Decrypted: " + decrypt(input.toList, shiftAmt % 26).mkString)
    solve(input.toList, maxShiftVal)
  }
}