; Automagicly added line: tf_ver=4.0.7
;------------------------------------------------------------------------------
;|           >>>>>>>>>>>> Plik konfiguracyjny do TF-a <<<<<<<<<<<<            |
;|                              Ingwar Swenson                                |
;|                       sob 04 maj 2002 07:01:48 CEST                        |
;|                       sob 09 sie 2003 14:01:34 CEST                        |
;------------------------------------------------------------------------------
;******************************************************************************
/set tf_version=4.0.7 Lite
/load defs.tf
/load bindy.tf
/load hilite.tf
/load trig.tf
/load statystyka.tf
;/load screen.tf
;/load scroll.tf
/load help.tf
;/load wrogowie.tf
;/load changelog.tf
;/load zapamietywanie.tf
;/load mutacje.tf
;/load bilans.tf

;def zielnik = \
;   /load zielnik.tf

; Przeladowanie wszystkich makr (lacznie z makramami grajacej obecnie osoby)
; Uzycie : /reload [-g] 
/def reload = \
    /mecho off %;\
    /purge %;\
    /purge -i alias_body_* %;\
    /purge -i alias_call_* %;\
    /load %{1} arkadia.tf%;\
    /load %{1} %{obecnie_expujacy}.tf %;\
    /kiera %;\
    /tfver %;\
    /defs

/if (regmatch("[1-4]+.+[0-9]+", $(/ver))) \
    /echo %;\
    /echo %;\
    /echo -p -aBCyellow Ta wersja skryptow jest przeznaczona do TF-a w wersji conajmniej 5.0 %;\
    /echo -p -aBCred    I moze zawierac pewnie bledy i nie uruchamiac czesci rzeczy. %;\
    /echo -p -aBCgreen  Prosze zainstalowac nowsza wersje. %;\
    /echo %;\
    /echo %;\
/endif

/if (regmatch("5.0 alpha (.*)", $(/ver)) & {P1} < 14) \
    /echo %;\
    /echo -p -aBCyellow Ta wersja skryptow jest przeznaczona do TF-a w wersji conajmniej 5.0 alpha 14 moze dzialac poprawnie ale to nie jest zalecane%;\
    /echo -p -aBCgreen  Prosze zainstalowac nowsza wersje. %;\
    /echo %;\
    /def decode_attr = /return inline_attr({*}) %;\
/endif
;******************************************************************************
