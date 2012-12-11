; ## Linie dodane automagicznie   : tf_ver=1.8.9
; ## 
; ## Wersja pliku                 : 1.8.9
; ## Ostatnia zmiana pliku        : 2009-01-06 21:07:40
; ## Plik pobrany                 : 2009-01-06 21:07:52
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
;-------------------------------------------------------------------------------
;|                                OGOLNE                                       |
;-------------------------------------------------------------------------------
/eval /def -F -a%{ogolne_color_warn_rozpada-r} -t'* rozpada sie!'    _cosik_sie_rozpadlo
/eval /def -F -a%{ogolne_color_warn_peka-r} -t'* peka!'             _cosik_peklo
/eval /def -F -P%{ogolne_color_warn_atakujecie-BCgreen} -t'atakuje cie(bie|)!$$' _bestie_atakuja = /eval %{ogolne_robie_po_ataku}

/eval /def -F -a%{ogolne_color_info_zaplata-B} -t'Nie masz czym zaplacic*'     _nie_masz_czym_zaplacic 
/eval /def -F -a%{ogolne_color_info_golab-bBCmagenta} -t'Bialy golab pocztowy laduje na twoim r*'     _golab_ = /echo
/eval /def -F -a%{ogolne_color_info_golab-bBCmagenta} -t'Na twoje ramie niespodziewanie wskakuje szczur.*'     _golab_szczur = /echo
/eval /def -F -a%{ogolne_color_info_tell-bBCmagenta} -t'W swoim umysle szlyszysz*'             _wiadomosc_od_kogos 
/eval /def -F -a%{ogolne_color_info_tell-bBCmagenta} -t'Nagle, tuz przed toba, z chmury dymu*'     _wiadomosc_od_kogos2

;/eval /def -F -P1%{ogolne_color_info_sogr-Cyellow} -t' to (potezny smoczy ogr) ' _ogry_hilite_p                                       
;/eval /def -F -P1%{ogolne_color_info_psogr-BCyellow} -t' to (wyjatkowo potezny smoczy ogr) ' _ogry_hilite_wp
;/eval /def -F -P1%{ogolne_color_info_rept-BCyellow} -t'jest (zdecydowanie wiekszy od pozostalych)' _repty_hilite_potezny
/eval /def -F -P0%{ogolne_color_info_przepasc-BCyellow} -t'Na .* rozciaga(ja|) sie przepasc(i|).' _przepasc_hilite

/eval /def -F -P%{ogolne_color_info_rept-BCyellow} -t'zdobienia w ksztalcie weza wijacego sie niczym winorosl' _trujacy_sarkofag_tilea = /msg -e Trujact sarkofag

;-------------------------------------------------------------------------------
;|                                STANY                                        |
;-------------------------------------------------------------------------------

/def _pnr = \
    /if ({ogolne_literki_na_cyferki}) \
        /return substitute(strcat({PL}, {P0}, " ", {*}, {PR})) %;\
    /endif

/def -p20 -F -mregexp -t'^Wyglada(sz|) na' _~poziomy_graczy_inicjuj = \
;   Poziomy sprzetu reaguja na ten sam text wiec po co robic 2
    /_sprzet_inicjuj %;\
    /rstart -1 1 /purge __poziomy_graczy_*  %;\
    /purge __poziomy_graczy_* %;\
    /def -p4 -P%{ogolne_color_info_poziom-B} -F -t'kompletnego zoltodzioba.$$' __poziomy_graczy_1 = /_pnr (1/17) %;\
    /def -p4 -P%{ogolne_color_info_poziom-B} -F -t'stawia pierwsze kroki.$$'   __poziomy_graczy_2 = /_pnr (2/17) %;\
    /def -p4 -P%{ogolne_color_info_poziom-B} -F -t'jeszcze niewiele widzial.$$'     __poziomy_graczy_3 = /_pnr (3/17) %;\
    /def -p4 -P%{ogolne_color_info_poziom-B} -F -t'niewiele wie o swiecie.$$'       __poziomy_graczy_4 = /_pnr (4/17) %;\
    /def -p4 -P%{ogolne_color_info_poziom-B} -F -t'niedoswiadczonego.$$'           __poziomy_graczy_5 = /_pnr (5/17) %;\
    /def -p4 -P%{ogolne_color_info_poziom-B} -F -t'widzial juz to i owo.$$' __poziomy_graczy_6 = /_pnr (6/17) %;\
    /def -p4 -P%{ogolne_color_info_poziom-B} -F -t'pewnie stapa po swiecie.$$'            __poziomy_graczy_7 = /_pnr (7/17) %;\
    /def -p4 -P%{ogolne_color_info_poziom-B} -F -t'niejedno widzial.$$'       __poziomy_graczy_8 = /_pnr (8/17) %;\
    /def -p5 -P%{ogolne_color_info_poziom-B} -F -t'swoje przezyl.$$'  __poziomy_graczy_9 = /_pnr (9/17) %;\
    /def -p5 -P%{ogolne_color_info_poziom-B} -F -t'(?<!wielce) doswiadczonego.$$'  __poziomy_graczy_10 = /_pnr (10/17) %;\
    /def -p5 -P%{ogolne_color_info_poziom-B} -F -t'wiele przeszedl.$$'  __poziomy_graczy_11 = /_pnr (11/17) %;\
    /def -p5 -P%{ogolne_color_info_poziom-B} -F -t'widzial kawal swiata.$$'  __poziomy_graczy_12 = /_pnr (12/17) %;\
    /def -p5 -P%{ogolne_color_info_poziom-B} -F -t'bardzo doswiadczonego.$$'  __poziomy_graczy_13 = /_pnr (13/17) %;\
    /def -p5 -P%{ogolne_color_info_poziom-B} -F -t'zwiedzil caly swiat.$$'  __poziomy_graczy_14 = /_pnr (14/17) %;\
    /def -p5 -P%{ogolne_color_info_poziom-B} -F -t'wielce doswiadczonego.$$'  __poziomy_graczy_15 = /_pnr (15/17) %;\
    /def -p5 -P%{ogolne_color_info_poziom-B} -F -t'widzial i doswiadczyl wszystkiego.$$'  __poziomy_graczy_16 = /_pnr (16/17) %;\
    /def -p5 -P%{ogolne_color_info_poziom-B} -F -t'osobe owiana legenda.$$'  __poziomy_graczy_17 = /_pnr (17/17)

/def -p20 -F -mregexp -t', od (momentu |)kiedy (wszedles|weszlas) do gry\\.$$' _~cechy_inicjuj = \
    /rstart -0 1 /purge __cechy_*  %;\
    /purge __cechy_* %;\
    /def -Fp4 -PB -t' zadnych postepow'         __cechy_0 = /_pnr (0/16) %%; /_nowy_postep 0 %;\
    /def -Fp4 -PB -t' minimalne postepy'        __cechy_1 = /_pnr (1/16) %%; /_nowy_postep 1 %;\
    /def -Fp4 -PB -t' nieznaczne postepy'       __cechy_2 = /_pnr (2/16) %%; /_nowy_postep 2 %;\
    /def -Fp4 -PB -t' bardzo male postepy'      __cechy_3 = /_pnr (3/16) %%; /_nowy_postep 3 %;\
    /def -Fp4 -PB -t'(?<!bardzo) male postepy'  __cechy_4 = /_pnr (4/16) %%; /_nowy_postep 4 %;\
    /def -Fp4 -PB -t' nieduze postepy'          __cechy_5 = /_pnr (5/16) %%; /_nowy_postep 5 %;\
    /def -Fp4 -PB -t' zadowalajace postepy'     __cechy_6 = /_pnr (6/16) %%; /_nowy_postep 6 %;\
    /def -Fp4 -PB -t' spore postepy'            __cechy_7 = /_pnr (7/16) %%; /_nowy_postep 7 %;\
    /def -Fp4 -PB -t' dosc duze postepy'        __cechy_8 = /_pnr (8/16) %%; /_nowy_postep 8 %;\
    /def -Fp4 -PB -t' znaczne postepy'          __cechy_9 = /_pnr (9/16) %%; /_nowy_postep 9 %;\
    /def -Fp4 -PB -t'(?<!bardzo|dosc) duze postepy' __cechy_10 = /_pnr (10/16) %%; /_nowy_postep 10 %;\
    /def -Fp4 -PB -t' bardzo duze postepy'      __cechy_11 = /_pnr (11/16) %%; /_nowy_postep 11 %;\
    /def -Fp4 -PB -t' ogromne postepy'          __cechy_12 = /_pnr (12/16) %%; /_nowy_postep 12 %;\
    /def -Fp4 -PB -t' imponujace postepy'       __cechy_13 = /_pnr (13/16) %%; /_nowy_postep 13 %;\
    /def -Fp4 -PB -t' wspaniale postepy'        __cechy_14 = /_pnr (14/16) %%; /_nowy_postep 14 %;\
    /def -Fp4 -PB -t' gigantyczne postepy'      __cechy_15 = /_pnr (15/16) %%; /_nowy_postep 15 %;\
    /def -Fp4 -PB -t' niebotyczne postepy'      __cechy_16 = /_pnr (16/16) %%; /_nowy_postep 16 %;\
    /def -FP -p4 -t' slabiutk(i|a)'            __cechy_s_1 = /_pnr (1/8)[%{ogolne_cechy_brak1}/5] %;\
    /def -FP -p4 -t' watl(y|a)'                __cechy_s_2 = /_pnr (2/8)[%{ogolne_cechy_brak1}/5] %;\
    /def -FP -p5 -t' slab(y|a)'                 __cechy_s_3 = /_pnr (3/8)[%{ogolne_cechy_brak1}/5] %;\
    /def -FP -p4 -t' krzepk(i|a)'                 __cechy_s_4 = /_pnr (4/8)[%{ogolne_cechy_brak1}/5] %;\
    /def -FP -p4 -t' siln(y|a)'                 __cechy_s_5 = /_pnr (5/8)[%{ogolne_cechy_brak1}/5] %;\
    /def -FP -p4 -t' mocn(y|a)'                 __cechy_s_6 = /_pnr (6/8)[%{ogolne_cechy_brak1}/5] %;\
    /def -FP -p4 -t' potezn(y|a)'                __cechy_s_7 = /_pnr (7/8)[%{ogolne_cechy_brak1}/5] %;\
    /def -FP -p4 -t' mocarn(y|a)'                 __cechy_s_8 = /_pnr (8/8)[%{ogolne_cechy_brak1}/5] %;\
    /def -FP -p4 -t' nieskoordynowan'          __cechy_d_1 = /_pnr (1/8)[%{ogolne_cechy_brak2}/5] %;\
    /def -FP -p4 -t' niezreczn(y|a)'             __cechy_d_2 = /_pnr (2/8)[%{ogolne_cechy_brak2}/5] %;\
    /def -FP -p4 -t' niezgrabn(y|a)'             __cechy_d_3 = /_pnr (3/8)[%{ogolne_cechy_brak2}/5] %;\
    /def -FP -p4 -t' sprawn(y|a)'                 __cechy_d_4 = /_pnr (4/8)[%{ogolne_cechy_brak2}/5] %;\
    /def -FP -p4 -t' zwinn(y|a)'                 __cechy_d_5 = /_pnr (5/8)[%{ogolne_cechy_brak2}/5] %;\
    /def -FP -p4 -t' zreczn(y|a)'                 __cechy_d_6 = /_pnr (6/8)[%{ogolne_cechy_brak2}/5] %;\
    /def -FP -p4 -t' gibk(i|a)'                 __cechy_d_7 = /_pnr (7/8)[%{ogolne_cechy_brak2}/5] %;\
    /def -FP -p4 -t' akrobatyczn(y|a)'            __cechy_d_8 = /_pnr (8/8)[%{ogolne_cechy_brak2}/5] %;\
    /def -FP -p4 -t' cherlaw(y|a)'                __cechy_c_1 = /_pnr (1/8)[%{ogolne_cechy_brak3}/5] %;\
    /def -FP -p4 -t' rachityczn(y|a)'             __cechy_c_2 = /_pnr (2/8)[%{ogolne_cechy_brak3}/5] %;\
    /def -FP -p4 -t' mizern(y|a)'                 __cechy_c_3 = /_pnr (3/8)[%{ogolne_cechy_brak3}/5] %;\
    /def -FP -p4 -t' dobrze zbudowan(y|a)'        __cechy_c_4 = /_pnr (4/8)[%{ogolne_cechy_brak3}/5] %;\
    /def -FP -p4 -t' wytrzymal(y|a)'             __cechy_c_5 = /_pnr (5/8)[%{ogolne_cechy_brak3}/5] %;\
    /def -FP -p4 -t' tward(y|a)'                 __cechy_c_6 = /_pnr (6/8)[%{ogolne_cechy_brak3}/5] %;\
    /def -FP -p4 -t' muskularn(y|a)'             __cechy_c_7 = /_pnr (7/8)[%{ogolne_cechy_brak3}/5] %;\
    /def -FP -p4 -t' atletyczn(y|a)'             __cechy_c_8 = /_pnr (8/8)[%{ogolne_cechy_brak3}/5] %;\
    /def -FP -p4 -t' bezmysln(y|a)'             __cechy_i_1 = /_pnr (1/8)[%{ogolne_cechy_brak4}/5] %;\
    /def -FP -p4 -t' tep(y|a)'                    __cechy_i_2 = /_pnr (2/8)[%{ogolne_cechy_brak4}/5] %;\
    /def -FP -p4 -t' ograniczon(y|a)'             __cechy_i_3 = /_pnr (3/8)[%{ogolne_cechy_brak4}/5] %;\
    /def -FP -p4 -t' pojetn(y|a)'                 __cechy_i_4 = /_pnr (4/8)[%{ogolne_cechy_brak4}/5] %;\
    /def -FP -p4 -t' inteligentn(y|a)'            __cechy_i_5 = /_pnr (5/8)[%{ogolne_cechy_brak4}/5] %;\
    /def -FP -p4 -t' bystr(y|a)'                 __cechy_i_6 = /_pnr (6/8)[%{ogolne_cechy_brak4}/5] %;\
    /def -FP -p4 -t' blyskotliw(y|a)'             __cechy_i_7 = /_pnr (7/8)[%{ogolne_cechy_brak4}/5] %;\
    /def -FP -p4 -t' genialn(y|a)'             __cechy_i_8 = /_pnr (8/8)[%{ogolne_cechy_brak4}/5] %;\
    /def -FP -p4 -t' glupi(y|a)'                 __cechy_w_1 = /_pnr (1/8)[%{ogolne_cechy_brak5}/5] %;\
    /def -FP -p4 -t' zacofan(y|a)'                __cechy_w_2 = /_pnr (2/8)[%{ogolne_cechy_brak5}/5] %;\
    /def -FP -p4 -t' niewyksztalcon(y|a)'         __cechy_w_3 = /_pnr (3/8)[%{ogolne_cechy_brak5}/5] %;\
    /def -FP -p4 -t' wyksztalcon(y|a)'            __cechy_w_4 = /_pnr (4/8)[%{ogolne_cechy_brak5}/5] %;\
    /def -FP -p4 -t' madr(y|a)'                 __cechy_w_5 = /_pnr (5/8)[%{ogolne_cechy_brak5}/5] %;\
    /def -FP -p4 -t' uczon(y|a)'                 __cechy_w_6 = /_pnr (6/8)[%{ogolne_cechy_brak5}/5] %;\
    /def -FP -p4 -t' oswiecon(y|a)'             __cechy_w_7 = /_pnr (7/8)[%{ogolne_cechy_brak5}/5] %;\
    /def -FP -p4 -t' wszechwiedzac(y|a)'         __cechy_w_8 = /_pnr (8/8)[%{ogolne_cechy_brak5}/5] %;\
    /def -FP -p4 -t' tchorzliw(y|a)'        __cechy_o_1 = /_pnr (1/8)[%{ogolne_cechy_brak6}/5] %;\
    /def -FP -p4 -t' strachliw(y|a)'        __cechy_o_2 = /_pnr (2/8)[%{ogolne_cechy_brak6}/5] %;\
    /def -FP -p4 -t' niepewn(y|a)'            __cechy_o_3 = /_pnr (3/8)[%{ogolne_cechy_brak6}/5] %;\
    /def -FP -p4 -t' zdecydowan(y|a)'        __cechy_o_4 = /_pnr (4/8)[%{ogolne_cechy_brak6}/5] %;\
    /def -FP -p4 -t' odwazn(y|a)'            __cechy_o_5 = /_pnr (5/8)[%{ogolne_cechy_brak6}/5] %;\
    /def -FP -p4 -t' dzieln(y|a)'            __cechy_o_6 = /_pnr (6/8)[%{ogolne_cechy_brak6}/5] %;\
    /def -FP -p4 -t' nieugiet(y|a)'            __cechy_o_7 = /_pnr (7/8)[%{ogolne_cechy_brak6}/5] %;\
    /def -FP -p4 -t' nieustraszon(y|a)'        __cechy_o_8 = /_pnr (8/8)[%{ogolne_cechy_brak6}/5] %;\
    /def -FP -p4 -t' pacyfista'                __cechy_b_1 = /_pnr (1/12) %;\
    /def -FP -p4 -t' bardzo potuln(y|a)'    __cechy_b_2 = /_pnr (2/12) %;\
    /def -FP -p4 -t'(?<!bardzo) potuln(y|a)' __cechy_b_3 = /_pnr (3/12) %;\
    /def -FP -p4 -t' bardzo lagodn(y|a)'    __cechy_b_4 = /_pnr (4/12) %;\
    /def -FP -p4 -t'(?<!bardzo) lagodn(y|a)' __cechy_b_5 = /_pnr (5/12) %;\
    /def -FP -p4 -t' spokojn(y|a)'          __cechy_b_6 = /_pnr (6/12) %;\
    /def -FP -p4 -t' agresywn(y|a)'            __cechy_b_7 = /_pnr (7/12) %;\
    /def -FP -p4 -t'(?<!bardzo) bojow(y|a)' __cechy_b_8 = /_pnr (8/12) %;\
    /def -FP -p4 -t' bardzo bojow(y|a)'        __cechy_b_9 = /_pnr (9/12) %;\
    /def -FP -p4 -t'(?<!bardzo) brutaln(y|a)' __cechy_b_10 = /_pnr (10/12) %;\
    /def -FP -p4 -t' bardzo brutaln(y|a)'   __cechy_b_11 = /_pnr (11/12) %;\
    /def -FP -p4 -t' zadn krwi(y|a)'        __cechy_b_12 = /_pnr (12/12)

/def -p20 -F -mregexp -t'^Jestes fizycznie .* zas mentalnie' _~stan_inicjuj = \
    /purge __stan_* %;\
    /def -FP -t'przerazon(y|a|e)'                  __stan_b_1 = /_pnr (1/6) %;\
    /def -FP -t'nerwowo'                           __stan_b_2 = /_pnr (2/6) %;\
    /def -FP -t'nieswojo'                          __stan_b_3 = /_pnr (3/6) %;\
    /def -FP -t'spokojnie'                         __stan_b_4 = /_pnr (4/6) %;\
    /def -FP -t'(?<!bardzo) bezpiecznie'           __stan_b_5 = /_pnr (5/6) %;\
    /def -FP -t'bardzo bezpiecznie'                __stan_b_6 = /_pnr (6/6) %;\
    /def -FP -t'(?<!mentalnie) calkowicie wycienczon(y|a|e)'      __stan_s_0 = /_pnr (1/10) %;\
    /def -FP -t'(?<!mentalnie)(?<!calkowicie) wycienczon(y|a|e)' __stan_s_1 = /_pnr (2/10) %;\
    /def -FP -t'(?<!mentalnie) bardzo wyczerpan(y|a|e)'           __stan_s_2 = /_pnr (3/10) %;\
    /def -FP -t'(?<!mentalnie)(?<!bardzo|nieco) wyczerpan(y|a)'  __stan_s_3 = /_pnr (4/10) %;\
    /def -FP -t'(?<!mentalnie) nieco wyczerpan(y|a|e)'            __stan_s_4 = /_pnr (5/10) %;\
    /def -FP -t'(?<!mentalnie) bardzo zmeczon(y|a|e)'             __stan_s_5 = /_pnr (6/10) %;\
    /def -FP -t'(?<!mentalnie)(?<!bardzo|troche) zmeczon(y|a|e)' __stan_s_6 = /_pnr (7/10) %;\
    /def -FP -t'(?<!mentalnie) troche zmeczon(y|a|e)'             __stan_s_7 = /_pnr (8/10) %;\
    /def -FP -t'(?<!mentalnie)(?<!w pelni) wypoczet(y|a|e)'      __stan_s_8 = /_pnr (9/10) %;\
    /def -FP -t'(?<!mentalnie) w pelni wypoczet(y|a|e)'           __stan_s_9 = /_pnr (10/10) %;\
    /def -FP -t'Chce ci sie bardzo pic'            __stan_p_1 = /_pnr (1/4) %;\
    /def -FP -t'Chce ci sie pic'                   __stan_p_2 = /_pnr (2/4) %;\
    /def -FP -t'Troche chce ci sie pic'            __stan_p_3 = /_pnr (3/4) %;\
    /def -FP -t'Nie chce ci sie pic'               __stan_p_4 = /_pnr (4/4) %;\
    /def -FP -t'jestes bardzo glodn(y|a|e)'        __stan_j_1 = /_pnr (1/4) %;\
    /def -FP -t'jestes glodn(y|a|e)'               __stan_j_2 = /_pnr (2/4) %;\
    /def -FP -t'jestes najedzon(y|a|e)'            __stan_j_3 = /_pnr (3/4) %;\
    /def -FP -t'jestes bardzo najedzon(y|a|e)'     __stan_j_4 = /_pnr (4/4) %;\
    /def -FP -t'wadzi ci troche'                   __stan_w_1 = /_pnr (1/6) %;\
    /def -FP -t'daje ci sie we znaki'              __stan_w_2 = /_pnr (2/6) %;\
    /def -FP -t'jest dosyc klopotliwy'             __stan_w_3 = /_pnr (3/6) %;\
    /def -FP -t'jest wyjatkowo ciezki'             __stan_w_4 = /_pnr (4/6) %;\
    /def -FP -t'jest niemilosiernie ciezki'        __stan_w_5 = /_pnr (5/6) %;\
    /def -FP -t'prawie przygniata cie do ziemi'    __stan_w_6 = /_pnr (6/6) %;\
    /def -FP -t'mentalnie u kresu sil'             __stan_m_1 = /_pnr (1/9) %;\
    /def -FP -t'mentalnie wykonczon(y|a|e)'        __stan_m_2 = /_pnr (2/9) %;\
    /def -FP -t'mentalnie wyczerpan(y|a|e)'        __stan_m_3 = /_pnr (3/9) %;\
    /def -FP -t'mentalnie w zlej kondycji'         __stan_m_4 = /_pnr (4/9) %;\
    /def -FP -t'mentalnie bardzo zmeczon(y|a|e)'   __stan_m_5 = /_pnr (5/9) %;\
    /def -FP -t'mentalnie zmeczon(y|a|e)'          __stan_m_6 = /_pnr (6/9) %;\
    /def -FP -t'mentalnie oslabion(y|a|e)'         __stan_m_7 = /_pnr (7/9) %;\
    /def -FP -t'mentalnie lekko oslabion(y|a|e)'   __stan_m_8 = /_pnr (8/9) %;\
    /def -FP -t'mentalnie w pelni sil'             __stan_m_9 = /_pnr (9/9) %;\
