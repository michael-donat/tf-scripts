;/addworld -T'lp' local localhost 1234
/addworld -T'lp' arkadia arkadia.rpg.pl 23

/cd src

/isize 1

/require alias.tf
/require spedwalk.tf
/require kbbind.tf
/require map.tf
/require textutil.tf
/require lisp.tf
/require complete.tf
/require relog.tf
/require kbstack.tf
/require at.tf


;-----------------------------------------------
;           MAC NUM PAD
;-----------------------------------------------
/def key_nkp0 = /_bind_kb_key_nkp0
/def key_nkp. = /_bind_kb_key_nkpDot
/def key_nkpEnt = /_bind_kb_key_nkpEnt
/def key_nkp+ = /_bind_kb_key_nkpPlus
/def key_nkp- = /_bind_kb_key_nkpMinus

/def key_nkp1 = /_bind_kb_key_nkp1
/def key_nkp2 = /_bind_kb_key_nkp2
/def key_nkp3 = /_bind_kb_key_nkp3
/def key_nkp4 = /_bind_kb_key_nkp4
/def key_nkp5 = /_bind_kb_key_nkp5
/def key_nkp6 = /_bind_kb_key_nkp6

/def key_nkp7 = /_bind_kb_key_nkp7
/def key_nkp8 = /_bind_kb_key_nkp8
/def key_nkp9 = /_bind_kb_key_nkp9

/def key_nkp/ = /_bind_kb_key_nkpDivide

/def key_nkp* = /_bind_kb_key_nkpTimes

/~keyseq nkpEq		^[OX

/def key_nkpEq = /_bind_kb_key_nkpEquals

;above caters for small + key

/load includes.tf

/def reload = /purge * %; /cd .. %; /load init.tf
