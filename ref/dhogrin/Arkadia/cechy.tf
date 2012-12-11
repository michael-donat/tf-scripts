; Automagicly added line: tf_ver=1.0.9
/def staty = \
    /_cechy %;\
    /quote -S -decho !cechy -tf %{ogolne_cechy_rasa} \
      %{ogolne_cechy_cecha1} %{ogolne_cechy_cecha2} %{ogolne_cechy_cecha3} %{ogolne_cechy_cecha4} %{ogolne_cechy_cecha5} %{ogolne_cechy_cecha6} \
      %{ogolne_cechy_brak1} %{ogolne_cechy_brak2} %{ogolne_cechy_brak3} %{ogolne_cechy_brak4} %{ogolne_cechy_brak5} %{ogolne_cechy_brak6}

/def stat = \
    /_cechy_trigs

/def _cechy_trigs = \
    /purge _cechy_set_* %;\
    /rstart -1 2 /purge _cechy_set_* %;\
    /def -aB -p5 -t'*Jestes *{krasnoludem,|krasnoludka,}*' _cechy_set_race_1=/set ogolne_cechy_rasa 1  %;\
    /def -aB -p5 -t'*Jestes *{elfka,|elfem,}*' 		_cechy_set_race_2=/set ogolne_cechy_rasa 2 %;\
    /def -aB -p5 -t'*Jestes *{mezczyzna,|kobieta,}*' 	_cechy_set_race_3=/set ogolne_cechy_rasa 3 %;\
    /def -aB -p5 -t'*Jestes *{halflingiem,|halflinka,}*' _cechy_set_race_4=/set ogolne_cechy_rasa 4 %;\
    /def -aB -p5 -t'*Jestes *{gnomem,|gnomka,}*' 	_cechy_set_race_5=/set ogolne_cechy_rasa 5 %;\
    /def -aB -p5 -t'*Jestes *{ogrem,|ogrzyca,}*' 	_cechy_set_race_6=/set ogolne_cechy_rasa 6 %;\
    /def -aB -p5 -t'*Jestes *{polelfem,|polelfka,}*' 	_cechy_set_race_7=/set ogolne_cechy_rasa 7  %;\
    %;\
    /def -FPB -p4 -t' slabiutk' 				_cechy_set_str_1=/set ogolne_cechy_cecha1 1 %;\
    /def -FPB -p4 -t' watl' 				_cechy_set_str_2=/set ogolne_cechy_cecha1 2 %;\
    /def -FPB -p5 -t' slab' 				_cechy_set_str_3=/set ogolne_cechy_cecha1 3 %;\
    /def -FPB -p4 -t' krzepk' 				_cechy_set_str_4=/set ogolne_cechy_cecha1 4 %;\
    /def -FPB -p4 -t' siln' 				_cechy_set_str_5=/set ogolne_cechy_cecha1 5 %;\
    /def -FPB -p4 -t' mocn' 				_cechy_set_str_6=/set ogolne_cechy_cecha1 6 %;\
    /def -FPB -p4 -t'(?<!bardziej) potezn' 				_cechy_set_str_7=/set ogolne_cechy_cecha1 7 %;\
    /def -FPB -p4 -t' mocarn' 				_cechy_set_str_8=/set ogolne_cechy_cecha1 8 %;\
    %;\
    /def -FPB -p4 -t' nieskoordynowan' 			_cechy_set_dex_1=/set ogolne_cechy_cecha2 1 %;\
    /def -FPB -p4 -t' niezreczn' 			_cechy_set_dex_2=/set ogolne_cechy_cecha2 2 %;\
    /def -FPB -p4 -t' niezgrabn' 			_cechy_set_dex_3=/set ogolne_cechy_cecha2 3 %;\
    /def -FPB -p4 -t' sprawn' 				_cechy_set_dex_4=/set ogolne_cechy_cecha2 4 %;\
    /def -FPB -p4 -t' zwinn' 				_cechy_set_dex_5=/set ogolne_cechy_cecha2 5 %;\
    /def -FPB -p4 -t' zreczn' 				_cechy_set_dex_6=/set ogolne_cechy_cecha2 6 %;\
        /def -FPB -p4 -t' gibk' 				_cechy_set_dex_7=/set ogolne_cechy_cecha2 7 %;\
    /def -FPB -p4 -t' akrobatyczn' 			_cechy_set_dex_8=/set ogolne_cechy_cecha2 8 %;\
    \			    %;\
    /def -FPB -p4 -t' cherlaw' 				_cechy_set_con_1=/set ogolne_cechy_cecha3 1 %;\
    /def -FPB -p4 -t' rachityczn' 			_cechy_set_con_2=/set ogolne_cechy_cecha3 2 %;\
    /def -FPB -p4 -t' mizern' 				_cechy_set_con_3=/set ogolne_cechy_cecha3 3 %;\
    /def -FPB -p4 -t' dobrze zbudowan' 			_cechy_set_con_4=/set ogolne_cechy_cecha3 4 %;\
    /def -FPB -p4 -t' wytrzymal' 			_cechy_set_con_5=/set ogolne_cechy_cecha3 5 %;\
    /def -FPB -p4 -t' tward' 				_cechy_set_con_6=/set ogolne_cechy_cecha3 6 %;\
    /def -FPB -p4 -t' muskularn' 			_cechy_set_con_7=/set ogolne_cechy_cecha3 7 %;\
    /def -FPB -p4 -t' atletyczn' 			_cechy_set_con_8=/set ogolne_cechy_cecha3 8 %;\
    %;\
    /def -FPB -p4 -t' bezmysln' 				_cechy_set_int_1=/set ogolne_cechy_cecha4 1 %;\
    /def -FPB -p4 -t' tepa| tepy' 			_cechy_set_int_2=/set ogolne_cechy_cecha4 2 %;\
    /def -FPB -p4 -t' ograniczon' 			_cechy_set_int_3=/set ogolne_cechy_cecha4 3 %;\
    /def -FPB -p4 -t' pojetn' 				_cechy_set_int_4=/set ogolne_cechy_cecha4 4 %;\
    /def -FPB -p4 -t' inteligentn' 			_cechy_set_int_5=/set ogolne_cechy_cecha4 5 %;\
    /def -FPB -p4 -t' bystr' 				_cechy_set_int_6=/set ogolne_cechy_cecha4 6 %;\
    /def -FPB -p4 -t' blyskotliw' 			_cechy_set_int_7=/set ogolne_cechy_cecha4 7 %;\
    /def -FPB -p4 -t' genialn' 				_cechy_set_int_8=/set ogolne_cechy_cecha4 8 %;\
    %;\
    /def -FPB -p4 -t' glupi' 				_cechy_set_wis_1=/set ogolne_cechy_cecha5 1 %;\
    /def -FPB -p4 -t' zacofan' 				_cechy_set_wis_2=/set ogolne_cechy_cecha5 2 %;\
    /def -FPB -p4 -t' niewyksztalcon' 			_cechy_set_wis_3=/set ogolne_cechy_cecha5 3 %;\
    /def -FPB -p4 -t' wyksztalcon' 			_cechy_set_wis_4=/set ogolne_cechy_cecha5 4 %;\
    /def -FPB -p4 -t' madr' 				_cechy_set_wis_5=/set ogolne_cechy_cecha5 5 %;\
    /def -FPB -p4 -t' uczon' 				_cechy_set_wis_6=/set ogolne_cechy_cecha5 6 %;\
    /def -FPB -p4 -t' oswiecon' 				_cechy_set_wis_7=/set ogolne_cechy_cecha5 7 %;\
    /def -FPB -p4 -t' wszechwiedzac' 			_cechy_set_wis_8=/set ogolne_cechy_cecha5 8 %;\
    %;\
    /def -FPB -p4 -t'tchorzliw' 				_cechy_set_dis_1=/set ogolne_cechy_cecha6 1 %;\
    /def -FPB -p4 -t'strachliw' 				_cechy_set_dis_2=/set ogolne_cechy_cecha6 2 %;\
    /def -FPB -p4 -t'niepewn' 				_cechy_set_dis_3=/set ogolne_cechy_cecha6 3 %;\
    /def -FPB -p4 -t'zdecydowan' 			_cechy_set_dis_4=/set ogolne_cechy_cecha6 4 %;\
    /def -FPB -p4 -t'odwazn' 				_cechy_set_dis_5=/set ogolne_cechy_cecha6 5 %;\
    /def -FPB -p4 -t'dzieln' 				_cechy_set_dis_6=/set ogolne_cechy_cecha6 6 %;\
    /def -FPB -p4 -t'nieugiet' 				_cechy_set_dis_7=/set ogolne_cechy_cecha6 7 %;\
    /def -FPB -p4 -t'nieustraszon' 			_cechy_set_dis_8=/set ogolne_cechy_cecha6 8 %;\
    %;\
    /def -p5 -PB -t'ze bardzo duzo ci brakuje' 		_cechy_set_brak_1=/set cechy_brakuje 5%%;/_cechy_liczenie %;\
    /def -p5 -PB -t'ze duzo ci brakuje' 			_cechy_set_brak_2=/set cechy_brakuje 4%%;/_cechy_liczenie %;\
    /def -p5 -PB -t'ze troche ci brakuje' 			_cechy_set_brak_3=/set cechy_brakuje 3%%;/_cechy_liczenie %;\
    /def -p5 -PB -t'ze niewiele ci brakuje' 		_cechy_set_brak_4=/set cechy_brakuje 2%%;/_cechy_liczenie %;\
    /def -p5 -PB -t'ze bardzo niewiele ci brakuje' 		_cechy_set_brak_5=/set cechy_brakuje 1%%;/_cechy_liczenie %;\
    /def -p5 -PB -t'epicka' 				_cechy_set_brak_6=/set cechy_brakuje 9%%;/_cechy_liczenie %;\
    /def -p5 -PB -t'nadludzka' 				_cechy_set_brak_7=/set cechy_brakuje 10%%;/_cechy_liczenie %;\
    %;\
    /set cechy_brakuje 0 %;\
    /set cechy_licznik 0 %;\
    /if ({ogolne_cechy_rasa}=~NULL) \
       /send spojrz na siebie %;\
    /endif %;\
    /send cechy %;\
    /send usiadz %;\
    /send medytuj %;\
    /send ocen sile %;\
    /send ocen zrecznosc %;\
    /send ocen wytrzymalosc %;\
    /send ocen inteligencje %;\
    /send ocen madrosc %;\
    /send ocen odwage %;\
    /send ocen mutacje %; \
    /send powstan

