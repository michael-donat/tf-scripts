; ## Linie dodane automagicznie   : tf_ver=1.0.6
; ## 
; ## Wersja pliku                 : 1.0.6
; ## Ostatnia zmiana pliku        : 2009-01-06 21:07:41
; ## Plik pobrany                 : 2009-01-06 21:08:10
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##

/def gildie = \
    /if ({*} =~ NULL) \
        /msg Wrogie gildie to '%{ogolne_gildie_wrogie}'. %;\
    /else \
        /set ogolne_gildie_wrogie=%{*} %;\
        /_gildie_make_trigs %;\
        /msg Od teraz wrogie gildie to '%{ogolne_gildie_wrogie}'. %;\
    /endif

/def ?gildie = \
    /msg Wpis moze wygladac np tak 'MC Nurgle|BS|WKS'. %;\
    /msg Azeby pokazywac Nurgli + Berserkerow + WKS-ow
    
/def gprzedstaw = \
    /if (_wrogowie_obecni =~ NULL) \
        /msg Nie znasz nikogo do przedstawienia %;\
        /return %;\
    /endif %;\
    /let _tmp=%{_wrogowie_obecni} %;\
    /while /let i=$[strstr({_tmp},"|")] %;/@test i>-1 %;/do \
        /let _name=$[substr({_tmp},0,i)] %;\
        /let _tmp=$[substr({_tmp},i+1)] %;\
        /let _name=$(/_odmien_M_B %{_name}) %;\
;        /msg Przedstawiam %{_name} %;\
        $$przedstaw %{_name} %;\
		/let _tmp2=$[strcat({_tmp2}, {_name}, ", ")]%;\
    /done %;\
    /msg Przedstawiam: @{B}%{_tmp2}@{n}

/def _is_kobieta = \
    /if ({*} =/ "{kobieta|elfka|polelfka|krasnoludka|gnomka|halflinka|niziolka|ogrzyca}") \
        /return 1 %;\
    /endif %;\
    /return 0

;"imie","opis","gildia","kaplica|inne","uwagi","data"
/def _gildie_make_trig = \
    /if (!regmatch({ogolne_gildie_wrogie-NIC}, strcat({3}, " ", {4}))) \
        /return %;\
    /endif %;\
    /test ++_gildie_last_id %;\
    /let _opis=%{2} %;\
    /if ({3} =~ "MC") \
        /let _opis=$[substr({2}, 0, strrchr({2}, " "))] %;\
        /let _rasa=$[substr({2}, strrchr({2}, " ") + 1)] %;\
        /if (_is_kobieta(_rasa)) \
            /let _rasa=$[strcat("(?:", _rasa, "|mutantka)")] %;\
        /else \
            /let _rasa=$[strcat("(?:", _rasa, "|mutant)")] %;\
        /endif %;\
        /let _opis=$[strcat(_opis, " ", _rasa)] %;\
    /endif %;\
    /let _txt=$[strlen({4}) ? strcat(" @{BCblack}", substr({4}, 0, 1)) : ""] %;\
    /if (strlen({1})) \
        /def -Fp252 -mregexp -t'(%{1})([ .,*]|\$)' _gildie_trig_i_%{_gildie_last_id} = \
            /return _gildie_seen("%{3}", "%{_txt}") %;\
        /let _txt=$[strcat(" ", {1}, {_txt})] %;\
    /endif %;\
    /def -Fp251 -mregexp -t'(%{_opis})([ .,]|\$)' _gildie_trig_o_%{_gildie_last_id} = \
        /return _gildie_seen("%{3}", "%{_txt}") 
    
/def _gildie_seen = \
    /if (!{_wrog_podpis_on}) \
        /_set_wrog %{P1} %;\
        /return substitute(strcat({PL}, {P1}, " @{BCwhite}(@{BCred}", {1}, "@{nBCwhite}", {2}, "@{nBCwhite})@{n}", {P2}, {PR})) %;\
    /endif %;\
    /if ({_sprawdz_aktywnosci_wrogow}) \
        /test ++{_ilosc_wrogow_obecnych} %;\
        /set _wrogowie_obecni=$[strcat({_wrogowie_obecni}, {P1}, "|")] %;\
        /return substitute(strcat({PL}, "@{BCred}", {P1}, {P2}, "@{n}", {PR})) %;\
    /endif

/def _gildie_make_trigs = \
    /purge _gildie_trig_* %;\
    /set _gildie_last_id=0 %;\
    /quote -S /test _gildie_make_trig('"%{TFDIR}/gildie.db") %;\
    /unset _gildie_last_id %;\

/_gildie_make_trigs

