; by Ingwar

/def -p20 -mregexp -t'^([^:\\(\\)]*) ([^ \\(\\)]*) (\\(.*\\) |)(czarodziej |)przedstawia sie jako:' _przedstawia_sie = \
	/def -n1 -mregexp -t'^(Praktykant(|ka) |Ojciec |Sir |Don |Szlachetn(y|a|e) |Czcigodn(y|a|e) |Senior(|ita|ito) |L(ord|ady) |Mistrz(|yni|unio) |)([^ ,]*)( |,)' imie_trig = \
		/test _zapamietaj_imie("%%{P8}","%{P1} %{P2}")

/def _zapamietaj_imie = \
	/let imiex=%{1} %;\
	/let imie_opis=$[strcat("[",substr({2},0,1),tolower(substr({2},0,1)),"]",substr({2},1))]%;\
	/let imie_def=/def -Fp5 -mregexp -t'(%{imie_opis})(( \\\\([^,.]*\\\\))|([ .,]))' _imie_%{imiex} = /substitute -p %%{PL}%%{P1} @{BCwhite}_%{imiex}_%%{P3}@{n}%%{P4}%%{PR}%;\
	/if ($(/list -s _imie_%{imiex})=~NULL) \
		/echo -p #@{BC%kolor_info}#@{n}# Zapamietany: @{BC%kolor_info}%{imiex}@{n} %;\
		/eval -s0 %{imie_def} %;\
		/echo %{imie_def}%|/writefile -a %{priv_dir}/%{obecnie_swiat}/players/%{obecnie_expujacy}/imiona.tf %;\
	/elseif /test (strstr("($(/list -s _imie_%{imiex}))","(%{imie_opis})((")==-1) %;/then \
		/echo -p #@{BC%kolor_info}#@{n}# Zmienil sie opis dla wpisu: @{BC%kolor_info}%{imiex}@{n} %;\
		/undef _imie_%{imiex} %;\
		/eval -s0 %{imie_def} %;\
		/echo /undef _imie_%{imiex}%|/writefile -a %{priv_dir}/%{obecnie_swiat}/players/%{obecnie_expujacy}/imiona.tf %;\
		/echo %{imie_def}%|/writefile -a %{priv_dir}/%{obecnie_swiat}/players/%{obecnie_expujacy}/imiona.tf %;\
	/endif

/def czysc_imiona = \
	/def -ag -h'REDEF' _redef_gag %;\
	/load -q %{priv_dir}/%{obecnie_swiat}/players/%{obecnie_expujacy}/imiona.tf %;\
	/save %{priv_dir}/%{obecnie_swiat}/players/%{obecnie_expujacy}/imiona.tf _imie_* %;\
	/purge _redef_gag %;\
	/ktoto licz

/def ktoto = \
	/if ({*}!~NULL) \
		/if ({*} =~ "licz" ) \
			/set _ilu_ludzi=0 %;\
			/quote -S /_ktoto_licz `/list -s _imie_* %;\
			/echo -p #@{BC%kolor_info}#@{n}# Zapamietanych @{BC%kolor_info}%{_ilu_ludzi} @{n}opisow.%;\
			/unset _ilu_ludzi %;\
		/else \
			/set _ilu_ludzi=0 %;\
			/quote -S /_ktoto `/list -s _imie_%{*} %;\
			/quote -S /_ktoto `/list -s -mregexp -t'$[strcat(tolower(substr({*},0,1)),"(]|)",tolower(substr({*},1)))]' _imie_* %;\
			/echo -p #@{BC%kolor_info}#@{n}# W bazie @{BC%kolor_info}%{_ilu_ludzi} @{n}pasujacych rekordow.%;\
			/unset _ilu_ludzi %;\
		/endif %;\
	/endif

/def _ktoto = \
	/test ++_ilu_ludzi %;\
	/let pocz_opisu=$[strstr({*},"'([")] %;\
	/let koni_opisu=$[strstr({*},")(")] %;\
	/let pocz_imienia=$[strstr({*},"_imie_")+6] %;\
	/echo -p #@{BC%kolor_info}#@{n}# $[pad(substr({*},{pocz_imienia}),-15,substr({*},{pocz_opisu}+3,1),1,substr({*},{pocz_opisu}+6,{koni_opisu}-{pocz_opisu}-6))]

/def _ktoto_licz = \
	/test ++_ilu_ludzi