/def _cechy_liczenie=\
  /test ++cechy_licznik %;\
;  /purge _cechy_set_* %;\
  /if ({cechy_brakuje}==9 | {cechy_brakuje}==10) \
    /set ogolne_cechy_cecha%{cechy_licznik} %{cechy_brakuje}  %;\
    /set ogolne_cechy_brak%{cechy_licznik} 0 %;\
  /else \
    /set ogolne_cechy_brak%{cechy_licznik} %{cechy_brakuje} %;\
  /endif %;\
  /if ({cechy_licznik}==6) \
    /repeat -0 1 /_cechy %;\
    /unset cechy_licznik %;\
    /unset cechy_brakuje %;\
;   /_cechy_zapisz %;\
    /purge _cechy_set_* %;\
  /endif

;/def _cechy_zapisz = \
;    /let _cechy_suma=$[10*({ogolne_cechy_cecha1}+{cechy_cecha2}+{cechy_cecha3}+{cechy_cecha4}+{cechy_cecha5}+{cechy_cecha6})+ \
;      ({ogolne_cechy_brak1}+{cechy_brak2}+{cechy_brak3}+{cechy_brak4}+{cechy_brak5}+{cechy_brak6})] %;\
;    /if (0 & {_cechy_suma}!={cechy_suma}) \
;      /let log_plik=%{TFDIR}/save/%{obecnie_expujacy}/cechy_zapis.log %;\
;      /echo Dnia    : $[ftime("%Y-%m-%d",time())] %|/writefile -a %{log_plik} %;\
;      /echo Godzina : $[ftime("%H:%M:%S",time())] %|/writefile -a %{log_plik} %;\
;      /quote -S -decho !cechy -tf %{ogolne_cechy_rasa} \
;        %{ogolne_cechy_cecha1} %{cechy_cecha2} %{cechy_cecha3} %{cechy_cecha4} %{cechy_cecha5} %{cechy_cecha6} \
;        %{ogolne_cechy_brak1} %{cechy_brak2} %{cechy_brak3} %{cechy_brak4} %{cechy_brak5} %{cechy_brak6} \
;        >> %{log_plik} %;\
;      /echo %|/writefile -a %{log_plik} %;\
;      /echo %|/writefile -a %{log_plik} %;\
;      /set cechy_suma=%{_cechy_suma} %;\
;    /endif %;\
;    /listvar cechy_* %|/writefile %{TFDIR}/save/%{obecnie_expujacy}/cechy_obecne.tf

