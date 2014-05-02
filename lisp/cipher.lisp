;;;Caesar Cipher - Lisp
;;;Author: John Paul Welsh

(defparameter *input* "ABCDEFGHIJKLMNOPQRSTUVWXYZ") ;input string
(defparameter *crypt-shift* 1) ;shift amount for encrypt and decrypt
(defparameter *solve-shift* 26) ;max shift amount for solve

;;Shifts the ASCII value, checks whether it exceeds any bounds,
;;keeps it the same if not
;;Used by encrypt
(defun shift (n)
		(if (= n 32) ;if it's a space...
        (+ n 0) ;don't change it, just return
      (if (< (+ n *crypt-shift*) 65) ;if it's below A...
      		(- 91 (mod 65 (+ n *crypt-shift*))) ;wrap it around to Z and descend
        (if (> (+ n *crypt-shift*) 90) ;if it's above Z...
            (+ 64 (mod (+ n *crypt-shift*) 90)) ;wrap it around to A and ascend
          (+ n *crypt-shift*) ;otherwise, just add the shift and return
        )
      )
    )
)

;;Same as shift function, but subtracts the shift amount instead
;;Used by decrypt
(defun neg-shift (n)
    (if (= n 32)
        (+ n 0)
      (if (< (- n *crypt-shift*) 65)
          (- 91 (mod 65 (- n *crypt-shift*)))
        (if (> (- n *crypt-shift*) 90)
            (+ 64 (mod (- n *crypt-shift*) 90))
          (- n *crypt-shift*)
        )
      )
    )
)

;;Converts a string into a list of characters
;;Stolen from
;;http://stackoverflow.com/questions/5706803
;;  /split-string-into-individual-characters
(defun explode (input)
	(coerce input 'list)
)

;;Converts a list of characters into a string
(defun implode (input)
	(coerce input 'string)
)

;;Converts a list of characters to ASCII codes
;;Stolen from
;;http://stackoverflow.com/questions/5706803
;;  /split-string-into-individual-characters
(defun char-to-int (input)
	(map 'list #'char-code input)
)

;;Converts a list of ASCII codes to characters
(defun int-to-char (input)
	(map 'list #'code-char input)
)

;;Explodes the input string, maps char-to-int to that,
;;  maps shift to that, maps shift-bounds to that, maps
;;  int-to-char to that, and implodes that
(defun en-crypt (input-string)
  	(implode
        (int-to-char
            (map 'list #'shift
                (char-to-int
                    (explode input-string)
                )
            )
        )
    )
)

;;Calls encrypt, but with the negative shift amount
(defun de-crypt (input-string)
    (implode
        (int-to-char
            (map 'list #'neg-shift
                (char-to-int
                    (explode input-string)
                )
            )
        )
    )
)

;;Solves a string for every shift value between solve-shift and 0
;(defun solve (input-string)   
    ;map decrypt across the input string, print it, and call
    ;solve again with (- solve-shift 1)
;)

(print (en-crypt *input*))
(print (de-crypt *input*))
(solve *input*)