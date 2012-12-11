; ## Linie dodane automagicznie   : tf_ver=1.1.2
; ## 
; ## Wersja pliku                 : 1.1.2
; ## Ostatnia zmiana pliku        : 2008-07-07 11:48:12
; ## Plik pobrany                 : 2008-07-07 11:48:26
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
;/def _anty_flood_make_a = \
;    /def -p500 -a%{ogolne_color_anty_flood-g} -t'%{*}' \
;        _anty_flood_trig_%{_anty_flood_id} %;\
;    /test ++_anty_flood_id

/def _anty_flood_hide = \
    /if (ogolne_anty_flood_level >= {1}) \
        /return substitute("", "gL", 0) %;\
    /endif

/def _anty_flood_make = \
    /def -p%{3-500} -a%{ogolne_color_anty_flood-g} -m%{2-glob} -t'%{1}' \
        _anty_flood_trig_%{_anty_flood_id} %;\
    /test ++_anty_flood_id

/def _anty_flood = \
    /purge _anty_flood_trig_* %;\
    /set _anty_flood_id=0 %;\
    /if (ogolne_anty_flood_level >= 1) \
        /test _anty_flood_make("*{skaven|reptilion|ork|goblin|hobgoblin|krasnozwierz} krzyczy*: *") %;\
        /test _anty_flood_make("*troll wybucha sadystycznym smiechem.") %;\
        /test _anty_flood_make("*troll ryczy glosno.") %;\
        /test _anty_flood_make("*ambull sapie przerazliwie.") %;\
    /endif %;\
;    /if (ogolne_anty_flood_level >= 5) \
;        /test _anty_flood_make("wyparowany przez| oslania sie |udaje (ci |)sie oslonic|udaje sie sparowac|udaje sie uniknac|udaje sie je zbic|udaje sie go sparowac| paruje go | uskakuje przed |zbija je z linii ataku|udaje sie zbic|nie udaje sie trafic", "regexp", 50) %;\
;    /endif %;\
;    /if (ogolne_anty_flood_level >= 6) \
;        /test _anty_flood_make("(ledwo muska|lekko rani|(?<!lekko|powaznie|bardzo ciezko) rani) .*, trafiajac (go|ja|je) w", "regexp", 50) %;\
;    /endif %;\
;    /if (ogolne_anty_flood_level >= 7) \
;        /test _anty_flood_make("(powaznie rani|bardzo ciezko rani|masakruje) .*, trafiajac (go|ja|je) w", "regexp", 50) %;\
;    /endif %;\
    /unset _anty_flood_id

/_anty_flood

/def anty_flood = \
    /if ({*} =~ NULL) \
        /test echo(strcat("Poziom anty flooda ustawiony na @{B}", {ogolne_anty_flood_level}, "@{n}."), {ogolne_color_info_local-Cgreen}, 1) %;\
    /elseif ({*} =/ "[0-9]") \
        /set ogolne_anty_flood_level=%{*} %;\
        /_anty_flood %;\
        /anty_flood %;\
    /else \
        /test echo("Skladnia: /anty_flood [0-9]") %;\
    /endif

