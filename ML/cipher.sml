val inputList = explode "JOHN PAUL WELSH";
val shiftAmt = 5;

fun shift (num, amt) = num + amt;
fun map (f, ls) = if null(ls) then nil else f(hd ls) :: map(f, tl(ls));