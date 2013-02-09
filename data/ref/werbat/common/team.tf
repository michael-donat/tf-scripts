/def -mglob -Fp2 -t' zaprasza cie do swojej druzyny' team0 = \
	/beep 1

/def -mregexp -Fp2 -t'przekazuje ci prowadzenie druzyny' team1 = \
	/beep 1

/def -mregexp -Fp2 -t'dolacza(sz|) * do ' _druzyna_trig_0 = \
	/echo -p @{BC%kolor_info}>>> @{n}Team has changed (@{BC%kolor_info}ctrl+d@{n}).

/def -mregexp -Fp2 -t'porzuca.* druzyne' _druzyna_trig_2 = \
	/echo -p @{BC%kolor_info}>>> @{n}Team has changed (@{BC%kolor_info}ctrl+d@{n}).

/def -mregexp -Fp2 -t'rozwiazuje druzyne' _druzyna_trig_3 = \
	/echo -p @{BC%kolor_info}>>> @{n}Team has changed (@{BC%kolor_info}ctrl+d@{n}).

/def -mregexp -Fp2 -t'zmusza.* do opuszczenia druzyny' _druzyna_trig_4 = \
	/echo -p @{BC%kolor_info}>>> @{n}Team has changed (@{BC%kolor_info}ctrl+d@{n}).

/def -mregexp -Fp2 -t'przekazuje.* druzyn' _druzyna_trig_5 = \
	/echo -p @{BC%kolor_info}>>> @{n}Team has changed (@{BC%kolor_info}ctrl+d@{n}).

/def tablica_druzyny = \
	/quote -S /unset `/listvar -s __druzyna_pozycja_*%;\
	/quote -S /unset `/listvar -s __druzyna_bie_pozycja_*%;\
	/let _tmp_druzyna=%{ogolne_druzyna}%;\
	/let _tmp_druzyna=$[replace("|", " ", {_tmp_druzyna})]%;\
	/let _tmp_druzyna_bie=%{ogolne_druzyna_bie}%;\
	/let _tmp_druzyna_bie=$[replace("|", " ", {_tmp_druzyna_bie})]%;\
;;	/let _tmp_druzyna_bie=$[replace("elikea", "elike", {_tmp_druzyna_bie})]%;\
	/add_array druzyna %{_tmp_druzyna}%;\
	/add_array druzyna_bie %{_tmp_druzyna_bie}%;\
	/rozmiar_tablicy druzyna %;\
	/rozmiar_tablicy druzyna_bie %;\
	/ustaw_indeksy

/def -b'^D' ustaw_druzynke_bind = /druzyna

/def druzyna = \
	/purge key_esc_f1 %;\
	/purge key_esc_f2 %;\
	/purge key_esc_f3 %;\
	/purge key_esc_f4 %;\
	/purge key_esc_f5 %;\
	/purge key_esc_f6 %;\
	/purge key_esc_f7 %;\
	/purge key_esc_f8 %;\
	druzyna %;\
	/set ogolne_druzyna=DRUZYNA %;\
	/set ogolne_leader=LEADER %;\
	/purge __druzyna_tmp_* %;\
	/def -ag -t'*Nie jestes w zadnej druzynie.*' __druzyna_tmp_1= \
		/am 1 %%;\
		/_ustaw_druzyne %%;\
		/quote -S /unset `/listvar -s __druzyna_pozycja_*%%;\
		/quote -S /unset `/listvar -s __druzyna_bie_pozycja_*%;\
	/def -ag -mregexp -t'Przewodzisz druzynie, w ktorej oprocz ciebie jest jeszcze ([^.]*)\\\\.$$' __druzyna_tmp_2a= \
		/am 3 %%;\
		/set ogolne_druzyna=%%{P1} %%;\
		/_ustaw_druzyne %%;\
		/repeat -1 1 /tablica_druzyny %;\
	/def -ag -mregexp -t'Druzyne prowadzi (.*)( i oprocz ciebie (sa|jest) w niej jeszcze(: | )([^.]*)\\\\.$$|, zas ty jestes jej jedynym czlonkiem.)' __druzyna_tmp_3a= \
		/am 1 %%;\
		/set ogolne_leader=$$[{P1}] %%;\
		/set ogolne_leader=$$[escape("\\\\",escape("()",{ogolne_leader}))] %%;\
		/set ogolne_leader_dop=$$(/_l_odmien D %%{ogolne_leader}) %%;\
		/set ogolne_leader_bie=$$(/_l_odmien B %%{ogolne_leader}) %%;\
		/set ogolne_leader_nar=$$(/_l_odmien N %%{ogolne_leader}) %%;\
