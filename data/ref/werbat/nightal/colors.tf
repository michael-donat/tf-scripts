; ogólne
/eval /def -PBC%kolor_main    -Fp5 -t'Tak jest\\.'
/eval /def -PBC%kolor_main    -Fp5 -t'Ze co.'
/eval /def -PBC%kolor_main    -Fp5 -t'zaprasza cie do swojej druzyny'
/eval /def -PBCwhite;Cbggreen -Fp5 -t' przybywa(ja|)'
/eval /def -PBCwhite;Cbggreen -Fp5 -t' przybiega(ja|)'
/eval /def -PBCbggreen;Cwhite -Fp5 -t' podaza(ja|sz|) '
/eval /def -PBCbggreen;Cwhite -Fp5 -t' wybiega(ja|)'
/eval /def -ar -mglob          -Fp5 -t'*przekazuje ci dowodzenie nad druzyna*'

; walka
/eval /def -ar -mregexp       -Fp5 -t'.* zaslania .* przed twoimi ciosami.'
/eval /def -ar -PBC%kolor_atak -mregexp -Fp5 -t'.* atakuje cie(bie|)[!.]'
/eval /def -ar -PBC%kolor_atak -mregexp -Fp5 -t'.* stajesz na .* drodze.'
/eval /def -ar -PBC%kolor_atak -mregexp -Fp5 -t'.* przebijajac sie przez twoja .*'

/eval /def -PBC%kolor_atak   -Fp5 -t'^Atakujesz .*'
/eval /def -PBC%kolor_atak  -Fp5 -t'Wspierasz '
/eval /def -PBC%kolor_atak  -Fp5 -t' wspiera cie '
/eval /def -PBC%kolor_atak  -Fp5 -t'.* atakuje .*'
/eval /def -PBC%kolor_atak  -Fp5 -t'.* probuje cie zaatakowac, lecz .*'
/eval /def -PBC%kolor_atak  -Fp5 -t'.* przebijajac sie przez (jej|jego) .*'
/eval /def -PBC%kolor_atak   -Fp5 -t'^Z zacietoscia rzucasz sie na .* przebijajac sie przez .*!'
/eval /def -PBC%kolor_atak   -Fp5 -t'Walczysz '
/eval /def -PBC%kolor_atak   -Fp5 -t' walczy '
/eval /def -PCred            -Fp5 -t'.* (umarl|polegl)(a|o|)\\.'
/eval /def -PBCred           -Fp5 -t'^Zabil.s (.*)'
/eval /def -PCbgwhite;BCred  -Fp5 -t'Zaslaniasz'
/eval /def -PCbgwhite;BCred  -Fp5 -t'zaslania cie '
/eval /def -PCbgwhite;Cred   -Fp5 -t'zaslania'
/eval /def -PCbgwhite;BCblue -Fp5 -t'Prob.jesz zaslonic'
/eval /def -PCbgwhite;BCblue -Fp5 -t'prob.je cie zaslonic'
/eval /def -PCbgwhite;Cblue  -Fp5 -t'prob.je zaslonic'
/eval /def -PCbgwhite;Cred   -Fp5 -t'przestaje zaslaniac'
/eval /def -PBC%kolor_alarm  -Fp5 -t'Czujesz sie ekstremalnie zmeczon..'

; ataki niestandardowe
/eval /def -ar -PBC%kolor_atak -mregexp -Fp5 -t'.* uderza sie gwaltownie w tors .* ciebie .*'
/eval /def -PC%kolor_atak -Fp5 -t'.* wydajac z siebie .* rzuca sie na .*'
/eval /def -ar -PBC%kolor_atak -mregexp -Fp5 -t'.* rusza na ciebie wzywajac kogos do walki!'
/eval /def -ar -PBC%kolor_atak -mregexp -Fp5 -t'.* rozdziawia szczeke i wpatruje sie w Ciebie przez pare chwil.*'

