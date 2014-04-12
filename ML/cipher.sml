val inputList = explode "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
val shiftAmt = 10;

fun charToInt(ch) = ord(ch);

fun intToChar(num) = chr(num);

fun isSpace(num) = (num = 32);

fun shift(num, amt) =
	if isSpace(num) then num
	else if ((num + amt) < 65) then (91 - (num mod 65))
	else if ((num + amt) > 90) then (64 + (90 mod num))
	else num + amt;

fun map(f, ls) =
	if null(ls) then nil
	else f(hd ls) :: map(f, tl(ls));

fun mapShift(amt, ls) =
	if null(ls) then nil
	else shift(hd(ls), amt) :: mapShift(amt, tl(ls));

(****Done definitions****)

(*Turn all the chars into ints, shift them, and turn them back
to an imploded list of chars.*)
fun encrypt(ls) = implode(map(intToChar, mapShift(shiftAmt, map(charToInt, ls))));

fun decrypt(ls) = implode(map(intToChar, mapShift(~shiftAmt, map(charToInt, ls))));

encrypt(inputList);
decrypt(inputList);