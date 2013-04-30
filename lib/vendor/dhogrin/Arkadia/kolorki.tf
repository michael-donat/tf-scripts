/def -Fp400 -P0BCmagenta -mregexp -t'Nadr-Hogr' _kolorki_wyroznienie_nh

;------------------------------------------------------------------------
;			POZIOMY DOSWIADCZENIA				|
;------------------------------------------------------------------------
/def -p4 -P2B -mregexp -F -t'Wyglada(sz|) na kogos (niedoswiadczonego).' 		_kolorki_poziomy_graczy1 = /substitute -p %{P0} @{B}[1/13] @{n}
/def -p4 -P2B -mregexp -F -t'Wyglada(sz|) na kogos, kto (widzial juz to i owo).' 		_kolorki_poziomy_graczy2 = /substitute -p %{P0} @{B}[2/13] @{n}
/def -p4 -P2B -mregexp -F -t'Wyglada(sz|) na kogos, kto (pewnie stapa po swiecie).'		_kolorki_poziomy_graczy3 = /substitute -p %{P0} @{B}[3/13] @{n}
/def -p4 -P2B -mregexp -F -t'Wyglada(sz|) na kogos, kto (niejedno widzial).'			_kolorki_poziomy_graczy4 = /substitute -p %{P0} @{B}[4/13] @{n}
/def -p4 -P2B -mregexp -F -t'Wyglada(sz|) na kogos, kto (swoje przezyl).' 			_kolorki_poziomy_graczy5 = /substitute -p %{P0} @{B}[5/13] @{n}
/def -p4 -P2B -mregexp -F -t'Wyglada(sz|) na kogos (doswiadczonego).'		 	_kolorki_poziomy_graczy6 = /substitute -p %{P0} @{B}[6/13] @{n}
/def -p4 -P2B -mregexp -F -t'Wyglada(sz|) na kogos, kto (wiele przeszedl).' 			_kolorki_poziomy_graczy7 = /substitute -p %{P0} @{B}[7/13] @{n}
/def -p4 -P2B -mregexp -F -t'Wyglada(sz|) na kogos, kto (widzial kawal swiata).'		_kolorki_poziomy_graczy8 = /substitute -p %{P0} @{B}[8/13] @{n}
/def -p4 -P2B -mregexp -F -t'Wyglada(sz|) na kogos (bardzo doswiadczonego).' 		_kolorki_poziomy_graczy9 = /substitute -p %{P0} @{B}[9/13] @{n}
/def -p4 -P2B -mregexp -F -t'Wyglada(sz|) na kogos, kto (zwiedzil caly swiat).' 		_kolorki_poziomy_graczy10 = /substitute -p %{P0} @{B}[10/13] @{n}
/def -p4 -P2B -mregexp -F -t'Wyglada(sz|) na kogos (wielce doswiadczonego).' 		_kolorki_poziomy_graczy11 = /substitute -p %{P0} @{B}[11/13] @{n}
/def -p4 -P2B -mregexp -F -t'Wyglada(sz|) na kogos, kto (widzial i doswiadczyl wszystkiego).'	_kolorki_poziomy_graczy12 = /substitute -p %{P0} @{B}[12/13] @{n}
/def -p4 -P2B -mregexp -F -t'Wyglada(sz|) na (osobe owiana legenda).' 		_kolorki_poziomy_graczy13 = /substitute -p %{P0} @{B}[13/13] @{n}

;------------------------------------------------------------------------
;			    M E D Y T A C J A				|
;------------------------------------------------------------------------
/def -p4 -PB -F -t'ze bardzo duzo ci brakuje' 		_kolorki_gil_brakuje_bdu
/def -p4 -PB -F -t'ze duzo ci brakuje' 			_kolorki_gil_brakuje_du
/def -p4 -PB -F -t'ze troche ci brakuje' 		_kolorki_gil_brakuje_tr
/def -p4 -PB -F -t'ze niewiele ci brakuje' 		_kolorki_gil_brakuje_n
/def -p4 -PB -F -t'ze bardzo niewiele ci brakuje' 	_kolorki_gil_brakuje_bn

