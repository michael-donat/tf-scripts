; by Siro

/def odmien = \
	/purge _rodmien_* %;\
	/repeat -5 1 /purge _rodmien_* %;\
	odmien %{1} %;\
	/def -p20 -agLG -t'Odmien <kto/co>?' _rodmien_blad = \
		/purge _rodmien_* %;\
	/def -p20 -agLG -mregexp -t'odmienia sie nastepujaco:' _rodmien_pocz %;\
	/def -p20 -agLG -mregexp -t'  Mianownik: (.*),' _rodmien_mia %;\
	/def -p20 -agLG -mregexp -t' Dopelniacz: (.*),' _rodmien_dop = \
		/eval /set ogolne_odmiana_d_%{1}=$$[tolower({P1})] %;\
	/def -p20 -agLG -mregexp -t'   Celownik: (.*),' _rodmien_cel %;\
	/def -p20 -agLG -mregexp -t'    Biernik: (.*),' _rodmien_bie = \
		/eval /set ogolne_odmiana_b_%{1}=$$[tolower({P1})] %;\
	/def -p20 -agLG -mregexp -t'  Narzednik: (.*),' _rodmien_nar = \
		/eval /set ogolne_odmiana_n_%{1}=$$[tolower({P1})] %;\
	/def -p20 -agLG -mregexp -t'Miejscownik: (.*).' _rodmien_mie = \
		/purge _rodmien_* %%;\
		/eval /echo -p #@{BC%kolor_info}#@{n}# Odmiana @{BC%kolor_info}%{1}@{n}: %%ogolne_odmiana_d_%{1}/%%ogolne_odmiana_b_%{1}/%%ogolne_odmiana_n_%{1}

/def _l_odmien = \
	/let _tmp=$[strcat({-1}, "|")] %;\
	/while /let i=$[strstr({_tmp},"|")] %;/@test i >- 1 %;/do \
		/let _name=$[substr({_tmp},0,i)] %;\
		/let _tmp=$[substr({_tmp},i+1)] %;\
		/let _name=$[substr(strcat({_name}, "\\"), 0, strchr({_name}, "\\"))] %;\
		/let _name=$(/_odmien_M_%{1} %{_name}) %;\
		/let _ret_str=$[strcat({_ret_str}, {_name}, "|")] %;\
	/done %;\
	/echo $[substr({_ret_str}, 0, -1)]

/def _odmien_M_D = \
	/while ({#}) \
		/let dpE=$[substr({1}, -1, 1)] %;\
		/let dpEE=$[substr({1}, -2, 2)] %;\
		/if (dpEE=~"ta" | dpEE =~ "pa" | dpEE =~ "na" | dpEE =~ "ma") \
			/let op_B1=$[strcat(substr({1}, 0, -1),'y')] %;\
		/elseif (dpE=~"a") \
			/let op_B1=$[strcat(substr({1}, 0, -2),'i')] %;\
		/elseif (dpE =~ "i") \
			/let op_B1=$[strcat({1}, 'ego')] %;\
		/elseif (dpE =~ "y") \
			/let op_B1=$[strcat(substr({1}, 0, -1), 'ego')] %;\
		/elseif (dpE =~ "u" | dpE =~ "o") \
			/let op_B1=$[strcat(substr({1}, 0, -1), 'a')] %;\
		/else \
			/let op_B1=$[strcat({1},'a')] %;\
		/endif %;\
		/let op_B=$[strcat(op_B, op_B1, ' ')] %;\
		/shift %;\
	/done %;\
	/echo $[tolower({op_B})]

/def _odmien_M_B = \
	/while ({#}) \
		/let dpE=$[substr({1}, -1, 1)] %;\
		/let dpEE=$[substr({1}, -2, 2)] %;\
		/if (dpEE=~"ta" | dpEE =~ "pa" | dpEE =~ "na" | dpEE =~ "ma" | dpEE =~ "ka") \
			/let op_B1=$[strcat(substr({1}, 0, -1),'e')] %;\
		/elseif (dpE=~"a") \
			/let op_B1=%{1} %;\
		/elseif (dpE =~ "i") \
			/let op_B1=$[strcat({1}, 'ego')] %;\
		/elseif (dpE =~ "y") \
			/let op_B1=$[strcat(substr({1}, 0, -1), 'ego')] %;\
		/elseif (dpE =~ "u" | dpE =~ "o") \
			/let op_B1=$[strcat(substr({1}, 0, -1), 'a')] %;\
		/else \
			/let op_B1=$[strcat({1},'a')] %;\
		/endif %;\
		/let op_B=$[strcat(op_B, op_B1, ' ')] %;\
		/shift %;\
	/done %;\
	/echo $[tolower({op_B})]

/def _odmien_M_N = \
	/while ({#}) \
		/let dpE=$[substr({1}, -1, 1)] %;\
		/let dpEE=$[substr({1}, -2, 2)] %;\
		/let dpEEE=$[substr({1}, -3, 3)] %;\
		/if (dpEEE=~"tac") \
			/let op_B1=$[strcat({1},'ia')] %;\
		/elseif (dpEEE=~"iec") \
			/let op_B1=$[strcat(substr({1}, 0, -3),'cem')] %;\
		/elseif (opEEE=~"ies") \
			/let op_B1=$[strcat(substr({1}, 0, -3),'sem')] %;\
		/elseif (dpE=~"a") \
			/let op_B1=%{1} %;\
		/elseif (dpE=~"i" | dpE=~"y") \
			/let op_B1=$[strcat({1},'m')] %;\
		/elseif (dpE=~"g" | dpE=~"k") \
			/let op_B1=$[strcat({1},'iem')] %;\
		/elseif (dpE =~ "u" | dpE =~ "o") \
			/let op_B1=$[strcat(substr({1}, 0, -1), 'em')] %;\
		/else \
			/let op_B1=$[strcat({1},'em')] %;\
		/endif %;\
		/let op_B=$[strcat(op_B, op_B1, ' ')] %;\
		/shift %;\
	/done %;\
	/echo $[tolower({op_B})]
