
;--------------------------------------------------------------
; Hooki do kolorowania mowienia
;--------------------------------------------------------------

/set _info_events_speech_type_list=(mowi|nuci|szepcze zlowieszczo|zlowieszczo szepcze|syczy|bulgocze)
/eval /def -mregexp -t'.* %{_info_events_speech_type_list} do ciebie:? (.*)' -aB -Fp1 -aCbgrgb010 _info_events_speech_1
/eval /def -mregexp -t'(.* %{_info_events_speech_type_list}.*: )(.*)' -aCbgrgb001 -aCrgb510 -Fp10 _info_events_speech_2 = /test substitute(strcat("- ", "%%{P1}", decode_attr("%%{P3}", "Crgb550")))
/def -mregexp -t'(Szepczesz zlowieszczo:?|Mowisz:?) .*' -aCbgrgb001 -aCrgb550 -Fp15 _info_events_speech_3


;--------------------------------------------------------------
; Kolorowanie przybywa podaza
;--------------------------------------------------------------

/def -aCgray11 -mregexp -t'(.*)(?:skradajac sie|) (przybywa|podaza)(ja|) (?:za toba |)(z|na|ze|sposrod) (.*)' _info_events_location_change_1 = /test substitute(strcat("= ", "%{P0}"))
/def -aCgray11 -mregexp -t'Wraz z .* podazasz(?: skradajac sie|) za .* (na|do) *.' _info_events_location_change_2 = /test substitute(strcat("= ", "%{*}"))
/def -aCgray11 -mregexp -t'Podazasz skradajac sie za .* (na|do) *.' _info_events_location_change_3 = /test substitute(strcat("= ", "%{*}"))

;------------------------------------------------------------------------
; Sprzet
;------------------------------------------------------------------------

/eval /def -Fp100 -mregexp -aBCgreen -t'^Masz przy sobie ' _kolorki_ekwipunek_przy_sobie
/eval /def -Fp100 -mregexp -aBCgreen -t'^Ma(sz|) na sobie ' _kolorki_ekwipunek_na_sobie
/eval /def -Fp100 -mregexp -aBCgreen -t'Twe cialo chronia grube plyty mahakamskiej wojennej zbroi plytowej, pancerza, ktory od pokolen kuty jest przez twych przodkow w kuzniach twierdzy Mons Arx. Idealnie wyprofilowany na krasnoludzkie potrzeby ekwipunek uklada sie wyjatkowo wygodnie na twym ciele, nie dajac ci odczuc swej pokaznej masy.| cialo chronia grube plyty mahakamskiej wojennej zbroi plytowej, pancerza, ktory od pokolen kuty jest przez twych przodkow w kuzniach twierdzy Mons Arx.' _kolorki_ekwipunek_na_sobie_mahakamska_plytowka
/eval /def -Fp100 -mregexp -aBCgreen -t'Od stop do glow zakut[ay] jest w ' _kolorki_ekwipunek_na_sobie_mutanty
/eval /def -Fp100 -mregexp -aBCgreen -t' cialo przykrywaja stalowe plyty pelnego pancerza, na ktorego powierzchni widnieja krwistoczerwone malunki, przesycone pierwotna zadza destrukcji, zla i zaglady.' _kolorki_ekwipunek_na_sobie_ogry
/eval /def -Fp100 -mregexp -aBCmagenta -t'^Trzyma(sz|)( oburacz .*|.* w (prawej|lewej) rece)\.' _kolorki_ekwipunek_bron

;------------------------------------------------------------------------
; Inne fajne
;------------------------------------------------------------------------

/def -Fp50 -aCrgb455 -mregexp -t'((Jest|Jestes) .*, (znanym|znana) jako:|Jest to [^ ]+ [^ ]+ (elf|elfka|krasnolud|krasnoludka|gnom|gnomka|ogr|ogrzyca|niziolek|niziolka|polelf|polelfka|mezczyzna|kobieta|halfling|halflina|mutant|mutantka)\.)' _rozdzielenie_opisow_postaci = /echo%; /echo +---------------------------------------------------------------------------------+%; /echo
/def -ab -t'Masz nowa poczte od *.' _poczta_prompt = /echo%;/echo%;/echo NOWA POCZTA!%;/echo%;/echo
/def -aCrgb515 -t'*dobywa*' _wielding
/def -aCrgb515 -t'*unosi swoja partyzane*' _wielding_parta


/def -P1Crgb034 -mregexp -t' glosno sapiac, przystaje na chwile, ociera swa dlonia krople potu z czola sygnalizujac ze jest (.*)\.' info_zmeczenie_kmodpocznij


/def brama = otworz brame kula
/def zlozklucz = zloz pierwsza polkule z druga polkula
/def -mregexp -F -t'Znajdujacy sie na lewym skrzydle wizerunek przedstawia (.*?)(\\.|,)' blavi_color_1 =   /echo -p LEWE SKRZYDLO:   @{Crgb520}%{P1}
/def -mregexp -F -t'Obraz na prawym skrzydle bramy pokazuje z kolei (.*?)(\\.|,)' blavi_color_2 =          /echo -p PRAWE SKRZYDLO:  @{Crgb520}%{P1}