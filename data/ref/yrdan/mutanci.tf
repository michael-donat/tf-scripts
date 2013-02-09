    ; ## Linie dodane automagicznie   : tf_ver=1.1.0
; ## 
; ## Wersja pliku                 : 1.1.0
; ## Ostatnia zmiana pliku        : 2005-07-22 10:21:37
; ## Plik pobrany                 : 2005-07-22 10:21:46
; ## Wersja Tfupdate              : 2.0.0 alfa 3
; ##
; ##

; Od dzis plik sluzy bardziej szczytnym celom :)
;"imie","opis","kaplica","ranga","uwagi"
/def _is_kobieta = \
    /if ({*} =/ "{kobieta|elfka|polelfka|krasnoludka|gnomka|halflinka|niziolka|ogrzyca}") \
        /return 1 %;\
    /endif %;\
    /return 0

/def _mutanci_make_trig = \
    /if ({5} =~ "---") \
        /return %;\
    /endif %;\
    /test ++_mutanci_last_id %;\
    /let _opis=$[substr({2}, 0, strrchr({2}, " "))] %;\
    /let _rasa=$[substr({2}, strrchr({2}, " ") + 1)] %;\
    /if (_is_kobieta(_rasa)) \
        /let _rasa=$[strcat("(?:", _rasa, "|mutantka)")] %;\
    /else \
        /let _rasa=$[strcat("(?:", _rasa, "|mutant)")] %;\
    /endif %;\
    /let _txt=$[strcat(strlen({1}) ? strcat(" ", {1}) : "")] %;\
    /let _txt=$[strcat({_txt}, strlen({3}) ? strcat(" @{BCblack}", {3}) : "")] %;\
    /def -Fp220 -mregexp -t'(%{_opis} %{_rasa})([ .,])' _mutanci_trig_%{_mutanci_last_id} = \
        /return _mutanci_seen("%{_txt}")
    
/def _mutanci_seen = \
    /_set_wrog %{P1} %;\
    /return substitute(strcat({PL}, {P1}, " @{BCwhite}(@{BCred}MC@{nBCwhite}", {1}, "@{nBCwhite})@{n}", {P2}, {PR}))


/def _mutanci_make_trigs = \
    /purge _mutanci_trig_* %;\
    /set _mutanci_last_id=0 %;\
    /quote -S /test _mutanci_make_trig('"%{TFDIR}/mutanci.db") %;\
    /unset _mutanci_last_id %;\

/_mutanci_make_trigs

/def _mutanci_make_db_one = \
    /let _opis=%{2} %{3} %{4} %;\
    /let _imie=$[{1} =~ "?" ? "" : {1}] %;\
;    /let _opis=%{1} %{2} %{3} %;\
;    /let _imie=$[{5} =~ "?" ? "" : {5}] %;\
    /let _uwagi=$[{4} =~ "-U-" ? "Ktos o tym samym opisie" : ""] %;\
    /if ({4} =~ "-M-") \
        /let _kaplica=Malal %;\
    /elseif ({4} =~ "-K-") \
        /let _kaplica=Khorne %;\
    /elseif ({4} =~ "-N-") \
        /let _kaplica=Nurgle %;\
    /elseif ({4} =~ "-R-") \
        /let _kaplica=Rashneth %;\
    /elseif ({4} =~ "-T-") \
        /let _kaplica=Tzeentch %;\
    /endif %;\
    /echo "%{_imie}","%{_opis}","%{_kaplica}","","%{_uwagi}" %| /writefile -a %{TFDIR}/mutanci.db

/def _mutanci_make_db = \
    /quote -S /_mutanci_make_db_one '"%{TFDIR}/mutanci.txt"

;/def mc=/mcuderz %{*}
;/def mcuderz = \
;    /if ({*}=~"off") \
;      /set ogolne_mcuderz=0 %;\
;      /echo No i co to ma znaczyc.. Teraz to juz nie bedzie zabawy.. %;\
;    /elseif ({*}=~"on") \
;      /set ogolne_mcuderz=1 %;\
;      /echo Dobra napierdzielam w Kregoslupy za Tzeentcha %;\
;    /elseif ({*}=~NULL) \
;      /if ({ogolne_mcuderz}==1) \
;        /set ogolne_mcuderz=0 %;\
;        /echo No i co to ma znaczyc.. Teraz to juz nie bedzie zabawy.. %;\
;      /else \
;        /set ogolne_mcuderz=1 %;\
;        /echo Dobra napierdzielam w Kregloslupy za Tzeentcha %;\
;      /endif %;\
;    /else \
;      /echo Uzycie: /mcuderz [on|off] %;\
;    /endif
;
;/def mcop = \
;    /set ogolne_mcuderz_opoznienie=%{1-2} %;\
;    /echo -p -aCgreen Opuznienie przy oderzaniu tarcza ustawione na mniej niz "@{B}%{1-2}@{n}" sekundy!!
;					  
;/def _mcuderz = \
;    /if ($(/_czesto)) %;\
;    	/return %; %;\
;    /endif %;\
;    /if ({mcuderz}==0 & {ogolne_mcuderz}==1) \
;      /repeat -$[rand({ogolne_mcuderz_opoznienie-2})] 1 mcuderz %;\
;    /else \
;      /echo -aCgreen Musisz znow odzyskac spokoj i rownowage. %;\
;    /endif
;
;/def -aB -t'*Jestes goto* do wyprowadzenia kolejnego ciosu*' _mutanci_mcuderz3 =\
;    /set mcuderz=0 %;\
;    /set nie_za_czesto=0 %;\
;    /_mcuderz
;
;/def -t'*atakuje cie!*' _mcuderz_uderz4 =\
;    /_mcuderz
;
;/def -t'*koncentruje sie na walce z toba*' _mutanci_uderz5 =\
;    /repeat -1 1 /_mcuderz %;\
;    /repeat -1 2 /_mcuderz
;
;/def -h'SEND {zabij*|wesprzyj*}*' _mutanci_uderz6 =\
;    /send %{*} %;\
;    /_mcuderz
;
;/def -aB -t'*Zaczynasz przygotowywac sie do zadania ciosu*'	_mutanci_bijesz
;/def -aB -t'*Musisz chwile odpoczac, zanim wyprowadzisz *'	_mutanci_nie_mozna
;/def -aB -t'*Uciekajac przed przeciwnikiem, rezygnuj*'		_mutanci_uciekasz
;
;/def -mregexp -PCgreen -t'ledwo muskajac (go|ja|je)'		_mutanci_rana_1
;/def -mregexp -PCgreen -t'lekko raniac (go|ja|je)'		_mutanci_rana_2
;/def -mregexp -PCgreen -t'raniac (go|ja|je)'			_mutanci_rana_3
;/def -mregexp -PBCgreen -t'powaznie raniac (go|ja|je)'		_mutanci_rana_4
;/def -mregexp -PBCgreen -t'bardzo ciezko raniac (go|ja|je)'	_mutanci_rana_5
;/def -mregexp -PBCgreen -t'masakrujac (go|ja|je)'		_mutanci_rana_6
;/def -mregexp -PBCgreen -t'przypatrujac sie ostatnim ruchom'	_mutanci_rana_7