;------------------------------------------------------------------------
;				ROZMOWY					|
;------------------------------------------------------------------------

/def -aBCyellow -p100 -mregexp -t'[Pp]yta( sie ciebie|sz .*) o' 	_kolorki_mowa_pyta
/def -aBCyellow -p100 -t'*krzyczy*:*'     	_kolorki_mowa_krzyczy
/def -aBCyellow -p100 -t'*szepcze*:*'     	_kolorki_mowa_szepcze
/def -aBCyellow -p100 -t'*do twego ucha:*'           	_kolorki_mowa_szepce_kolczyk
/def -aBCred -p100 -t'*mowi*:*'           	_kolorki_mowa_mowi
/def -aBCred -p100 -t'*szepce*:*'         	_kolorki_mowa_szepce
/def -aBCred -p100 -t'*syczy*:*'          	_kolorki_mowa_syczy
/def -aBCred -p100 -t'*marudzi*:*'        	_kolorki_mowa_marudzi
/def -aBCred -p100 -t'*zawodzi*:*'        	_kolorki_mowa_zawodzi
/def -aBCred -p100 -t'*huczy*:*'          	_kolorki_mowa_huczy
/def -aBCred -p100 -t'*brzeczy*:*'        	_kolorki_mowa_brzeczy
/def -aBCred -p100 -t'*bulgocze*:*'       	_kolorki_mowa_bulgocze
/def -aBCred -p100 -t'*spiewa*:*'         	_kolorki_mowa_spiewa
/def -aBCred -p100 -t'*dudni*:*'          	_kolorki_mowa_dudni
/def -aBCred -p100 -t'*mruczy*:*'         	_kolorki_mowa_mruczy
/def -aBCred -p100 -t'*nuci*:*'           	_kolorki_mowa_nuci
/def -aBCred -p100 -t'*skrzypi*:*'        	_kolorki_mowa_skrzypi
/def -aBCred -p100 -t'*piszczy*:*'        	_kolorki_mowa_piszczy
/def -aBCred -p100 -t'*skrzeczy*:*'       	_kolorki_mowa_skrzeczy
/def -aBCred -p100 -t'*burczy*:*'         	_kolorki_mowa_burczy
/def -aBCred -p100 -t'*grzmi*:*'         	_kolorki_mowa_grzmi

;------------------------------------------------------------------------
;			   ... OBRAŻENIA ... 				  |
;------------------------------------------------------------------------
  
/def -Fp160 -P0hCblue 	-t'Ledwo muskasz '				_kolorki_walka_lmuskasz
/def -Fp160 -P0hCblue 	-t'Lekko ranisz '	 			_kolorki_walka_lranisz
/def -Fp160 -P0hCblue 	-t'Ranisz '	 				_kolorki_walka_ranisz
/def -Fp160 -P0BCblue 	-t'Powaznie ranisz ' 				_kolorki_walka_pranisz 
/def -Fp160 -P0BCblue 	-t'Bardzo ciezko ranisz ' 			_kolorki_walka_bcranisz 
/def -Fp160 -P0BCblue 	-t'Masakrujesz ' 				_kolorki_walka_masakrujesz 

/def -Fp157 -P1xhCred 	-t' (ledwo muska) cie ' 			_kolorki_walka_cie_muska 
/def -Fp157 -P1xhCred 	-t' (lekko rani) cie ' 				_kolorki_walka_cie_lrani 
/def -Fp158 -P1xhCred 	-t' (rani) cie ' 				_kolorki_walka_cie_rani 
/def -Fp157 -P1xBCred 	-t' (powaznie rani) cie ' 			_kolorki_walka_cie_prani 
/def -Fp157 -P1xBCred 	-t' (bardzo ciezko rani) cie ' 		_kolorki_walka_cie_bcrani 
/def -Fp157 -P1xBCred 	-t' (masakruje) cie ' 				_kolorki_walka_cie_maskruje 

