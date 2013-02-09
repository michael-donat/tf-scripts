/def -mregexp -p2 -t'Pozostawia na twojej dloni wiadomosc i' _poczta_golab = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),"golab","|")] %;\
	/beep 1 %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm} %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MSG%;\
	/endif

/def -mregexp -p2 -t'Nagle miedzy twoimi nogami zaczyna platac' _poczta_mysz = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),"mysz","|")] %;\
	/beep 1 %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm} %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MSG%;\
	/endif

/def -mregexp -p2 -t'Nie mija chwila gdy ptak przysiada na twoim ramieniu.' _poczta_kruk = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),"kruk","|")] %;\
	/beep 1 %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm} %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MSG%;\
	/endif

/def -mregexp -p2 -t'Na twoim przedramieniu niespodziewanie wyladowala snieznobiala pocztowa mewa.' _poczta_mewa = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),"mewa","|")] %;\
	/beep 1 %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm} %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MSG%;\
	/endif

/def -mregexp -p2 -t'Dociera do twojego przedramienia, gdzie przystaje, poruszajac lekko ogonem.' _poczta_jaszczurka = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),"jaszczurka","|")] %;\
	/beep 1 %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm} %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MSG%;\
	/endif

/def -mregexp -p2 -t'agle tuz pod twoja noge przypelza kolorowa cetkowana zmija i szczerzy groznie kly jadowe.' _poczta_zmija = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),"zmija","|")] %;\
	/beep 1 %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm} %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MSG%;\
	/endif

/def -mregexp -p2 -t'Nagle wesolo merdajac ogonkiem przybiega do ciebie' _poczta_wilczek = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),"wilczek","|")] %;\
	/beep 1 %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm} %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MSG%;\
	/endif

/def -mregexp -p2 -t'Czujesz wokol siebie dosc dziwny zapach, ktory kojarzyc moze sie ze zgnilizna' _poczta_szczur = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),"szczur","|")] %;\
	/beep 1 %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm} %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MSG%;\
	/endif

/def -mregexp -p2 -t'Nagle, tuz obok ciebie, w rozblysku ognia pojawia sie ognisty zlosliwy imp, z niechecia wreczajac ci wiadomosc.' _poczta_imp = \
	/set ogolne_poczta=$[strcat({ogolne_poczta},ftime("%H:%M",time()),"imp","|")] %;\
	/beep 1 %;\
	/status_edit -r1 poczta_show:5:BC%{kolor_alarm} %;\
	/if ({poczta_show} !~ 'none' ) \
		/set poczta_show=MULTI%;\
	/else \
		/set poczta_show=MSG%;\
	/endif