; ciosy	
/eval /def -mregexp -PBC%kolor_fight_me -Fp5 -t'(Smiercionosnie tniesz|Bardzo mocno tniesz|Tylko nacinasz|Nacinasz|Tniesz|Gleboko tniesz|Lekko tniesz|Klujesz|Dzgasz|Gleboko klujesz|Powaznie klujesz|Powaznie tniesz|Zadrapujesz|Ledwie zadrapujesz|Brutalnie tluczesz|Powaznie obijasz|Obijasz|Tluczesz|Mocno uderzasz|Lekko obijasz|Muskasz|Lekko nakluwasz|Uderzasz|Bardzo gleboko przebijasz|Siniaczysz)'
/eval /def -mregexp -PBC%kolor_fight -Fp5 -t' (smiercionosnie tnie|bardzo mocno tnie|tylko nacina|nacina|tnie|gleboko tnie|lekko tnie|kluje|dzga|gleboko kluje|powaznie kluje|powaznie tnie|zadrapuje|ledwie zadrapuje|brutalnie tlucze|powaznie obija|obija|tlucze|mocno uderza|lekko obija|muska|lekko nakluwa|uderza|bardzo gleboko przebija|siniaczy) cie '
/eval /def -PC%kolor_fight -Fp5 -t' (smiercionosnie tnie|bardzo mocno tnie|tylko nacina|nacina|tnie|gleboko tnie|lekko tnie|kluje|dzga|gleboko kluje|powaznie kluje|powaznie tnie|ledwie zadrapuje|zadrapuje|brutalnie tlucze|powaznie obija|obija|tlucze|mocno uderza|lekko obija|muska|lekko nakluwa|uderza|bardzo gleboko przebija|siniaczy) (?!cie )'

/eval /def -mregexp -PBC%kolor_fight_me -Fp5 -t'(Ledwo muskasz|Lekko ranisz|Ranisz|Powaznie ranisz|Bardzo ciezko ranisz|Masakrujesz) '
/eval /def -mregexp -PBC%kolor_fight -Fp5 -t' (ledwo muska|lekko muska|niezbyt mocno rani|lekko rani|(?<!powaznie |bardzo ciezko )rani|powaznie rani|bardzo ciezko rani|masakruje) cie '
/eval /def -mregexp -PC%kolor_fight  -Fp5 -t' (ledwo muska|lekko muska|niezbyt mocno rani|lekko rani|(?<!powaznie |bardzo ciezko )rani|powaznie rani|bardzo ciezko rani|masakruje) (?!cie )'

; kondycja
/eval /def -PBC%kolor_main  -Fp5 -t'w swietnej kondycji'
/eval /def -PBC%kolor_main  -Fp5 -t'w dobrym stanie'
/eval /def -PBC%kolor_main  -Fp5 -t'lekko rann.'
/eval /def -PBC%kolor_alarm -Fp5 -t' rann.'
/eval /def -PBC%kolor_alarm -Fp5 -t'w zlej kondycji'
/eval /def -PBC%kolor_crit  -Fp4 -t'(ciezko rann.)'
;;/eval /def -PBC%kolor_crit  -Fp1 -t'ledwo zyw.'

; mana
/eval /def -PBC%kolor_main  -Fp5 -t'mentalnie w pelni sil'
/eval /def -PBC%kolor_alarm  -Fp5 -t'mentalnie lekko oslabion.'
/eval /def -PBC%kolor_alarm  -Fp5 -t'mentalnie oslabion.'
/eval /def -PBC%kolor_alarm  -Fp5 -t'mentalnie zmeczon.'
/eval /def -PBC%kolor_alarm -Fp5 -t'mentalnie bardzo zmeczon.'
/eval /def -PBC%kolor_alarm -Fp5 -t'mentalnie w zlej kondycji'
/eval /def -PBC%kolor_alarm -Fp5 -t'mentalnie wyczerpan.'
/eval /def -PBC%kolor_crit  -Fp5 -t'mentalnie wykonczon.'
/eval /def -PBC%kolor_crit  -Fp5 -t'mentalnie u kresu sil'