/def -Fp159 -P0hCmagenta -t' ledwo muska ' 				_kolorki_walka_ktos_lmuska
/def -Fp159 -P0hCmagenta -t' lekko rani ' 				_kolorki_walka_ktos_lrani
/def -Fp160 -P0hCmagenta -t' rani '					_kolorki_walka_ktos_rani
/def -Fp159 -P0BCmagenta -t' powaznie rani '	 			_kolorki_walka_ktos_prani
/def -Fp159 -P0BCmagenta -t' bardzo ciezko rani '			_kolorki_walka_ktos_bcrani
/def -Fp159 -P0BCmagenta -t' masakruje '				_kolorki_walka_ktos_masakruje
  
;------------------------------------------------------------------------
;			   ... CIOSY NIESKUTECZNE ... 			  |
;------------------------------------------------------------------------
  
/def -p140 -P0BLCgray6;LCgray6;RCgray6 -t'wyparowany przez'         _kolorki_walka_cosik_parujy1
/def -p140 -P0BLCgray6;LCgray6;RCgray6 -t' oslania sie '            _kolorki_walka_cosik_parujy2
/def -p140 -P0BLCgray6;LCgray6;RCgray6 -t'udaje (ci |)sie oslonic'  _kolorki_walka_cosik_parujy3
/def -p140 -P0BLCgray6;LCgray6;RCgray6 -t'udaje sie sparowac'       _kolorki_walka_cosik_parujy4
/def -p140 -P0BLCgray6;LCgray6;RCgray6 -t'udaje sie uniknac'        _kolorki_walka_cosik_parujy5
/def -p140 -P0BLCgray6;LCgray6;RCgray6 -t'udaje sie je zbic'        _kolorki_walka_cosik_parujy6
/def -p140 -P0BLCgray6;LCgray6;RCgray6 -t'udaje sie go sparowac'    _kolorki_walka_cosik_parujy7
/def -p140 -P0BLCgray6;LCgray6;RCgray6 -t' paruje go '              _kolorki_walka_cosik_parujy8
/def -p140 -P0BLCgray6;LCgray6;RCgray6 -t' uskakuje przed '         _kolorki_walka_cosik_parujy9
/def -p140 -P0BLCgray6;LCgray6;RCgray6 -t'zbija je z linii ataku'   _kolorki_walka_cosik_parujy10
/def -p140 -P0BLCgray6;LCgray6;RCgray6 -t'udaje sie zbic'           _kolorki_walka_cosik_parujy11
/def -p140 -P0BLCgray6;LCgray6;RCgray6 -t'zbijasz na bok'           _kolorki_walka_cosik_parujy12
/def -p140 -P0BLCgray6;LCgray6;RCgray6 -t' nie udaje sie trafic'     _kolorki_walka_cosik_parujy13

;------------------------------------------------------------------------
;				EKWIPUNEK				|
;------------------------------------------------------------------------

/def -Fp100 -mregexp -aCgreen -t'^Masz przy sobie ' _kolorki_ekwipunek_przy_sobie
/def -Fp100 -mregexp -aBCgreen -t'^Ma(sz|) na sobie ' _kolorki_ekwipunek_na_sobie
/def -Fp100 -mregexp -aBCmagenta -t'^Trzyma(sz|)( oburacz .*|.* w (prawej|lewej) rece)\.' _kolorki_ekwipunek_bron

;------------------------------------------------------------------------
;			   ... ROZNE ... 				  |
;------------------------------------------------------------------------


/def -p4 -PB -F -t'uciekl ci'           _kolorki_ucieka_1
/def -p4 -PB -F -t'w panice wybiega'           _kolorki_ucieka_2

/def -F -ar -t'* rozpada sie!*' 		_kolorki_cosik_sie_rozpadlo = \
  /repeat -0.2 2 /beep
/def -F -ar -t'* peka!*' 			_kolorki_cosik_peklo = \
  /repeat -0.2 2 /beep
/def -F -ar -t'Uderzenie jest tak silne, ze bezwiednie puszczasz *'		_kolorki_puszczam_bron = \
  /repeat -0.2 2 /beep
  
/def -F -ar -mregexp -t'Otaczajaca (.*) sfera znika z cichym szumem.' 		_kolorki_sfera_znikla
/def -F -aB -t'*Nie masz czym zaplacic*' 	_kolorki_nie_masz_czym_zaplacic 