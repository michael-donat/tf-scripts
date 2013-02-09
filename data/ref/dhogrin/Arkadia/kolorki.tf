/def -Fp400 -mregexp -t' (zabil(a|)) (.*)\.' _killed = /substitute -p  @{Cbgred}==========]@{n} @{BCyellow}%{PL} @{CRed}%{P1} @{BCblue}%{P3}@{BCwhite}.
/def -Fp400 -mregexp -t'Nadr-Hogr'     mah1 = /substitute -p @{}%{PL}@{BgCmagenta}%{P0}@{n}%{PR}
/def -Fp400 -mregexp -t'[Mm]onolit'     monolit = /substitute -p @{}%{PL}@{BgCmagenta}%{P0}@{n}%{PR}
/def -Fp400 -mregexp -t'(C|c)hoinka'     choinka = /substitute -p %{PL}@{BgCmagenta}%{P0}@{n}%{PR}
/def -p4 -PB -F -t'Masz wrazenie, ze twe umiejetnosci gornicze wzrosly nieznacznie.' gorn
/def -p4 -PB -F -t'Wyciagasz zlapana rybe na powierzchnie.' rybajest
;------------------------------------------------------------------------
;			POZIOMY DOSWIADCZENIA				|
;------------------------------------------------------------------------
;/def -p4 -mregexp -F -t'((Wyglada na|Wygladasz na) (kompletnego zoltodzioba.))'		_poziomy_graczy1 = /substitute -p %{P2} @{BxCwhite}%{P3}[1/13] @{n}%{P5}%{PR}
;/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (stawia pierwsze kroki.))'		_poziomy_graczy2 = /substitute -p %{P2} @{BxCwhite}%{P3}[2/13] @{n}%{P5}%{PR}
;/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (jeszcze niewiele widzial.))'		_poziomy_graczy3 = /substitute -p %{P2} @{BxCwhite}%{P3}[3/13] @{n}%{P5}%{PR}
;/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (niewiele wie o swiecie.))' 		_poziomy_graczy4 = /substitute -p %{P2} @{BxCwhite}%{P3}[4/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos|Wygladasz na kogos) (niedoswiadczonego.))' 		_poziomy_graczy5 = /substitute -p %{P2} @{BxCwhite}%{P3} [1/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (widzial juz to i owo.))' 		_poziomy_graczy6 = /substitute -p %{P2} @{BxCwhite}%{P3} [2/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (pewnie stapa po swiecie.))'		_poziomy_graczy7 = /substitute -p %{P2} @{BxCwhite}%{P3} [3/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (niejedno widzial.))'			_poziomy_graczy8 = /substitute -p %{P2} @{BxCwhite}%{P3} [4/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (swoje przezyl.))' 			_poziomy_graczy9 = /substitute -p %{P2} @{BxCwhite}%{P3} [5/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na|Wygladasz na) (kogos doswiadczonego.))'		 	_poziomy_graczy10 = /substitute -p %{P2} @{BxCwhite}%{P3} [6/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (wiele przeszedl.))' 			_poziomy_graczy11 = /substitute -p %{P2} @{BxCwhite}%{P3} [7/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (widzial kawal swiata.))'		_poziomy_graczy12 = /substitute -p %{P2} @{BxCwhite}%{P3} [8/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos|Wygladasz na kogos) (bardzo doswiadczonego.))' 		_poziomy_graczy13 = /substitute -p %{P2} @{BxCwhite}%{P3} [9/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (zwiedzil caly swiat.))' 		_poziomy_graczy14 = /substitute -p %{P2} @{BxCwhite}%{P3} [10/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos|Wygladasz na kogos) (wielce doswiadczonego.))' 		_poziomy_graczy15 = /substitute -p %{P2} @{BxCwhite}%{P3} [11/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (widzial i doswiadczyl wszystkiego.))'	_poziomy_graczy16 = /substitute -p %{P2} @{BxCwhite}%{P3} [12/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na|Wygladasz na) (osobe owiana legenda.))' 		_poziomy_graczy17 = /substitute -p %{P2} @{BxCwhite}%{P3} [13/13] @{n}%{P5}%{PR}

;------------------------------------------------------------------------
;			    M E D Y T A C J A				|
;------------------------------------------------------------------------
/def -p4 -PB -F -t'ze bardzo duzo ci brakuje' 		_gil_brakuje_bdu
/def -p4 -PB -F -t'ze duzo ci brakuje' 			_gil_brakuje_du
/def -p4 -PB -F -t'ze troche ci brakuje' 		_gil_brakuje_tr
/def -p4 -PB -F -t'ze niewiele ci brakuje' 		_gil_brakuje_n
/def -p4 -PB -F -t'ze bardzo niewiele ci brakuje' 	_gil_brakuje_bn