; zmeczenie
/eval /def -PBC%kolor_main -Fp5 -t'jestes w pelni wypoczet(y|a)\\.'
/eval /def -PBC%kolor_main -Fp5 -t'jestes wypoczet(y|a)\\.'
/eval /def -PBC%kolor_main -Fp5 -t'jestes troche zmeczon(y|a)\\.'
/eval /def -PBC%kolor_main -Fp5 -t'jestes zmeczon(y|a)\\.'
/eval /def -PBC%kolor_main -Fp5 -t'jestes bardzo zmeczon(y|a)\\.'
/eval /def -PBC%kolor_main -Fp5 -t'jestes nieco wyczerpan(y|a)\\.'
/eval /def -PBC%kolor_alarm -Fp5 -t'jestes wyczerpan(y|a)\\.'
/eval /def -PBC%kolor_alarm -Fp5 -t'jestes bardzo wyczerpan(y|a)\\.'
/eval /def -PBC%kolor_crit -Fp5 -t'jestes wycienczon(y|a)\\.'
/eval /def -PBC%kolor_crit -Fp5 -t'jestes calkowicie wycienczon(y|a)\\.'

/eval /def -PBC%kolor_crit  -Fp5 -t'Jestes tak zmeczon., ze nie mozesz dalej .* w tym kierunku\\.'

; postepy
/eval /def -mregexp -Fp5 -PBC%kolor_main -t'(Nie poczynil[ea]s| (.*) postepy)'

/eval /def -PBC%kolor_main  -Fp5 -t'Dzierzy(sz|) .*'
/eval /def -PC%kolor_main   -Fp5 -t'Ma(sz| on| ona) na sobie '
/eval /def -PC%kolor_main   -Fp5 -t'Masz przy sobie ' 
/eval /def -PBC%kolor_main  -Fp5 -t'ze jest w znakomitym stanie'
/eval /def -PBC%kolor_alarm -Fp5 -t'ze jest w (dobrym|zlym|bardzo zlym) stanie'
/eval /def -PBC%kolor_alarm -Fp5 -t'ze liczne walki wyryly na .* swoje pietno'
/eval /def -PBC%kolor_alarm -Fp5 -t'ze wymaga natychmiastowej konswerwacji'
/eval /def -PBC%kolor_alarm -Fp5 -t'ze moze peknac w kazdej chwili'
/eval /def -PBC%kolor_alarm -Fp5 -t'ze jest lekko podniszczon.'
/eval /def -PBC%kolor_alarm -Fp5 -t'ze jest w kiepskim stanie'
/eval /def -PBC%kolor_alarm -Fp5 -t'ze jest w oplakanym stanie'
/eval /def -PBC%kolor_alarm -Fp5 -t'ze jest gotow. rozpasc sie w kazdej chwili'
/eval /def -PBC%kolor_alarm -Fp5 -t'nie nadaje sie do (ostrzenia|naprawy).'

; poczta
/eval /def -PBC%kolor_main  -Fp5 -t'^Nagle, tuz przed toba, z chmury dymu .*'
/eval /def -PBC%kolor_main  -Fp5 -t'^Masz now(a|y) .*'
/eval /def -PBC%kolor_main  -Fp5 -t'.*Czeka na ciebie .* poczta.*'
/eval /def -PBC%kolor_main  -Fp5 -t'.*Pozostawia na twojej dloni wiadomosc i.*'
/eval /def -PBC%kolor_main  -Fp5 -t'.*Podnosisz go i odczepiasz.*'
/eval /def -PBC%kolor_main  -Fp5 -t'.*Z glosnym trzepotem skrzydel na twoim ramieniu siada.*'
/eval /def -PBC%kolor_main  -Fp5 -t'.*agle miedzy twoimi nogami zaczyna platac.*'
/eval /def -PBC%kolor_main  -Fp5 -t'.*Nie mija chwila gdy ptak przysiada na twoim ramieniu..*'
/eval /def -PBC%kolor_main  -Fp5 -t'.*Na twoim przedramieniu niespodziewanie wyladowala snieznobiala pocztowa mewa..*'
/eval /def -PBC%kolor_main  -Fp5 -t'.*Dociera do twojego przedramienia, gdzie przystaje, poruszajac lekko ogonem..*'
/eval /def -PBC%kolor_main  -Fp5 -t'.*agle tuz pod twoja noge przypelza kolorowa cetkowana zmija i szczerzy groznie kly jadowe..*'
/eval /def -PBC%kolor_main  -Fp5 -t'.*Nagle wesolo merdajac ogonkiem przybiega do ciebie.*'
/eval /def -PBC%kolor_main  -Fp5 -t'.*Czujesz wokol siebie dosc dziwny zapach, ktory kojarzyc moze sie ze zgnilizna.*'
/eval /def -PBC%kolor_main  -Fp5 -t'.*Nagle, tuz obok ciebie, w rozblysku ognia pojawia sie ognisty zlosliwy imp, z niechecia wreczajac ci wiadomosc.*'

