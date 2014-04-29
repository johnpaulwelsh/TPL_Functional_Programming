InputString = "JOHN PAUL WELSH".
ShiftAmt = 3.
MaxShift = 26.
    
shift({Num, ShiftAmt}) ->
    Num + ShiftAmt.

mapShift({InputList, ShiftAmt}) ->
    [shift({ShiftAmt, Num}) || Num <- InputList].