;; nightal
		/set ogolne_leader_bie=$$[replace("arda", "arde", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("rydharde", "rydharda", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("larella", "larelle", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("enta", "entu", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("tyrania", "tyranie", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("naraka", "naraku", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("isobella", "isobell", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("perla", "perle", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("ayrena", "ayren", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("szassa", "szass", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("venisa", "venise", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("maevea", "maeve", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("rteca", "rtec", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("myrela", "myrale", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("squibiea", "squibiego", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("rhera", "rhere", {ogolne_leader_bie})]%%;\
;; arkadia
		/set ogolne_leader_bie=$$[replace("myra", "myre", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("elikea", "elike", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("bara", "bare", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("necra", "necre", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("ayletta", "aylett", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("deliego", "deli", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("ilanea", "ilane", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("aida", "aide", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("ineza", "inez", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("nastilla", "nastille", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("lidia", "lidie", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("gerdia", "gerdie", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("arroniego", "arronie", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("istrida","istrid", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("vaea","vae", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("jinesha","jinesh", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("ursa", "urse", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("aenya", "aenye", {ogolne_leader_bie})]%%;\
		/set ogolne_leader_bie=$$[replace("aylinna", "aylinn", {ogolne_leader_bie})]%%;\
		/set ogolne_druzyna=%%{P5-DRUZYNA} %%;\
	/_ustaw_druzyne%;\
	/if ( {1} !~ "-q" )\
		/echo -p #@{BC%kolor_info}#@{n}# Team set, attack mode: @{BC%kolor_info}%opis_ataku@{n}.%;\
	/endif

/def _ustaw_druzyne = \
	/purge __druzyna_tmp_* %;\
	/set ogolne_druzyna=$[replace(" kleczac. na ziemi", "", ogolne_druzyna)] %;\
	/set ogolne_druzyna=$[replace(" piszac. list", "", ogolne_druzyna)] %;\
	/set ogolne_druzyna=$[replace(" i ", "|", ogolne_druzyna)] %;\
	/set ogolne_druzyna=$[replace(", ", "|", ogolne_druzyna)] %;\
	/set ogolne_druzyna=$[escape("\\",escape("()[]",{ogolne_druzyna}))] %;\
	/set ogolne_druzyna_dop=$(/_l_odmien D %{ogolne_druzyna}) %;\
	/set ogolne_druzyna_bie=$(/_l_odmien B %{ogolne_druzyna}) %;\
	/set ogolne_druzyna_nar=$(/_l_odmien N %{ogolne_druzyna}) %;\
; --- Wyjatki imion zle odmienialnych (biernik) ---
;; nightal
	/set ogolne_druzyna_bie=$[replace("arda", "arde", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("rydharde", "rydharda", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("larella", "larelle", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("enta", "entu", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("tyrania", "tyranie", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("naraka", "naraku", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("isobella", "isobell", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("perla", "perle", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("ayrena", "ayren", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("venisa", "venise", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("maevea", "maeve", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("rteca", "rtec", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("myrela", "myrale", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("squibiea", "squibiego", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("rhera", "rhere", {ogolne_druzyna_bie})]%;\
;; arkadia
	/set ogolne_druzyna_bie=$[replace("myra", "myre", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("elikea", "elike", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("bara", "bare", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("necra", "necre", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("ayletta", "aylett", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("deliego", "deli", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("ilanea", "ilane", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("aida", "aide", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("ineza", "inez", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("nastilla", "nastille", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("lidia", "lidie", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("gerdia", "gerdie", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("arroniego", "arronie", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("istrida", "istrid", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("vaea", "vae", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("jinesha", "jinesh", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("ursa", "urse", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("aenya", "aenye", {ogolne_druzyna_bie})]%;\
	/set ogolne_druzyna_bie=$[replace("aylinna", "aylinn", {ogolne_druzyna_bie})]%;\
	/_zaslona_binds

/def _zaslona_binds = \
	/let _tmp=$[strcat({ogolne_leader_bie}, "|", {ogolne_druzyna_bie}, "|")] %;\
	/while /let i=$[strstr({_tmp},"|")] %;/@test i >- 1 %;/do \
		/let _name=$[substr({_tmp},0,i)] %;\
		/let _tmp=$[substr({_tmp},i+1)] %;\
		/test _zaslona_bind_one({_name}, {_ilosc}, "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12") %;\
		/let _ilosc=$[{_ilosc} + 1] %;\
	/done

/def _zaslona_show_numbers = \
	/let _numer_do_zaslony=1 %;\
	/purge _zaslona_show_numbers_* %;\
	/purge koncentracja_show_numbers* %;\
	/purge przejecie_ataku_show_numbers* %;\
	/let _tmp=$[strcat({ogolne_leader}, "|", {ogolne_druzyna}, "|")] %;\
	/while /let i=$[strstr({_tmp},"|")] %;/@test i >- 1 %;/do \
		/let _name=$[substr({_tmp},0,i)] %;\
		/let _tmp=$[substr({_tmp},i+1)] %;\
		/if ({_numer_do_zaslony} < 13) \
			/def -mregexp -Fp3 -t'^%{_name}.* jest (w swietnej kondycji|w dobrym stanie|lekko rann(y|a)|rann(y|a)|w zlej kondycji|ciezko rann(y|a)|ledwo zyw(y|a)).' _zaslona_show_numbers_%{_numer_do_zaslony} = /return substitute(strcat("@{BCwhite}[ ", pad(strcat("F", %{_numer_do_zaslony}), -2), " ]@{n} ", {*}), "x", 1) %;\
		/endif %;\
		/let _numer_do_zaslony=$[{_numer_do_zaslony} + 1] %;\
		/done

/def _zaslona_bind_one = \
	/if ({2} >= 12) \
		/return %;\
	/endif %;\
	/let _name=%{1} %;\
	/let _ilosc=%{2} %;\
	/shift $[2+ {_ilosc}] %;\
	/def key_esc_f%{1} = zaslon %{_name}%;\
	/alias z%{1} chr %{_name} %;\
	/if ({obecnie_swiat} =~ "arkadia" )\
		/alias g%{1} zaslon %{_name} przed grupa %;\
	/endif %;\
	/shift 12 %;\
	/_zaslona_show_numbers
