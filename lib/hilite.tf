
;--------------------------------------------------------------
; Hooki do kolorowania mowienia
;--------------------------------------------------------------

/set _info_events_speech_type_list=(mowi|nuci|szepcze zlowieszczo|syczy|bulgocze)
/eval /def -mregexp -t'.* %{_info_events_speech_type_list} do ciebie:? (.*)' -aB -Fp5 _info_events_speech_1
/eval /def -mregexp -t'(.* %{_info_events_speech_type_list}.*: )(.*)' -aCrgb552 -Fp10 _info_events_speech_2 = /test  substitute(strcat("- ", "%%{P1}", decode_attr("%%{P3}", "Crgb551")))
/def -mregexp -t'Mowisz:? .*' -aCrgb315 -p15 _info_events_speech_3


;--------------------------------------------------------------
; Kolorowanie przybywa podaza
;--------------------------------------------------------------

/def -aCgray11 -mregexp -t'(.*) (przybywa|podaza)(ja|) (z|na) (.*)' _info_events_location_change_1 = /test substitute(strcat("= ", "%{P0}"))

/def -aCgray11 -mregexp -t'Wraz z .* podazasz za .* (na|do) *.' _info_events_location_change_2 = /test substitute(strcat("= ", "%{*}"))

;------------------------------------------------------------------------
; Sprzet
;------------------------------------------------------------------------
/def -p10 -mregexp -F -aBCgreen -t'Ma(|sz) na sobie .*(.)$' _masz_przy_sobie_1 =\
    /if ({P2}!~".") \
      /def -p10 -F -aBCgreen -t"*" _masz_przy_sobie_1a %;\
      /def -p15 -1 -mregexp -F -aBCgreen -t"\\\\.$$" _masz_przy_sobie_1b=/purge _masz_przy_sobie_1a %;\
    /endif
/def -p20 -mregexp -F -aCgreen -t'Masz przy sobie .*([^\\.]|\\.)$' _masz_przy_sobie_2 =\
    /if ({P1}!~".") \
      /def -p20 -F -aCgreen -t"*" _masz_przy_sobie_2a %;\
      /def -p25 -1 -mregexp -F -aCgreen -t"\\\\.$$" _masz_przy_sobie_2b=/purge _masz_przy_sobie_2a %;\
    /endif
/def -p10 -F -aBCmagenta -mregexp -t'Trzyma(|sz) ' _masz_przy_sobie_4

;------------------------------------------------------------------------
; Inne fajne
;------------------------------------------------------------------------

/def -Fp50 -aCrgb455 -mregexp -t'((Jest|Jestes) .*, (znanym|znana) jako:|Jest to [^ ]+ [^ ]+ (elf|elfka|krasnolud|krasnoludka|gnom|gnomka|ogr|ogrzyca|niziolek|niziolka|polelf|polelfka|mezczyzna|kobieta|halfling|halflina|mutant|mutantka)\.)' _rozdzielenie_opisow_postaci = /echo%; /echo +---------------------------------------------------------------------------------+%; /echo