; mowienie
/eval /def -mregexp -PBC%kolor_speak -Fp5 -t'(Mowisz|Krzyczysz|Szepczesz)(.*)'
/eval /def -mregexp -PBC%kolor_speak -Fp5 -t'(.*) (mowi|krzyczy|szepcze|ryczy|skrzypi|dudni|mruczy|nuci|marudzi|brzeczy|zawodzi|piszczy|jeczy|skrzeczy|zgrzyta|spiewa|warczy|burczy|syczy|grzmi|belkocze pijacko|huczy|mamrocze|wola)((.*)| )do ciebie: (.*)'
/eval /def -mregexp -PC%kolor_speak  -Fp5 -t'(.*) ((?-i)mowi|krzyczy|szepcze|ryczy|skrzypi|dudni|mruczy|nuci|marudzi|brzeczy|zawodzi|piszczy|jeczy|skrzeczy|zgrzyta|spiewa|warczy|burczy|syczy|grzmi|belkocze pijacko|huczy|mamrocze|wola)(| z (.*)|(.*)|( z (.*) do (?!ciebie))|(.*) do (?!ciebie)): (.*)'

/def glow = \
	/def -PBC%kolor_glow -Fp5 -t'%{*}' _glow_%{1}

/def unglow = \
	/purge -i _glow_%{*}
		
; by Ingwar

/set ogolne_skrzynia_dluga=1

/def _skrzynia = \
	/purge _skrzynia_trig_* %;\
	/if ({ogolne_skrzynia_dluga}==1) \
		/def -agC%kolor_info -p2 -mregexp -t'( zawiera(?:|ja)|powieszono) (.+, .+ i .+)\\\\.$$' _skrzynia_trig_1 = /test _skrzynia_pokaz(strcat({PL}, {P1}, ":"), {P2}) %;\
	/endif

/_skrzynia

/purge -i _skrzynia_pokaz