;    /def -FP -t''       __stan_ = /_pnr (/) %;\
    /rstart -1 1 /purge __stan_*

/def _sprzet_inicjuj = \
    /purge _jakosc_bro* %;\
    /def -p5 -P0%{ogolne_color_info_stansprzetu-B} -F -t'w znakomitym stanie.$$'            _jakosc_bro1 = /_pnr (1/7) %;\
    /def -p5 -P1%{ogolne_color_info_stansprzetu-B} -F -t'ze jest (w dobrym stanie).$$'    _jakosc_bro2 = /_pnr (2/7) %;\
    /def -p5 -P0%{ogolne_color_info_stansprzetu-B} -F -t'liczne walki wyryly na ni.* swoje pietno.$$'     _jakosc_bro3 = /_pnr (3/7) %;\
    /def -p5 -P0%{ogolne_color_info_stansprzetu-B} -F -t'w zlym stanie.$$'                 _jakosc_bro4 = /_pnr (4/7) %;\
    /def -p5 -P0%{ogolne_color_info_stansprzetu-B} -F -t'w bardzo zlym stanie.$$'             _jakosc_bro5 = /_pnr (5/7) %;\
    /def -p5 -P0%{ogolne_color_info_stansprzetu-B} -F -t'wymaga natychmiastowej konserwacji.$$'     _jakosc_bro6 = /_pnr (6/7) %;\
    /def -p5 -P0%{ogolne_color_info_stansprzetu-B} -F -t'moze peknac w kazdej chwili.$$'         _jakosc_bro7 = /_pnr (7/7) %;\
    /def -p5 -P0%{ogolne_color_info_stansprzetu-B} -F -t'lekko podniszczon[aye].$$'              _jakosc_bro8 = /_pnr (2/5) %;\
    /def -p5 -P0%{ogolne_color_info_stansprzetu-B} -F -t'kiepskim stanie.$$'                 _jakosc_bro9 = /_pnr (3/5)  %;\
    /def -p5 -P0%{ogolne_color_info_stansprzetu-B} -F -t'oplakanym stanie.$$'                 _jakosc_bro10 = /_pnr (4/5)  %;\
    /def -p5 -P0%{ogolne_color_info_stansprzetu-B} -F -t'gotow(|a|y|e) sie rozpas w kazdej chwili.$$'     _jakosc_bro11 = /_pnr (5/5) %;\
    /def -p5 -P1%{ogolne_color_info_stansprzetu-B} -F -t'Jest .*(zniszczon[aye]).$$'             _jakosc_bro12 = /_pnr (0!/5)  %;\
    /def -p5 -P1%{ogolne_color_info_stansprzetu-B} -F -t'Jest .*(zlaman[aye]).$$'             _jakosc_bro13 = /_pnr (0!/7) %;\
    /def -p5 -P%{ogolne_color_info_czassprzetu-B} -F -t'mogl(|a|o|y)by ci jeszcze bardzo dlugo sluzyc.$$'     _jakosc_bro_przetrwania1 = /_pnr (1/3)  %;\
    /def -p5 -P%{ogolne_color_info_czassprzetu-B} -F -t'mogl(|a|o|y)by ci jeszcze dlugo sluzyc.$$'         _jakosc_bro_przetrwania2 = /_pnr (2/3)  %;\
    /def -p5 -P%{ogolne_color_info_czassprzetu-B} -F -t'mogl(|a|o|y)by ci jeszcze troche sluzyc.$$'     _jakosc_bro_przetrwania3 = /_pnr (3/3) %;\
    /rstart -1 1 /purge _jakosc_bro*

/eval /def -p10 -mregexp -F -a%{ogolne_color_info_nasobie-BCgreen} -t'^Ma(|sz) na sobie .*(.)$$' _masz_przy_sobie_1 = \
    /if ({P2}!~".") \
      /def -p10 -F -a%{ogolne_color_info_nasobie-BCgreen} -t"*" _masz_przy_sobie_1a %%;\
      /def -p15 -1 -mregexp -F -a%{ogolne_color_info_nasobie-BCgreen} -t"\\\\\\\\.$$$" _masz_przy_sobie_1b=/purge _masz_przy_sobie_1a %%;\
    /endif
    
/eval /def -p20 -mregexp -F -a%{ogolne_color_info_przysobie-Cgreen} -t'^Masz przy sobie .*([^\\\\.]|\\\\.)$$' _masz_przy_sobie_2 =\
    /if ({P1}!~".") \
      /def -p20 -F -a%{ogolne_color_info_przysobie-Cgreen} -t"*" _masz_przy_sobie_2a %%;\
      /def -p25 -1 -mregexp -F -a%{ogolne_color_info_przysobie-Cgreen} -t"\\\\\\\\.$$$" _masz_przy_sobie_2b=/purge _masz_przy_sobie_2a %%;\
    /endif

/eval /def -p10 -F -a%{ogolne_color_wrekach-BCmagenta} -mregexp -t'^Trzyma(|sz) ' _masz_przy_sobie_4

/eval /def -p10 -F -a%{ogolne_color_naplecach-Cmagenta} -mregexp -t'^(przez plecy ma(sz|) przewieszon|na plecach ma(sz|) skrzyzowan|na plecach przewieszon. ma|(przy|na) .* ma(sz|) przypiet.* (zawierajac|z tkwiac.* w ni))' _masz_przy_sobie_5

;-------------------------------------------------------------------------------
;|                                MOWA                                         |
;-------------------------------------------------------------------------------

/eval /def -a%{ogolne_color_mowa_pyta-BCyellow} -p500 -mregexp -t'[Pp]yta( sie ciebie|sz .*) o'     _mowi_pyta
/eval /def -a%{ogolne_color_mowa_krzyczy-BCyellow} -p500 -t'*krzyczy*:*' _mowi_krzyczy
/eval /def -a%{ogolne_color_mowa_szepce-BCyellow} -p500 -t'*szepcze*:*'  _mowi_szepcze

/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*mowi*:*'        _mowi_mowi
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*szepce*:*'       _mowi_szepce
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*syczy*:*'       _mowi_syczy
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*marudzi*:*'      _mowi_marudzi
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*zawodzi*:*'      _mowi_zawodzi
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*huczy*:*'        _mowi_huczy
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*brzeczy*:*'      _mowi_brzeczy
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*bulgocze*:*'    _mowi_bulgocze
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*spiewa*:*'      _mowi_spiewa
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*dudni*:*'       _mowi_dudni
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*mruczy*:*'       _mowi_mruczy
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*nuci*:*'         _mowi_nuci
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*skrzypi*:*'      _mowi_skrzypi
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*piszczy*:*'      _mowi_piszczy
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*skrzeczy*:*'     _mowi_skrzeczy
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*burczy*:*'       _mowi_burczy
/eval /def -a%{ogolne_color_mowa_mowi-BCred} -p500 -t'*grzmi*:*'        _mowi_grzmi

/eval /def -a%{ogolne_color_mowa_inne-BCred} -p0 -F -t'*: *'                 _mowi_inne

;-------------------------------------------------------------------------------
;|                                WALKA                                        |
;-------------------------------------------------------------------------------
/def -p4 -PB -F -t'wyparowany przez'         _cosik_parujy1 = /_anty_flood_hide 2
/def -p4 -PB -F -t' oslania sie '            _cosik_parujy2 = /_anty_flood_hide 2
/def -p4 -PB -F -t'udaje (ci |)sie oslonic'  _cosik_parujy3 = /_anty_flood_hide 2
/def -p4 -PB -F -t'udaje sie sparowac'       _cosik_parujy4 = /_anty_flood_hide 2
/def -p4 -PB -F -t'udaje sie uniknac'        _cosik_parujy5 = /_anty_flood_hide 2
/def -p4 -PB -F -t'udaje sie je zbic'        _cosik_parujy6 = /_anty_flood_hide 2
/def -p4 -PB -F -t'udaje sie go sparowac'    _cosik_parujy7 = /_anty_flood_hide 2
/def -p4 -PB -F -t' paruje go '              _cosik_parujy8 = /_anty_flood_hide 2
/def -p4 -PB -F -t' uskakuje przed '         _cosik_parujy9 = /_anty_flood_hide 2
/def -p4 -PB -F -t'zbija je z linii ataku'   _cosik_parujy10 = /_anty_flood_hide 2
/def -p4 -PB -F -t'udaje sie zbic'           _cosik_parujy11 = /_anty_flood_hide 2
/def -p4 -PB -F -t'nie udaje sie trafic'     _cosik_parujy12 = /_anty_flood_hide 2

/def -Fp15 -P0hCblue     -t'^Ledwo muskasz '                _walka_lmuskasz
/def -Fp15 -P0hCblue     -t'^Lekko ranisz '                 _walka_lranisz
/def -Fp15 -P0hCblue     -t'^Ranisz '                     _walka_ranisz
/def -Fp15 -P0BCblue     -t'^Powaznie ranisz '             _walka_pranisz 
/def -Fp15 -P0BCblue     -t'^Bardzo ciezko ranisz '         _walka_bcranisz 
/def -Fp15 -P0BCblue     -t'^Masakrujesz '                 _walka_masakrujesz 
/def -Fp12 -P1xhCred     -t' (ledwo muska) cie .* trafiajac cie'         _walka_cie_muska 
/def -Fp12 -P1xhCred     -t' (lekko rani) cie .* trafiajac cie'             _walka_cie_lrani 
/def -Fp13 -P1xhCred     -t'(?<!lekko|powaznie|bardzo ciezko) (rani) cie .* trafiajac cie'    _walka_cie_rani 
/def -Fp12 -P1xBCred     -t' (powaznie rani) cie .* trafiajac cie'         _walka_cie_prani 
/def -Fp12 -P1xBCred     -t' (bardzo ciezko rani) cie .* trafiajac cie'     _walka_cie_bcrani 
/def -Fp12 -P1xBCred     -t' (masakruje) cie .* trafiajac cie'             _walka_cie_maskruje 
/def -Fp14 -P1hCmagenta -t' (ledwo muska) (?!cie ).*, trafiajac (go|ja|je) w'        _walka_ktos_lmuska = /_anty_flood_hide 4
/def -Fp14 -P1hCmagenta -t' (lekko rani) (?!cie ).*, trafiajac (go|ja|je) w'         _walka_ktos_lrani = /_anty_flood_hide 4
/def -Fp15 -P1hCmagenta -t'(?<!lekko|powaznie|bardzo ciezko) (rani) (?!cie ).*, trafiajac (go|ja|je) w' _walka_ktos_rani = /_anty_flood_hide 4
/def -Fp14 -P1BCmagenta -t' (powaznie rani) (?!cie ).*, trafiajac (go|ja|je) w'         _walka_ktos_prani = /_anty_flood_hide 6
/def -Fp14 -P1BCmagenta -t' (bardzo ciezko rani) (?!cie ).*, trafiajac (go|ja|je) w' _walka_ktos_bcrani = /_anty_flood_hide 6
/def -Fp14 -P1BCmagenta -t' (masakruje) (?!cie ).*, trafiajac (go|ja|je) w'            _walka_ktos_masakruje = /_anty_flood_hide 6

/def -ah -F -mregexp -t'^(Probujesz trafic|Nie udaje ci sie|Robisz zamach|Ranisz|Lekko ranisz|Trafiasz|Ledwo muskasz|Powaznie ranisz|Bardzo ciezko ranisz|Masakrujesz) .* (piescia|noga|lokciem|kolanem|stopa)' _walcze_bez_broni = \
    /echo -p @{B}       @{nBCred}W A L C Z Y S Z    B E Z   B R O N I! %; /fast_bind /db

;------------------------------------------------------------------------------
;                            SPECE                                            |
;------------------------------------------------------------------------------
; 1 - kolor
; 2 - skrot
; 3 - poziom obrazen (x/y)
; 4 - kto
; 5 - kogo
; 6 - czym
; 7 - jak mocno (masakruje/rani)
; 8 - poziom antyflooda
/def _psnr = \
    /let _kolor=%{1} %;\
    /let _skrot=%{2} %;\
    /let _poz_ob=%{3} %;\
    /let _kto=%{4} %;\
    /let _kogo=%{5} %;\
    /let _czym=%{6} %;\
    /let _jak=%{7} %;\
    /let _af=%{8} %;\
    /let _sub_op=$[strcat({PL}, {P0}, {PR})] %;\
    /let _sub_col=@{%{ogolne_color_spec_inny-n}} %;\
    /if (_kto =~ "TY") \
        /let _sub_col=@{%{ogolne_color_spec_ty-BCblack}} %;\
    /elseif (_kogo =~ "ciebie" | _kogo =~ "cie") \
        /let _sub_col=@{%{ogolne_color_spec_ciebie-BCred}} %;\
    /elseif (strstr(strcat("|", {ogolne_druzyna-druzyna}, "|", {ogolne_leader-leader}, "|"), strcat("|", tolower({_kto}), "|")) > -1) \
        /let _sub_col=@{%{ogolne_color_spec_druzyna-n}} %;\
    /elseif (strstr(strcat("|", {ogolne_druzyna_bie-druzyna_bie}, "|", {ogolne_leader_bie-leader_bie}, "|"), strcat("|", tolower({_kogo}), "|")) > -1) \
        /test _zaslona_set(toupper({_kto}, 1), toupper({_kogo}, 1)) %;\
        /let _sub_col=@{%{ogolne_color_spec_druzyne-BCmagenta}} %;\
    /endif %;\
    /if ({_af} & ogolne_anty_flood_level >= {_af}) \
        /return substitute("", "gL", 0) %;\
    /endif %;\
    /let _sub_beg=$[strcat("@{BCgreen}>> ", {_kolor}, {_skrot}, " @{BCgreen}SPEC")] %;\
    /let _sub_end=$[strcat("@{BCwhite}", {ogolne_literki_na_cyferki} ? strcat(" ", {_poz_ob}) : "", " @{BCgreen}<< @{n}")] %;\
    /if (ogolne_literki_na_cyferki == 2 & {#} > 3) \
        /let _sub_op=$[strcat(_sub_col, toupper({_kto}, 1), "@{n} -> ", _sub_col, toupper({_kogo}, 1), "@{n} (", _sub_col, {_czym}, "@{n})")] %;\
    /endif %;\
    /return substitute(decode_attr(strcat(_sub_beg, _sub_end, _sub_op))) 

/def _psnr2 = \
    /let _poz_ob=%{1} %;\
    /let _kogo=%{2} %;\
    /let _msg_col=@{%{ogolne_color_spec_inny-n}} %;\
    /if (ogolne_literki_na_cyferki != 2 | {#} < 1) \
        /return %;\
    /endif %;\
    /if (_kogo =~ "ciebie" | _kogo =~ "cie") \
        /let _msg_col=@{%{ogolne_color_spec_ciebie-BCred}} %;\
    /elseif (strstr(strcat("|", {ogolne_druzyna-druzyna}, "|", {ogolne_leader-leader}, "|"), strcat("|", tolower({_kto}), "|")) > -1) \
        /let _msg_col=@{%{ogolne_color_spec_druzyna-n}} %;\
    /elseif (strstr(strcat("|", {ogolne_druzyna_bie-druzyna_bie}, "|", {ogolne_leader_bie-leader_bie}, "|"), strcat("|", tolower({_kogo}), "|")) > -1) \
        /let _msg_col=@{%{ogolne_color_spec_druzyne-BCmagenta}} %;\
    /endif %;\
    /let _msg=$[strcat("@{BCwhite}", "    +", " @{BCgreen}SPEC ", "@{BCwhite}", {_poz_ob}, "@{n}         -> ", _sub_col, toupper({_kogo}, 1))] %;\
;    /let _msg=$[strcat("@{BCgreen}>> ", {_kolor}, {_skrot}, " @{BCgreen}SPEC ", "@{BCwhite}", {_poz_ob}, " @{BCgreen}<< @{n}", _sub_col, "@{n}     -> ", _sub_col, toupper({_kogo}, 1))] %;\
    /repeat -0.001 1 /test echo("%{_msg}", "", 1)


;---------IMPERIALNY----------
;dzialaja wg NOWEGO antyflooda
;2 osoba
/def -Fp5 -P3nCgreen -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), lecz tobie udaje sie go (uniknac)\\.$' _spec_std_pudlo_1 = /return _psnr("@{nCred}", "IMP", "(0/6)", {P1}, "cie", {P2}, {P3}, 2)
/def -Fp5 -P3nCgreen -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), lecz ty (zbijasz) go' _spec_std_pudlo_2 = /return _psnr("@{nCred}", "IMP", "(0/6)", {P1}, "cie", {P2}, {P3}, 2)
/def -Fp5 -P3nCgreen -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), lecz sprawnie (parujesz) go' _spec_std_pudlo_3 = /return _psnr("@{nCred}", "IMP", "(0/6)", {P1}, "cie", {P2}, {P3}, 2)
/def -Fp5 -P3nCgreen -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), lecz .* (zatrzymuje) sie na tw(ym|ej)' _spec_std_pudlo_4 = /return _psnr("@{nCred}", "IMP", "(0/6)", {P1}, "cie", {P2}, {P3}, 2)
/def -Fp5 -P3nCred -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), ktory (ledwo muska) (cie) w' _spec_std_trafiony_1 = /return _psnr("@{nCred}", "IMP", "(1/6)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3nCred -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), ktory (lekko rani) (cie) w' _spec_std_trafiony_2 = /return _psnr("@{nCred}", "IMP", "(2/6)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3nCred -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), ktory (rani) (cie) w' _spec_std_trafiony_3 = /return _psnr("@{nCred}", "IMP", "(3/6)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3BCred -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), ktory (powaznie rani) (cie) w' _spec_std_trafiony_4 = /return _psnr("@{nCred}", "IMP", "(4/6)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3BCred -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), ktory (bardzo ciezko rani) (cie) w' _spec_std_trafiony_5 = /return _psnr("@{nCred}", "IMP", "(5/6)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3BCred -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), ktory (niemal smiertelnie rani) (cie) w' _spec_std_trafiony_6 = /return _psnr("@{nCred}", "IMP", "(5/6)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3BCred -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), ktory (masakruje) (cie) w' _spec_std_trafiony_7 = /return _psnr("@{nCred}", "IMP", "(6/6)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P2BCred -t'^Nagle (.*) (rozrabuje) .* natychmiast powalajac cie na ziemie\\.$$' _spec_std_trafiony_8 =   /_psnr @{nCred} IMP (6/6) 
;3 osoba
/def -Fp5 -P4nCgreen -t'^Nagle (.*) wykonuje zamaszysty cios (.*) celujac w ([^,]*), lecz temu udaje sie go (uniknac)\\.$' _spec_std_pudlo_1a = /return _psnr("@{nCred}", "IMP", "(0/6)", {P1}, {P3}, {P2}, {P4}, 2)
/def -Fp5 -P3nCgreen -t'^Nagle (.*) wykonuje zamaszysty cios (.*) celujac w ([^,]*), lecz ten (zbija go)' _spec_std_pudlo_2a = /return _psnr("@{nCred}", "IMP", "(0/6)", {P1}, {P3}, {P2}, {P4}, 2)
/def -Fp5 -P3nCgreen -t'^Nagle (.*) wykonuje zamaszysty cios (.*) celujac w ([^,]*), lecz ten (paruje go)' _spec_std_pudlo_3a = /return _psnr("@{nCred}", "IMP", "(0/6)", {P1}, {P3}, {P2}, {P4}, 2)
/def -Fp5 -P3nCgreen -t'^Nagle (.*) wykonuje zamaszysty cios (.*) celujac w ([^,]*), lecz uderzenie (zatrzymuje sie na)' _spec_std_pudlo_4a = /return _psnr("@{nCred}", "IMP", "(0/6)", {P1}, {P3}, {P2}, {P4}, 2)
/def -Fp5 -P3nCgreen -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), ktory (ledwo muska) (?!cie)(.*) w' _spec_std_trafiony_1a = /return _psnr("@{nCred}", "IMP", "(1/6)", {P1}, {P4}, {P2}, {P3}, 8)
/def -Fp5 -P3nCgreen -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), ktory (lekko rani) (?!cie)(.*) w' _spec_std_trafiony_2a = /return _psnr("@{nCred}", "IMP", "(2/6)", {P1}, {P4}, {P2}, {P3}, 8)
/def -Fp5 -P3nCgreen -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), ktory (rani) (?!cie)(.*) w' _spec_std_trafiony_3a = /return _psnr("@{nCred}", "IMP", "(3/6)", {P1}, {P4}, {P2}, {P3}, 8)
/def -Fp5 -P3BCgreen -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), ktory (powaznie rani) (?!cie)(.*) w' _spec_std_trafiony_4a = /return _psnr("@{nCred}", "IMP", "(4/6)", {P1}, {P4}, {P2}, {P3}, 9)
/def -Fp5 -P3BCgreen -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), ktory (bardzo ciezko rani) (?!cie)(.*) w' _spec_std_trafiony_5a = /return _psnr("@{nCred}", "IMP", "(5/6)", {P1}, {P4}, {P2}, {P3}, 9)
/def -Fp5 -P3BCgreen -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), ktory (niemal smiertelnie rani) (?!cie)(.*) w' _spec_std_trafiony_6a = /return _psnr("@{nCred}", "IMP", "(5/6)", {P1}, {P4}, {P2}, {P3}, 9)
/def -Fp5 -P3BCgreen -t'^Nagle (.*) wykonuje zamaszysty cios ([^,]*), ktory (masakruje) (?!cie)(.*) w' _spec_std_trafiony_7a = /return _psnr("@{nCred}", "IMP", "(6/6)", {P1}, {P4}, {P2}, {P3}, 9)

