/def -mglob -p2 -t'*moze*gdzies usiadziesz*' sit0 = \
	/tbind usiadz

/alias zamow /zamow %{*}

/def zamow = \
	/set zamawiane %{*} %;\
	/send zamow %{zamawiane} %;\
	/alias jedz_dalej /send zamow %zamawiane %;\
	/def -mregexp -p2 -t'Po chwili otrzymujesz i zjadasz' _zamow_next = /tbind jedz_dalej %;\
	/def -mregexp -p2 -t'Nie sadzisz, zebys byl.*w stanie zjesc' _zamow_off = /tbind koniec_jedzenia

/alias koniec_jedzenia \
	/if ( {pack} =~ "on" )\
		/dp monety %;\
	/endif %;\
	/send wstan %;\
	/unset zamawianex%;\
	/unalias jedz_dalej %;\
	/purge _zamow_*

/def -mglob -p2 -t'Nie masz wystarczajacej ilosci pieniedzy, zeby zaplacic.*' no_money = \
	/if ( {pack} =~ "on" )\
		/zp monety %;\
	/endif %;\
	/if ( {zamawiane} !~ "" ) \
		/tbind zamow %{zamawiane} %;\
	/endif

/def -mregexp -p2 -t'Gdzie chcesz usiasc\? (.* lub|.* czy|)(.*)\?' sit1 = \
	/set place=$[tolower({P2})] %;\
	/if ( {zamawiane} !~ "" ) \
		/tbind usiadz %{place} %%; zamow %{zamawiane} %;\
	/else \
		/tbind usiadz %%{place} %;\
	/endif

/def -mregexp -p2 -t'Nie (.*) siedzisz(.*)' sit2 = \
	/tbind wstan