/def -i _skrzynia_pokaz = \
	/let _tmp=$[replace(", ", "|", {2})] %;\
	/let _tmp=$[strcat(replace(" i ", "|", {_tmp}), "|")] %;\
	/let _tmp=$[replace("||", "|", {_tmp})] %;\
	/while /let i=$[strstr({_tmp},"|")] %; /@test i > -1 %; /do \
		/let _name=$[substr({_tmp},0,i)] %;\
		/let _tmp=$[substr({_tmp},i+1)] %;\
		/let _ile=$(/_zam_licz %{_name}) %;\
		/if ({_ile} != 1) \
			/let _name=$[substr({_name}, strchr({_name}, " ") + 1)] %;\
		/endif %;\
		/if (regmatch("\
			gwiezdny.* topor|\
			", {_name})) \
			/let _name=$[strcat(decode_attr(""), {_name})] %;\
		/elseif (regmatch("\
			prost. smukl. rapier|\
			", {_name})) \
			/let _name=$[strcat(decode_attr(""), {_name})] %;\
		/endif %;\
		/if (regmatch({ogolne_skrzynia_podswietl-NICO}, {_name})) \
			/let _name=$[strcat(decode_attr(strcat("@{BCmagenta}[", {_ile}, "] ")), substr({_name}, 0, strstr({_name}, "]") + 1), decode_attr(strcat(substr({_name}, strstr({_name}, "]") + 1))))] %;\
		/else \
			/let _name=$[strcat("[", {_ile}, "] ", {_name})] %;\
		/endif %;\
		/if (regmatch("\
			topor|\
			berdysz|\
			siekier|\
			czekan|\
			oskard|\
			kilof|\
			tasak|\
			tabar|\
			nadziak|\
			miecz|\
			szabl|\
			szabel|\
			rapier|\
			scimitar|\
			katzbalger|\
			stilett|\
			pal|\
			sztylet|\
			halabard|\
			falchion|\
			mlot|\
			obusz|\
			wlocznie|\
			pik[ei]|\
			noz|\
			maczug|\
			morgenstern|\
			kordelas|\
			mizerykordi|\
			buzdygan|\
			korbacz|\
			gal[ae]z|\
			bulaw|\
			drag|\
			kiscien|\
			nog[ai] stolow|\
			wekier|\
			walek|\
			lamia|\
			kos[aye]|\
			szponton|\
			partyzan|\
			glewi|\
			gizarm|\
			dzid|\
			naginat|\
			rohatyn|\
			korsek |\
			cep|\
			trojz[ea]b|\
			ronkon|\
			runk|\
			flamberg|\
			poltorak|\
			bulat|\
			nimsz|\
			szamszir|\
			lami|\
			spis[ay]|\
			schiavon|\
			lewak|\
			sierp|\
			lask|\
			wid(e|)l|\
			saif|\
			koncerz|\
			kij|\
			espadon|\
			claymor|\
			cinquend|\
			szpad|\
			karabel|\
			jatagan|\
			baselard\
			", {_name})) \
			/let _tmp_zb_1=$[strcat(_tmp_zb_1, _name, "|")] %;\
		/elseif (regmatch("tarcz|puklerz|pawez", {_name})) \
			/let _tmp_zb_2=$[strcat(_tmp_zb_2, _name, "|")] %;\
		/elseif (regmatch("napiersnik|kirys|kolczug|karacen|kaftan|koszul|tunik|zbroj|bajdan[ay]|anim[eay]|kozus|kurt|kamizel|becht|pancerz", {_name})) \
			/let _tmp_zb_3=$[strcat(_tmp_zb_3, _name, "|")] %;\
		/elseif (regmatch("nareczak|naramiennik|rekawic|karwasz", {_name})) \
			/let _tmp_zb_4=$[strcat(_tmp_zb_4, _name, "|")] %;\
		/elseif (regmatch("nagolennik|spoden|nogawic|but(y|ow)|trzewik|spodni|spodnic|naudziak|sandal|nakolannik", {_name})) \
			/let _tmp_zb_5=$[strcat(_tmp_zb_5, _name, "|")] %;\
		/elseif (regmatch("helm|misiurk|kaptur|morion|basinet|salad|przylbic|diadem|szyszak|narbut[ay]| armet|casquett| czapk|beret|turban|gigantyczn. wzmacnian. czaszk| barbut|kapalin", {_name})) \
			/let _tmp_zb_6=$[strcat(_tmp_zb_6, _name, "|")] %;\
		/elseif (regmatch("plaszcz|peleryn| tog| szat|bloniaste skrzydl", {_name})) \
			/let _tmp_zb_7=$[strcat(_tmp_zb_7, _name, "|")] %;\
		/else \
			/let _tmp_zb_8=$[strcat(_tmp_zb_8, _name, "|")] %;\
		/endif %;\
	/done %;\
	/let _szer=$[wrapsize / 2 - 4] %;\
	/test echo(strcat("+", strrep("-", {_szer} * 2 - 44 - %{wrapspace}), "+")) %;\
	/let i=0 %;\
	/while (i < 4) \
		/let i1=$[{i} * 2 + 1] %;\
		/let i2=$[{i} * 2 + 2] %;\
		/eval /set _zb=%%_tmp_zb_%{i1} %;\
		/eval /set _zb2=%%_tmp_zb_%{i2} %;\
		/if ({_zb} !~ NULL | {_zb2} !~ NULL) \
		    /while (_zb !~ "" | _zb2 !~ "") \
				/let _k=$[strstr({_zb},"|")] %;\
				/let _name=$[substr({_zb},0,_k)] %;\
				/let _name=$[substr(_name, 0, {_szer})] %;\
				/set _zb=$[substr({_zb},_k+1)] %;\
				/let _k2=$[strstr({_zb2},"|")] %;\
				/let _name2=$[substr({_zb2},0,_k2)] %;\
				/let _name2=$[substr(_name2, 0, {_szer})] %;\
				/set _zb2=$[substr({_zb2},_k2+1)] %;\
				/test echo(strcat("| ", pad({_name}, - {_szer} + 25 + %{wrapspace}), " | ", pad({_name2}, - {_szer} + 24 + %{wrapspace}), " |")) %;\
			/done %;\
			/test echo(strcat("+", strrep("-", {_szer} * 2 - 44 - %{wrapspace}), "+")) %;\
		/endif %;\
		/test ++i %;\
	/done %;\
	/unset _zb %;\
	/unset _zb2 %;\
	/unset _na %;\
	/unset _na2