/def _cechy_poziom_one = \
    /eval /return {$[{1} + 1]}

/def _cechy_poziom = \
    /let _opis=$[_cechy_poziom_one({1}, \
    'kompletnego zoltodzioba.', \
    'stawia pierwsze kroki.', \
    'jeszcze niewiele widzial.', \
    'niewiele wie o swiecie.', \
    'niedoswiadczonego.', \
    'widzial juz to i owo.', \
    'pewnie stapa po swiecie.', \
    'niejedno widzial.', \
    'swoje przezyl.', \
    'doswiadczonego.', \
    'wiele przeszedl.', \
    'widzial kawal swiata.', \
    'bardzo doswiadczonego.', \
    'zwiedzil caly swiat.', \
    'wielce doswiadczonego.', \
    'widzial i doswiadczyl wszystkiego.', \
    'osobe owiana legenda.')] %;\
    /return strcat("Wygladasz na ", _opis, " (", {1}, "/17)")


/def _cechy_licz = \
    /let _poziom=%{1} %;\
    /let _brakuje=%{2} %;\
    /if (_poziom == 10) \
        /let _punkty=160 %;\
    /elseif (_poziom == 9) \
        /let _punkty=136 %;\
    /else \
        /let _punkty=$[((_poziom - 1) * 17) + ((5 - _brakuje) * 3) + ((5 - _brakuje + 1) / 2)] %;\
    /endif %;\
    /return %{_punkty}

