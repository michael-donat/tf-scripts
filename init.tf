/addworld -T'lp' arkadia arkadia.rpg.pl 23
/isize 2

/cd src

;-----------------------------------------------
;           MAC NUM PAD
;-----------------------------------------------

/def showme = /test $[fake_recv({*})]
/def testit = \
    /showme Agresywny goblin ledwo muska cie w noge.%;\
    /showme Agresywny goblin lekko rani cie w noge.%;\
    /showme Agresywny goblin rani cie w noge.%;\
    /showme Agresywny goblin powaznie rani cie w noge.%;\
    /showme Agresywny goblin bardzo ciezko rani cie w noge.%;\
    /showme Agresywny goblin masakruje cie w noge.%;\
    \
    /showme Varriz ledwo muska cie w noge.%;\
    /showme Varriz lekko rani cie w noge.%;\
    /showme Varriz rani cie w noge.%;\
    /showme Varriz powaznie rani cie w noge.%;\
    /showme Varriz bardzo ciezko rani cie w noge.%;\
    /showme Varriz masakruje cie w noge.%;\
    \
    /showme Agresywny tlusty goblin ledwo muska cie w noge.%;\
    /showme Agresywny tlusty goblin lekko rani cie w noge.%;\
    /showme Agresywny tlusty goblin rani cie w noge.%;\
    /showme Agresywny tlusty goblin powaznie rani cie w noge.%;\
    /showme Agresywny tlusty goblin bardzo ciezko rani cie w noge.%;\
    /showme Agresywny tlusty goblin masakruje cie w noge.
    

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

/def key_nkp= = /_bind_kb_key_nkpEquals
/def key_nkp/ = /_bind_kb_key_nkpDivide

/def key_nkp* = /_bind_kb_key_nkpMinus
;above caters for small + key

/load includes.tf

/def reload = /purge * %; /cd .. %; /load init.tf


/def _bind_kb_key_nkpDivide = k wszystkich