/purge -i _zam_licz

/def -i _zam_licz = \
	/if ({1} =~ "dwa" | {1} =~ "dwie" | {1} =~ "dwoch") \
		/test echo(2) %;\
	/elseif ({1} =~ "trzy" | {1} =~ "trzech") \
		/test echo(3) %;\
	/elseif ({1} =~ "cztery" | {1} =~ "czterej") \
		/test echo(4) %;\
	/elseif ({1} =~ "piec" | {1} =~ "pieciu") \
		/test echo(5) %;\
	/elseif ({1} =~ "szesc" | {1} =~ "szeciu") \
		/test echo(6) %;\
	/elseif ({1} =~ "siedem" | {1} =~ "siedmiu") \
		/test echo(7) %;\
	/elseif ({1} =~ "osiem" | {1} =~ "osmiu") \
		/test echo(8) %;\
	/elseif ({1} =~ "dziewiec" | {1} =~ "dziewieciu") \
		/test echo(9) %;\
	/elseif ({1} =~ "dziesiec" | {1} =~ "dziesieciu") \
		/test echo(10) %;\
	/elseif ({1} =~ "jedenascie" | {1} =~ "jedynastu") \
		/test echo(11) %;\
	/elseif ({1} =~ "dwanascie" | {1} =~ "dwunastu") \
		/test echo(12) %;\
	/elseif ({1} =~ "trzynascie" | {1} =~ "trzynastu") \
		/test echo(13) %;\
	/elseif ({1} =~ "czternascie" | {1} =~ "czternastu") \
		/test echo(14) %;\
	/elseif ({1} =~ "pietnascie" | {1} =~ "pietnastu") \
		/test echo(15) %;\
	/elseif ({1} =~ "szesnascie" | {1} =~ "szesnastu") \
		/test echo(16) %;\
	/elseif ({1} =~ "siedemnascie" | {1} =~ "siedemnastu") \
		/test echo(17) %;\
	/elseif ({1} =~ "osiemnascie" | {1} =~ "osiemnastu") \
		/test echo(18) %;\
	/elseif ({1} =~ "dziewietnascie" | {1} =~ "dziewietnastu") \
		/test echo(19) %;\
	/elseif ({1} =~ "dwadziescia" | {1} =~ "dwudziestu") \
		/test echo(20) %;\
	/elseif (regmatch("(\\d+)", {1})) \
		/test echo(decode_attr(strcat("@{nCwhite}", {1}))) %;\
	/elseif ({1} =~ "wiele" | {1} =~ "wielu") \
		/test echo("X") %;\
	/else \
		/test echo(1) %;\
	/endif

/def um = \
	/if ({*}=~NULL) \
		/send umiejetnosci bojowe %;\
		/send umiejetnosci ogolne %;\
		/send umiejetnosci zlodziejskie %;\
		/set _umiejetnosci_i=6 %;\
		/let _um_ktore=bojowe ogolne zlodziejskie %;\
	/else \
		/if ({*}=~"wszystkie") \
			umiejetnosci %;\
			/let _um_ktore=wszystkie %;\
		/else \
			umiejetnosci %{*} %;\
			/let _um_ktore=%{*} %;\
		/endif %;\
		/set _umiejetnosci_i=2 %;\
	/endif %;\
	/set umiejetnosci=%;\
	/def -p6 -ag -mregexp -t':( )*([^ ]*)( )*(.*):( )*([^ ]*)' _um_trig_1= \
		/set umiejetnosci=%%{umiejetnosci}%%{PL}|%%{P2}#%%{P4}|%%{P6}#%;\
	/def -p5 -ag -mregexp -t':( )*([^ ]*)( )*$$' _um_trig_2= \
		/set umiejetnosci=%%{umiejetnosci}%%{PL}|%%{P2}#@%%;\
		/test --_umiejetnosci_i %%;\
		/if ({_umiejetnosci_i}==1) \
			/purge _um_trig_* %%;\
			/_um_wyswietl %{_um_ktore} %%;\
		/endif %;\
	/def -p5 -ag -mregexp -t'^($$|ieznana kategoria. Masz do wyboru:)' _um_trig_3= \
		/set umiejetnosci=%%{umiejetnosci}@%%;\
		/test --_umiejetnosci_i %%;\
		/if ({_umiejetnosci_i}==1) \
			/purge _um_trig_* %%;\
			/_um_wyswietl %{_um_ktore} %%;\
		/endif