/def _cechy = \
;    /set ogolne_cechy_cecha1=1 %;\
;    /set ogolne_cechy_cecha2=1 %;\
;    /set ogolne_cechy_cecha3=9 %;\
;    /set ogolne_cechy_cecha4=1 %;\
;    /set ogolne_cechy_cecha5=1 %;\
;    /set ogolne_cechy_cecha6=1 %;\
;    /set ogolne_cechy_brak1=1 %;\
;    /set ogolne_cechy_brak2=1 %;\
;    /set ogolne_cechy_brak3=9 %;\
;    /set ogolne_cechy_brak4=1 %;\
;    /set ogolne_cechy_brak5=1 %;\
;    /set ogolne_cechy_brak6=1 %;\
    /let _str=$[_cechy_licz(ogolne_cechy_cecha1, ogolne_cechy_brak1)] %;\
    /let _dex=$[_cechy_licz(ogolne_cechy_cecha2, ogolne_cechy_brak2)] %;\
    /let _con=$[_cechy_licz(ogolne_cechy_cecha3, ogolne_cechy_brak3)] %;\
    /let _int=$[_cechy_licz(ogolne_cechy_cecha4, ogolne_cechy_brak4)] %;\
    /let _wis=$[_cechy_licz(ogolne_cechy_cecha5, ogolne_cechy_brak5)] %;\
    /let _dis=$[_cechy_licz(ogolne_cechy_cecha6, ogolne_cechy_brak6)] %;\
    /let _sum=$[_str + _dex + _con + _int + _wis + _dis] %;\
    /let _avg=$[_sum / 6] %;\
    /let _avg_c=$[(_str + _dex + _con) / 3] %;\
    /let _avg_nc=$[(_int + _wis + _dis) / 3] %;\
    /let _div=61 %;\
    /let _need=$[_div - mod(_sum, _div)] %;\
    /let _need_p=$[trunc(_need / 3.5)] %;\
    /let _level=$[trunc(_sum / _div) + 1] %;\
    /let _szer=$[80 / 6 - 2] %;\
    /test echo(strcat(" ", strrep("_", {_szer} * 6 + 11), " ")) %;\
    /test echo(strcat("/     ", pad(_cechy_poziom({_level}), -({_szer} * 6 + 1)), "     \\\\")) %;\
    /test echo(strcat("+", strrep("-", {_szer} * 6 + 11), "+")) %;\
    /test echo(pad("|", 0, \
        "Sila", {_szer}, " |", 0, \
        "Zrecznosc", {_szer}, " |", 0, \
        "Wytrzymalosc", {_szer}, "|", 0, \
        "Inteligencja", {_szer}, "|", 0, \
        "Madrosc", {_szer}, " |", 0, \
        "Odwaga", {_szer}, " |", 0)) %;\
    /test echo(pad("|", 0, \
        _str, {_szer}, " |", 0, \
        _dex, {_szer}, " |", 0, \
        _con, {_szer}, " |", 0, \
        _int, {_szer}, " |", 0, \
        _wis, {_szer}, " |", 0, \
        _dis, {_szer}, " |", 0)) %;\
    /test echo(strcat("+", strrep("-", {_szer} * 6 + 11), "+")) %;\
    /test echo(pad("| ", 0, \
        "Srednia statow: ", 0, \
        _avg, 3, \
        ", statow bojowych: ", 0, \
        _avg_c, 3, \
        ", statow niebojowych: ", 0, \
        _avg_nc, 3, \
        ".", 0, "|", 10)) %;\
    /test echo(pad("| ", 0, \
        "Wspolczynniki boj/nboj: ", 0, \
        $[(1.0 * _avg_c) / _avg_nc], -23, \
        "|", 30)) %;\
    /test echo(pad("| ", 0, \
        "Masz aktualnie conajmniej: ", 0, \
        _sum, 3, \
        " punktow, czyli: ", 0, \
        $[trunc(_sum / 3.4)], 3, \
        " podpoziomow.", 0, "|", 14)) %;\
    /test echo(pad("| ", 0, \
        "Do nastepnego poziomu brakuje ci: ", 0, \
        _need, 2, \
        " punktow, czyli: ", 0, \
        _need_p, 2, \
        " podpoziomow.", 0, "|", 9)) %;\
    /test echo(strcat("+", strrep("-", {_szer} * 6 + 11), "+")) %;\
    /test echo(pad("| ", 0, \
        "Informacje dodatkowe: ", 0, \
        "|", 55)) %;\
    /test echo(pad("| ", 0, \
        "Hitpoints: ", 0, \
        $[_con * 20 - 100], 4, \
        ", Mana: ", 0, \
        $[_int * 10], 4, \
        ", Fatigue: ", 0, \
        $[_con + 50], 3, \
        ".", 0, "|", 35)) %;\
    /test echo(strcat("+", strrep("-", {_szer} * 6 + 11), "+"))

