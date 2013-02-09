/def -mregexp -p2 -t'Na two.* ramie.* niespodziewanie.* szczur' _poczta_szczur = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),"szczur","|")] %;\
	/beep 1 %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm} %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MSG%;\
	/endif

/def -mregexp -p2 -t'Bialy golab pocztowy laduje na twoim ramieniu.' _poczta_golab = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),"golab","|")] %;\
	/beep 1 %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm} %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MSG%;\
	/endif

/def -mregexp -p2 -t'Na twoim ramieniu niespodziewanie wyladowal ' _poczta_golab2= \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),"golab","|")] %;\
	/beep 1 %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm} %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MSG%;\
	/endif