;------------------------------------------------------------------------
;			    P O S T E P Y    				|
;------------------------------------------------------------------------
/def -Fp400 -mregexp -t'(Poczyniles minimalne postepy, od momentu kiedy wszedles do gry\.)' post_1 = /substitute -p @{BxCwhite}%P1 [0/15]
/def -Fp400 -mregexp -t'(Poczyniles nieznaczne postepy, od momentu kiedy wszedles do gry\.)' post_2 = /substitute -p @{BxCwhite}%P1 [1/15]
/def -Fp400 -mregexp -t'(Poczyniles bardzo male postepy, od momentu kiedy wszedles do gry\.)' post_3 = /substitute -p @{BxCwhite}%P1 [2/15]
/def -Fp400 -mregexp -t'(Poczyniles male postepy, od momentu kiedy wszedles do gry\.)' post_4 = /substitute -p @{BxCwhite}%P1 [3/15]
/def -Fp400 -mregexp -t'(Poczyniles nieduze postepy, od momentu kiedy wszedles do gry\.)' post_5 = /substitute -p @{BxCwhite}%P1 [4/15]
/def -Fp400 -mregexp -t'(Poczyniles zadowalajace postepy, od momentu kiedy wszedles do gry\.)' post_6 = /substitute -p @{BxCwhite}%P1 [5/15]
/def -Fp400 -mregexp -t'(Poczyniles spore postepy, od momentu kiedy wszedles do gry\.)' post_7 = /substitute -p @{BxCwhite}%P1 [6/15]
/def -Fp400 -mregexp -t'(Poczyniles dosc duze postepy, od momentu kiedy wszedles do gry\.)' post_8 = /substitute -p @{BxCwhite}%P1 [7/15]
/def -Fp400 -mregexp -t'(Poczyniles znaczne postepy, od momentu kiedy wszedles do gry\.)' post_9 = /substitute -p @{BxCwhite}%P1 [8/15]
/def -Fp400 -mregexp -t'(Poczyniles duze postepy, od momentu kiedy wszedles do gry\.)' post_10 = /substitute -p @{BxCwhite}%P1 [9/15]
/def -Fp400 -mregexp -t'(Poczyniles bardzo duze postepy, od momentu kiedy wszedles do gry\.)' post_11 = /substitute -p @{BxCwhite}%P1 [10/15]
/def -Fp400 -mregexp -t'(Poczyniles ogromne postepy, od momentu kiedy wszedles do gry\.)' post_12 = /substitute -p @{BxCwhite}%P1 [11/15]
/def -Fp400 -mregexp -t'(Poczyniles imponujace postepy, od momentu kiedy wszedles do gry\.)' post_13 = /substitute -p @{BxCwhite}%P1 [12/15]
/def -Fp400 -mregexp -t'(Poczyniles wspaniale postepy, od momentu kiedy wszedles do gry\.)' post_14 = /substitute -p @{BxCwhite}%P1 [13/15]
/def -Fp400 -mregexp -t'(Poczyniles gigantyczne postepy, od momentu kiedy wszedles do gry\.)' post_15 = /substitute -p @{BxCwhite}%P1 [14/15]
/def -Fp400 -mregexp -t'(Poczyniles niebotyczne postepy, od momentu kiedy wszedles do gry\.)' post_16 = /substitute -p @{BxCwhite}%P1 [15/15]

;------------------------------------------------------------------------
;			    K O N D Y C J A  				|
;------------------------------------------------------------------------
/def -p399 -mregexp -t'(Wyglada na to, ze jest w dobrym stanie.)'     kond_broni2

