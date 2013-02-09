; Automagicly added line: tf_ver=1.0.0

/def color=/set hiliteattr=n
/def bw=/set hiliteattr=B
/def czarne=/bw


/def -F -ar -t'* rozpada sie!*' 		_cosik_sie_rozpadlo
/def -F -ar -t'* peka!*' 			_cosik_peklo
/def -F -aB -t'*Nie masz czym zaplacic*' 	_nie_masz_czym_zaplacic 

/def -F -abBCmagenta -t'*Bialy golab pocztowy laduje na twoim r*' 	_golab_ =/echo
/def -F -abBCmagenta -t'*W swoim umysle szlyszysz*' 			_wiadomosc_od_kogos 
/def -F -abBCmagenta -t'*Nagle, tuz przed toba, z chmury dymu*' 	_wiadomosc_od_kogos2

/def -F -PBCgreen -t'atakuje cie(bie|)!' _bestie_atakuja = /eval %{ogolne_robie_po_ataku}

/def -p4 -PB -F -t'kompletnego zoltodzioba.'	_poziomy_graczy1
/def -p4 -PB -F -t'jeszcze niewiele widzial.' 	_poziomy_graczy2
/def -p4 -PB -F -t'niewiele wie o swiecie.' 	_poziomy_graczy3
/def -p4 -PB -F -t'widzial juz to i owo.' 	_poziomy_graczy4
/def -p4 -PB -F -t'niejedno widzial.' 		_poziomy_graczy5
/def -p4 -PB -F -t'doswiadczona osobe.' 	_poziomy_graczy6
/def -p4 -PB -F -t'wiele przeszedl.' 		_poziomy_graczy7
/def -p4 -PB -F -t'zwiedzila caly swiat.' 	_poziomy_graczy8
/def -p5 -PB -F -t'wielce doswiadczona osobe.' 	_poziomy_graczy9

/def -p4 -PB -F -t'ze bardzo duzo ci brakuje' 		_gil_brakuje_bdu
/def -p4 -PB -F -t'ze duzo ci brakuje' 			_gil_brakuje_du
/def -p4 -PB -F -t'ze troche ci brakuje' 		_gil_brakuje_tr
/def -p4 -PB -F -t'ze niewiele ci brakuje' 		_gil_brakuje_n
/def -p4 -PB -F -t'ze bardzo niewiele ci brakuje' 	_gil_brakuje_bn

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

/def -p4 -PB -F -t' zadnych postepow'      _postepy_zadne
/def -p4 -PB -F -t' nieznaczne postepy'    _postepy_nieznaczne
/def -p4 -PB -F -t' male postepy'          _postepy_male
/def -p4 -PB -F -t' nieduze postepy'       _postepy_nieduze
/def -p4 -PB -F -t' znaczne postepy'       _postepy_znaczne
/def -p4 -PB -F -t' duze postepy'          _postepy_duze
/def -p4 -PB -F -t' bardzo duze postepy'   _postepy_bardzoduze
/def -p4 -PB -F -t' wspaniale postepy'     _postepy_wspaniale
/def -p4 -PB -F -t' ogromne postepy'       _postepy_ogromne

/def -aBCyellow -p100 -mregexp -t'[Pp]yta( sie ciebie|sz .*) o' 	_mowi_pyta
/def -aBCyellow -p100 -t'*krzyczy*:*'     	_mowi_krzyczy
/def -aBCyellow -p100 -t'*szepcze*:*'     	_mowi_szepcze
/def -aBCred -p100 -t'*mowi*:*'           	_mowi_mowi
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


/def -p5 -P0B -F -t'w znakomitym stanie' 			_jakosc_bro1
/def -p5 -P1B -F -t'ze jest (w dobrym stanie)' 			_jakosc_bro2
/def -p5 -P0B -F -t'liczne walki wyryly na nim swoje pietno' 	_jakosc_bro3
/def -p5 -P0B -F -t'w zlym stanie' 				_jakosc_bro4
/def -p5 -P0B -F -t'w bardzo zlym stanie' 			_jakosc_bro5
/def -p5 -P0B -F -t'wymaga natychmiastowej konswerwacji' 	_jakosc_bro6
/def -p5 -P0B -F -t'moze peknac w kazdej chwili' 		_jakosc_bro7
/def -p5 -P0B -F -t'lekko podniszczon[aye]'  			_jakosc_bro8
/def -p5 -P0B -F -t'kiepskim stanie' 				_jakosc_bro9
/def -p5 -P0B -F -t'oplakanym stanie' 				_jakosc_bro10
/def -p5 -P0B -F -t'gotow[aye] rozpasc sie w kazdej chwili' 	_jakosc_bro11
/def -p5 -P1B -F -t'Jest .*(zniszczon[aye])' 			_jakosc_bro12
/def -p5 -P1B -F -t'Jest .*(zlaman[aye])' 			_jakosc_bro13

/def -p5 -PB -F -t'mogl(|a)by ci jeszcze bardzo dlugo sluzyc' 	_przetrwania_bro1
/def -p5 -PB -F -t'mogl(|a)by ci jeszcze dlugo sluzyc' 		_przetrwania_bro2
/def -p5 -PB -F -t'mogl(|a)by ci jeszcze troche sluzyc' 	_przetrwania_bro3

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


;------------------------------------------------------------------------------
;                            SPECE                                            |
;------------------------------------------------------------------------------
