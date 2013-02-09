/def poczta = \
	/if ({*}=~NULL | {*}=~'check') \
		/if ({ogolne_poczta}=~NULL ) \
			/echo -p #@{BC%kolor_info}#@{n}# Brak poczty. %;\
		/else \
			/let _poczta=%{ogolne_poczta} %;\
			/echo -p #@{BC%kolor_info}#@{n}# Listy: %;\
			/while /let i=$[strstr({_poczta},"|")] %; /@test i>-1 %; /do \
				/echo -p #@{BC%kolor_info}#@{n}# Od: @{BC%kolor_info}$[substr({_poczta},5,i-5)] @{n}($[substr({_poczta},0,5)]). %;\
				/let _poczta=$[substr({_poczta},i+1)] %;\
			/done %;\
		/endif %;\
	/elseif ({*} =~ 'clear') \
		/unset ogolne_poczta %;\
		/status_edit -r1 poczta_show:5:BC%{kolor_main} %;\
		/set poczta_show=none %;\
	/endif

/def -mglob -p2 -t'*Nie otrzymales zadnych nowych listow*' poczta_off0 = /poczta clear
/def -mglob -p2 -t'*Kasuje listy*' poczta_off1 = /poczta clear
/def -mglob -p2 -t'*Wszystkie listy w twej skrzynce*' poczta_off2 = /poczta clear
/def -mglob -p2 -t'*Zjadasz*wiadomosc*' poczta_off3 = /poczta clear
/def -mglob -p2 -t'*Odkladasz*wiadomosc*' poczta_off4 = /poczta clear

/def  -mregexp -Fp2 -t'^Czeka na ciebie (.*) poczta' _poczta_0 = \
	/set ogolne_poczta=$[strcat(ftime("%H:%M",time()),"Kogos lub Czegos (", {P1}, ")|")] %;\
	/beep 1 %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MAIL%;\
	/endif %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm}

/def -mregexp -Fp2 -t'^Masz nowa poczte od (.*).' _poczta_1 = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),{P1},"|")] %;\
	/beep 1 %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MAIL%;\
	/endif %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm}

/def -mregexp -Fp2 -t'^Masz nowy list.*od ([^ ]*), zatytulowany \'(.*)(\'|[^.]$)' _poczta_2 = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),{P1}," zatytulowany '",{P2},"'|")] %;\
	/beep 1 %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MAIL%;\
	/endif %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm}