;/def -Fp400 -mregexp -t'( jest|Jestes) (w swietnej kondycji).' kond1 = /substitute -p @{BxCwhite}[@{n}@{Cgreen}++++++++++++++@{BxCwhite}] %{PL}%{P1} @{n}@{Cgreen}%{P2}.
;/def -p200 -mregexp -t'( jest|Jestes) (w dobrym stanie).'     kond2 = /substitute -p @{BxCwhite}[@{n}@{BxCgreen}@{BxCgreen}++++++++++++..@{BxCwhite}] %{PL}%{P1} @{BxCgreen}%{P2}.
;/def -Fp400 -mregexp -t'( jest|Jestes) (lekko rann[yea]).'     kond3 = /substitute -p @{BxCwhite}[@{n}@{BxCyellow}@{BxCyellow}++++++++++....@{BxCwhite}] %{PL}%{P1} @{BxCyellow}%{P2}.
;/def -Fp400 -mregexp -t'( jest|Jestes) (rann[yea]).'           kond4 = /substitute -p @{BxCwhite}[@{n}@{Cyellow}++++++++......@{BxCwhite}] %{PL}%{P1} @{n}@{n}@{n}@{Cyellow}%{P2}.
;/def -Fp400 -mregexp -t'( jest|Jestes) (w zlej kondycji).'     kond5 = /substitute -p @{BxCwhite}[@{n}@{Crgb530}++++++........@{BxCwhite}] %{PL}%{P1} @{Crgb530}%{P2}.
;/def -Fp400 -mregexp -t'( jest|Jestes) (ciezko rann[eay]).'    kond6 = /substitute -p @{BxCwhite}@{n}[@{Crgb520}++++..........@{BxCwhite}] %{PL}%{P1} @{Crgb520}%{P2}.
;/def -Fp400 -mregexp -t'( jest|Jestes) (ledwo zyw[eay]).'      kond7 = /substitute -p @{BxCwhite}[@{n}@{Crgb510}++............@{BxCwhite}] %{PL}%{P1} @{Crgb510}%{P2}.



;------------------------------------------------------------------------
;				ROZMOWY					|
;------------------------------------------------------------------------

/def -aBCyellow -p100 -mregexp -t'[Pp]yta( sie ciebie|sz .*) o' 	_mowi_pyta
/def -aBCyellow -p100 -t'*krzyczy*:*'     	_mowi_krzyczy
/def -aBCyellow -p100 -t'*szepcze*:*'     	_mowi_szepcze
/def -aBCred -p100 -t'*mowi*:*'           	_mowi_mowi
/def -aBCyellow -p100 -t'*do twego ucha:*'           	_mowi_szepce_kolczyk
/def -aBCred -p100 -t'*szepce*:*'         	_mowi_szepce
/def -aBCred -p100 -t'*syczy*:*'          	_mowi_syczy
/def -aBCred -p100 -t'*marudzi*:*'        	_mowi_marudzi
/def -aBCred -p100 -t'*zawodzi*:*'        	_mowi_zawodzi
/def -aBCred -p100 -t'*huczy*:*'          	_mowi_huczy
/def -aBCred -p100 -t'*brzeczy*:*'        	_mowi_brzeczy
/def -aBCred -p100 -t'*bulgocze*:*'       	_mowi_bulgocze
/def -aBCred -p100 -t'*spiewa*:*'         	_mowi_spiewa
/def -aBCred -p100 -t'*dudni*:*'          	_mowi_dudni
/def -aBCred -p100 -t'*mruczy*:*'         	_mowi_mruczy
/def -aBCred -p100 -t'*nuci*:*'           	_mowi_nuci
/def -aBCred -p100 -t'*skrzypi*:*'        	_mowi_skrzypi
/def -aBCred -p100 -t'*piszczy*:*'        	_mowi_piszczy
/def -aBCred -p100 -t'*skrzeczy*:*'       	_mowi_skrzeczy
/def -aBCred -p100 -t'*burczy*:*'         	_mowi_burczy
/def -aBCred -p100 -t'*grzmi*:*'         	_mowi_grzmi

;------------------------------------------------------------------------
;	;			WALKA					|
;------------------------------------------------------------------------

/def -F -PBCgreen -t'atakuje cie(bie|)!' _bestie_atakuja

/def -Fp15 -P0hCblue 	-t'Ledwo muskasz '				_walka_lmuskasz
/def -Fp15 -P0hCblue 	-t'Lekko ranisz '	 			_walka_lranisz
/def -Fp15 -P0hCblue 	-t'Ranisz '	 				_walka_ranisz
/def -Fp15 -P0BCblue 	-t'Powaznie ranisz ' 				_walka_pranisz 
/def -Fp15 -P0BCblue 	-t'Bardzo ciezko ranisz ' 			_walka_bcranisz 
/def -Fp15 -P0BCblue 	-t'Masakrujesz ' 				_walka_masakrujesz 

/def -Fp12 -P1xhCred 	-t' (ledwo muska) cie ' 			_walka_cie_muska 
/def -Fp12 -P1xhCred 	-t' (lekko rani) cie ' 				_walka_cie_lrani 
/def -Fp13 -P1xhCred 	-t' (rani) cie ' 				_walka_cie_rani 
/def -Fp12 -P1xBCred 	-t' (powaznie rani) cie ' 			_walka_cie_prani 
/def -Fp12 -P1xBCred 	-t' (bardzo ciezko rani) cie ' 			_walka_cie_bcrani 
/def -Fp12 -P1xBCred 	-t' (masakruje) cie ' 				_walka_cie_maskruje 

