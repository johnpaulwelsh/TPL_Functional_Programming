% Caesar Cipher - Erlang
% Author: John Paul Welsh
-module(cipher).
-export([shift/2]).
-export([encrypt/2]).
-export([decrypt/2]).
-export([solve/2]).
-export([display/0]).

% Shifts a number, with bounds-checking, and ignoring spaces.
shift(Num, Amt) ->
	Temp = Num+Amt,
	if
		Num =:= 32 -> Num;
		Temp < 65 -> (91 - (65 rem Temp));
		Temp > 90 -> (64 + (Temp rem 90));
		true -> Temp
	end.

% Shifts the head of the current input, puts that in a list, and
% concatenates that list with another one containing a recursive
% call to the function.
encrypt(Input, Amt) ->
	if
		length(Input) < 1 -> [];
		true -> ([shift(hd(Input), Amt)] ++ [encrypt(tl(Input), Amt)])
	end.

% Encrypts with a negative number.
decrypt(Input, Amt) ->
	encrypt(Input, -Amt).

% Prints the decryption of the current amount, then recursively
% calls the function with one smaller shift amount, down to 0.
solve(Input, Max) ->
	if
		Max < 0 -> [];
		true -> io:format("Solve ~w: ~s~n", [Max, decrypt(Input, Max)]),
			solve(Input, Max-1)
	end.

% Prints everything to the screen: basically a 'main' function.
display() ->
	InputString = "JOHN PAUL WELSH",
	ShiftAmt = 18,
	MaxShift = 26,

	io:format("The input string is ~s~n", [InputString]),
	io:format("The shift amount for encrypt and decrypt is ~w~n", [ShiftAmt]),
	io:format("The maximum shift amount for solve is ~w~n", [MaxShift]),
	io:format("Encrypted: ~s~n", [encrypt(InputString, ShiftAmt)]),
	io:format("Decrypted: ~s~n", [decrypt(InputString, ShiftAmt)]),
	solve(InputString, MaxShift).