;---------GOBLINOIDY----------
/def -Fp5 -P4nCgreen -t'^Nozdrza (.*) na moment rozchylaja sie, by glosnym swistem wciaganego powietrza ostrzec cie przed wlasnie wyprowadzanym morderczym ciosem. W pore mozesz wiec nadstawic (swa|swoj) (.*), (zbijajac) uderzenie i momentalnie przechodzac do przeciwnatarcia\\.$$'  _spec_goby_pudlo_1 = /return _psnr("@{nCred}", "IMP", "(0/6)", {P1}, "cie", {P3}, {P2}, 2)
/def -Fp5 -P3nCgreen -t'^W slepiach (.*) pojawia sie nienawistny blysk, gdy zdecydowanym uderzeniem (.*) (przecina powietrze) tuz przed twoja glowa\\.$$'  _spec_goby_pudlo_2 = /return _psnr("@{nCred}", "IMP", "(0/6)", {P1}, "cie", {P2}, {P3}, 2)
/def -Fp5 -P2nCgreen -t'^Z gardla (.*) wydobywa sie porazajacy ryk, gdy jego uderzenie (zeslizguje) sie po (twym|ej)' _spec_goby_pudlo_3 = /return _psnr("@{nCred}", "IMP", "(0/6)", {P1}, "cie", {PR}, {P2}, 2)
/def -Fp5 -P2nCgreen -t'^Szybkim pchnieciem (.*) (zbijasz na bok) niespodziewany cios' _spec_goby_pudlo_4 = /return _psnr("@{nCred}", "IMP", "(0/6)", {PR}, "cie", {P1}, {P2}, 2)
/def -Fp5 -P3nCred -t'^W slepiach (.*) pojawia sie nienawistny blysk, gdy zdecydowanym uderzeniem (.*) (kaleczy ci)' _spec_goby_1 = /return _psnr("@{nCred}", "IMP", "(1/6)", {P1}, "cie", {P2}, {P3})
/def -Fp5 -P3nCred -t'^W slepiach (.*) pojawia sie nienawistny blysk, gdy zdecydowanym uderzeniem (.*) (rozkrwawia ci)' _spec_goby_2 = /return _psnr("@{nCred}", "IMP", "(2/6)", {P1}, "cie", {P2}, {P3})
/def -Fp5 -P3nCred -t'^W slepiach (.*) pojawia sie nienawistny blysk, gdy zdecydowanym uderzeniem (.*) (rani ci)' _spec_goby_3 = /return _psnr("@{nCred}", "IMP", "(3/6)", {P1}, "cie", {P2}, {P3})
/def -Fp5 -P3nBCred -t'^W slepiach (.*) pojawia sie nienawistny blysk, gdy zdecydowanym uderzeniem (.*) wprost (rozrabuje ci)' _spec_goby_5  = /return _psnr("@{nCred}", "IMP", "(6/6)", {P1}, "cie", {P2}, {P3})


