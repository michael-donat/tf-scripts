; by Ingwar

/def pij = \
	napij sie %{*} %;\
	/_picie

/def _picie_add = \
	/def -p10 -t'%{1}' _picie_trig_%{_pi_last_id} = %{2} %;\
	/test ++_pi_last_id

/def _picie = \
	/set _pi_last_id=4 %;\
	/repeat -40 1 /purge _picie_trig_* %;\
	/def -mglob -t'*Wypil?s juz tak duzo, ze nie jestes w st*'	_picie_trig_0 = \
		/repeat -3 1 /purge _picie_trig_* %;\
	/def -p2 -mregexp -t'Pijesz lyk wody (z(?:e|) (?:.*))\\\\.' _picie_trig_3 = /tbind napij sie %%{P1} %;\
	/test _picie_add("*Podchodzisz do fontanny*","/tbind napij sie z fontanny") %;\
	/test _picie_add("*pomoca cebrzyka wydobywasz ze studni*","/tbind napij sie ze studni") %;\
	/test _picie_add("*Klekasz przy skraju drogi i nabierasz w dlonie czystej*","/tbind napij sie ze strumienia") %;\
	/test _picie_add("*Nachylasz sie nad fontanna i pijesz z niej troche orzezwiajacej wody.*","/tbind napij sie z fontanny") %;\
	/test _picie_add("*Za pomoca wiaderka wydobywasz ze studzienki nieco*","/tbind napij sie ze studzienki") %;\
	/test _picie_add("*Podchodzisz ostroznie do sadzawki i klekasz przy niej.*","/tbind napij sie z sadzawki") %;\
	/test _picie_add("*Gasisz pragnienie*z beczki.*","/tbind napij sie z beczki") %;\
	/test _picie_add("*Podchodzisz na tyle blisko fontanny, aby moc zaczerp*","/tbind napij sie z fontanny") %;\
	/test _picie_add("*Pochylasz sie nad tafla jeziora i czerpiesz garsc*","/tbind napij sie z jeziora") %;\
	/test _picie_add("*Przechylasz sie nad murkiem otaczajacym fontanne*","/tbind napij sie z fontanny") %;\
	/test _picie_add("*Nachylasz sie nad cembrowina studni i zaczerpnawszy*","/tbind napij sie ze studni") %;\
	/test _picie_add("*Gasisz pragnienie woda z wiadra*","/tbind napij sie ze studni") %;\
	/test _picie_add("*Gasisz pragnienie zimna woda ze studni*","/tbind napij sie ze studni") %;\
	/test _picie_add("", "") %;\
	/unset _pi_last_id

/def -mglob -p2 -t'*Moze bys tak usiadl*' sit0 = \
	/tbind usiadz
