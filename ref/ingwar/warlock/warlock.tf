; Automagicly added line: tf_ver=3.0.6
;------------------------------------------------------------------------------
;|           >>>>>>>>>>>> Plik konfiguracyjny do TF-a <<<<<<<<<<<<            |
;|                              Ingwar Swenson                                |
;|                       sob 04 maj 2002 07:01:48 CEST                        |
;------------------------------------------------------------------------------
;******************************************************************************
/set tf_version=3.0.6 Lite
/load ../arkadia/defs.tf
/load ../arkadia/bindy.tf
/load ../arkadia/hilite.tf
/load ../arkadia/trig.tf
/load ../arkadia/statystyka.tf
;/load ../arkadia/screen.tf
;/load ../arkadia/scroll.tf
/load ../arkadia/help.tf
;/load ../arkadia/wrogowie.tf
;/load ../arkadia/changelog.tf
;/load ../arkadia/bilans.tf

/load defs_war.tf
/load hilite_war.tf
/load trig_war.tf
/load statystyka_war.tf
;/load imiona_war.tf


; Przeladowanie wszystkich makr (lacznie z makramami grajacej obecnie osoby)
; Uzycie : /reload [-g] 
/def reload = \
    /mecho off %;\
    /purge %;\
    /purge -i alias_body_* %;\
    /purge -i alias_call_* %;\
    /load %{1} warlock.tf%;\
    /load %{1} %{obecnie_expujacy}.tf %;\
    /kiera %;\
    /tfver%;\
    /defs

;******************************************************************************
