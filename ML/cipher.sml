(*Caesar Cipher - Standard ML*)
(*Author: John Paul Welsh*)

val inputList = explode "JOHN PAUL WELSH";
val shiftAmt = 3 mod 26;
val maxShift = 20;

fun charToInt(ch) = ord(ch);
fun intToChar(num) = chr(num);

fun lowerBoundChange(num) = 90 - (65 mod num);
fun upperBoundChange(num) = 65 + (num mod 90);

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

(*Turn all the chars into ints, shift them, and turn them back to an imploded
    list of chars.*)
fun encrypt(ls, amt) = implode(map(intToChar, mapShift(amt, map(charToInt, ls))));
fun decrypt(ls, amt) = encrypt(ls, ~amt);

(*Calls decrypt for every shift val between max and 0.*)
fun solve(amt, ls) =
    if amt < 0 then nil
    else (print(decrypt(ls, amt) ^ "\n"); solve(amt-1, ls));

print(encrypt(inputList, shiftAmt));
print(decrypt(inputList, shiftAmt));
solve(maxShift, inputList);