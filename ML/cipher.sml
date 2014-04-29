(* Caesar Cipher - Standard ML *)
(* Author: John Paul Welsh *)

val inputList = explode "JOHN PAUL WELSH";
val shiftAmt = 13;
val maxShift = 26;

fun charToInt(ch) = ord(ch);
fun intToChar(num) = chr(num);

fun lowerBoundChange(num) = 91 - (65 mod num);
fun upperBoundChange(num) = 64 + (num mod 90);

fun checkShift(num) =
    if (num < 65) then lowerBoundChange(num)
    else if (num > 90) then upperBoundChange(num)
    else num;

fun shift(num, amt) =
    if (num = 32) then num
    else checkShift(num + amt);

fun map(f, ls) =
    if null(ls) then nil
    else f(hd ls) :: map(f, tl(ls));

fun mapShift(amt, ls) =
    if null(ls) then nil
    else shift(hd(ls), amt) :: mapShift(amt, tl(ls));

(* Turn all the chars into ints, shift them, and turn them back to an
    imploded list of chars *)
fun encrypt(ls, amt) =
    implode(map(intToChar,mapShift(amt, map(charToInt, ls))));

fun decrypt(ls, amt) = encrypt(ls, ~amt);

(* Calls decrypt for every shift val between maxShift and 0 *)
fun solve(amt, ls) =
    if amt < 0 then nil
    else (print("Solve " ^ Int.toString(amt) ^ ": " ^
        decrypt(ls, amt mod 26) ^ "\n"); solve(amt-1, ls));

print("The input string is : " ^ implode(inputList) ^ "  ");
print("The shift amount for encrypt and decrypt is : " ^ Int.toString(shiftAmt) ^ "  ");
print("The max shift amount for solve is : " ^ Int.toString(maxShift) ^ "  ");
print("Encrypted: " ^ encrypt(inputList, shiftAmt mod 26) ^ "  ");
print("Decrypted: " ^ decrypt(inputList, shiftAmt mod 26) ^ "  ");
solve(maxShift, inputList);