/def ?anty_flood = \
    /echo -p -aCgreen +-======================== @{BCwhite}Arkadia ver %{tf_version} @{BCmagenta}Pomoc @{nCgreen}==========================-+ %; \
	/echo -p -aCgreen | @{BCyellow}Antyflood!@{nCgreen}                                                                  | %; \
	/echo -p -aCgreen | Uzycie:                                                                     | %; \
	/echo -p -aCgreen |     @{BCwhite}/anty_flood [0-9]@{nCgreen}                                                       | %; \
	/echo -p -aCgreen |                                                                             | %; \
	/echo -p -aCgreen | Poziom @{BCwhite}0@{nCgreen}:                                                                   | %; \
	/echo -p -aCgreen |  - Anty_flood wylaczony.                                                    | %; \
	/echo -p -aCgreen | Poziom @{BCwhite}1@{nCgreen}:                                                                   | %; \
	/echo -p -aCgreen |  - Malo istotne eventy                                                      | %; \
	/echo -p -aCgreen | Poziom @{BCwhite}2@{nCgreen}:                                                                   | %; \
	/echo -p -aCgreen |  - Pudla, uniki, parowanie, sparowania zbroja i tarcza                      | %; \
	/echo -p -aCgreen |    Oznacza to ze wszystko w/w bedzie na '/anty_flood 2' niewyswietlane      | %; \
	/echo -p -aCgreen | Poziom @{BCwhite}3@{nCgreen}:                                                                   | %; \
	/echo -p -aCgreen |  -                                                                          | %; \
	/echo -p -aCgreen | Poziom @{BCwhite}4@{nCgreen}:                                                                   | %; \
	/echo -p -aCgreen |  - Ledwo muska/Lekko rani/Rani oraz odpowiedniki broni nietypowych          | %; \
	/echo -p -aCgreen | Poziom @{BCwhite}5@{nCgreen}:                                                                   | %; \
	/echo -p -aCgreen |  - Odpowiedniki slabych uderzen broni magicznych                            | %; \
	/echo -p -aCgreen | Poziom @{BCwhite}6@{nCgreen}:                                                                   | %; \
	/echo -p -aCgreen |  - Powaznie/Bardzo ciezo rani/Masakruje + odpowiedniki broni nietypowych    | %; \
	/echo -p -aCgreen | Poziom @{BCwhite}7@{nCgreen}:                                                                   | %; \
	/echo -p -aCgreen |  - Odpowiedniki mocnych uderzen broni magicznych                            | %; \
	/echo -p -aCgreen | Poziom @{BCwhite}8@{nCgreen}:                                                                   | %; \
	/echo -p -aCgreen |  - Slabsze uderzenia specjalne                                              | %; \
	/echo -p -aCgreen | Poziom @{BCwhite}9@{nCgreen}:                                                                   | %; \
	/echo -p -aCgreen |  - Powazne uderzenia specjalne                                              | %; \
	/echo -p -aCgreen |  - Rownoznacznosc z 'opcje opisywanie wylacz'. Zaleta ze nadal podpina nam  | %; \
	/echo -p -aCgreen |    zaslony.                                                                 | %; \
	/echo -p -aCgreen |                                                                             | %; \
	/echo -p -aCgreen | Dodatkowo:                                                                  | %; \
	/echo -p -aCgreen |     @{BCwhite}/cyferki [0-2]@{nCgreen}                                                          | %; \
	/echo -p -aCgreen | Cyferki @{BCwhite}0@{nCgreen} - Wylacza zmiane literek na cyferki.                              | %; \
	/echo -p -aCgreen | Cyferki @{BCwhite}1@{nCgreen} - Wlacza zmiane literek na cyferki.                               | %; \
	/echo -p -aCgreen | Cyferki @{BCwhite}2@{nCgreen} - Wlacza zmiane literek na cyferki ze skrocaniem.                 | %; \
	/echo -p -aCgreen |                                                                             | %; \
	/echo -p -aCgreen | @{BCwhite}Uwagi@{nCgreen}:                                                                      | %; \
	/echo -p -aCgreen |  Anty_flood skupia sie glownie na walce. Zaden cios w ciebie, lub twoj, nie | %; \
	/echo -p -aCgreen | bedacy pudlem, nie powinien zostac uciety. Gdyby sie tak dzialo prosze      | %; \
	/echo -p -aCgreen | o dokladny opis walki. Rowniez prosze o opisy: specy, nietypowych broni i   | %; \
	/echo -p -aCgreen | magikow mozliwie w kazdej osobie.                                           | %; \
	/echo -p -aCgreen | Bledy zglaszac w formie: Opis, co to za bron/spec, komentarz                | %; \
	/echo -p -aCgreen | Kontakt do mnie: <Neus> na Ircu, lub neusek@gmail.com.                      | %; \
	/echo -p -aCgreen +-===========================================================================-+
