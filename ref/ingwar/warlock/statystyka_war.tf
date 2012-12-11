; Automagicly added line: tf_ver=1.0.0
;------------------------------------------------------------------------------
;|                        Rozne cuda niewidy.. Statystyki wykresy             |
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;|                        Pasek stanu z roznymi cudami                       |
;------------------------------------------------------------------------------

/def -aBCyellow -t'*Jestes w pelni zdrow*' _kondycha_pelnia= \
    /echo %;\
    /set wykrzykniki . %;\
    /set aktualna_kondycha=   W pelni zdrow
        
/def -aBCyellow -t'*Jestes poturbowan*' _kondycha_poturbowany= \
    /echo %;\
    /set wykrzykniki .. %;\
    /set aktualna_kondycha=     Poturbowany

/def -aBCyellow -t'*Jestes pokiereszowan*' _kondycha_pokiereszowany= \
    /echo %;\
    /set wykrzykniki .. %;\
    /set aktualna_kondycha=  Pokiereszowany

/def -aBCyellow -t'*Jestes poranion*' _kondycha_poraniony= \
    /echo %;\
    /set wykrzykniki ... %;\
    /set aktualna_kondycha=       Poraniony

/undef _kondycha_zla_kondycja
/def -aBCyellow -t'*Jestes w zlej kondycji*' _kondycha_zla_kondycja= \
    /echo %;\
    /set wykrzykniki ... %;\
    /set aktualna_kondycha= W zlej kondycji
	    

/def -aBCyellow -t'*Jestes w zlym stanie*' _kondycha_zly_stan= \
    /echo %;\
    /set wykrzykniki ! %;\
    /set aktualna_kondycha=   W zlym stanie  

/def -aBCyellow -t'*Jestes zmasakrowan*' _kondycha_zmasakrowan= \
    /echo %;\
    /set wykrzykniki !! %;\
    /set aktualna_kondycha=    Zmasakrowany

/undef _kondycha_ledwo_zywy
/def -aBCyellow -t'*Jestes ledwo zyw*' _kondycha_ledwo_zywy= \
    /echo %;\
    /set wykrzykniki !! %;\
    /set aktualna_kondycha=      Ledwo zywy

/def -aBCyellow -t'*Jestes na skraju smierci*' _kondycha_na_skraju_smierci= \
    /echo %;\
    /set wykrzykniki !!! %;\
    /set aktualna_kondycha=  SKRAJ SMIERCI!
