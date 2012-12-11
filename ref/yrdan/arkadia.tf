; ## Linie dodane automagicznie   : tf_ver=4.2.9
; ## 
; ## Wersja pliku                 : 4.2.9
; ## Ostatnia zmiana pliku        : 2009-01-06 21:07:40
; ## Plik pobrany                 : 2009-01-06 21:07:47
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
;------------------------------------------------------------------------------
;|           >>>>>>>>>>>> Plik konfiguracyjny do TF-a <<<<<<<<<<<<            |
;|                              Ingwar Swenson                                |
;|                       sob 04 maj 2002 07:01:48 CEST                        |
;|                       sob 09 sie 2003 14:01:34 CEST                        |
;------------------------------------------------------------------------------
;******************************************************************************
/set tf_version=4.2.4
/set master_file=arkadia

/load defs.tf
/if (ogolne_bindy_new) \
    /load bindy_new.tf %;\
/else \
    /load bindy.tf %;\
/endif %;\
/load hilite.tf
/load trig.tf
/load statystyka.tf
;/load screen.tf
;/load scroll.tf
/load help.tf
/load wrogowie.tf
/load changelog.tf
/load zapamietywanie.tf
/load mutacje.tf
/load bilans.tf
/load odmiana.tf
/load zaslona.tf
/load skrzynia.tf
/load umiejetnosci.tf
/load anty_flood.tf
/load cechy.tf
/load gildie.tf
/load zawod.tf

/def zielnik = \
    /load zielnik.tf

;******************************************************************************
