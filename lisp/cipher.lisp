;;;Caesar Cipher - Lisp
;;;Author: John Paul Welsh

(defparameter *input* "ABCDEFGHIJKLMNOPQRSTUVWXYZ") ;input string
(defparameter *crypt-shift* 1) ;shift amount for encrypt and decrypt
(defparameter *solve-shift* 15) ;max shift amount for solve

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

;;Same as shift function, but subtracts the solve shift amount instead
;;Used by solve
(defun solves-shift (n)
    (if (= n 32)
        (+ n 0)
      (if (< (- n *solve-shift*) 65)
          (- 91 (mod 65 (- n *solve-shift*)))
        (if (> (- n *solve-shift*) 90)
            (+ 64 (mod (- n *solve-shift*) 90))
          (- n *solve-shift*)
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
(defun solve (input-string)
    (if (>= *solve-shift* 0)
        (inside-solve input-string)
    )
)

;;Lumps together all the printing statements for solve, since otherwise
;;  it yelled at me for not using a lambda function
;;Used by solve
(defun inside-solve (input-string)
    (print "Solve ")
    (prin1 *solve-shift*)
    (prin1 ": ")
    (prin1 (do-solve input-string))
    (decf *solve-shift*)
    (solve input-string)
)

;;The same as dec-shift, but uses *solve-shift* instead of *crypt-shift*
;;Used by inside-solve
(defun do-solve (input-string)
    (implode
        (int-to-char
            (map 'list #'solves-shift
                (char-to-int
                    (explode input-string)
                )
            )
        )
    )
)

;;;-------------------------------------------------

(print "The input string is ")
(prin1 *input*)
(print "The shift amount for encrypt and decrypt is ")
(prin1 *crypt-shift*)
(print "The maximum shift value for solve is ")
(prin1 *solve-shift*)

(print "Encrypted: ")
(prin1 (en-crypt *input*))
(print "Decrypted: ")
(prin1 (de-crypt *input*))
(solve *input*)