/def -Fp14 -P0hCmagenta -t' ledwo muska ' 				_walka_ktos_lmuska
/def -Fp14 -P0hCmagenta -t' lekko rani ' 				_walka_ktos_lrani
/def -Fp15 -P0hCmagenta -t' rani '					_walka_ktos_rani
/def -Fp14 -P0BCmagenta -t' powaznie rani '	 			_walka_ktos_prani
/def -Fp14 -P0BCmagenta -t' bardzo ciezko rani '			_walka_ktos_bcrani
/def -Fp14 -P0BCmagenta -t' masakruje '					_walka_ktos_masakruje

/def -p4 -PB -F -t'wyparowany przez'         _cosik_parujy1
/def -p4 -PB -F -t' oslania sie '            _cosik_parujy2
/def -p4 -PB -F -t'udaje (ci |)sie oslonic'  _cosik_parujy3
/def -p4 -PB -F -t'udaje sie sparowac'       _cosik_parujy4
/def -p4 -PB -F -t'udaje sie uniknac'        _cosik_parujy5
/def -p4 -PB -F -t'udaje sie je zbic'        _cosik_parujy6
/def -p4 -PB -F -t'udaje sie go sparowac'    _cosik_parujy7
/def -p4 -PB -F -t' paruje go '              _cosik_parujy8
/def -p4 -PB -F -t' uskakuje przed '         _cosik_parujy9
/def -p4 -PB -F -t'zbija je z linii ataku'   _cosik_parujy10
/def -p4 -PB -F -t'udaje sie zbic'           _cosik_parujy11
/def -p4 -PB -F -t'zbijasz na bok'        _cosik_parujy12

/def -p4 -PB -F -t'uciekl ci'           _ucieka_1
/def -p4 -PB -F -t'w panice wybiega'           _ucieka_2

/def -F -ar -t'* rozpada sie!*' 		_cosik_sie_rozpadlo
/def -F -ar -mregexp -t'Otaczajaca (.*) sfera znika z cichym szumem.' 		_sfera_znikla
/def -F -ar -t'* peka!*' 			_cosik_peklo
/def -F -ar -t'Uderzenie jest tak silne, ze bezwiednie puszczasz *'		_puszczam_bron
/def -F -aB -t'*Nie masz czym zaplacic*' 	_nie_masz_czym_zaplacic 

/def -mregexp -F -t'( przybywa | przybywaja )(?!za toba)' ktosik_przybywa = /substitute -p %{PL}@{BCyellow}$[toupper({P1})]@{n}%{PR}
/def -mregexp -F -t'( podaza | podazaja )' ktosik_podaza = /substitute -p %{PL}@{BCyellow}$[toupper({P1})]@{n}%{PR}

;------------------------------------------------------------------------
;				EKWIPUNEK				|
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
;				POSTEPY					|
;------------------------------------------------------------------------
/def -p4 -PB -F -t' zadnych postepow'      _postepy_zadne
/def -p4 -PB -F -t' minimalne postepy'      _postepy_minimalne
/def -p4 -PB -F -t' nieznaczne postepy'    _postepy_nieznaczne
/def -p4 -PB -F -t' bardzo male postepy'   _postepy_bardzomale
/def -p4 -PB -F -t' male postepy'          _postepy_male
/def -p4 -PB -F -t' nieduze postepy'       _postepy_nieduze
/def -p4 -PB -F -t' zadowalajace postepy'  _postepy_zadowalajace
/def -p4 -PB -F -t' spore postepy'         _postepy_spore
/def -p4 -PB -F -t' dosc duze postepy'     _postepy_doscduze
/def -p4 -PB -F -t' znaczne postepy'       _postepy_znaczne
/def -p4 -PB -F -t' duze postepy'          _postepy_duze
/def -p4 -PB -F -t' bardzo duze postepy'   _postepy_bardzoduze
/def -p4 -PB -F -t' ogromne postepy'       _postepy_ogromne
/def -p4 -PB -F -t' imponujace postepy'    _postepy_imponujace
/def -p4 -PB -F -t' wspaniale postepy'     _postepy_wspaniale
/def -p4 -PB -F -t' gigantyczne postepy'   _postepy_gigantyczne
/def -p4 -PB -F -t' niebotyczne postepy'   _postepy_niebotyczne

