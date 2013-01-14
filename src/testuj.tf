; by Ingwar

/def szukaj = /testuj
/def testuj = \
	spoliczkuj kogo? %;\
	/def -p306 -1 -i -agLG -t'Spoliczkuj kogo?' _testuj_poczatek = \
		/let _testuj_komendy=\
		wykop|kop|trenuj|kup|przejrzyj|zamow|wejdz|przejdz|wespnij|zlap|\
		chwyc|zejdz|zsun|dotknij|urwij|wyskocz|zlam|zniszcz|rozwal|uderz|\
		pomodl|modl|rozsun|wsun|dosun|posun|odsun|nasun|wysun|zasun|\
		przesun|usun|rozciagnij|wciagnij|dociagnij|pociagnij|odciagnij|\
		naciagnij|wyciagnij|zaciagnij|uciagnij|wcisnij|docisnij|pocisnij|\
		odcisnij|wycisnij|zacisnij|przecisnij|ucisnij|rozlacz|wlacz|\
		polacz|odlacz|wylacz|zalacz|przelacz|rozerwij|porwij|oderwij|narwij|\
		wyrwyj|przerwij|podwaz|wywaz|przewaz|roznies|wnies|donies|\
		ponies|odnies|nanies|wynies|zanies|przenies|unies|wplyn|doplyn|\
		poplyn|wyplyn|zanurkuj|nurkuj|przeplyn|umiesc|nadaj|wypowiedz|\
		zapukaj|zadzwon|rozpal|podpal|rzuc|podrzuc|podsadz|rozbij|przebij|\
		zmien|zamien|przemien|pokaz|podloz|podeprzyj|przeczolgaj|czolgaj|\
		wdrap|wyjdz|zastukaj|przepraw|przelej|wyrwij|wyjrzyj|wczolgaj|\
		wygladnij|podciagnij|wygnij|nalej|odlej|wyrzuc|podnies|zloz|\
		zasyp|nasyp|przesyp|podlej|opowiedz|sprawdz|popraw|zwroc|\
		nacisnij|zajrzyj|siadz|usiadz|popchnij|pchnij|wplyn|\
		wslizgnij|wskocz|zeskocz|wkrec|wykrec|odkrec|zakrec|przekrec|\
		odbierz|wydlub|poswiec|ukorz|oddaj|kleknij|ukleknij|poddaj|\
		odetnij|odwiaz|odetkaj|wykap|zdeponuj|przeskocz|postaw|zdepcz|zadepcz|\
		rozdepcz|przetrzyj|wyczysc|oczysc|powachaj|wachaj|sproboj|pobierz|\
		wygrzeb|odgrzeb|zerwij|zaczep|odczep|przyczep|przypnij|przyloz|przystaw|\
		odchyl|przezuj|sproszkuj|spal|wypal|przywiaz|zawiaz|rozgryz|pozbieraj|\
		zbieraj|doloz|zabierz|zalej|zagrzeb|rozbroj|przekop|popusc|obroc|\
		wydoj|sciagnij|zatknij|rozegraj|graj|przymij|zarzuc|\
		zdenominuj|wypozycz|pozycz|napraw|wybierz|wydrap|naloz|odpocznij|\
		potargaj|utul|zanuc|pobij|mietos|spij|przytrocz|dmuchnij|odczytaj|\
		wyryj|naostrz|zlomuj|wrzuc|odrzuc|ogrzej|wstan|powstan|kucnij|ukucnij|\
		wytnij|rozpostrzyj|zepnij|rozepnij|przylacz|odlacz|przeslizgnij|\
		zadeklaruj|zaplac|\
		%%;\
		/while /let i=$$[strstr({_testuj_komendy},"|")] %%; /@test i > 0 %%; /do \
		/send $$[strcat(substr({_testuj_komendy},0,i), " Grrrrr..")] %%;\
		/let _i_=$$[{_i_}+1] %%;\
		/set _testuj_komendy2=$$[strcat({_testuj_komendy2},pad({_i_},-3),substr({_testuj_komendy},0,i+1))] %%;\
		/let _testuj_komendy=$$[substr({_testuj_komendy},i+1)] %%;\
		/done %%;\
		/set _testuj_ilosc=0 %%;\
		spoliczkuj kogo? %%;\
		/def -agLG -p301 -i -mregexp -t'^(> )*Slucham\\\\\\\\?$$$$' _testuj_gag1 = \
			/set _testuj_ilosc=$$$[{_testuj_ilosc}+1] %%%;\
			/set _testuj_cos=1 %%;\
		/def -agLG -p301 -i -mregexp -t'^(> )*Ze co\\\\\\\\?$$$$' _testuj_gag2 = \
			/set _testuj_ilosc=$$$[{_testuj_ilosc}+1] %%%;\
			/set _testuj_cos=1 %%;\
		/def -agLG -p301 -i -mregexp -t'^(> )*Pociagnij .nosem. .jak.\\\\\\\\?$$$$' _testuj_gag3 = \
			/set _testuj_ilosc=$$$[{_testuj_ilosc}+1] %%%;\
			/set _testuj_cos=1 %%;\
		/def -p205 -i -mregexp -h'PROMPT ^> ' _testuj_gag4 = \
			/set _testuj_cos=1 %%;\
		/def -p300 -i -mregexp -t'^> ' _testuj_gag5 = \
			/set _testuj_cos=1 %%%;\
			/_testuj_gag_hit %%;\
		/def -p200 -i -t'*' _testuj_gag_hit = \
			/if ({_testuj_cos}==1) \
				/set _testuj_ilosc=$$$[{_testuj_ilosc}+1] %%%;\
				/set _testuj_ilosc2=$$$[{_testuj_ilosc2}+1] %%%;\
				/set _testuj_cos=0 %%%;\
				/let num=$$$[strstr({_testuj_komendy2},{_testuj_ilosc})+3] %%%;\
				/let num2=$$$[strstr(substr({_testuj_komendy2},{num}),"|")] %%%;\
				/let _testuj_kom=$$$[substr({_testuj_komendy2},{num},{num2})] %%%;\
				/echo -p Komenda: @{BC%kolor_info}%%%{_testuj_kom}@{n} %%%;\
			/endif %%;\
		/def -p305 -agLG -i -t'*Spoliczkuj kogo?' _testuj_koniec = \
			/echo -p #@{BC%kolor_info}#@{n}# Udanych: @{BC%kolor_info}%%%{_testuj_ilosc2-}@{n}/%%%{_testuj_ilosc}@{n} %%%;\
			/purge -i _testuj_* %%%;\
			/unset _testuj_ilosc %%%;\
			/unset _testuj_ilosc2 %%%;\
			/unset _testuj_cos %%%;\
			/unset _testuj_komendy2