;-----------------ZT------------------
;3 osoba
;dwureki 
/def -Fp5 -P3xnCgreen -t' zawija oburacz (.*) i wyprowadza znad glowy.*mijajac (.*) ledwie o wlos, (z hukiem trafia w podloze)\\.$' _zabojcy_spec_inny_0 = /return _psnr("@{BCblue}", "ZT", "(0/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xnCgreen -t' kreci nad glowa szerokiego mlynca ([^,]*), a.*cichym jekiem ([^,]*), .*(znaczac swoj lot krwawa smuga)\\.$' _zabojcy_spec_inny_1 = /return _psnr("@{BCblue}", "ZT", "(1/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xnCgreen -t' nie baczac na ciosy (.*) odwaznie napiera .* uderzeniem (.*) zbija.*(z przenikliwym swistem trafia przeciwnika)' _zabojcy_spec_inny_2 = /return _psnr("@{BCblue}", "ZT", "(2/5)", {PL}, {P1}, {P2}, {P3})
/def -Fp5 -P3xBCgreen -t' unosi nad glowa (.*) i wsrod najciezszych.* wprost na (.*). Dopadajac .* (serie morderczych ciosow)' _zabojcy_spec_inny_3 = /return _psnr("@{BCblue}", "ZT", "(3/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xBCgreen -t' z potepienczym wrzaskiem wywija (.*) i nagle.* spada na ([^.]*)\\. Prowadzone zza glowy.*(charczac i plujac na boki krwia przeciwnika)\\.$' _zabojcy_spec_inny_4 = /return _psnr("@{BCblue}", "ZT", "(4/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xBCgreen -t' ujmuje mocniej (.*) i napinajac.*rusza na ([^.]*)\\. Wyprzedzajac.*(uwalniajac zywioly niosace ostrze jego broni przez rozrywane cialo przeciwnika)\\.$' _zabojcy_spec_inny_5 = /return _psnr("@{BCblue}", "ZT", "(5/5)", {PL}, {P2}, {P1},{P3})
;jednoreki
/def -Fp5 -P3xnCgreen -t' z paskudnie wykrzywiona twarza rusza na ([^,]*), mlynkujac nad glowa ([^.]*)\\..*(nie czyniac blednacemu przeciwnikowi zadnej (?:szkody|krzywdy))\\.$$' _zabojcy_spec_inny_2_0 = /return _psnr("@{BCblue}", "ZT", "(0/5)", {PL}, {P1}, {P2}, {P3})
/def -Fp5 -P3xnCgreen -t' pozorujac atak z gory zmusza (.*) do odsloniecia sie.*drugiej reki (.*) w [^,]*, .*(niezbyt gleboka rane)\\.$$' _zabojcy_spec_inny_2_1 = /return _psnr("@{BCblue}", "ZT", "(1/5)", {PL}, {P1}, {P2}, {P3})
/def -Fp5 -P2xnCgreen -t' gwaltownym susem wchodzi pod pedzacy na niego cios ([^.]*)\\. Krzyzujac [^,]*, (zaglebiajac ostrze (.*) w ciele przeciwnika)\\.$$' _zabojcy_spec_inny_2_2 = /return  _psnr("@{BCblue}", "ZT", "(2/5)", {PL}, {P1},decode_attr(strcat("@{nCwhite}",{P3})), {P2})
/def -Fp5 -P3xBCgreen;RxBCgreen -t' dodajac sobie animuszu mocnymi machnieciami (.*) rzuca sie z rykiem na ([^.]*)\\. Przetaczajac sie[^,]*, (z calej sily rabiac zaskoczonego przeciwnika)' _zabojcy_spec_inny_2_3 = /return _psnr("@{BCblue}", "ZT", "(3/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xBCgreen -t' zgrzytajac wsciekle zebami uderza raz po raz ostrzami (toporow) o siebie.* zasypujac (.*) huraganem skosnych ciec\\..*(dzikie zadowolenie z zadanych ran)\\.$$' _zabojcy_spec_inny_2_4 = /return _psnr("@{BCblue}", "ZT", "(4/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P2xBCgreen -t' napina miesnie karku,.* rusza w kierunku ([^.]*)\\. Zbijajac w biegu[^,]*, gdy (martwe cialo pada glucho na ziemie)\\.$$' _zabojcy_spec_inny_2_5 = /return _psnr("@{BCblue}", "ZT", "(5/5)", {PL}, {P1}, "toporow", {P3})
;ZT-antyflood
/def -Fp4 -P1Cmagenta -t'uderza od boku.*(nieznacznie raniac)' _zt_cios_inny_1 = /_anty_flood_hide 4 
/def -Fp4 -P1Cmagenta -t'z lekkiego wymachu (rani)[^s]' _zt_cios_inny_2 = /_anty_flood_hide 4
/def -Fp4 -P1Cmagenta -t'wykonuje solidny zamach.*(powaznie godzac)' _zt_cios_inny_3 = /_anty_flood_hide 6
/def -Fp4 -P1BCmagenta -t'silnym ciosem.*(mocno kaleczy)[^s]' _zt_cios_inny_4 = /_anty_flood_hide 6
/def -Fp4 -P0BCmagenta -t'z chrzestem zaglebiajac ostrze' _zt_cios_inny_5 = /_anty_flood_hide 6 
/def -Fp4 -P1BCmagenta -t'skretem tulowia nadaje impet.*(z potworna sila uderza)' _zt_cios_inny_6 = /_anty_flood_hide 6 
/def -Fp4 -P1BCmagenta;RBCmagenta -t'masakruje przeciwnika, (odrabujac mu przy tym|nieomal przerabujac [^ ]* na pol\\.$)' _zt_cios_inny_7 = /_anty_flood_hide 6
/def -Fp5 -PxB -t'unika tego ciosu'  _zt_unik_inny = /_anty_flood_hide 2
/def -Fp5 -P1xB -t'iskry.* ((przyjmuje|zbija) ten cios)'  _zt_parowanie_inny = /_anty_flood_hide 2
/def -Fp5 -P1xB;2xB -t'ostatniej chwili (udaje sie zaslonic)|(uderzeniu jego broni w)'  _zt_tarcza_inny = /_anty_flood_hide 2


; ---------- MC --------------- 
; brak 1 osoby, nie rozdzielone ciosy w ciebie/kogos 
/def -Fp5 -P4xnCgreen -t' bierze potezny zamach i wyprowadza (.*) cios, ktory ma (cie |)zmasakrowac([^.]*|)\\. .* (nie czyniac przeciwni(?:kowi|czce) najmniejszej krzywdy|nawet przez chwile .* nie zagrazajac)' _mutki_spec_0 = /return _psnr("@{nCred}", "MC", "(0/7)", {PL}, strcat({P2},{P3}), {P1}, {P4})
/def -Fp5 -P2xnCgreen -t' (?:dostrzegajac luke w obronie przeciwni|usmiecha sie przebiegle|wykonuje szybki, szalony piruet|wykrzywia twarz w grymasie|zaciska mocniej palce|krzywi wargi w pelnym satysfakcji|usmiecha sie czujac rozkosz).* rzuca sie do ataku.* trafia (.*) w .* (ledwo muskajac) (?:go |ja |je |)([^.]*)\\.$' _mutki_spec_1 = /return _psnr("@{nCred}", "MC", "(1/7)", {PL}, {P1}, {P3}, {P2})
/def -Fp5 -P2xnCgreen -t' (?:dostrzegajac luke w obronie przeciwni|usmiecha sie przebiegle|wykonuje szybki, szalony piruet|wykrzywia twarz w grymasie|zaciska mocniej palce|krzywi wargi w pelnym satysfakcji|usmiecha sie czujac rozkosz).* rzuca sie do ataku.* trafia (.*) w .* (lekko raniac) (?:go |ja |je |)([^.]*)\\.$' _mutki_spec_2 = /return _psnr("@{nCred}", "MC", "(2/7)", {PL}, {P1}, {P3}, {P2})
/def -Fp5 -P2xnCgreen -t' (?:dostrzegajac luke w obronie przeciwni|usmiecha sie przebiegle|wykonuje szybki, szalony piruet|wykrzywia twarz w grymasie|zaciska mocniej palce|krzywi wargi w pelnym satysfakcji|usmiecha sie czujac rozkosz).* rzuca sie do ataku.* trafia (.*) w .* ((?<!lekko |powaznie |bardzo ciezko )raniac)(?: go| ja| je|) ([^.]*)\\.$' _mutki_spec_3 = /return _psnr("@{nCred}", "MC", "(3/7)", {PL}, {P1}, {P3}, {P2})
/def -Fp5 -P2xBCgreen -t' (?:dostrzegajac luke w obronie przeciwni|usmiecha sie przebiegle|wykonuje szybki, szalony piruet|wykrzywia twarz w grymasie|zaciska mocniej palce|krzywi wargi w pelnym satysfakcji|usmiecha sie czujac rozkosz).* rzuca sie do ataku.* trafia (.*) w .* (powaznie raniac)(?: go| ja| je|) ([^.]*)\\.$' _mutki_spec_4 = /return _psnr("@{nCred}", "MC", "(4/7)", {PL}, {P1}, {P3}, {P2})
/def -Fp5 -P2xBCgreen -t' (?:dostrzegajac luke w obronie przeciwni|usmiecha sie przebiegle|wykonuje szybki, szalony piruet|wykrzywia twarz w grymasie|zaciska mocniej palce|krzywi wargi w pelnym satysfakcji|usmiecha sie czujac rozkosz).* rzuca sie do ataku.* trafia (.*) w .* (bardzo ciezko raniac)(?: go| ja| je|) ([^.]*)\\.$' _mutki_spec_5 = /return _psnr("@{nCred}", "MC", "(5/7)", {PL}, {P1}, {P3}, {P2})
/def -Fp5 -P2xBCgreen -t' (?:dostrzegajac luke w obronie przeciwni|usmiecha sie przebiegle|wykonuje szybki, szalony piruet|wykrzywia twarz w grymasie|zaciska mocniej palce|krzywi wargi w pelnym satysfakcji|usmiecha sie czujac rozkosz).* rzuca sie do ataku.* trafia (.*) w .* (masakrujac)(?: go| ja| je|) ([^.]*)\\.$' _mutki_spec_6 = /return _psnr("@{nCred}", "MC", "(6/7)", {PL}, {P1}, {P3}, {P2})
/def -Fp5 -P4xBCgreen -t'^Wykrzykujac glosno imie (?:[^ ]*) (.*) staje pewnie.*uderzenie ([^.]*)\\. Bezlitosny, okrutny cios trafia (.*) zaglebiajac.*(osuwa sie powoli na ziemie)' _mutki_spec_7a = /return _psnr("@{nCred}", "MC", "(7/7)", {P1}, {P3}, {P2}, {P4})
/def -Fp5 -P3xBCgreen -t' staje pewnie.*uderzenie ([^.]*)\\. Bezlitosny, okrutny cios trafia (.*) zaglebiajac.*(osuwa sie powoli na ziemie)' _mutki_spec_7b = /return _psnr("@{nCred}", "MC", "(7/7)", {PL}, {P2}, {P1}, {P3})

; --------- Najmy stare -------
; pika - narazie w komentarz jakby sie pojawil ktos kto zachowal te umy to dodamy
/purge _najmy_spec_*
/def -Fp5 -P2xnCgreen -t' chwyta .* skupia swoja uwage nie na (.*) a na .*(unika smiercionosnego ciosu|kluje powietrze tuz obok)\\.$' _najmy_spec_0 = /return _psnr("@{nCblue}", "NA", "(0/6)", {PL}, {P1}, "drzewcem")
/def -Fp5 -P2xnCgreen -t' chwyta .* i wyprowadza .*niezbyt mocny, trafia (.*) w .*(otwierajac niewielka, (choc na pewno|aczkolwiek) bolesna rane)\\.$' _najmy_spec_1 = /return _psnr("@{nCblue}", "NA", "(1/6)", {PL}, {P1}, "drzewcem")
/def -Fp5 -P2xnCgreen -t' chwyta .* i wykonuje .* pchniecie, ktore dosiega (.*). Mimo .*(paskudna rana).* przez ostrze (.*)\\.$' _najmy_spec_1a = /return _psnr("@{nCblue}", "NA", "(1/6)", {PL}, {P1}, {P3})
/def -Fp5 -P2xnCgreen -t' chwyta .* udaje sie mu trafic (.*) w .*(Czerwonawy slad na broni)' _najmy_spec_2 = /return _psnr("@{nCblue}", "NA", "(2/6)", {PL}, {P1}, "drzewcem")
/def -Fp5 -P3xnCgreen -t' chwyta .* omija zaslone (.*) i z.*ostrze (.*) zadaje .*(gleboka, poszarpana rane)' _najmy_spec_2a = /return _psnr("@{nCblue}", "NA", "(2/6)", {PL}, {P1}, {P2})
/def -Fp5 -P2xnCgreen -t' chwyta .* trudnosci dosiega (.*) trafiajac .* (wewnetrzne obrazenia)\\.$' _najmy_spec_3 = /return _psnr("@{nCblue}", "NA", "(3/6)", {PL}, {P1}, "drzewcem")
/def -Fp5 -P2xnCgreen -t' chwyta .* trafia z impetem (.*) zaglebiajac .* (usmiech satysfakcji)\\.$' _najmy_spec_3a = /return _psnr("@{nCblue}", "NA", "(3/6)", {PL}, {P1}, "drzewcem")
/def -Fp5 -P2xnCgreen -t' zaciska .* calego ciala wybija (.*) z rytmu walki .* (momentalnie bucha strumien purpurowej krwi)\\.$' _najmy_spec_4 = /return _psnr("@{nCblue}", "NA", "(4/6)", {PL}, {P1}, "drzewcem")
/def -Fp5 -P3xnCgreen -t' chwyta .*doskakujac szybko do (.*) wyprowadza .* pchniecie, zaglebiajac ostrze (.*) gleboko w .* (ogromnej rany natychmiast zaczyna tryskac krew)\\.$' _najmy_spec_4a = /return _psnr("@{nCblue}", "NA", "(4/6)", {PL}, {P1}, {P2})
/def -Fp5 -P2xnCgreen -t' chwyta .* potezna sile trafia (.*) w .* (kojarzy ci sie z lamaniem kosci)\\!$' _najmy_spec_5 = /return _psnr("@{nCblue}", "NA", "(5/6)", {PL}, {P1}, "drzewcem")
/def -Fp5 -P3xnCgreen -t' chwyta .* potezna sila trafia (.*) ([a-z]+ [a-z]+ (kosa|wlocznia|naginata|halabarda|korseka|glewia).*) w .*(blyskaja biela pokruszone kosci)\\.$' _najmy_spec_5a = /return _psnr("@{nCblue}", "NA", "(5/6)", {PL}, {P1}, {P2})
/def -Fp5 -P3xnCgreen -t' chwyta .* ktory zaglebia (.*) w ciele (.*). Dopiero.*(osuwa sie na ziemie)' _najmy_spec_6 = /return _psnr("@{nCblue}", "NA", "(6/6)", {PL}, {P2}, {P1})
/def -Fp5 -P3xnCgreen -t', jakby wyczuwajac .* Ostrze (.*) z impetem przebija na wylot cialo (.*), ktor.*(triumfalnym usmiecham)' _najmy_spec_6a = /return _psnr("@{nCblue}", "NA", "(6/6)", {PL}, {P2}, {P1})
; palka - conajmniej 2 osoby na arce jeszcze maja i uzywaja
/purge _najmy_spec_p_*
/def -Fp5 -P1xnCgreen -t' napina wszystkie miesnie.*(tym razem nie udalo)' _najmy_spec_p_0 = /_anty_flood_hide 1
/def -Fp5 -P3xBCgreen -t' (?:bardzo |)mocno napina wszystkie miesnie.* ruchem uderza (.*) ([a-z]+ [a-z]+ [a-z]+) w glowe .*(mocno|lekko|bolesnie|calkowicie)' _najmy_spec_p_1 = /return _psnr("@{nCblue}", "NA", "(x/x)", {PL}, {P1}, {P3})

; --------- Najmy nowe -------
; Przeciagniecie na drugiego npca.
/def -Fp6 -P1xnCgreen -mregexp -t'(muskajac) (.*) samym sztychem broni\\.$$' _miecznik_spec_a1 = /return _psnr2("(1/6)", {P2})
/def -Fp6 -P1xnCgreen -mregexp -t'(lekko raniac) (.*) samym sztychem broni\\.$$' _miecznik_spec_a2 = /return _psnr2("(2/6)", {P2})
/def -Fp6 -P1xnCgreen -mregexp -t'(?<!lekko )(raniac) (.*) samym sztychem broni\\.$$' _miecznik_spec_a3 = /return _psnr2("(3/6)", {P2})
/def -Fp6 -P1xBCgreen -mregexp -t'(?<!paskudnie )(kaleczac) (.*) samym sztychem broni\\.$$' _miecznik_spec_a4 = /return _psnr2("(4/6)", {P2})
/def -Fp6 -P1xBCgreen -mregexp -t'(paskudnie kaleczac) (.*) samym sztychem broni\\.$$' _miecznik_spec_a5 = /return _psnr2("(5/6)", {P2})
; Glowny cios.
/def -Fp5 -P3xnCgreen -mregexp -t'^(?:Nie zwazajac na nic |)(.*) (?:poprawia chwyt na swym|wyrzuca do przodu swoj|niespodziewanie skreca tulow, wyprowadzajac przy tym oburacz dlugie uderzenie|rozpoczyna oburacz potezny mlyniec|rusza do przodu, w pol kroku wyprowadzajac oburacz szybkie uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadza nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore jednak (zeslizguje sie) po (?:[a-z]* [a-z]* [a-z]* (bojowej |bojowym |rycerskim |))([^.]*)\\.'               _miecznik_spec_0a = /return _psnr("@{nCblue}", "NA", "(0/8)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3xnCgreen -mregexp -t'^(?:Nie zwazajac na nic |)(.*) (?:poprawia chwyt na swym|wyrzuca do przodu swoj|niespodziewanie skreca tulow, wyprowadzajac przy tym oburacz dlugie uderzenie|rozpoczyna oburacz potezny mlyniec|rusza do przodu, w pol kroku wyprowadzajac oburacz szybkie uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadza nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore tylko (jakims cudem nie dosiega) ([^.]*)\\.'                                    _miecznik_spec_0 = /return _psnr("@{nCblue}", "NA", "(0/8)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3xnCgreen -mregexp -t'^(?:Nie zwazajac na nic |)(.*) (?:poprawia chwyt na swym|wyrzuca do przodu swoj|niespodziewanie skreca tulow, wyprowadzajac przy tym oburacz dlugie uderzenie|rozpoczyna oburacz potezny mlyniec|rusza do przodu, w pol kroku wyprowadzajac oburacz szybkie uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadza nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (ledwo zacina) ([^.]*) w '                                                      _miecznik_spec_1 = /return _psnr("@{nCblue}", "NA", "(1/8)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3xnCgreen -mregexp -t'^(?:Nie zwazajac na nic |)(.*) (?:poprawia chwyt na swym|wyrzuca do przodu swoj|niespodziewanie skreca tulow, wyprowadzajac przy tym oburacz dlugie uderzenie|rozpoczyna oburacz potezny mlyniec|rusza do przodu, w pol kroku wyprowadzajac oburacz szybkie uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadza nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (zacina) ([^.]*) w '                                                            _miecznik_spec_2 = /return _psnr("@{nCblue}", "NA", "(2/8)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3xnCgreen -mregexp -t'^(?:Nie zwazajac na nic |)(.*) (?:poprawia chwyt na swym|wyrzuca do przodu swoj|niespodziewanie skreca tulow, wyprowadzajac przy tym oburacz dlugie uderzenie|rozpoczyna oburacz potezny mlyniec|rusza do przodu, w pol kroku wyprowadzajac oburacz szybkie uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadza nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (bolesnie zacina) ([^.]*) w '                                                   _miecznik_spec_3 = /return _psnr("@{nCblue}", "NA", "(3/8)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3xnCgreen -mregexp -t'^(?:Nie zwazajac na nic |)(.*) (?:poprawia chwyt na swym|wyrzuca do przodu swoj|niespodziewanie skreca tulow, wyprowadzajac przy tym oburacz dlugie uderzenie|rozpoczyna oburacz potezny mlyniec|rusza do przodu, w pol kroku wyprowadzajac oburacz szybkie uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadza nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (plytko tnie) ([^.]*) w '                                                       _miecznik_spec_4 = /return _psnr("@{nCblue}", "NA", "(4/8)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3xBCgreen -mregexp -t'^(?:Nie zwazajac na nic |)(.*) (?:poprawia chwyt na swym|wyrzuca do przodu swoj|niespodziewanie skreca tulow, wyprowadzajac przy tym oburacz dlugie uderzenie|rozpoczyna oburacz potezny mlyniec|rusza do przodu, w pol kroku wyprowadzajac oburacz szybkie uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadza nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (tnie) ([^.]*) w '                                                              _miecznik_spec_5 = /return _psnr("@{nCblue}", "NA", "(5/8)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3xBCgreen -mregexp -t'^(?:Nie zwazajac na nic |)(.*) (?:poprawia chwyt na swym|wyrzuca do przodu swoj|niespodziewanie skreca tulow, wyprowadzajac przy tym oburacz dlugie uderzenie|rozpoczyna oburacz potezny mlyniec|rusza do przodu, w pol kroku wyprowadzajac oburacz szybkie uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadza nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (gleboko tnie) ([^.]*) w '                                                      _miecznik_spec_6 = /return _psnr("@{nCblue}", "NA", "(6/8)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3xBCgreen -mregexp -t'^(?:Nie zwazajac na nic |)(.*) (?:poprawia chwyt na swym|wyrzuca do przodu swoj|niespodziewanie skreca tulow, wyprowadzajac przy tym oburacz dlugie uderzenie|rozpoczyna oburacz potezny mlyniec|rusza do przodu, w pol kroku wyprowadzajac oburacz szybkie uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadza nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (niemalze rozcina) ([^.]*) (?:glowe|korpus|cialo|prawe ramie|lewe ramie)\\.'    _miecznik_spec_7 = /return _psnr("@{nCblue}", "NA", "(7/8)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3xBCgreen;5BCgreen -mregexp -t'^(?:Nie zwazajac na nic |)(.*) (?:poprawia chwyt na swym|wyrzuca do przodu swoj|niespodziewanie skreca tulow, wyprowadzajac przy tym oburacz dlugie uderzenie|rozpoczyna oburacz potezny mlyniec|rusza do przodu, w pol kroku wyprowadzajac oburacz szybkie uderzenie) ([^,]*?)(?: i z szerokiego zamachu wyprowadza nim potezne uderzenie|, wkladajac cala sile w uderzenie|, momentalnie przechodzac do uderzenia|), ktore (z potworna moca tnie) (.*) (doslownie w pol)\\.'                      _miecznik_spec_8 = /return _psnr("@{nCblue}", "NA", "(8/8)", {P1}, {P4}, {P2}, {P3})
/def -Fp5 -P3xBCgreen -mregexp -t' wyczekuje na dogodny moment i tnie nagle plasko przez (.*). Ostrze (.*) z nieprzyjemnym chrzestem przechodzi przez miesnie i kosci, a gdy w koncu zatrzymuje sie, (oba ciala bez ducha osuwaja sie na podloze)\\.' _miecznik_spec_9 = /return _psnr("@{nCblue}", "NA DOUBLE KILL", "(8/8)", {PL}, {P1}, {P2}, {P3})

;Trochu do testowania, usuniemy jak skonczymy wsio bo brakuje chyba kilka specow.
;/itrigger Ovidus poprawia chwyt na swym polyskliwym smuklym espadonie i z szerokiego zamachu wyprowadza nim potezne uderzenie, ktore plytko tnie Bostirda w korpus.
;/itrigger Ovidus wyrzuca do przodu swoj polyskliwy smukly espadon, wkladajac cala sile w uderzenie, ktore plytko tnie jednookiego kamiennego trolla w glowe.
;/itrigger Ovidus niespodziewanie skreca tulow, wyprowadzajac przy tym oburacz dlugie uderzenie polyskliwym smuklym espadonem, ktore plytko tnie olbrzymiego kamiennego trolla w korpus.
;/itrigger Nie zwazajac na nic Ovidus rozpoczyna oburacz potezny mlyniec polyskliwym smuklym espadonem, momentalnie przechodzac do uderzenia, ktore plytko tnie wysokiego brutalnego czarnego orka w nos.
;/itrigger Ovidus rusza do przodu, w pol kroku wyprowadzajac oburacz szybkie uderzenie polyskliwym smuklym espadonem, ktore plytko tnie jednookiego kamiennego trolla w korpus.
;Podwojny
;/itrigger Ovidus poprawia chwyt na swym polyskliwym smuklym espadonie i z szerokiego zamachu wyprowadza nim potezne uderzenie, ktore plytko tnie Bostirda w korpus. Korzystajac z dogodnego ustawienia przeciaga jeszcze cios, muskajac Vingaarda samym sztychem broni.
;Pudlo:
;Ovidus niespodziewanie skreca tulow, wyprowadzajac przy tym oburacz dlugie uderzenie polyskliwym smuklym espadonem, ktore bolesnie zacina olbrzymiego kamiennego trolla w korpus.
;Ovidus niespodziewanie skreca tulow, wyprowadzajac przy tym oburacz dlugie uderzenie polyskliwym smuklym espadonem, ktore tylko jakims cudem nie dosiega jednookiego kamiennego trolla.
;Nie zwazajac na nic rozpoczynasz oburacz potezny mlyniec mahakamskim kunsztownym mieczem, momentalnie przechodzac do uderzenia, ktore tylko jakims cudem nie dosiega xxx.
;Niespodziewanie skrecasz tulow, wyprowadzajac przy tym oburacz dlugie uderzenie mahakamskim kunsztownym mieczem, ktore jednak zeslizguje sie po haaklanskim zdobionym szamszirze xxx.
;Nie zwazajac na nic rozpoczynasz oburacz potezny mlyniec mahakamskim kunsztownym mieczem, momentalnie przechodzac do uderzenia, ktore z potworna moca tnie laciata niewielka mysz doslownie w pol.
;Wyczekujesz na dogodny moment i tniesz nagle plasko przez szara koscista mysz i czarna drobna mysz. Ostrze mahakamskiego kunsztownego miecza z nieprzyjemnym chrobotem przechodzi przez miesnie i kosci, a gdy zatrzymujesz ped swej broni, slyszysz tylko jak dwa ciala bez ducha osuwaja sie na podloze.
;/itrigger Ovidus wyczekuje na dogodny moment i tnie nagle plasko przez jaszczurzoglowego kostropatego mutanta i kozloglowego smialego mutanta. Ostrze polyskliwego smuklego espadona z nieprzyjemnym chrzestem przechodzi przez miesnie i kosci, a gdy w koncu zatrzymuje sie, oba ciala bez ducha osuwaja sie na podloze.
;-------------------------------------------------



; ---------- Zakon -------------
/purge _zakon_spec_*
/def -Fp5 -P3xnCgreen -t' bierze potezny zamach swoim (.*), jednak (.*) wykonuje zreczny unik i (cios przeszywa powietrze)\\.$$' _zakon_spec_0 = /return _psnr("@{BCblue}", "ZS", "(0/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xnCgreen -t' bierze mocny zamach (.*), mierzac w (?:tulow|nogi|.*ramie|glowe|.*korpus|cialo) (.*), lecz.*(nieznaczne zadrapania)\\.$$' _zakon_spec_1 = /return _psnr ("@{BCblue}", "ZS", "(1/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xnCgreen -t' bierze mocny zamach (.*) i z powodzeniem trafia (.*) (?:pozostawiajac na.*|w .* pozostawiajac) (krwawiaca rane)\\.$$' _zakon_spec_2 = /return _psnr ("@{BCblue}", "ZS", "(2/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xBCgreen -t' bierze potezny zamach (.*) i z latwoscia trafia ([^,]*), pozostawiajac.* (duza, krwawiaca rane)\\.$$' _zakon_spec_3a = /return _psnr ("@{BCblue}", "ZS", "(3/5)", {PL}, {P2}, {P1}, {P4})
/def -Fp5 -P3xBCgreen;4xBCgreen -t' bierze potezny zamach (.*) i z latwoscia trafia ([^,]*)(?:, pozostawiajac na.*| w .* pozostawiajac) (duza, krwawiaca rane).* (chwieje sie jeszcze przez chwile, probujac sie otrzasnac)' _zakon_spec_3b = /return _psnr ("@{BCblue}", "ZS", "(3/5)", {PL}, {P2}, {P1}, {P4})
/def -Fp5 -P3xBCgreen -t' bierze potezny zamach ([^.]*). Z.*uderza (.*)(?: w .*|, powodujac) (zalewa strumien krwi|rozlegle obrazenia)\\.$$' _zakon_spec_4 = /return _psnr ("@{BCblue}", "ZS", "(4/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xBCgreen -t' bierze potezny zamach ([^.]*). Przez.*uderza (.*) w .* Slychac .* (pada martw. na ziemie)\\.$$' _zakon_spec_5 = /return _psnr ("@{BCblue}", "ZS", "(5/5)", {PL}, {P2}, {P1}, {P3})

; Bierzesz mocny zamach zdobionym jasniejacym mlotem bojowym i z powodzeniem trafiasz olbrzymiego kamiennego trolla, pozostawiajac na jego glowie krwawiaca rane.
; Bierzesz potezny zamach zdobionym jasniejacym mlotem bojowym i z latwoscia trafiasz olbrzymiego kamiennego trolla, pozostawiajac na jego glowie duza, krwawiaca rane. Olbrzymi kamienny troll chwieje sie na nogach przez chwile, probujac sie otrzasnac.
; Bierzesz potezny zamach zdobionym jasniejacym mlotem bojowym. Przez twoja twarz przechodzi grymas wysilku, gdy wkladasz w cios wszystkie dostepne ci sily. Z zadziwiajaca latwoscia uderzasz siwego kamiennego trolla w glowe. Slychac ohydne chrupniecie pekajacej czaszki, a w powietrze wylatuja okruchy kosci zmieszane z kropelkami krwi, tworzac prawdziwie makabryczny widok. Siwy kamienny troll pada martwy na ziemie.

; --------------Legionista-------------
; 3 osoba
/def -Fp5 -P4nCgreen -t'(?: zdecydowanie napiera bokiem na|Nie tracac dystansu do| przesuwa sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|(.*) cofa ).*(?:ciecie|uderzenie|pchniecie) ([^.]*). .*(przecinajac tylko powietrze|nie czyniac najmniejszej krzywdy)\\.$$' _leg_spec_0 = /return _psnr("@{BCmagenta}", "OHM", "(0/7)", strcat({PL}, {P2}), {P1} , {P3}, {P4})
/def -Fp5 -P4nCgreen -t'(?: zdecydowanie napiera bokiem na|Nie tracac dystansu do| przesuwa sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|(.*) cofa ).*(?:ciecie|uderzenie|pchniecie) ([^.]*). .*powodujac tylko (ledwo zauwazalne obrazenia)\\.$$' _leg_spec_1 = /return _psnr("@{BCmagenta}", "OHM", "(1/7)", strcat({PL}, {P2}), {P1} , {P3}, {P4})
/def -Fp5 -P4nCgreen -t'(?: zdecydowanie napiera bokiem na|Nie tracac dystansu do| przesuwa sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|(.*) cofa ).*(?:ciecie|uderzenie|pchniecie) ([^.]*). .*powodujac tylko (nieznaczne obrazenia)\\.$$' _leg_spec_2 = /return _psnr("@{BCmagenta}", "OHM", "(2/7)", strcat({PL}, {P2}), {P1} , {P3}, {P4})
/def -Fp5 -P4nCgreen -t'(?: zdecydowanie napiera bokiem na|Nie tracac dystansu do| przesuwa sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|(.*) cofa ).*(?:ciecie|uderzenie|pchniecie) ([^.]*). .*powodujac (niemale obrazenia)\\.$$' _leg_spec_3 = /return _psnr("@{BCmagenta}", "OHM", "(3/7)", strcat({PL}, {P2}), {P1} , {P3}, {P4})
/def -Fp5 -P4BCgreen -t'(?: zdecydowanie napiera bokiem na|Nie tracac dystansu do| przesuwa sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|(.*) cofa ).*(?:ciecie|uderzenie|pchniecie) ([^.]*). .*powodujac (rozlegle obrazenia)\\.$$' _leg_spec_4 = /return _psnr("@{BCmagenta}", "OHM", "(4/7)", strcat({PL}, {P2}), {P1} , {P3}, {P4})
/def -Fp5 -P4BCgreen -t'(?: zdecydowanie napiera bokiem na|Nie tracac dystansu do| przesuwa sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|(.*) cofa ).*(?:ciecie|uderzenie|pchniecie) ([^.]*). .*powodujac (liczne i glebokie obrazenia)\\.$$' _leg_spec_5 = /return _psnr("@{BCmagenta}", "OHM", "(5/7)", strcat({PL}, {P2}), {P1} , {P3}, {P4})
/def -Fp5 -P4BCgreen -t'(?: zdecydowanie napiera bokiem na|Nie tracac dystansu do| przesuwa sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|(.*) cofa ).*(?:ciecie|uderzenie|pchniecie) ([^.]*). .*powodujac (prawie ze smiertelne obrazenia)\\.$$' _leg_spec_6 = /return _psnr("@{BCmagenta}", "OHM", "(6/7)", strcat({PL}, {P2}), {P1} , {P3}, {P4})
/def -Fp5 -P4BCgreen -t'(?: zdecydowanie napiera bokiem na|Nie tracac dystansu do| przesuwa sie nieznacznie w bok, obchodzac powoli) ([^,]*), (?:by|(.*) cofa ).*(?:ciecie|uderzenie|pchniecie) ([^.]*). .*(konczac walke)\\.$$' _leg_spec_7 = /return _psnr("@{BCmagenta}", "OHM", "(7/7)", strcat({PL}, {P2}), {P1} , {P3}, {P4})

;-------------SKN/WKS------------
; SKN wytracanie - odroznic ciosy we mnie/kogos i podpiac pod antyflood
/purge _skn_spec_*
/def -Fp5 -P1xnCgreen -t' slamazarnym wymachem .* (probuje wytracic)' _skn_spec_1 = /_anty_flood_hide 1
/def -Fp5 -P1xBCgreen -t' szybkim niczym mysl ruchem .* (wytraca) (.*) z (?:rak|reki) (.*).' _skn_spec_2 = /return _psnr("@{BCmagenta}", "SKN", "(VV)", {PL}, {P3}, {P2})
; SKN ofensywne - odroznic ciosy we mnie/kogos i podpiac pod antyflood
/purge _skn_speca_*
/def -Fp5 -P3xnCgreen -t' wykorzystujac brak broni.* cios (.*) mierzac w (.*) i prawie.* (jego zrecznym uniku)' _skn_speca_0 = /return _psnr("@{BCmagenta}", "SKN", "(0/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xnCgreen -t' wykorzystujac brak broni.* cios (.*) mierzac w (.*). Wypracowan.* (sparowane|wyparowany)' _skn_speca_0a = /return _psnr("@{BCmagenta}", "SKN", "(0/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xnCgreen -t' wykorzystujac brak broni.* cios (.*) mierzac w (.*). Wypracowanym.* (ledwie (sinca|zahaczajac))' _skn_speca_1 = /return _psnr("@{BCmagenta}", "SKN", "(1/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xnCgreen -t' wykorzystujac brak broni.* cios (.*) mierzac w (.*). Wypracowanym.* (krwawiace zadrapanie|(lekko raniac))' _skn_speca_2 = /return _psnr("@{BCmagenta}", "SKN", "(2/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xBCgreen -t' wykorzystujac brak broni.* cios (.*) mierzac w (.*). Wypracowanym.*( dluga, poszarpana rane|, mocno raniac)' _skn_speca_3 = /return _psnr("@{BCmagenta}", "SKN", "(3/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xBCgreen -t' wykorzystujac brak broni.* cios (.*) mierzac w (.*). Wypracowanym.* (gleboka rane z wystajacymi na wierzchu tkankami|(bardzo mocno raniac))' _skn_speca_4 = /return _psnr("@{BCmagenta}", "SKN", "(4/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xBCgreen -t' wykorzystujac brak broni.* cios (.*) mierzac w (.*). Wypracowanym.* (zadajac smiertelne obrazenia)' _skn_speca_5 = /return _psnr("@{BCmagenta}", "SKN", "(5/5)", {PL}, {P2}, {P1}, {P3})
/def -Fp5 -P3xBCgreen -t' wykorzystujac oslabienie (.*) dosiega.* pchnieciem (.*). Widzisz.* (ze zdumienia i zaraz potem zachodza mgla)' _skn_speca_5a = /return _psnr("@{BCmagenta}", "SKN", "(5/5)", {PL}, {P1}, {P2}, {P3})

;-------------Mafia-------------------
/def -Fp5 -P1Cgreen;2Cgreen -t'(?:zaciskajac kurczowo dlon .* (cios minimalnie chybia celu)|z latwoscia (unika ciosu), zmuszajac .* gwaltownego skretu tulowia)' _ra_spec_0 = /_psnr @{Cblue} RA (0/8)
/def -Fp5 -P1Cgreen -t'^Wykorzystujac dogodna chwile .* pozostawia po sobie tylko (lekkie drasniecie).' _ra_spec_1 = /_psnr @{Cblue} RA (1/8)
/def -Fp5 -P1Cgreen -t'zatacza szeroki luk .* zadajac jednak tylko (nieznaczne obrazenia)' _ra_spec_2 = /_psnr @{Cblue} RA (2/8)
/def -Fp5 -P1xBCgreen -t'mruzac oczy uwaznie obserwuje ruchy .* (pozostawia krwawiaca rane)' _ra_spec_3 = /_psnr @{Cblue} RA (3/8)
/def -Fp5 -P1xBCgreen -t'uwaznie sledzi ruchy .* (pozostawic bolesna rane)' _ra_spec_4 = /_psnr @{Cblue} RA (4/8)
/def -Fp5 -P1xBCgreen -t'(?:zaciska mocniej palce .* obserwujac (grymas bolu na twarzy ofiary)|wykonuje plynny polobrot.*(bolesny grymas na .* twarzy))' _ra_spec_5 = /_psnr @{Cblue} RA (5/8)
/def -Fp5 -P1xBCgreen -t'zwinnie uchyla sie przed .* (zaglebia sie az po rekojesc)' _ra_spec_6 = /_psnr @{Cblue} RA (6/8)
/def -Fp5 -P1xBCgreen -t'silnym kopnieciem wytraca .* z rownowagi.* (potwornej rany momentalnie tryska krew).' _ra_spec_7 = /_psnr @{Cblue} RA (7/8)
/def -Fp5 -P1BCgreen;2BCgreen;3BCgreen -t'(?:dekoncentracje i oslabienie .* (osuwajacego sie na ziemie ciala)|zrecznym ruchem paruje cios .* (osuwa sie .* z cichym jekiem na ziemie)|wbija az po rekojesc swoj.* (noga odsuwa zwloki na bok))' _ra_spec_ = /_psnr @{Cblue} RA (8/8)

; ------------Berki--------------------
;BS-2 osoba- dzialaja wg standardu ingwara
/purge _berki_specc_*
;/def -Fp5 -PxnCgreen -t'' _berki_specc_0 = /return _psnr("@{BCred}", "BS", "(0/5)", {}, "CIEBIE", {}, {})
/def -Fp5 -P2xnCgreen -t' powolnym ruchem unika twego ciosu, jednoczesnie uderzajac cie sw(?:oja|a|ym) (.*), lecz.* (nieznaczne obrazenia)' _berki_specc_1 = /return _psnr("@{BCred}", "BS", "(1/5)", {PL}, "CIEBIE", {P1}, {P2})
/def -Fp5 -P2xnCgreen -t' oszczednym ruchem unika twego ciosu, rabiac (cie) rownoczesnie sw(?:oja|a|ym) (.*), a uderzenie.* (otwiera szeroka rane)' _berki_specc_2 = /return _psnr("@{BCred}", "BS", "(2/5)", {PL}, {P1}, {P2}, {P3})
;/def -Fp5 -PxBCgreen -t'' _berki_specc_3 = /return _psnr("@{BCred}", "BS", "(3/5)", {}, "CIEBIE", {}, {})
;/def -Fp5 -PxBCgreen -t'' _berki_specc_4 = /return _psnr("@{BCred}", "BS", "(4/5)", {}, "CIEBIE", {}, {})
;/def -Fp5 -PxBCgreen -t'' _berki_specc_5 = /return _psnr("@{BCred}", "BS", "(5/5)", {}, "CIEBIE", {}, {})
;BS-3 osoba- dzialaja wg standardu ingwara (odroznic spece w ciebie i dolaczyc do antyfooda)
/purge _berki_speca_*
/def -Fp5 -P5xnCgreen -t'^Niezgrabny ruch (.*) niemal cudem pozwala mu uniknac ciosu (.*), a jego wyrzucon(y|a) w bok (.*), bardziej .* (przecina tylko powietrze)' _berki_speca_0 = /return _psnr("@{BCred}", "BS", "(0/5)", {P1}, {P2}, {P4}, {P5})
/def -Fp5 -P5xnCgreen -t' powolnym ruchem unika ciosu (.*), jednoczesnie uderzajac (go|ja) (swoja|swym|a) (.*), lecz .* (nieznaczne obrazenia)' _berki_speca_1 = /return _psnr("@{BCred}", "BS", "(1/5)", {PL}, {P1}, {P4}, {P5})
/def -Fp5 -P5xnCgreen -t' oszczednym ruchem unika ciosu (.*), rabiac (go|ja) rownoczesnie (swoja|swym|a) (.*), a uderzenie (?:to |)(otwiera szeroka rane)' _berki_speca_2 = /return _psnr("@{BCred}", "BS", "(2/5)", {PL}, {P1}, {P4}, {P5})
/def -Fp5 -P5xBCgreen -t' zgrabnym ruchem unika ciosu (.*) i korzystajac .* rabie (go|ja) na odlew (swoja|swym|a) (.*), gleboko.*(rozrywajac je.* cialo)' _berki_speca_3 = /return _psnr("@{BCred}", "BS", "(3/5)", {PL}, {P1}, {P4}, {P5})
/def -Fp5 -P5xBCgreen -t' plynnym ruchem unika ciosu (.*) i uderzejac .* tnie (go|ja) (swoja|swym|a) (.*), ktor.* (ogromne obrazenia)' _berki_speca_4 = /return _psnr("@{BCred}", "BS", "(4/5)", {PL}, {P1}, {P4}, {P5})
/def -Fp5 -P4xBCgreen -t' blyskawicznym polobrotem unika ciosu (.*), a (jego|jej) (.*), dzierzon.* (krwawy warkocz smierci)' _berki_speca_5 = /return _psnr("@{BCred}", "BS", "(5/5)", {PL}, {P1}, {P3}, {P4})

; ---------------SCOJA-----------------
/purge _sc_spec_*
/def -Fp5 -P3xnCgreen -t' probuje dosiegnac (.*) ([a-z]+ [a-z]+ (?:mlotem|nadziakierm|mieczem|toporem|berdyszem|sztyletem|wekiera).*), jednak jego bron nieznacznie (chybia celu)' _sc_spec_0 = /return _psnr ("@{BCmagenta}", "SC", "(0/7)", {PL}, {P1}, {P2}, {P3})
/def -Fp5 -P3xnCgreen -t' (?:z doskoku|bez zastanowienia|niezbyt celnie|oszczednym ruchem|bez wysilku|niezbyt dokladnie|z szybkiego doskoku|robiac oszczedny zamach|w pospiechu|zbierajac sie w sobie|w zamieszaniu|korzystajac z zamieszania|z lekkiego wymachu) uderza (.*) ([a-z]+ [a-z]+ [a-z]+(?:, | rycerskim, | wojennym, | bojowym, ))(nieznacznie raniac)' _sc_spec_1 = /return _psnr ("@{BCmagenta}", "SC", "(1/7)", {PL}, {P1}, {P2}, {P3})
/def -Fp5 -P3xnCgreen -t' (?:z doskoku|bez zastanowienia|niezbyt celnie|oszczednym ruchem|bez wysilku|niezbyt dokladnie|z szybkiego doskoku|robiac oszczedny zamach|w pospiechu|zbierajac sie w sobie|w zamieszaniu|korzystajac z zamieszania|z lekkiego wymachu) uderza (.*) ([a-z]+ [a-z]+ (?:mlotem|nadziakierm|mieczem|toporem|berdyszem|sztyletem|wekiera).*), (lekko raniac)' _sc_spec_2 = /return _psnr ("@{BCmagenta}", "SC", "(2/7)", {PL}, {P1}, {P2}, {P3})
/def -Fp5 -P3xnCgreen -t' (?:z doskoku|bez zastanowienia|niezbyt celnie|oszczednym ruchem|bez wysilku|niezbyt dokladnie|z szybkiego doskoku|robiac oszczedny zamach|w pospiechu|zbierajac sie w sobie|w zamieszaniu|korzystajac z zamieszania|z lekkiego wymachu) uderza (.*) ([a-z]+ [a-z]+ (?:mlotem|nadziakierm|mieczem|toporem|berdyszem|sztyletem|wekiera).*), (bolesnie raniac)' _sc_spec_3 = /return _psnr ("@{BCmagenta}", "SC", "(3/7)", {PL}, {P1}, {P2}, {P3})
/def -Fp5 -P3xBCgreen -t' (?:zaciskajac z wysilku zeby|dziko hallakujac|wrzeszczac na cale gardlo|bez chwili namyslu|(?:blyskawicznie|szybko) skladajac sie do ciosu|(?:pewnym|plynnym) ruchem|z szybkiego doskoku|zbierajac sie w sobie|w szalenczym porywie|z grymasem wysilku|robiac szeroki zamach|blyskawicznie) uderza (.*) ([a-z]+ [a-z]+ (?:mlotem|nadziakierm|mieczem|toporem|berdyszem|sztyletem|wekiera).*), (powaznie raniac)' _sc_spec_4 = /return _psnr ("@{BCmagenta}", "SC", "(4/7)", {PL}, {P1}, {P2}, {P3})
/def -Fp5 -P3xBCgreen -t' (?:zaciskajac z wysilku zeby|dziko hallakujac|wrzeszczac na cale gardlo|bez chwili namyslu|(?:blyskawicznie|szybko) skladajac sie do ciosu|(?:pewnym|plynnym) ruchem|z szybkiego doskoku|zbierajac sie w sobie|w szalenczym porywie|z grymasem wysilku|robiac szeroki zamach|blyskawicznie) uderza (.*) ([a-z]+ [a-z]+ (?:mlotem|nadziakierm|mieczem|toporem|berdyszem|sztyletem|wekiera).*), (bardzo ciezko raniac)' _sc_spec_5 = /return _psnr ("@{BCmagenta}", "SC", "(5/7)", {PL}, {P1}, {P2}, {P3})
/def -Fp5 -P3xBCgreen -t' (?:zaciskajac z wysilku zeby|dziko hallakujac|wrzeszczac na cale gardlo|bez chwili namyslu|(?:blyskawicznie|szybko) skladajac sie do ciosu|(?:pewnym|plynnym) ruchem|z szybkiego doskoku|zbierajac sie w sobie|w szalenczym porywie|z grymasem wysilku|robiac szeroki zamach|blyskawicznie) uderza (.*) ([a-z]+ [a-z]+ (?:mlotem|nadziakierm|mieczem|toporem|berdyszem|sztyletem|wekiera).*), (potwornie raniac)' _sc_spec_6 = /return _psnr ("@{BCmagenta}", "SC", "(6/7)", {PL}, {P1}, {P2}, {P3})
/def -Fp5 -P2xBCgreen -t' blyskawicznie doskakuje do ledwo stojacego na nogach ([^,]*), (bezlitosnie masakrujac (?:go|ja)) (.*)\\.$$' _sc_spec_7 = /return _psnr ("@{BCmagenta}", "SC", "(7/7)", {PL}, {P1}, {P3}, {P2})

; --------------Von Raugen--------------
; Gladowe - dzialaja wg standardu ingwara
; Jednorek + tarcza - etat
/purge _von_raugen_spec_*
/def -Fp5 -P3xnCgreen -t' paruje cios (.*) (?:[a-z]+ [a-z]+) (?:tarcza|puklerzem|pawezem) i uderza (?:go|ja) (.*) (lecz nie trafia).' _von_raugen_spec_0 = /return _psnr("@{nCblue}", "VR", "(0/7)", {PL}, {P1}, "%{P2} + tarcza", {P3})
/def -Fp5 -P2xnCgreen -t' odpycha (.*) (?:[a-z]+ [a-z]+) (?:tarcza|paweza|puklerzem) i (lekko kaleczy) .* ciosem (.*) w' _von_raugen_spec_1a = /return _psnr("@{nCblue}", "VR", "(1/7)", {PL}, {P1}, "%{P3} + tarcza", {P2})
/def -Fp5 -P3xnCgreen -t' paruje cios (.*) (?:[a-z]+ [a-z]+) (?:tarcza|paweza|puklerzem) i odpowiada nan szybkim ciosem (.*) w .*, zadajac (nieznaczne obrazenia)' _von_raugen_spec_1b  = /return _psnr("@{nCblue}", "VR", "(1/7)", {PL}, {P1}, "%{P2} + tarcza", {P3})
/def -Fp5 -P4xnCgreen -t'^Ciosem (.*) w (?:glowe|.*ramie|korpus|cialo|nogi|tulow) (.*) zadaje (.*) (nieduza rane|nieduze obrazenia) i uderzeniem ' _von_raugen_spec_2 = /return _psnr("@{nCblue}", "VR", "(2/7)", {P2}, {P3}, "%{P1} + tarcza", {P4})
/def -Fp5 -P2xnCgreen -t' sprawnie paruje atak (.*) (?:[a-z]+ [a-z]+) (?:tarcza|paweza|puklerzem) i (rani) .* celna kontra ciosu (.*) w ' _von_raugen_spec_3a = /return _psnr("@{nCblue}", "VR", "(3/7)", {PL}, {P1}, "%{P3} + tarcza", {P2})
/def -Fp5 -P2xnCgreen -t' nurkujac pod atakiem (.*) (mocno rani) .* ciosem .* i zaraz po tym kaleczy uderzeniem (.*) w' _von_raugen_spec_3b = /return _psnr("@{nCblue}", "VR", "(3/7)", {PL}, {P1}, "%{P3} + tarcza", {P2})
/def -Fp5 -P4xnCgreen -t'^Mocnym uderzeniem.*(?:tarczy|paweza|puklerza) (.*) oszalamia (.*) i ciosem (.*) zadaje .*(krwista rane, raniac|znaczne obrazenia)' _von_raugen_spec_4 = /return _psnr("@{nCblue}", "VR", "(4/7)", {P1}, {P2}, "%{P3} + tarcza", {P4})
/def -Fp5 -P3xBCgreen -t' zatrzymuje atak (.*) pewnym blokiem .* i poteznym ciosem (.*) (powaznie rani)' _von_raugen_spec_5a = /return _psnr("@{nCblue}", "VR", "(5/7)", {PL}, {P1}, "%{P2} + tarcza", {P3})
/def -Fp5 -P2xBCgreen -t' kilkakrotnie tlucze w (?:glowe|.*ramie|korpus|cialo|nogi|pysk) (.*) poteznymi ciosami .* i (ciezko rani|krwawo rani) go (.*)\\.' _von_raugen_spec_5b = /return _psnr("@{nCblue}", "VR", "(5/7)", {PL}, {P1}, "%{P3} + tarcza", {P2})
/def -Fp5 -P3xBCgreen -t' blokuje atak (.*) (?:[a-z]+ [a-z]+) (?:tarcza|paweza|puklerzem) i zadanym z pelnego sily obrotu ciosem (.*)((?:| bardzo) ciezko rani) ' _von_raugen_spec_6a = /return _psnr("@{nCblue}", "VR", "(6/7)", {PL}, {P1}, "%{P2} + tarcza", {P3})
/def -Fp5 -P3xBCgreen -t'^Z wyrywajacym sie z jego piersi bojowym okrzykiem (.*) dopada do (.*) i blokujac pole je.* manewru .* kilkakrotnie, (paskudnie masakruje) .* ciosami ([^,]*),' _von_raugen_spec_6b = /return _psnr("@{nCblue}", "VR", "(6/7)", {P1}, {P2}, "%{P4} + tarcza", {P3})
/def -Fp5 -P4xBCgreen -t'^Z pelnym wscieklosci rykiem (.*) blokuje (?:zaslone|[a-z]+ [a-z]+ [a-z]+) (.*) i zadanym z rozmachu uderzeniem (.*) masakruje .*, (blyskawicznie konczac walke).' _von_raugen_spec_7a = /return _psnr("@{nCblue}", "VR", "(7/7)", {P1}, {P2}, "%{P3} + tarcza", {P4})
/def -Fp5 -P4xBCgreen -t'^Zgrabnym unikiem (.*) omija desperacki atak (.*)i zadanym jednoczesnie ciosem (.*) i .* (masakruje .*, konczac walke).' _von_raugen_spec_7b = /return _psnr("@{nCblue}", "VR", "(7/7)", {P1}, {P2}, "%{P3} + tarcza", {P4})
/def -Fp5 -P3xBCgreen -t'^Twardym ciosem .*(?:tarczy|paweza|puklerza) (.*) zamienia twarz (.*) w (krwawa miazge) i druzgoczacym ciosem (.*) rzuca ' _von_raugen_spec_7c = /return _psnr("@{nCblue}", "VR", "(7/7)", {P1}, {P2}, "%{P4} + tarcza", {P3})
/def -Fp5 -P2xBCgreen -t'^Twardym ciosem .*(?:tarczy|paweza|puklerza) (.*) (masakruje (?:pysk|.*reke|nogi|korpus|cialo|glowe)) (.*) druzgoczacym ciosem (.*) rzuca ' _von_raugen_spec_7d = /return _psnr("@{nCblue}", "VR", "(7/7)", {P1}, {P2}, "%{P3} + tarcza", {P2})
; Jednorek + tarcza - glady
/purge _von_raugen_speca_*
/def -Fp5 -P4xnCgreen -t'^Oslaniajac sie (?:[a-z]+ [a-z]+) (?:tarcza|paweza|puklerzem) (.*) stara sie trafic (.*) ciosem ([^,]*), (jednak pudluje)' _von_raugen_speca_0 = /return _psnr("@{nCblue}", "VR", "(0/7)", {P1}, {P2}, "%{P3} + tarcza", {P4})
/def -Fp5 -P3xnCgreen -t'^Rownoczesnym uderzeniem porecznego (.*) i (?:[a-z]+ [a-z]+) (?:tarczy|paweza|puklerza) (.*) bez skutku (probuje trafic) ([^.]*).' _von_raugen_speca_0a = /return _psnr("@{nCblue}", "VR", "(0/7)", {P2}, {P4}, "%{P1} + tarcza", {P3})
/def -Fp5 -P3xnCgreen -t' paruje atak (.*) (?:[a-z]+ [a-z]+) (?:tarcza|pawezem|puklerzem) i ripostuje ciosem (.*) w je.* (zadajac niewielkie obrazenia)' _von_raugen_speca_1 = /return _psnr("@{nCblue}", "VR", "(1/7)", {PL}, {P1}, "%{P2} + tarcza", {P3})
/def -Fp5 -P3xnCgreen -t' szybko zaslania.*uderza (.*) ([a-z]+ [a-z]+ (?:topor(?:ki|)em|berdyszem|czekanem|siekier(?:k|)a|mieczem|poltorakiem|nimsza|szabla|szpada|sihillem|espadonem|koncerzem|rapierem|palka|maczuga|morgensternem|wekiera|korbaczem|buzdyganem).*) w .*(ledwie jednak .* draskajac)' _von_raugen_speca_1a = /return _psnr("@{nCblue}", "VR", "(1/7)", {PL}, {P1}, "%{P2} + tarcza", {P3})
/def -Fp5 -P2xnCgreen -t' zbija cios (.*) (?:[a-z]+ [a-z]+) (?:tarcza|pawezem|puklerzem) i kontruje .* (lekko kaleczac).* ciosem ([^.]*).' _von_raugen_speca_2 = /return _psnr("@{nCblue}", "VR", "(2/7)", {PL}, {P1}, "%{P3} + tarcza", {P2})
/def -Fp5 -P2xnCgreen -t' blokuje (?:zaslone|(?:[a-z]+ [a-z]+ [a-z]+(?: bojowy| wojenny| rycerski|))) (.*) (?:[a-z]+ [a-z]+) (?:tarcza|pawezem|puklerzem) i (celnie rani) (?:go|ja) (.*) w ' _von_raugen_speca_3 = /return _psnr("@{nCblue}", "VR", "(3/7)", {PL}, {P1}, "%{P3} + tarcza", {P2})
/def -Fp5 -P3xnCgreen -t' silnie napiera .* na (.*) i wyprowadzonym .* ciosem (.*) (rani)' _von_raugen_speca_3a = /return _psnr("@{nCblue}", "VR", "(3/7)", {PL}, {P1}, "%{P2} + tarcza", {P3})
/def -Fp5 -P2xBCgreen -t' zrecznie unika ataku (.*) i .* (doglebnie kaleczac) .* silnym ciosem ([^.]*).' _von_raugen_speca_4 = /return _psnr("@{nCblue}", "VR", "(4/7)", {PL}, {P1}, "%{P3} + tarcza", {P2})
/def -Fp5 -P1xBCgreen -t' morderczo atakuje, (blyskawicznie raniac) (.*) ciosem (.*) w ' _von_raugen_speca_4a = /return _psnr("@{nCblue}", "VR", "(4/7)", {PL}, {P2}, "%{P3} + tarcza", {P1})
/def -Fp5 -P1xBCgreen -t' (krwawo rani) (.*) w .* ciosem (.*) i zaslania' _von_raugen_speca_4b = /return _psnr("@{nCblue}", "VR", "(4/7)", {PL}, {P2}, "%{P3} + tarcza", {P1})
/def -Fp5 -P3xBCgreen -t' zbija (?:[a-z]+ [a-z]+) (?:tarcza|paweza|puklerzem) (?:zaslone|(?:[a-z]+ [a-z]+ [a-z]+(?: bojowy| wojenny| rycerskim|))) (.*) i uderza (?:go|ja) na odlew (.*) mierzac.* (rozdzierajac bolesna rane)' _von_raugen_speca_5 = /return _psnr("@{nCblue}", "VR", "(5/7)", {PL}, {P1}, "%{P2} + tarcza", {P3})
/def -Fp5 -P2xBCgreen -t' odpycha (?:[a-z]+ [a-z]+) (?:tarcza|paweza|puklerzem) (.*) i (poteznie uderza) (?:go|ja) ([^.]*).' _von_raugen_speca_5a = /return _psnr("@{nCblue}", "VR", "(5/7)", {PL}, {P1}, "%{P3} + tarcza", {P2})
/def -Fp5 -P2xBCgreen -t' oszalamia (.*) ciosem.* (paskudnie rani) .* uderzeniem (.*) w ' _von_raugen_speca_6 = /return _psnr("@{nCblue}", "VR", "(6/7)", {PL}, {P1}, "%{P3} + tarcza", {P2})
/def -Fp5 -P4xBCgreen -t'^Oslaniajac sie (?:[a-z]+ [a-z]+) (?:tarcza|paweza|puklerzem) (.*) rzuca sie na (.*) wyprowadzajac w pedzie straszliwe ciecia ([^,]*), a .*(krwisty slad, ciezko raniac)' _von_raugen_speca_6a = /return _psnr("@{nCblue}", "VR", "(6/7)", {P1}, {P2}, "%{P3} + tarcza", {P4})
/def -Fp5 -P3xBCgreen -t' ciosem .* przewraca (.*) na ziemie.* ciosow ([^.]*). (To juz koniec walki)' _von_raugen_speca_7 = /return _psnr("@{nCblue}", "VR", "(7/7)", {PL}, {P1}, "%{P2} + tarcza", {P3})
/def -Fp5 -P3xBCgreen -t' naglym wypadem omija (.*) i oslaniajac.* wbija ostrze (.*) miedzy je.* (chlustajac krwia z rany powoli osuwa sie na kolana, a potem pada twarza na ziemie. To juz koniec walki)' _von_raugen_speca_7a = /return _psnr("@{nCblue}", "VR", "(7/7)", {PL}, {P1}, "%{P2} + tarcza", {P3})

;------ Tancerze -------
;od decarda (niekoniecznie aktualne)
/def -Fp5 -P1xCgreen -t'dopada do .* (nie trafiajac) jednak zadnym z blyskawicznej serii ciosow'  _tw_spec_0 = /_psnr @{nBCblue} TW (0/6)
/def -Fp5 -P1xCgreen -t'dopada do .* zadajac (nieznaczne rany) blyskawiczna seria ciosow'  _tw_spec_1 = /_psnr @{nBCblue} TW (1/6)
/def -Fp5 -P1xCgreen -t'dopada do .* zadajac (znaczne rany) blyskawiczna seria ciosow'  _tw_spec_2 = /_psnr @{nBCblue} TW (2/6)
/def -Fp5 -P1xCgreen -t'dopada do .* zadajac (powazne rany) blyskawiczna seria ciosow'  _tw_spec_3 = /_psnr @{nBCblue} TW (3/6)
/def -Fp5 -P1xBCgreen -t'dopada do .* zadajac (bardzo ciezkie rany) blyskawiczna seria ciosow'  _tw_spec_4 = /_psnr @{nBCblue} TW (4/6)
/def -Fp5 -P1xBCgreen -t'dopada do .* zadajac (mordercze rany) blyskawiczna seria ciosow'  _tw_spec_5 = /_psnr @{nBCblue} TW (5/6)
/def -Fp5 -P1xBCgreen -t'dopada do .* zadajac (smiertelne rany) blyskawiczna seria ciosow'   _tw_spec_6 = /_psnr @{nBCblue} TW (6/6)


; ------------INNE---------------
; Spec straznika wierzy (ceglowka go ceglowka!!) :)
/def -Fp5 -aBCmagenta -t'*wiezy wyrywa z muru olbrzymi glaz i ciska nim w*' _straznik_wiezy_spec_0

; Golemy
/def -Fp5 -P1Cgreen -t'^Z ukrytych w ramieniu .* golema otworow.* (z gluchym chrzestem.*)\\.' _golem_spec_0
/def -Fp5 -P1BCgreen -t'^Z ukrytych w ramieniu .* golema otworow.* (z gluchym chrzestem.*)\\!' _golem_spec_1

; Kilmulisy
/def -n1 -Fp6 -t'*kilmulis*' _kilmulis_spec_wlacz = \
    /def -Fp5 -PxnCgreen -t'wymachuje pazurami, (nieznacznie|lekko) raniac' _kilmulis_spec_1 %;\
    /def -Fp5 -PxBCgreen -t'wymachuje pazurami,(| gleboko) raniac' _kilmulis_spec_2 

; Ozywience :)
/def -n1 -Fp6 -t'*ozywieniec*' _owyz_spec_wlacz = \
    /def -Fp5 -PnxCgreen -t'przelatuje (ze zlowrogim furkotem |)o dobre pol cala od (jego|jej|twojej piersi !)' _ozyw_spec0 %;\
    /def -Fp5 -PnxCgreen -t'udaje sie odruchowo (zaslonic|odbic cios)' _ozyw_spec1 %;\
    /def -Fp5 -PnxCgreen -t'raniac cie niezbyt gleboko' _ozyw_spec2 %;\
    /def -Fp5 -PnxCgreen -t'krew momentalnie tryska z szerokiej rany' _ozyw_spec3 %;\
    /def -Fp5 -PBxCgreen -t'otwierajac na moment przed twymi oczami czerwona otchlan' _ozyw_spec4 %;\
    /def -Fp5 -PBxCgreen -t'probowaly sie ratowac przed skapanym w purpurze cierpieniem' _ozyw_spec5 %;\
    /def -Fp5 -PBxCgreen -t'w niekonczacym sie bolu i szalenstwie' _ozyw_spec6 %;\
    /def -Fp5 -PBxCgreen -t'podazaja krople purpury' _ozyw_spec7 %;\
    /echo -aCgreen O ozywieniec!! Wlaczam opisy jego wrednych specjali!!

; Golem :)
/def -n1 -Fp6 -t'*kamienny golem*' _golem_spec_wlacz = \
    /def -Fp5 -PnxCgreen -t'.pokojnie odsuwa(sz|) sie (na|w) bok' _golem_spec0 %;\
    /def -Fp5 -PnxCgreen -t'gluchym furkotem wbija sie w (jego|jej|twoj) korpus' _golem_spec1 %;\
    /def -Fp5 -PBxCgreen -t'(od|)rzuca (cie na bok, wprost|go|ja) na sciane' _golem_spec2 %;\
    /def -Fp5 -PBxCgreen -t'osuwa(sz|) sie z bolu na kolana' _golem_spec3 %;\
    /def -Fp5 -PBxCgreen -t'rzucajac (nim|nia|toba) (z loskotem |)o sciane' _golem_spec4 %;\
    /echo -aCgreen O golemik!! Wlaczam opisy jego masakrujacych specjali!!

/def -n1 -Fp6 -t'*ledwo widoczny swietlisty upior*' _upior_spec_wlacz = \
    /def -Fp5 -P1BCgreen -t'ledwo widoczny swietlisty upior wykorzystujac .* (wyprowadza potezne ciecie) ze skretu bioder' _upior_spec0 %;\
    /def -Fp5 -P1BCgreen -t'ledwo widoczny swietlisty upior kpiac sobie z .*umiejetnosci .* (tnie .* okrutnie przez szyje)' _upior_spec1 %;\
    /echo -aCgreen O upior!! Podswietlam jego wyczyny!!

;------------------------------------------------------------------------------
;                            Magiki                                           |
;------------------------------------------------------------------------------

; Spec helmu z broku :)
/def -Fp5 -aBCmagenta -t'*rozjarza sie zimnym, niebieskim swiatlem,*' _helm_spec_0

; czerwony zakrwawiony pierscien i jego spec
/def -Fp5 -aBCmagenta -t'* skierowal czerwony zakrwawiony pierscien w strone *' _pierscien_spec_0
/def -Fp5 -aBCmagenta -t'* formuje sie tuz przed skrzacym sie na pierscieniu rubinem*' _pierscien_spec_1

; amulet z nekromanty
/def -Fp5 -aBCmagenta -t'Od twojego amuletu emanuje przyjemne cieplo.' _amulet_spec_0
/def -Fp5 -aBCmagenta -t'Na amulecie * rozjarzaja sie na moment trzy krwistoczerwone ogniki.' _amulet_spec_1

; Gwiezdny topor :)
; troche poprawione ale nie sprawdzone :)
/def -n1 -Fp6 -mregexp -t'(gwiezdny. topor|jasniejacy. niebieskim swiatlem.* topor|obureczny. dwureczny. topor)' _gwiazda_spec_wlacz = \
    /def -Fp5 -P1nCgreen -t', (chybia(sz|)) '                         _gwiazda_opis_0 %;\
    /def -Fp5 -P1nCgreen -t'swiadczy, ze (zaledwie (cie |)drasnal(es|))'         _gwiazda_opis_1 %;\
    /def -Fp5 -P1nCgreen -t'zada.* (niewielkie obrazenia)'                 _gwiazda_opis_2 %;\
    /def -Fp5 -PnCgreen -t'zadajac spore obrazenia (|i zalewajac ostrze posoka)'     _gwiazda_opis_3 %;\
    /def -Fp5 -PBCgreen -t'zalewaja (twa |)twarz .*ciepla posoka'             _gwiazda_opis_4 %;\
    /def -Fp5 -PBCgreen -t'fontanna swietlistej energii tryska z rany'         _gwiazda_opis_5 %;\
    /def -Fp5 -PBCgreen -t'Czujesz swad palonego ciala'                 _gwiazda_opis_6 %;\
    /def -Fp5 -aBCmagenta -t'*Nagle*zaczyna jarzyc sie pulsujacym blekitnym swiatlem*'    _gwiazda_opis_spec_start %;\
    /def -Fp5 -aBCmagenta -t'*topor przestaje sie swiecic*'                 _gwiazda_opis_spec_stop %;\
    /def -Fp5 -P1nCgreen -t'lecz zaledwie (lekko rani(sz|))'                    _gwiazda_opis_spec_1 %;\
    /def -Fp5 -PnCgreen -t'zadaje bolesne obrazenia'                    _gwiazda_opis_spec_2 %;\
    /def -Fp5 -PBCgreen -t'ze cios zadal(es|) powazne obrazenia'                 _gwiazda_opis_spec_3 %;\
    /def -Fp5 -PBCgreen -t'towarzyszy trzask lamanych kosci'                _gwiazda_opis_spec_4 %;\
    /def -Fp5 -PBCgreen -t'na dwie polowy'                         _gwiazda_opis_spec_5 %;\
    /echo -aCgreen O widze gwiezdny topor!! Wlaczam jego opisy specjalne!!

; Mitrylek.. Mitrylowy kunsztowny topor Katona :)
/def -n1 -Fp6 -t'*kunsztown* mithrylow* topor*' _mithrylek_spec_wlacz = \
    /def -Fp5 -P1Cgreen -t'robiac ladna, (swieza rane)\\\\.$$' _mithrylek_opis_1 %;\
    /def -Fp5 -P1Cgreen -t'kunsztowne.* mithrylowe.* (rabie)' _mithrylek_opis_2 %;\
    /def -Fp5 -P1BCgreen -t'kunsztown.* mithrylo.* topore.* (zgrzyt ostrza o kosci)\\\\.$$' _mithrylek_opis_3 %;\
    /def -Fp5 -P1BCgreen -t'tnie gleboko.* slyszysz glosny (odglos druzgotanych kosci).$$' _mithrylek_opis_4 %;\
    /def -Fp5 -P1BCgreen -t'kunsztow.* mithrylow.* topor.* (zmasakrowane i niemal nierozpoznawalne cialo)\\\\.$$' _mithrylek_opis_5 %;\
    /echo -aCgreen O Mithrylek!! Biedny Katon!!

; Tniesz gleboko swym kunsztownym mithrylowym toporem bojowym w luskowate cialo duzego obrosnietego potwora i slyszysz glosny odglos druzgotanych kosci.

; Adas.. Adamantytowy ciezki mlot bojowy :)
/def -n1 -Fp6 -t'*adamantytowy* mlot* bojowy*' _adamanty_spec_wlacz = \
    /def -Fp5 -P1xnCgreen -t'(Kaleczysz lekko|lekko kaleczy) .* adamantyt' _adamantyt_opis_1 %;\
    /def -Fp5 -P1xnCgreen -t'([Kk]aleczy(sz|)) .* adamantyt'         _adamantyt_opis_2 %;\
    /def -Fp5 -P1xnCgreen -t'([Ll]ekko rani(sz|)) .* adamantyt'        _adamantyt_opis_3 %;\
    /def -Fp5 -P1xnCgreen -t'adamantyt.* (raniac)'            _adamantyt_opis_4 %;\
    /def -Fp5 -P1xBCgreen -t'adamantyt.* (miazdzac (twe |)czlonki)'    _adamantyt_opis_5 %;\
    /def -Fp5 -P1xBCgreen -t'adamantyt.* (zostawiajac glebokie rany)'     _adamantyt_opis_6 %;\
    /def -Fp5 -P1xBCgreen -t'([Mm]asakruje(sz|)) .* adamantyt'         _adamantyt_opis_7 %;\
    /def -Fp5 -P1xBCgreen -t'adamantyt.* (miazdzy (twa |)glowe)'    _adamantyt_opis_8 %;\
    /echo -aCgreen No no no Adas!!! Wlaczam opisy jego specjali!!

; Srebrzysta kosa bojowa z demona :) trzeba oddzielic ciowy we mnie i wtedy: = /_anty_flood_hide 5|7
/def -n1 -Fp8 -t'*srebrzysta* kos[aey]* bojowa*' _srebrzysta_kosa_spec_wlacz_1 = \
    /def -Fp7 -P1xnCcyan -t'(ledwo muska) (?!cie).* srebrzysta kosa bojowa'                        _srebrzysta_kosa_opisb_0 %;\
    /def -Fp7 -P1xnCcyan -t'(lekko kaleczy) (?!cie).* srebrzysta kosa bojowa'                      _srebrzysta_kosa_opisb_1 %;\
    /def -Fp7 -P1xnCcyan -t'(kaleczy) (?!cie).* srebrzystej kosy bojowej'                          _srebrzysta_kosa_opisb_2 %;\
    /def -Fp7 -P1xnCcyan -t'(lekko rani) (?!cie).* srebrzystej kosy bojowej'                       _srebrzysta_kosa_opisb_3 %;\
    /def -Fp7 -P1xnCcyan -t'wykonuje potezny cios srebrzysta kosa bojowa, (raniac) (?!cie)'        _srebrzysta_kosa_opisb_4 %;\
    /def -Fp7 -P1xBCcyan -t'(wyrywa krwawe kawalki (?!twojego )ciala) .*srebrzysta kosa bojowa'    _srebrzysta_kosa_opisb_5 %;\
    /def -Fp7 -P1xBCcyan -t'uderzenie srebrzystej kosy bojowej .* (zostawiajac krwawe bruzdy) na (?!twoim)'     _srebrzysta_kosa_opisb_6 %;\
    /def -Fp7 -P1xBCcyan -t'(masakruje) (?!cie).* srebrzysta kosa bojowa'         _srebrzysta_kosa_opisb_7 %;\
    /def -Fp7 -P1xBCcyan -t'(Slyszysz ohydny dzwiek rozdzieranej tkanki).* gdy srebrzysta kosa bojowa .*masakruje (?!twoje)'    _srebrzysta_kosa_opisb_8 %;\
    /def -Fp5 -P1xnCred -t'(ledwo muska) cie .* srebrzysta kosa bojowa'    _srebrzysta_kosa_opisa_0 %;\
    /def -Fp5 -P1xnCred -t'(lekko kaleczy) cie .* srebrzysta kosa bojowa'    _srebrzysta_kosa_opisa_1 %;\
    /def -Fp5 -P1xnCred -t'(kaleczy) cie .* srebrzystej kosy bojowej'         _srebrzysta_kosa_opisa_2 %;\
    /def -Fp5 -P1xnCred -t'(lekko rani) cie .* srebrzystej kosy bojowej'        _srebrzysta_kosa_opisa_3 %;\
    /def -Fp5 -P1xnCred -t'wykonuje potezny cios srebrzysta kosa bojowa, (raniac) cie'  _srebrzysta_kosa_opisa_4 %;\
    /def -Fp5 -P1xBCred -t'(wyrywa krwawe kawalki twojego ciala).*srebrzysta kosa bojowa'    _srebrzysta_kosa_opisa_5 %;\
    /def -Fp5 -P1xBCred -t'uderzenie srebrzystej kosy bojowej .* (zostawiajac krwawe bruzdy) na twoim'     _srebrzysta_kosa_opisa_6 %;\
    /def -Fp5 -P1xBCred -t'(masakruje) cie.* srebrzysta kosa bojowa'         _srebrzysta_kosa_opisa_7 %;\
    /def -Fp5 -P1xBCred -t'(Slyszysz ohydny dzwiek rozdzieranej tkanki).* gdy srebrzysta kosa bojowa .*masakruje twoje cialo'    _srebrzysta_kosa_opisa_8 %;\
    /echo -aCgreen O super wypasna kosa demonka!!! Wlaczam ladne opisy!!
/def -n1 -Fp6 -t'Ostrze kosy rozblyska nieziemskim blaskiem, gdy dobywasz broni w obie rece.' _srebrzysta_kosa_spec_wlacz_2 = \
    /def -Fp5 -P1xnCblue -t'(Ledwo muskasz).* srebrzysta kosa bojowa'    _srebrzysta_kosa_opis_0 %;\
    /def -Fp5 -P1xnCblue -t'(Kaleczysz lekko).* srebrzysta kosa bojowa'    _srebrzysta_kosa_opis_1 %;\
    /def -Fp6 -P1xnCblue -t'(Kaleczysz|Lekko ranisz) .* srebrzystej kosy bojowej'         _srebrzysta_kosa_opis_2 %;\
    /def -Fp5 -P1xnCblue -t'Wykonujesz .*srebrzysta kosa bojowa, (raniac)'            _srebrzysta_kosa_opis_3 %;\
    /def -Fp5 -P1xBCblue -t'(Wyrywasz krwawe kawalki ciala) .*srebrzystej kosy bojowej'    _srebrzysta_kosa_opis_4 %;\
    /def -Fp5 -P1xBCblue -t'twojej srebrzystej kosy bojowej .* (zostawiajac krwawe bruzdy)'     _srebrzysta_kosa_opis_5 %;\
    /def -Fp5 -P1xBCblue -t'(Masakrujesz) .*srebrzysta kosa bojowa'         _srebrzysta_kosa_opis_6 %;\
    /def -Fp5 -P1xBCblue -t'(Slyszysz ohydny dzwiek rozdzieranej tkanki) .*twoja srebrzysta kosa bojowa'    _srebrzysta_kosa_opis_7 %;\
    /echo -aCgreen Moja ukochana!!! Wlaczam ladne opisy!!

; Jasniaczek. trzeba oddzielic ciowy we mnie i wtedy: = /_anty_flood_hide 5|7
/def -n1 -Fp6 -t'*[Zz]dobiony* jasniejacy* mlot* bojowy*' _jasniak_spec_wlacz_1 = \
    /def -Fp5 -P1xnCcyan -t'Niecelny cios zdobionego jasniejacego mlota bojowego .* (przeszywa powietrze)' _jasniak_cios_1 %;\
    /def -Fp5 -P1xnCcyan -t'uderza swym zdobionym jasniejacym mlotem bojowym w .* (niegroznie .* raniac)' _jasniak_cios_2 %;\
    /def -Fp5 -P1xnCcyan -t'(?:celnym ciosem swojego|dosiega .*silnym ciosem) zdobionego jasniejacego mlota bojowego.*(pozostawiajac nan krwawy slad|kaleczac)' _jasniak_cios_3 %;\
    /def -Fp5 -P1xBCcyan -t'(?:kiedy pelen sily cios|poteznym ciosem rozswietlonego obucha) zdobionego jasniejacego mlota bojowego.* (dotkliwie parzac|potwornie .* raniac)' _jasniak_cios_4 %;\
    /def -Fp5 -P1xBCcyan -t'(Przy przykrym akompaniamencie miazdzonych kosci), ciezkie uderzenie zdobionego jasniejacego mlota bojowego' _jasniak_cios_5 %;\
    /def -Fp5 -P1xBCcyan -t'swym zdobionym jasniejacym mlotem bojowym, a cios.* (bezlitosnie miazdzy)' _jasniak_cios_6 %;\
    /def -Fp5 -P1xBCcyan -t'przerazajacym ciosem zdobionego jasniejacego mlota bojowego.*(krwawo rozstrzaskujac .* swojego przeciwnika, definitywnie konczac starcie)' _jasniak_cios_7 %;\
    /def -Fp5 -P0xnCmagenta;1xnBCmagenta -t'Pulsujaca glowica zdobionego jasniejacego mlota bojowego (.*) rozblyska nagle luna bladego, zlocistego swiatla!' _jasniak_cios_8 %;\
    /def -Fp5 -P1xBCred -t'poteznym ciosem rozswietlonego obucha zdobionego jasniejacego mlota bojowego.* (potwornie raniac) cie' _jasniak_cios_1a %;\
    /echo -aCgreen Jasniak Grrida!!! Podpinam opisy!
/def -Fp6 -t'Pod wplywem twego pewnego chwytu, jasny obuch zdobionego jasniejacego mlota bojowego rozblyskuje jasnym swiatlem, zas twe serce napelnia sie pewnoscia, ze zakleta w tym orezu moc pozwoli ci stawic czolo kazdemu przeciwnikowi.' _jasniak_spec_wlacz_2 = \
    /set bron_dobyta 1 %;\
    /def -Fp5 -P1xnCblue -t'^Twoj niecelny cios zdobionego jasniejacego mlota bojowego.*(przeszywa powietrze)' moj_jasniak_cios_1a =/_anty_flood_hide 2 %;\
    /def -Fp5 -P1xnCblue -t'uderzasz swym zdobionym jasniejacym mlotem bojowym.*(niegroznie .* raniac)' moj_jasniak_cios_2a %;\
    /def -Fp5 -P1xnCblue -t'^Zaskakujesz .* celnym uderzeniem swojego zdobionego jasniejacego mlota bojowego.*(pozostawiajac nan krwawy slad)' moj_jasniak_cios_3a %;\
    /def -Fp5 -P1xnCblue -t'^Silnym ciosem zdobionego jasniejacego mlota bojowego dosiegasz.*(kaleczac)' moj_jasniak_cios_4a %;\
    /def -Fp5 -P1xBCblue -t'^(Przy przykrym akompaniamencie miazdzonych kosci), ciezkie uderzenie twego zdobionego jasniejacego mlota bojowego' moj_jasniak_cios_5a %;\
    /def -Fp5 -P1xBCblue -t'^Czujac ledwie ulamek promieniujacej ze zdobionego jasniejacego mlota bojowego mocy, .* wstrzasasz cialem .*, (potwornie raniac) je' moj_jasniak_cios_6a %;\
    /def -Fp5 -P1xBCblue -t'^W momencie kiedy pelen sily cios twego zdobionego jasniejacego mlota bojowego uderza .* (dotkliwie parzac)' moj_jasniak_cios_7a %;\
    /def -Fp5 -P1xBCblue -t'^Z zamaszystego zamachu morderczo uderzasz swym zdobionym jasniejacym mlotem bojowym .*(bezlitosnie miazdzy) cialo' moj_jasniak_cios_8a %;\
    /def -Fp5 -P1xBCblue -t'^Wypelniajaca cie brawura,.* ciosie zdobionego jasniejacego mlota bojowego, ktorego impet (krwawo rozstrzaskuje .*, konczac raz na zawsze walke)' moj_jasniak_cios_9a %;\
    /def -Fp5 -P0xnCmagenta;1xnBCmagenta -t'Pulsujaca glowica (twojego) zdobionego jasniejacego mlota bojowego rozblyska nagle luna bladego, zlocistego swiatla!' moj_jasniak_cios_10a %;\
    /echo -aCgreen Moj Jasniaczek!!! Pokoloruje twoje cudowne uderzenia! %;\
    /def -Fp5 -t'Wraz z opuszczeniem swego zdobionego jasniejacego mlota bojowego zanika wypelniajace do tej pory twe serce uczucie niezlomnosci i mestwa, zas jasny obuch broni przestaje swiecic emanujacym otucha blaskiem.' moj_jasniak_wylaczam_opisy = \
        /set bron_dobyta 0 %%;\
        /purge moj_jasniak_*
;    /def -Fp5 -P1xnCcyan -t'' _jasniak_cios_1a %;\

; Niebieskawa zdobiona bulawa smoczego
/def -n1 -Fp6 -t'*[Nn]iebieskaw* zdobion* bulaw*' _bulawa_spec_wlacz_1 = \
    /def -Fp5 -P1xnCcyan -t'(muska|niezbyt mocno rani) (?!cie ).*swoj(a|ej) niebieskaw.* zdobion.* bulaw' _bulawa_cios_1 %;\
    /def -Fp5 -P1xnCcyan -t'wyprowadza mierzony cios niebieskawa zdobiona bulawa i (uderza)' _bulawa_cios_2 %;\
    /def -Fp5 -P1xnCcyan -t'unosi wysoko swoja niebieskawa zdobiona bulawe i poteznym ciosem (rani)' _bulawa_cios_3 %;\
    /def -Fp5 -P1xBCcyan;2xBCcyan -t'wykonuje zamach swoja niebieskawa zdobiona bulawa, .*i (uderza) .* (prawie lamiac mu kosci)\.$$' _bulawa_cios_4 %;\
    /def -Fp5 -P1xBCcyan -t'^Niebieskawa zdobiona bulawa zaczyna .* (miazdzy) ' _bulawa_cios_5 %;\
    /def -Fp5 -P1xBCcyan -t'unosi swoja bron, a po jasniejacej niebieskawej zdobionej bulawie.*(zabijajac go na miejscu, pozostawiajac w nadpalonym korpusie ziejaca dziure)\.$$' _bulawa_cios_6 %;\
    /def -Fp5 -P1xnCred -t'(lekko muska|niezbyt mocno rani) cie .* swoj(a|ej) niebieskaw.* zdobion.* bulaw' _bulawa_cios_1a %;\
    /def -Fp5 -P0xnCmagenta -t'^Poswiata spowijajaca glowice niebieskawej zdobionej bulawy powoli blaknie i zanika\.$$' _bulawa_podswietlenie_1 = /_anty_flood_hide 6 %;\
    /def -Fp5 -P0xnCmagenta -t'^Glowica niebieskawej zdobionej bulawy rozpala sie blekitna poswiata\.$$' _bulawa_podswietlenie_2 %;\
    /msg Bulawka Friiliego !!! Podswietlam jej opisy!

;    /def -Fp5 -P1xnCred -t'' _bulawa_cios_ %;\
;    /def -Fp5 -P1xnCcyan -t'' _bulawa_cios_1 %;\


/def -n1 -Fp6 -t'*[Ss]zmaragdowozielony* misterny* plaszcz*' _plaszczyk_spec_wlacz_1 = \
	/def -Fp5 -P0xnCmagenta -t'^Czujesz jak uzdrawiajaca energia przepelnia twe cialo\.$$' _plaszczyk_podswietlenie_wlacz %;\
	/msg Ooo... Fajny plaszczyk z Drachen. 'Zeplnij plaszcz broszka' a bedzie leczyc.


; Misterny obosieczny toporek golema 
/def -n1 -Fp6 -t'*[Mm]isterny* obosieczny* topor*' _misterniak_spec_wlacz_1 = \
    /def -Fp5 -P1xnCcyan -t'Ostrze misternego obosiecznego topora dzierzonego przez.*(nie wyrzadzajac mu zadnej krzywdy)' _misterniak_cios_0 %;\
    /def -Fp5 -P1xnCcyan -t'(?: uderza swym | zamachu tnie | zahacza )misternym obosiecznym toporem .*(znaczac ostrze broni kilkoma kroplami krwi|nieznacznie raniac|nieduze obrazenia|pozostawiajac plytka, nierowna rane)' _misterniak_cios_1 %;\
    /def -Fp5 -P1xnCcyan -t'szpikulcow misternego obosiecznego topora .* uderza .*(niewielkie zadrapanie)' _misterniak_cios_2 %;\
    /def -Fp5 -P1xnCcyan -t' godzi .* misternego obosiecznego topora .* (lekko .* raniac|upuszczajac .* nieco krwi)' _misterniak_cios_3 %;\
    /def -Fp5 -P1xnCcyan -t'zamachu tnie misternym obosiecznym toporem.*(raniac .*|a tryskajaca z tej rany krew zrasza ziemie)\.' _misterniak_cios_5 %;\
    /def -Fp5 -P1xBCcyan -t'(?:ostrze dzierzonego przez (?!ciebie)|wbija.*sterczacy z (?:nasady zelezca|rekojesci)|Druzgoczacym atakiem).* misternego obosiecznego topora (?:godzi |bezlitosnie wbija |kolec|wrzyna sie|.*brutalnie rozcina |szpikulec).*(zadajac ogromne obrazenia|zadajac .* ciezka rane|zadajac powazne obrazenia|powodujac paskudny krwotok|odrzucajac .* w tyl niczym szmaciana lalke|zbrukane posoka ostrze grzeznie pomiedzy koscmi ofiary|pozostawiajac gleboka rane)' _misterniak_cios_4 %;\
    /def -Fp5 -P1xBCcyan -t'wyrzuca przed siebie misterny obosieczny topor.*(bardzo ciezko .* raniac)' _misterniak_cios_6 %;\
    /def -Fp5 -P1xBCcyan -t'szybkim wypadem wymija.*jego misterny obosieczny topor.*(zadajac mordercze ciecia)' _misterniak_cios_7 %;\
    /def -Fp5 -P1xBCcyan -t'Twarz .* wykrzywia paskudny grymas gdy (cialo z gluchym loskotem pada na ziemie)' _misterniak_cios_8 %;\
    /def -Fp5 -P1xBCcyan -t'Poteznym szarpnieciem.* uwalnia orez, a krew .* (tryska strumieniem ze straszliwej rany)' _misterniak_cios_9 %;\
    /def -Fp5 -P1xBCcyan -t'ciosem sterczacego z misternego obosiecznego topora.*trafia .*(Bezwladne cialo wali sie na ziemie, wciaz broczac krwia ze smiertelnej rany)' _misterniak_cios_10 %;\
    /echo -aCgreen Misterniak Bryga! Podpinam opisy!
/def -n1 -Fp6 -mregexp -t'^Chwytasz stylisko misternego obosiecznego topora w garsc i wykonujesz nim kilka probnych wymachow, oswajajac sie z nietypowym wywazeniem oreza\\.$$' _misterniak_spec_wlacz_2 = \
    /def -Fp5 -P1xnCblue -t'^Ostrze twojego misternego obosiecznego topora trafia .* (nie czyniac mu zadnej krzywdy)\.$$' moj_misterniak_cios_0 %;\
    /def -Fp5 -P1xnCblue -t'^Z (?:oszczednego zamachu uderzasz swym|szerokiego zamachu tniesz) misternym obosiecznym toporem .* (znaczac ostrze broni kilkoma kroplami krwi|a tryskajaca z tej rany krew zrasza ziemie)\.$$' moj_misterniak_cios_1 %;\
    /def -Fp5 -P1xnCblue -t'^(?:Ostrym jak sztylet gornym szpikulcem sterczacym ze styliska|Szybkim ciosem jednego ze szpikulcow) misternego obosiecznego topora (godzisz|uderzasz) .* (spuszczajac mu nieco krwi|niewielkie zadrapanie)\.$$' moj_misterniak_cios_2 %;\
    /def -Fp5 -P1xnCblue -t'^Twoj misterny obosieczny topor zahacza .* (pozostawiajac plytka, nierowna rane)\.$$' moj_misterniak_cios_3 %;\
    /def -Fp5 -P1xBCblue -t'^Przy akompaniamencie .* twojego misternego obosiecznego topora wrzyna sie w .* (odrzucajac .* w tyl niczym szmaciana lalke)\.$$' moj_misterniak_cios_4 %;\
;    /def -Fp5 -P1xnCblue -t'' moj_misterniak_cios_ %;\
;    /def -Fp5 -P1xnCblue -t'' moj_misterniak_cios_ %;\
;    /def -Fp5 -P1xnCblue -t'' moj_misterniak_cios_ %;\
;    /def -Fp5 -P1xnCblue -t'' moj_misterniak_cios_ %;\
;    /def -Fp5 -P1xnCblue -t'' moj_misterniak_cios_ %;\
    /msg Moj misterniaczek! Jakis ty piekny!

;Przy akompaniamencie oszalamiajacego syku przecinanego powietrza krwawe ostrze twego misternego obosiecznego topora wrzyna sie w glowe kogos, odrzucajac go w tyl niczym szmaciana lalke.

; Sihillek
/def -n1 -Fp6 -t'*[Ww]aski* kunsztown* sihill*' _sihill_spec_wlacz_1 = \
    /def -Fp5 -P1xnCcyan -t'wykonuje zamaszysty cios waskim kunsztownym sihillem.*(przecinajac powietrze tuz obok)' _sihill_cios_0 %;\
    /def -Fp5 -P1xnCcyan -t'niezbyt czysto trafia .*waskim kunsztownym sihillem.*(nieznaczne drasniecie)' _sihill_cios_1 %;\
    /def -Fp5 -P1xnCcyan -t'wykonuje oszczedne (?:ciecie|pchniecie), (lekko raniac).*waskiego kunsztownego sihilla' _sihill_cios_2 %;\
    /def -Fp5 -P1xnCcyan -t'blyskawicznie kontruje atak.* (tnac|dzgajac).* waskim kunsztownym sihillem' _sihill_cios_3 %;\
    /def -Fp5 -P1xBCcyan -t'waskiego kunsztownego sihilla dosiega .*(gleboko .* raniac)' _sihill_cios_4 %;\
    /def -p9 -P1xBCcyan -t'atakuje waskim kunsztownym sihillem.*(ogromne obrazenia)' _sihill_cios_5 %;\
    /def -Fp5 -P1xBCcyan -t'zgrabnym ruchem zwodzi .*waskiego kunsztownego sihilla. (Gwaltowny bryzg krwi znaczy dlonie i twarz zabojcy purpurowymi cetkami)' _sihill_cios_6 %;\
    /echo -aCgreen Sihillek Thaurona!!! Podpinam opisy!
/def -n1 -Fp6 -t'*Dobywasz waskiego kunsztownego sihilla' _sihill_spec_wlacz_2 = \
    /echo -aCgreen Moj ukochany mieczyk! Pokoloruje twoje cudowne uderzenia!
;    /def -Fp5 -P1xnCcyan -t'' _sihill_cios_a 

; Poszczerbiony obureczny miecz z Orsona :)
/def -n1 -Fp6 -t'*poszczerbiony* obureczny* miecz*' _szczerbiec_spec_wlacz = \
    /def -Fp5 -P1xnCgreen -t'istem przecina powietrze (tuz obok niego)'    _szczerbiec_opis_1 %;\
    /def -Fp5 -P1xnCgreen -t'zadajac .*(nieznaczne obrazenia)'        _szczerbiec_opis_2 %;\
    /def -Fp5 -PxnCgreen -t'lekko .* raniac'                _szczerbiec_opis_3 %;\
    /def -Fp5 -PxBCgreen -t'kaleczac .* przy tym dotkliwie'        _szczerbiec_opis_4 %;\
    /def -Fp5 -PxBCgreen -t'potwornie raniac'            _szczerbiec_opis_5 %;\
    /def -Fp4 -PxBCgreen -t'poteznym uderzeniem masakrujesz'        _szczerbiec_opis_6 %;\
    /def -Fp5 -axBCmagenta -t'*gdy ten zaczyna nagle plonac krwistoczerwonym ogni*'    _szczerbiec__opis_spec_1 %;\
    /def -Fp5 -axBCmagenta -t'*Miecz przygasa. Znow nabierasz pewnosci, ze tylko*'     _szczerbiec__opis_spec_2 %;\
    /def -Fp5 -PxnCgreen -t'niechetnie oddaje ci z powrotem kontrole nad cialem'    _szczerbiec__opis_spec_3 %;\
    /def -Fp5 -PxBCgreen -t'by po chwili ukosnym cieciem ugodzic'             _szczerbiec__opis_spec_4 %;\
    /echo -aCgreen O cuda dziwy!! Szczerbiec!!! Wlaczam ladne opisy i specjale

; Polyskliwy smukly espadon z ozywka :)
/def -n1 -Fp6 -t'*polyskliwy* smukly* espadon*' _espadon_spec_wlacz = \
    /def -Fp5 -P1xnCgreen -t'(lekko muska(sz|)) .* espadon'    _espadon_opis_1 %;\
    /def -Fp5 -P1xnCgreen -t'(muska(sz|)) .* espadon'    _espadon_opis_1_a %;\
    /def -Fp5 -P1xnCgreen -t'espad.* (rozcina(sz|.*) cialo)'         _espadon_opis_2 %;\
    /def -Fp5 -P1xnCgreen -t'(niezbyt mocno rani(sz|))'            _espadon_opis_3 %;\
    /def -Fp5 -P1xnCgreen -t'espad.* (rani(sz|))'            _espadon_opis_4 %;\
    /def -Fp4 -P1xBCgreen -t'espad.* (ciezko rani(sz|))'        _espadon_opis_5 %;\
    /def -Fp5 -P1xBCgreen -t'zamachu (masakruje(sz|))'             _espadon_opis_6 %;\
    /def -Fp5 -P0xBCgreen -t'gleboka rane'                _espadon_opis_7 %;\
    /def -Fp5 -P0xBCgreen -t'z okrzykiem na ustach dopada(sz|)'    _espadon_opis_8 %;\
    /def -Fp5 -P0xBCgreen -t'potwornej rany, buchajacej na wszystkie strony krwia'    _espadon_opis_9 %;\
    /def -Fp5 -P0xBCgreen -t'wyszarpuje.* z ciala.* zakrwawiona bron'    _espadon_opis_10 %;\
    /echo -aCgreen Espadonek!!! Wlaczam ladne opisy!!

;Sander (MC R) lekko muska cie w lewe ramie swoim polyskliwym smuklym espadonem.


; Prosty smukly_rapier
/def -n1 -Fp6 -t'*prosty* smukly* rapier*' _rapier_spec_wlacz = \
    /def -Fp5 -PxnCgreen -t'nie czyniac .* zadnej krzywdy' _rapier_opis_0 %;\
    /def -Fp5 -P1xnCgreen -t'nieudane .* (mija .* o cal)'   _rapier_opis_1 %;\
    /def -Fp5 -PxnCgreen -t'zadajac .* lekka rane'             _rapier_opis_2 %;\
    /def -Fp5 -PxBCgreen -t'zadajac .* powazna rane'        _rapier_opis_3 %;\
    /def -Fp5 -PxBCgreen -t'ciezko raniac'                  _rapier_opis_4 %;\
    /def -Fp4 -PxBCgreen -t'powoduje(sz|) fontanne krwi'    _rapier_opis_5 %;\
    /def -Fp5 -PxBCgreen -t'przebija(sz|) na wylot'         _rapier_opis_6 %;\
    /echo -aCgreen Rapier Chappelle'a!!! Wlaczam ladne opisy!!

; Polyskujacy zdobiony sztylet z humanoida!! MUTUJE!
/def -n1 -Fp6 -t'*polyskujac? zdobion? sztylet*' _sztylet_spec_wlacz = \
    /def -Fp5 -P1xnCgreen -t'cios (nieznacznie mija cel)'        _sztylet_opis_1 %;\
    /def -Fp5 -P1xnCgreen -t'jedynie (niegroznie .*muska(sz|))'        _sztylet_opis_2 %;\
    /def -Fp5 -P1xnCgreen -t'awej rece sztyletem (ledwo .* muskajac)'    _sztylet_opis_3 %;\
    /def -Fp5 -P1xnCgreen -t'rece sztyletem (lekko .* raniac)'        _sztylet_opis_4 %;\
    /def -Fp5 -P1xnCgreen -t'(raniac) .* dziwna b'            _sztylet_opis_5 %;\
    /def -Fp5 -P1xBCgreen -t'(z rozmachem trafia(sz|) .*) w .* trzym'    _sztylet_opis_6 %;\
    /def -Fp5 -P1xBCgreen -t'(Ostrze sztyletu zaglebia sie w .*ciele)'    _sztylet_opis_7 %;\
    /def -Fp5 -P1xBCgreen -t'zadajac (powazne obrazenia)'         _sztylet_opis_8 %;\
    /def -Fp5 -P0xBCgreen -t'blyskawicznym ruchem wbijasz'        _sztylet_opis_9 %;\
    /def -Fp5 -P0xBCgreen -t'rozblyskuja na chwile silniejszym swiatlem' _sztylet_opis_10 %;\
    /echo -aCgreen Spaczony sztylet z mutantow!!! Podswietlam jego ciosy!!

; Misterna elfia wlocznia z Loren. poprawki by F3niX :)
/def -n1 -Fp6 -t'*mistern? elfi? wlocznia*' _wlocznia_spec_wlacz = \
    /def -Fp5 -P1xnCgreen -t'elfia wlocznia .* (o wlos mija)'                 _wlocznia_opis_1 %;\
    /def -Fp5 -P1xnCgreen -t' wlocznia, pozostawiajac (ledwie drasniecie)'     _wlocznia_opis_2 %;\
    /def -Fp5 -P1xnCgreen -t'(niegroznie muska(sz|)) .* swa misterna elfia'         _wlocznia_opis_3 %;\
    /def -Fp5 -P1xnCgreen -t'(niezbyt mocno rani(sz|)) .* sw(a|ej) wloczni'         _wlocznia_opis_4 %;\
    /def -Fp5 -P1xnCgreen -t' wlocznia, (raniac)'                     _wlocznia_opis_5 %;\
    /def -Fp5 -P1xBCgreen -t'elfiej wloczni.* (mocno rani(sz|))'             _wlocznia_opis_6 %;\
    /def -Fp5 -P1xBCgreen -t'(z impetem wbija(sz|)) misterna elfia wlocznie'         _wlocznia_opis_7 %;\
    /def -Fp5 -P1xBCgreen -t'ktorej stalowe ostrza rozdzieraja (straszliwa rane)'     _wlocznia_opis_8 %;\
    /def -Fp5 -P1xBCgreen -t'trzymana oburacz elfia wlocznie (w (jego|jej|twoje) serce)' _wlocznia_opis_9 %;\
    /def -Fp5 -P1xBCgreen -t'na wylot. (Martwe cialo bezwladnie zsuwa sie)'         _wlocznia_opis_10 %;\
    /echo -aCgreen O widze elfia wlocznie z loren!! Wlaczam opisy specjalne!!

; Smukly lsniacy scimitar by Rudziutka :)
/def -n1 -Fp6 -t'*smukl* lsniac* scimitar*' _scimitar_spec_wlacz = \
    /def -Fp5 -P1Cgreen -t'piruecie.*(prawie .*trafiajac)' _scimitar_opis_0 %; \
    /def -Fp5 -PCgreen -t'nieznacznie .* raniac' _scimitar_opis_1 %; \
    /def -Fp5 -PCgreen -t'pozostawiajac lekko krwawiaca rane' _scimitar_opis_2 %; \
    /def -Fp5 -PBCgreen -t'zgrzyta o kosc, a katem oka zauwazasz warkocz posoki' _scimitar_opis_3 %; \
    /def -Fp5 -PBCgreen -t'uwalniajac ostrze z ciezkiej rany' _scimitar_opis_4 %; \
    /def -Fp5 -PBCgreen -t'gleboko w (korpus tnac kosci, sciegna|cialo pozostawiajac duza rane)' _scimitar_opis_5 %; \
    /def -Fp5 -PBCgreen -t'prawie smiertelna rane' _scimitar_opis_6 %; \
    /def -Fp5 -P1BCgreen -t'Z rozcietych tetnic chlusta fontanna posoki, a .* (pada bez zycia na ziemie)' _scimitar_opis_7 %; \
    /echo -aBCgreen Scimitar ze zmor!! Wlaczam ladne opisy!!!

; Zielonkawy bretonski mlot ze zmor
/def -n1 -Fp6 -t'*zielonkaw* bretonski* mlot*' _ziel_mlot_spec_wlacz = \
    /def -Fp5 -P1xnCgreen -t'rozpedzona glowica .* (mija) .* o wlos'        _ziel_mlot_opis_1 %;\
    /def -Fp5 -P1xnCgreen -t'glowica .* zahacza .* (niewielkie zasinienie)'    _ziel_mlot_opis_2 %;\
    /def -Fp5 -P1xnCgreen -t'z lekkiego zamachu .* (nieznacznie muska(?:sz|))'    _ziel_mlot_opis_3 %;\
    /def -Fp5 -P1xBCgreen -t'mocno trzonek .* tlucze .* (raniac dotkliwie)'    _ziel_mlot_opis_4 %;\
    /def -Fp5 -P1xBCgreen -t'tlucze.*pozostawiajac (paskudna rane)'         _ziel_mlot_opis_5 %;\
    /def -Fp5 -P1xBCgreen -t'z pelnego rozpedu.*(miazdzac okoliczne kosci)'        _ziel_mlot_opis_6 %;\
    /def -Fp5 -P1xBCgreen -t'naglym kopniakiem .* (miazdzy klatke piersiowa)' _ziel_mlot_opis_7 %;\
    /echo -aCgreen Zielonkawy bretonski mlot ze zmor!!! Podswietlam jego ciosy!!

;opalizujacy runiczny topor obosieczny - temu trzeba sie bedzie przyjrzec jeszcze ... bo nie jestem zadowolony ;/
;antyflood na ciosy 3 osoby i gasniecia(full)
;podswietla ladowania specow z 1 i 3 osoby(full)
;skraca spece tylko z 3 osoby i moje - brakuje specow we mnie (oby tych jak najmniej:P)
;brakuje ciosow w ciebie 
;moje ciosy podswietla
/def -n1 -Fp6 -t'*opalizujac* runiczn* topor* obosieczn*' _topor_opal_spec_wlacz = \
   /def -Fp5 -P1xnCgreen -t'(Muskasz) .* opalizujacym' _topor_opal_cios_1 %;\
   /def -Fp5 -P2xnCgreen -t'(Trafiasz) .* (kaleczac .*)' _topor_opal_cios_2 %;\
   /def -Fp5 -P1xnCgreen -t'(Lekko ranisz) .* runicznego' _topor_opal_cios_3 %;\
   /def -Fp5 -P1xnCgreen -t'Wykonujesz.*opalizujacym .* (raniac)' _topor_opal_cios_4 %;\
   /def -Fp5 -P1xnCgreen -t'Wykonujesz.*(pozostawiajac krwawa bruzde)' _topor_opal_cios_5 %;\
   /def -Fp5 -P1xnCgreen -t'(Bezlitosnie masakrujesz) .* opalizujacym' _topor_opal_cios_6 %;\
   /def -Fp5 -P1xnCgreen -t'opalizujacym.*trafiasz .*(krew zalewa .* niewidzace juz nic oczy)' _topor_opal_cios_7 %;\
   /def -Fp5 -P1xnCgreen -t'(krwawiaca rane)' _topor_opal_cios_8 %;\
   /def -Fp6 -P1xnCgreen -t'(muska .* swoim|trafia .* zamaszystym ciosem|lekko rani .* zamaszystym cieciem|wykonuje zamaszysty cios|bezlitosnie masakruje .*|Potezne ciecie|poteznym ciosem) opalizujac(ego|ym).*\.' _topor_opal_antyflood_1 = /_anty_flood_hide 6 %;\
   /def -Fp5 -P0xnCmagenta;1xnBCmagenta -t'Runy na ostrzu opalizujacego runicznego topora obosiecznego trzymanego przez (.*) zaczynaja plonac bladoczerwonym swiatlem' _topor_opal_ladowanie_1 %;\
   /def -Fp5 -P0xnCmagenta;1xnBCmagenta -t'Czujesz jak (opalizujacy runiczny topor obosieczny zaczyna drgac) w twych rekach jakby chcial sie wyrwac i za wszelka cene dosiegnac przeciwnika. Runy na ostrzu zaczynaja plonac bladoczerwonym swiatlem' _topor_opal_ladowanie_2 %;\
   /def -Fp5 -P0xnCgreen -t'Runy na ostrzu opalizujacego runicznego topora obosiecznego trzymanego przez .* przygasaja' _topor_opal_antyflood_2 = /_anty_flood_hide 6 %;\
   /def -Fp5 -P0xnCgreen -t'Opalizujacy runiczny topor obosieczny przestaje drgac a runy na jego ostrzu przygasaja' _topor_opal_antyflood_3 = /_anty_flood_hide 6 %;\
   /def -Fp5 -P1xnCgreen -t' wyprowadza potezny zamach opalizujacym.*muska .*(leb|ramie|noge|reke|glowe|korpus) (.*)\.' _topor_opal_spec_1 = /return _psnr("@{BCblack}", "OPAL", "1/6", {PL}, {P2}) %;\
   /def -Fp5 -P3xnCgreen -t'Opalizujacy runiczny topor obosieczny (.*) trafia (.*), zaglebiajac.*(gotowac)' _topor_opal_spec_2 = /return _psnr("@{BCblack}", "OPAL", "2/6", {P1}, {P2}) %;\
   /def -Fp5 -P2xnCgreen -t' zamaszystym cieciem opalizujacego.* trafia (.*). Bron .*(ostrza)\.' _topor_opal_spec_3 = /return _psnr("@{BCblack}", "OPAL", "3/6", {PL}, {P1}) %;\
   /def -Fp5 -P3xnCgreen -t' opalizujacy runiczny topor obosieczny (.*) opada w kierunku (.*), z potezna.*(runy pala)' _topor_opal_spec_4 = /return _psnr("@{BCblack}", "OPAL", "4/6", {P1}, {P2}) %;\
   /def -Fp5 -P2xnCgreen -t' poteznym uderzeniem swojego opalizujacego runicznego topora obosiecznego dosiega (.*). Ostrze .* (mdly zapach)\.' _topor_opal_spec_5 = /return _psnr("@{BCblack}", "OPAL", "5/6", {PL}, {P1}) %;\
   /def -Fp5 -P2xnCgreen -t' poteznym cieciem opalizujacego .*dodatkowo ranic ofiare. (.*) zamiera.*(po czym nieruchomieje)' _topor_opal_spec_6 = /return _psnr("@{BCblack}", "OPAL", "6/6", {PL}, {P1}) %;\
   /def -Fp5 -P1xnCgreen -t'Wyprowadzasz potezny zamach opalizujacym.*muska .*(leb|ramie|noge|reke|glowe|korpus) (.*)\.' _topor_opal_spec_moj_1 = /return _psnr("@{BCblack}", "OPAL", "1/6", "TY", {P2}) %;\
   /def -Fp5 -P2xnCgreen -t'Twoj opalizujacy runiczny topor obosieczny trafia (.*), zaglebiajac.*(gotowac)' _topor_opal_spec_moj_2 = /return _psnr("@{BCblack}", "OPAL", "2/6", "TY", {P1}) %;\
   /def -Fp5 -P2xnCgreen -t'Zamaszystym cieciem opalizujacego.* trafiasz (.*). Bron .*(ostrza)\.' _topor_opal_spec_moj_3 = /return _psnr("@{BCblack}", "OPAL", "3/6", "TY", {P1}) %;\
   /def -Fp5 -P2xnCgreen -t'Ze swistem twoj opalizujacy runiczny topor obosieczny opada w kierunku (.*), z potezna sila .* (blaskiem palac cialo twego)' _topor_opal_spec_moj_4 = /return _psnr("@{BCblack}", "OPAL", "4/6", "TY", {P1}) %;\
   /def -Fp5 -P2xnCgreen -t'Poteznym uderzeniem swojego opalizujacego runicznego topora obosiecznego dosiegasz (.*). Ostrze .* (mdly zapach)\.' _topor_opal_spec_moj_5 = /return _psnr("@{BCblack}", "OPAL", "5/6", "TY", {P1}) %;\
   /def -Fp5 -P1xnCgreen -t'Poteznym cieciem opalizujacego runicznego topora obosiecznego dosiegasz .*dodatkowo (go|ja) ranic. (.*) zamiera.*(po czym nieruchomieje)' _topor_opal_spec_moj_6 = /return _psnr("@{BCblack}", "OPAL", "6/6", "TY", {P2}) %;\
   /echo -aCgreen Opalizujacy topor Ghazara ! Podswietlam spece!!
   
;ciezkie zdobione topory ze zmor w bretonii
;Straszliwa eteryczna zmora bierze plynny zamach swoim ciezkim zdobionym toporem w ciebie, lecz udaje ci sie wykonac zwod i uniknac niecelnego ciosu.
;Straszliwa eteryczna zmora silnym wymachem swojego ciezkiego zdobionego topora trafia cie w korpus zostawiajac na twoim ciele niewielka rane.
;Uderzenie ciezkiego zdobionego topora straszliwej eterycznej zmory pozostawia na twoim ciele dluga, czerwona szrame.
;Mocny cios zdobionego ciezkiego topora groznej milczacej zmory trafia cie w korpus raniac znacznie.
/def -n1 -Fp6 -t'ciezk* zdobion* topor*' _zdobiony_topor_spec_wlacz = \
    /def -Fp5 -P1xnCgreen -t'wykonac zwod i (uniknac niecelnego ciosu)\\\\.$$' _zdobiony_topor_spec_1%;\
    /def -Fp5 -P1xnCgreen -t'zostawiajac na .* ciele (niewielka rane)\\\\.$$' _zdobiony_topor_spec_2%;\
    /def -Fp5 -P1xBCgreen -t'ciele dluga, (czerwona szrame)\\\\.$$' _zdobiony_topor_spec_3%;\
    /def -Fp5 -P1xBCgreen -t'^Mocny cios zdobionego ciezkiego topora .* (raniac znacznie)\\\\.$$' _zdobiony_topor_spec_4%;\
;niestety reszty opisow nie mam... :/
    /echo -aCgreen Ciezki zdobiony topor ze zmor!!! Podswietlam jego ciosy!!
;jednoreczne kosciane maczugi z bestii kolo srebrnego szlaku... nie wiem, czy wszystkie opisy sa.
;Prymitywna ogromna bestia uderza Gluvertha kosciana jednoreczna maczuga trafiajac go w korpus, a z powstalej rany zaczyna powoli broczyc krew.
; te dwa Gluverth dostal w dobrym.... muskanie?
;Prymitywna ogromna bestia uderza Graera kosciana jednoreczna maczuga trafiajac go w lewe ramie.
;Prymitywna ogromna bestia wykonuje szybki wymach a nastepnie uderza Graera kosciana jednoreczna maczuga zadajac nieznaczne obrazenia w glowe, a z powstalej rany zaczyna powoli tryskac krew.
; te dwa Gorthol dostal w rannym
;Prymitywna ogromna bestia unikajac ciosu wykonuje szybki wymach a nastepnie blys kawicznie uderza Gorthola kosciana jednoreczna maczuga raniac go w korpus. Momentalnie uderza ponownie w to samo miejsce, co powoduje silne krwawienie z rany.
;Prymitywna ogromna bestia wykonuje szybki wymach a nastepnie blyskawicznie uderza Gorthola kosciana jednoreczna maczuga trafiajac go w korpus. Cios byl na tyle silny, ze z poszarpanej rany zaczyna obficie broczyc krew.
; to dostal w ciezko Gorthol :> (oba)
;Prymitywna masywna bestia widzac chwile nieuwagi wyskakuje wysoko w gore i uderza Gorthola kosciana jednoreczna maczuga tak niespodziewanie, ze nie bylo najmniejszej szansy na obrone. Trafia powaznie raniac go w nogi. Cios jest tak silny, ze niemal powalil go na ziemie.
;Prymitywna masywna bestia bezlitosnie wykorzystuje swoja przewage i silnym ciosem trafia Gorthola kosciana jednoreczna maczuga bardzo mocno raniac go w korpus. Wykorzystujac chwile dekoncentracji, przyskakuje blizej i uderza jeszcze raz w to samo miejsce.
; bardzo ciezko i masakra? dostal te 2 w ledwo :>
;Prymitywna masywna bestia przyskakuje do Gorthola i wykonuje blyskawiczny piruet. Cios jest zbyt gwaltowny by ofiara mogla chociaz pomyslec o obronie. Slychac jedynie gluchy trzask i zaraz potem widzisz jak prymitywna masywna bestia raz po raz masakruje juz i tak martwe zwloki Gorthola.

/def -n1 -Fp6 -t'koscian* jednoreczn* maczug*' _kosciana_maczuga_spec_wlacz = \
    /def -Fp5 -P1xnCgreen -t'(uderza) (.*) kosciana jednoreczna maczuga' _kosciana_maczuga_spec_1%;\
    /def -Fp5 -P0xnCgreen -t'zaczyna powoli broczyc krew\\\\.$$' _kosciana_maczuga_spec_2%;\
    /def -Fp5 -P0xnCgreen -t'zaczyna powoli tryskac krew\\\\.$$' _kosciana_maczuga_spec_3%;\
    /def -Fp5 -P1xnCgreen;2xBCgreen -t'(raniac go) .* (silne krwawienie z rany)\\\\.$$' _kosciana_maczuga_spec_4%;\
    /def -Fp5 -P0xBCgreen -t'obficie broczyc krew\\\\.$$' _kosciana_maczuga_spec_5%;\
    /def -Fp5 -P1xBCgreen;2xBCgreen -t'Trafia (powaznie raniac)\\\\. Cios jest tak silny, ze (niemal powalil (?:go|cie) na ziemie)\\\\.$$' _kosciana_maczuga_spec_6%;\
    /def -Fp5 -P1xBCgreen -t'kosciana jednoreczna maczuga (bardzo mocno raniac (?:go|cie)' _kosciana_maczuga_spec_7%;\
    /def -Fp5 -P1xBCgreen -t'raz po raz (masakruje juz i tak martwe zwloki)' _kosciana_maczuga_spec_8%;\
    /echo -aCgreen Kosciana jenoreczna maczuga z bestii!!! Podswietlam jej ciosy!!


;Nagle lustrzana powierzchnia lsniacej plomienistej tarczy rozblyskuje jasnoczerwonym, palacym swiatlem. Ta dziwna poswiata formuje sie w wirujaca kule przeplatajacych sie ze soba zoltych i pomaranczowych jezorow plynnego ognia, ktore wystrzeliwuja w kierunku umiesnionego nerwowego reptiliona, nie czyniac jednak zadnej szkody.
;Nagle lustrzana powierzchnia lsniacej plomienistej tarczy rozblyskuje jasnoczerwonym, palacym swiatlem. Ta dziwna poswiata formuje sie w wirujaca kule przeplatajacych sie ze soba zoltych i pomaranczowych jezorow plynnego ognia, ktore wystrzeliwuja w kierunku niskiego nerwowego reptiliona.      Parzace plomienie omiataja jego cialo pozostawiajac jedynie nieznaczne obrazenia.
;Nagle lustrzana powierzchnia lsniacej plomienistej tarczy rozblyskuje jasnoczerwonym, palacym swiatlem. Ta dziwna poswiata formuje sie w wirujaca kule przeplatajacych sie ze soba zoltych i pomaranczowych jezorow plynnego ognia, ktore wystrzeliwuja w kierunku wysokiego syczacego reptiliona.     Parzace plomienie omiataja jego cialo pozostawiajac jedynie nieduze obrazenia.
;Nagle lustrzana powierzchnia lsniacej plomienistej tarczy rozblyskuje jasnoczerwonym, palacym swiatlem. Ta dziwna poswiata formuje sie w wirujaca kule przeplatajacych sie ze soba zoltych i pomaranczowych jezorow plynnego ognia, ktore wystrzeliwuja w kierunku oslizglego odrazajacego reptiliona. Parzace plomienie omiataja jego cialo pozostawiajac znaczne obrazenia.
;Nagle lustrzana powierzchnia lsniacej plomienistej tarczy rozblyskuje jasnoczerwonym, palacym swiatlem. Ta dziwna poswiata formuje sie w wirujaca kule przeplatajacych sie ze soba zoltych i pomaranczowych jezorow plynnego ognia, ktore wystrzeliwuja w kierunku wysokiego syczacego reptiliona.     Parzace plomienie omiataja jego cialo pozostawiajac bolesne obrazenia.
;Nagle lustrzana powierzchnia lsniacej plomienistej tarczy rozblyskuje jasnoczerwonym, palacym swiatlem. Ta dziwna poswiata formuje sie w wirujaca kule przeplatajacych sie ze soba zoltych i pomaranczowych jezorow plynnego ognia, ktore wystrzeliwuja w kierunku zrecznego smierdzacego reptiliona.  Parzace plomienie omiataja jego cialo pozostawiajac bardzo rozlegle obrazenia.
;Nagle lustrzana powierzchnia lsniacej plomienistej tarczy rozblyskuje jasnoczerwonym, palacym swiatlem. Ta dziwna poswiata formuje sie w wirujaca kule przeplatajacych sie ze soba zoltych i pomaranczowych jezorow plynnego ognia, ktore wystrzeliwuja w kierunku umiesnionego okrutnego reptiliona.  Parzace plomienie omiataja jego cialo pozostawiajac powazne obrazenia.
;Nagle lustrzana powierzchnia lsniacej plomienistej tarczy rozblyskuje jasnoczerwonym, palacym swiatlem. Ta dziwna poswiata formuje sie w wirujaca kule przeplatajacych sie ze soba zoltych i pomaranczowych jezorow plynnego ognia, ktore wystrzeliwuja w kierunku poteznego krwiozerczego reptiliona, a on sam pada na ziemie wsrod klebow gestego dymu.



;Friili uderza prosto w lewe ramie groznego zmurszalego szkieletu swym czarnoblekitnym pulsujacym morgensternem. Metalowa kula na koncu broni rozblyska ostrym blekitnym swiatlem, gdy nieznacznie zaglebia
;sie w cialo, zadajac bolesne obrazenia.
;Blekitne swiatlo wydobywajace sie z czarnoblekitnego pulsujacego morgensterna trzymanego przez Friiliego gasnie.
;W miejscu, w ktorym grozny zmurszaly szkielet otrzymal cios widzisz blekitne iskry i smugi przenikajace przez jego zbroje, ktora po chwili czernieje i ulega calkowitemu zniszczeniu.
;Zwykla szara kolczuga groznego zmurszalego szkieletu rozpada sie!

;Trzyma oburacz czarnoblekitny pulsujacy morgenstern.

/def -n1 -Fp6 -t'*czarnoblekitn* pulsujac* morgenstern*' _cpm_spec_wlacz = \
    /echo -aCgreen CPMik Magrafa!!! Podswietlam jego ciosy!!
