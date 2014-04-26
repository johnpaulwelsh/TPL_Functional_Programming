InputList = string:to_upper("abcxyz").
ShiftAmt = 3.
MaxShift = 26.
    
shift({ShiftAmt, Num}) ->
    Num + ShiftAmt.

mapShift({ShiftAmt, InputList}) ->
    [shift({ShiftAmt, Num}) || Num <- InputList].