/purge -i _um_wyswietl  

/def -i _um_wyswietl = \
	/let i=%;\
	/let linia=%;\
	/let cc=1%; \
	/while /let i=$[strstr(umiejetnosci,"@")]%; /@test i > 0%; /do \
		/test echo(strcat("+", strrep("-", 83) , "+")) %;\
		/shift %;\
		/let um_type=$[substr(umiejetnosci,0,i)]%; \
		/set umiejetnosci=$[substr(umiejetnosci,i+1)]%;\
		/let um_type2=9876543210 %;\
		/while /let i=$[strstr(um_type,"#")]%; /@test i > 0%; /do \
			/let um_name=$[substr(um_type, 0, i)]%;\
			/let um_type=$[substr(um_type, i + 1)]%;\
			/let j=$[strstr(um_name,"|")]%;\
			/let um_ile=$[substr(um_name, j + 1)]%;\
			/let um_name_real=$[substr(um_name, 0, j)]%;\
			/if ({um_ile}=~"powierzchownie") \
				/let ile_num=0 %;\
			/elseif ({um_ile}=~"slabo") \
				/let ile_num=1 %;\
			/elseif ({um_ile}=~"pobieznie") \
				/let ile_num=2 %;\
			/elseif ({um_ile}=~"zadowalajaco") \
				/let ile_num=3 %;\
			/elseif ({um_ile}=~"niezle") \
				/let ile_num=4 %;\
			/elseif ({um_ile}=~"dobrze") \
				/let ile_num=5 %;\
			/elseif ({um_ile}=~"znakomicie") \
				/let ile_num=6 %;\
			/elseif ({um_ile}=~"wspaniale") \
				/let ile_num=7 %;\
			/elseif ({um_ile}=~"perfekcyjnie") \
				/let ile_num=8 %;\
			/elseif ({um_ile}=~"mistrzowsko") \
				/let ile_num=9 %;\
			/endif %;\
			/let um_set_name=$[replace(" ", "_", um_name_real)]%;\
			/let j=$[strstr({um_type2},ile_num)] %;\
			/let um_type2=$[strcat(substr({um_type2},0,j+1),{um_name},"#",substr({um_type2},j+1))]%;\
		/done %;\
		/let i=0 %;\
		/while /@test i < 10 %; /do \
			/let j=$[strstr({um_type2},{i})]%;\
			/let um_type2=$[strcat(substr({um_type2},0,{j}),substr({um_type2},{j}+1))] %;\
			/test ++i %;\
		/done %;\
		/while /let i=$[strstr(um_type2,"#")]%; /@test i > 0%; /do \
			/let um_name=$[substr(um_type2,0,i)]%;\
			/let um_type2=$[substr(um_type2,i+1)]%;\
			/let j=$[strstr(um_name,"|")]%;\
			/let um_ile=$[substr(um_name,j+1)]%;\
			/let um_name=$[substr(um_name,0,j)]%;\
			/let um_set_name=$[replace(" ", "_", um_name)]%;\
			/let linia=$[strcat(linia,"|",pad(um_name, 24),": ",pad(um_ile,14), " ")]%; \
			/if (cc==1) \
				/let cc=2%; \
			/else \
				/test echo(strcat({linia}, "|")) %; \
				/let cc=1%; \
				/let linia=%;\
			/endif%; \
		/done %;\
		/if (linia!~NULL)\
			/test echo(strcat({linia}, "|", strrep(" ", 26), "               |"))%;\
		/endif %;\
		/let cc=1%; \
		/let linia=%;\
	/done %;\
	/unset umiejetnosci %;\
	/unset _umiejetnosci_i
