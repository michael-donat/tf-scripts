; originally by Kalreg, szydell

/eval /set rebinder_plik_wejscia %{priv_dir}/%{obecnie_swiat}/players/%{obecnie_expujacy}/lista.tf
/eval /set rebinder_plik_wyjscia %{priv_dir}/%{obecnie_swiat}/players/%{obecnie_expujacy}/lista.tmp

/require textutil.tf
/require lisp.tf
/eval /require %rebinder_plik_wejscia

/set REBINDER_PRIORYTET_STD 0

/def rebinder_def_pomocniczy = \
	/let tmp $[strcat("REBINDER_LISTA_",{*})]%;\
	/result $[{tmp}]

/def pobierz_kolor_z_listy = \
		/let REBINDER_KOLOR $[substr(REBINDER_LISTA_LISTY,strstr(REBINDER_LISTA_LISTY,{1}))]%;\
		/let REBINDER_KOLOR $[substr(REBINDER_KOLOR,0,strstr(REBINDER_KOLOR,"@"))]%;\
		/let REBINDER_KOLOR $[substr(REBINDER_KOLOR,strstr(REBINDER_KOLOR,"#") + 1)]%;\
		/if ( strstr(REBINDER_KOLOR,"#") == -1 ) \
			/result REBINDER_KOLOR%;\
		/else \
			/result strcat(substr(REBINDER_KOLOR,0,strstr(REBINDER_KOLOR,"#"))," ",substr(REBINDER_KOLOR,strstr(REBINDER_KOLOR,"#") + 1))%;\
		/endif

/def rebinder_zapisz_liste = \
		/quote -S -dexec !grep -v _%{1} %rebinder_plik_wejscia > %rebinder_plik_wyjscia %;\
		/quote -S -dexec !mv %rebinder_plik_wyjscia %rebinder_plik_wejscia%;\
		/if ( {2} !~ "0" ) \
			/echo -p /set REBINDER_LISTA_%{1} $[rebinder_def_pomocniczy({1})] %| /writefile -a %rebinder_plik_wejscia%;\
		/endif

/def lists = \
	/if ( {1} =~ "help" | {1} =~ "pomoc" ) \
		/echo -p #@{BC%kolor_info}#@{n}# ---------- [ DODAWANIE ] ----------------------------------------------- %;\
		/echo -p #@{BC%kolor_info}#@{n}#                                                                          %;\
		/echo -p #@{BC%kolor_info}#@{n}# /dodaj liste <nazwa listy> <kolor> [kolor tla]                           %;\
		/echo -p #@{BC%kolor_info}#@{n}# /dodaj <nazwa listy> <opis mianownik> [priorytet]                        %;\
		/echo -p #@{BC%kolor_info}#@{n}#                                                                          %;\
		/echo -p #@{BC%kolor_info}#@{n}# ---------- [ USUWANIE ] ------------------------------------------------ %;\
		/echo -p #@{BC%kolor_info}#@{n}#                                                                          %;\
		/echo -p #@{BC%kolor_info}#@{n}# /usun liste <nazwa listy>                                                %;\
		/echo -p #@{BC%kolor_info}#@{n}# /usun <nazwa listy> <wpis>                                               %;\
		/echo -p #@{BC%kolor_info}#@{n}#                                                                          %;\
		/echo -p #@{BC%kolor_info}#@{n}# ---------- [ ZMIANA KOLOROW LISTY ] ------------------------------------ %;\
		/echo -p #@{BC%kolor_info}#@{n}#                                                                          %;\
		/echo -p #@{BC%kolor_info}#@{n}# /zmien <nazwa listy> <kolor> [kolor tla]                                 %;\
		/echo -p #@{BC%kolor_info}#@{n}#                                                                          %;\
		/echo -p #@{BC%kolor_info}#@{n}# ---------- [ WYSWIETLANIE ] -------------------------------------------- %;\
		/echo -p #@{BC%kolor_info}#@{n}#                                                                          %;\
		/echo -p #@{BC%kolor_info}#@{n}# /wyswietl listy                                                          %;\
		/echo -p #@{BC%kolor_info}#@{n}# /wyswietl <nazwa_listy>                                                  %;\
		/echo -p #@{BC%kolor_info}#@{n}#                                                                          %;\
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/else \
		/let REBINDER_AKTUALNY_Z_LISTY_LIST $[strcat(substr(rebinder_def_pomocniczy("LISTY"),1),":")]%;\
		/let i=1%;\
		/let k=1%;\
		/let m=1%;\
		/if ( {1} =~ "silent" ) \
			\
		/elseif ( {2} =~ "silent") \
			\
		/else \
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/endif%;\
		/while ( strstr(REBINDER_AKTUALNY_Z_LISTY_LIST,":") != 0 ) \
			/let REBINDER_AKTUALNA_LISTA_LIST $[substr({REBINDER_AKTUALNY_Z_LISTY_LIST},0,strstr({REBINDER_AKTUALNY_Z_LISTY_LIST},"#"))]%;\
			/let REBINDER_KOLOR $[pobierz_kolor_z_listy({REBINDER_AKTUALNA_LISTA_LIST})]%;\
			/if ( strstr(REBINDER_KOLOR," ") == -1 ) \
				/if (regmatch("^b(.*)",REBINDER_KOLOR)) \
					/if ( {P1} =~ "lue" ) \
						/let REBINDER_KOLOR_DEF -PCblue%;\
					/else \
						/let REBINDER_KOLOR_DEF -PBC%P1%;\
					/endif %;\
				/else \
					/let REBINDER_KOLOR_DEF -PC%REBINDER_KOLOR%;\
				/endif %;\
			/else \
				/let REBINDER_KOLOR_1 $[substr(REBINDER_KOLOR,0,strstr(REBINDER_KOLOR," "))]%;\
				/let REBINDER_KOLOR_2 $[substr(REBINDER_KOLOR,strstr(REBINDER_KOLOR," ")+1)]%;\
				/if (regmatch("^b(.*)",REBINDER_KOLOR_1)) \
					/if ({P1} =~ "lue" ) \
						/let REBINDER_KOLOR_DEF -PCblue,Cbg%REBINDER_KOLOR_2%;\
					/else \
						/let REBINDER_KOLOR_DEF -PBC%P1,Cbg%REBINDER_KOLOR_2%;\
					/endif %;\
				/else \
					/let REBINDER_KOLOR_DEF -PC%REBINDER_KOLOR_1,Cbg%REBINDER_KOLOR_2%;\
				/endif %;\
			/endif%;\
			/let REBINDER_AKTUALNY_Z_LISTY $[strcat(substr(rebinder_def_pomocniczy({REBINDER_AKTUALNA_LISTA_LIST}),1),"@")]%;\
			/let j=1%;\
			/while ( strstr(REBINDER_AKTUALNY_Z_LISTY,"@") != 0 ) \
				/let REBINDER_AKTUALNA_LISTA $[substr({REBINDER_AKTUALNY_Z_LISTY},0,strstr({REBINDER_AKTUALNY_Z_LISTY},"@"))]%;\
				/let NAME $[replace("[a-z]*","",{REBINDER_AKTUALNA_LISTA})] %;\
				/let NAME $[replace(" ","",{NAME})] %;\
				/def -mregexp -Fp3 %REBINDER_KOLOR_DEF -t'(%REBINDER_AKTUALNA_LISTA)' REBINDER_%{REBINDER_AKTUALNA_LISTA_LIST}_%{NAME} %;\
				/let REBINDER_AKTUALNY_Z_LISTY $[substr(REBINDER_AKTUALNY_Z_LISTY,strstr(REBINDER_AKTUALNY_Z_LISTY,"@") +1)]%;\
				/let j=$[++j]%;\
				/let m=$[++m]%;\
			/done%;\
			/if ( {*} =~ NULL | {*} =~ {REBINDER_AKTUALNA_LISTA_LIST} ) \
				/let REBINDER_KOLOR $[pobierz_kolor_z_listy({REBINDER_AKTUALNA_LISTA_LIST})] %;\
				/if ( strstr(REBINDER_KOLOR," ") == -1 ) \
					/if (regmatch("^b(.*)",REBINDER_KOLOR)) \
						/if ( {P1} =~ "lue" ) \
							/echo -p #@{BC%kolor_info}#@{n}# Lista "@{Cblue}$[toupper(REBINDER_AKTUALNA_LISTA_LIST)]@{n}" wgrana. Rekordy: @{B}$[--j]@{n} %;\
						/else \
							/echo -p #@{BC%kolor_info}#@{n}# Lista "@{BC%P1}$[toupper(REBINDER_AKTUALNA_LISTA_LIST)]@{n}" wgrana. Rekordy: @{B}$[--j]@{n} %;\
						/endif %;\
					/else \
						/echo -p #@{BC%kolor_info}#@{n}# Lista "@{C%REBINDER_KOLOR}$[toupper(REBINDER_AKTUALNA_LISTA_LIST)]@{n}" wgrana. Rekordy: @{B}$[--j]@{n} %;\
					/endif %;\
				/else \
					/let REBINDER_KOLOR_1 $[substr(REBINDER_KOLOR,0,strstr(REBINDER_KOLOR," "))]%;\
					/let REBINDER_KOLOR_2 $[substr(REBINDER_KOLOR,strstr(REBINDER_KOLOR," ")+1)]%;\
					/if (regmatch("^b(.*)",REBINDER_KOLOR_1)) \
						/if ({P1} =~ "lue" ) \
							/echo -p #@{BC%kolor_info}#@{n}# Lista "@{Cblue,Cbg%REBINDER_KOLOR_2}$[toupper(REBINDER_AKTUALNA_LISTA_LIST)]@{n}" wgrana. Rekordy: @{B}$[--j]@{n} %;\
						/else \
							/echo -p #@{BC%kolor_info}#@{n}# Lista "@{BC%P1,Cbg%REBINDER_KOLOR_2}$[toupper(REBINDER_AKTUALNA_LISTA_LIST)]@{n}" wgrana. Rekordy: @{B}$[--j]@{n} %;\
						/endif %;\
					/else \
						/echo -p #@{BC%kolor_info}#@{n}# Lista "@{C%REBINDER_KOLOR_1,Cbg%REBINDER_KOLOR_2}$[toupper(REBINDER_AKTUALNA_LISTA_LIST)]@{n}" wgrana. Rekordy: @{B}$[--j]@{n} %;\
					/endif %;\
				/endif%;\
			/endif%;\
			/let j=0%;\
			/let REBINDER_AKTUALNY_Z_LISTY_LIST $[substr(REBINDER_AKTUALNY_Z_LISTY_LIST,strstr(REBINDER_AKTUALNY_Z_LISTY_LIST,"@") +1)]%;\
			/let i=$[++i]%;\
		/done%;\
		/if ( {*} =~ NULL ) \
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/echo -p #@{BC%kolor_info}#@{n}# Ilosc list: @{B}$[--i]@{n}, rekordow: @{B}$[--m]@{n} %;\
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/endif%;\
	/endif

/def dodaj = \
	/if	( %{*} =~ NULL ) \
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/echo -p #@{BC%kolor_info}#@{n}# Jaka liste badz osobe dodac?                                             %;\
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
	/elseif	( %{1} =~ "liste" & %{2} =~ NULL ) \
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/echo -p #@{BC%kolor_info}#@{n}# Podaj nazwe listy, ktora chcesz dodac.                                   %;\
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
	/elseif ( {1} =~ "liste" & %{2} !~ NULL ) \
		/if	( strstr({REBINDER_LISTA_LISTY},{2}) > -1 ) \
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/echo -p #@{BC%kolor_info}#@{n}# Taka lista juz istnieje.                                                 %;\
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/elseif	( strstr({REBINDER_LISTA_LISTY},{2}) == -1 & {3} =~ NULL ) \
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/echo -p #@{BC%kolor_info}#@{n}# Nie podano koloru dla tej listy.                                         %;\
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/elseif	( strstr({REBINDER_LISTA_LISTY},{2}) == -1 & {3} !~ NULL ) \
			/if ( {4} =~ NULL ) \
				/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
				/if (regmatch("^b(.*)",{3})) \
					/if ({P1} =~ "lue" ) \
	  					/echo -p #@{BC%kolor_info}#@{n}# Lista "@{Cblue}$[toupper({2})]@{n}" zostala dodana. %;\
					/else \
						/echo -p #@{BC%kolor_info}#@{n}# Lista "@{BC%P1}$[toupper({2})]@{n}" zostala dodana. %;\
					/endif %;\
				/else \
					/echo -p #@{BC%kolor_info}#@{n}# Lista "@{C%{3}}$[toupper({2})]@{n}" zostala dodana. %;\
				/endif %;\
				/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
				/if ( strstr({REBINDER_LISTA_LISTY},"@") == -1 ) \
					/set REBINDER_LISTA_LISTY $[strcat("@",{REBINDER_LISTA_LISTY})]%;\
				/endif%;\
				/set REBINDER_LISTA_LISTY $[strcat({REBINDER_LISTA_LISTY},{2},"#",{3},"@")]%;\
				/rebinder_zapisz_liste LISTY%;\
			/else \
				/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
					/if (regmatch("^b(.*)",{3})) \
						/if ({P1} =~ "lue" ) \
							/echo -p #@{BC%kolor_info}#@{n}# Lista "@{Cblue}@{Cbg%{4}}$[toupper({2})]@{n}" zostala dodana. %;\
						/else \
							/echo -p #@{BC%kolor_info}#@{n}# Lista "@{BC%P1,Cbg%{4}}$[toupper({2})]@{n}" zostala dodana. %;\
						/endif %;\
					/else \
						/echo -p #@{BC%kolor_info}#@{n}# Lista "@{C%{3},Cbg%{4}}$[toupper({2})]@{n}" zostala dodana. %;\
					/endif %;\
					/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
					/if ( strstr({REBINDER_LISTA_LISTY},"@") == -1 ) \
						/set REBINDER_LISTA_LISTY $[strcat("@",{REBINDER_LISTA_LISTY})]%;\
					/endif%;\
					/set REBINDER_LISTA_LISTY $[strcat({REBINDER_LISTA_LISTY},{2},"#",{3},"#",{4},"@")]%;\
					/rebinder_zapisz_liste LISTY%;\
			/endif%;\
		/endif%;\
	/elseif ( strstr({REBINDER_LISTA_LISTY},{1}) == -1 ) \
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/echo -p #@{BC%kolor_info}#@{n}# Taka lista nie istnieje.                                                 %;\
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
	/elseif ( strstr({REBINDER_LISTA_LISTY},{1}) > -1 ) \
		/if ( strstr(rebinder_def_pomocniczy({1}),{-1}) > -1 ) \
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/echo -p #@{BC%kolor_info}#@{n}# Ta osoba jest juz w tej liscie.                                          %;\
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/else \
			/if ( strstr(rebinder_def_pomocniczy({1}),"@") == -1 ) \
				/set REBINDER_LISTA_%1 $[strcat("@",rebinder_def_pomocniczy({1}))]%;\
			/endif%;\
			/set REBINDER_LISTA_%1 $[strcat(rebinder_def_pomocniczy({1}),{-1},"@")]%;\
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/echo -p #@{BC%kolor_info}#@{n}# Dodaje $[toupper({-1})] do listy "$[toupper({1})]".                      %;\
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/rebinder_zapisz_liste $[tolower({1})]%;\
			/lists $[tolower({1})] silent%;\
		/endif %;\
	/endif

/def zmien = \
	/if	( %{*} =~ NULL ) \
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/echo -p #@{BC%kolor_info}#@{n}# Podaj liste, ktorej kolor chcesz zmienic.                                %;\
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
	/elseif	( strstr({REBINDER_LISTA_LISTY},{1}) == -1 ) \
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/echo -p #@{BC%kolor_info}#@{n}# Taka lista nie istnieje.                                                 %;\
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
	/elseif ( {2} =~ NULL ) \
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/echo -p #@{BC%kolor_info}#@{n}# Podaj przynajmniej jeden kolor, ktory chcesz zmienic w liscie.           %;\
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
	/else \
		/let REBINDER_LEWO=$[substr(REBINDER_LISTA_LISTY,0,strstr(REBINDER_LISTA_LISTY,{1}))]%;\
		/let REBINDER_SRODEK=$[substr(REBINDER_LISTA_LISTY,strstr(REBINDER_LISTA_LISTY,{1}))]%;\
		/let REBINDER_PRAWO=$[substr(REBINDER_SRODEK,strstr(REBINDER_SRODEK,"@"))]%;\
		/let REBINDER_SRODEK_1=$[substr(REBINDER_SRODEK,0,strstr(REBINDER_SRODEK,"#") + 1)]%;\
		/let REBINDER_SRODEK_2=$[substr(REBINDER_SRODEK,strstr(REBINDER_SRODEK,"#") + 1)]%;\
		/if ( {3} =~ NULL ) \
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/if (regmatch("^b(.*)",{2})) \
				/if ({P1} =~ "lue" ) \
					/echo -p #@{BC%kolor_info}#@{n}# Zmieniono kolor listy "@{Cblue}$[toupper({1})]@{n}" %;\
				/else \
					/echo -p #@{BC%kolor_info}#@{n}# Zmieniono kolor listy "@{BC%P1}$[toupper({1})]@{n}" %;\
				/endif %;\
			/else \
				/echo -p #@{BC%kolor_info}#@{n}# Zmieniono kolor listy "@{C%{2}}$[toupper({1})]@{n}" %;\
				/let REBINDER_KOLOR %{2}%;\
				/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
				/set REBINDER_LISTA_LISTY $[strcat(REBINDER_LEWO,REBINDER_SRODEK_1,REBINDER_KOLOR,REBINDER_PRAWO)]%;\
				/rebinder_zapisz_liste LISTY%;\
				/lists $[tolower({1})] silent%;\
			/endif %;\
		/else \
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/if (regmatch("^b(.*)",{2})) \
				/if ({P1} =~ "lue" ) \
					/echo -p #@{BC%kolor_info}#@{n}# Zmieniono kolor listy "@{Cblue,Cbg%{3}}$[toupper({1})]@{n}" %;\
				/else \
					/echo -p #@{BC%kolor_info}#@{n}# Zmieniono kolor listy "@{BC%P1,Cbg%{3}}$[toupper({1})]@{n}" %;\
				/endif %;\
			/else \
				/echo -p #@{BC%kolor_info}#@{n}# Zmieniono kolor listy "@{C%{2},Cbg%{3}}$[toupper({1})]@{n}" %;\
			/endif %;\
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/let REBINDER_KOLOR %{2}#%{3}%;\
			/set REBINDER_LISTA_LISTY $[strcat(REBINDER_LEWO,REBINDER_SRODEK_1,REBINDER_KOLOR,REBINDER_PRAWO)]%;\
			/rebinder_zapisz_liste LISTY%;\
			/lists $[tolower({1})] silent%;\
		/endif%;\
	/endif 

/def wyswietl = \
	/if	( {*} =~ NULL ) \
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/echo -p #@{BC%kolor_info}#@{n}# Podaj liste, ktora chcesz przejrzec.                                     %;\
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
	/elseif ( {1} =~ "listy" ) \
		/let REBINDER_AKTUALNY_Z_LISTY_LIST $[strcat(substr(rebinder_def_pomocniczy("LISTY"),1),":")]%;\
		/echo -p #@{BC%kolor_info}#@{n}# -- [ ZALOZONE LISTY ] -------------------------------------------------- %;\
		/echo -p #@{BC%kolor_info}#@{n}#                                                                          %;\
		/let i=1%;\
		/while ( strstr(REBINDER_AKTUALNY_Z_LISTY_LIST,":") != 0 ) \
			/let REBINDER_AKTUALNA_LISTA_LIST $[substr({REBINDER_AKTUALNY_Z_LISTY_LIST},0,strstr({REBINDER_AKTUALNY_Z_LISTY_LIST},"#"))]%;\
			/let REBINDER_KOLOR $[pobierz_kolor_z_listy({REBINDER_AKTUALNA_LISTA_LIST})]%;\
			/if ( strstr(REBINDER_KOLOR," ") == -1 ) \
				/if (regmatch("^b(.*)",REBINDER_KOLOR)) \
					/if ( {P1} =~ "lue" ) \
						/echo -p #@{BC%kolor_info}#@{n}#    [ %i $[strrep(".",60 - strlen({i}) - strlen(REBINDER_AKTUALNA_LISTA_LIST))] @{Cblue}$[toupper(REBINDER_AKTUALNA_LISTA_LIST)]@{n} ]@{n} %;\
					/else \
						/echo -p #@{BC%kolor_info}#@{n}#    [ %i $[strrep(".",60 - strlen({i}) - strlen(REBINDER_AKTUALNA_LISTA_LIST))] @{BC%P1}$[toupper(REBINDER_AKTUALNA_LISTA_LIST)]@{n} ]@{n} %;\
					/endif %;\
				/else \
	  				/echo -p #@{BC%kolor_info}#@{n}#    [ %i $[strrep(".",60 - strlen({i}) - strlen(REBINDER_AKTUALNA_LISTA_LIST))] @{C%{REBINDER_KOLOR}}$[toupper(REBINDER_AKTUALNA_LISTA_LIST)]@{n} ]@{n}%;\
				/endif %;\
			/else \
				/let REBINDER_KOLOR_1 $[substr(REBINDER_KOLOR,0,strstr(REBINDER_KOLOR," "))]%;\
				/let REBINDER_KOLOR_2 $[substr(REBINDER_KOLOR,strstr(REBINDER_KOLOR," ")+1)]%;\
				/if (regmatch("^b(.*)",REBINDER_KOLOR_1)) \
					/if ( {P1} =~ "lue" ) \
						/echo -p #@{BC%kolor_info}#@{n}#    [ %i $[strrep(".",60 - strlen({i}) - strlen(REBINDER_AKTUALNA_LISTA_LIST))] @{Cblue,Cbg%{REBINDER_KOLOR_2}}$[toupper(REBINDER_AKTUALNA_LISTA_LIST)]@{n} ]@{n}%;\
					/else \
						/echo -p #@{BC%kolor_info}#@{n}#    [ %i $[strrep(".",60 - strlen({i}) - strlen(REBINDER_AKTUALNA_LISTA_LIST))] @{BC%P1,Cbg%{REBINDER_KOLOR_2}}$[toupper(REBINDER_AKTUALNA_LISTA_LIST)]@{n} ]@{n}%;\
					/endif %;\
				/else \
	  				/echo -p #@{BC%kolor_info}#@{n}#    [ %i $[strrep(".",60 - strlen({i}) - strlen(REBINDER_AKTUALNA_LISTA_LIST))] @{C%{REBINDER_KOLOR_1}}@{Cbg%{REBINDER_KOLOR_2}}$[toupper(REBINDER_AKTUALNA_LISTA_LIST)]@{n} ]@{n}%;\
				/endif %;\
			/endif%;\
			/let REBINDER_AKTUALNY_Z_LISTY $[strcat(substr(rebinder_def_pomocniczy({REBINDER_AKTUALNA_LISTA_LIST}),1),":")]%;\
			/let REBINDER_AKTUALNY_Z_LISTY_LIST $[substr(REBINDER_AKTUALNY_Z_LISTY_LIST,strstr(REBINDER_AKTUALNY_Z_LISTY_LIST,"@") +1)]%;\
			/let i=$[++i]%;\
		/done%;\
		/echo -p #@{BC%kolor_info}#@{n}#                                                                          %;\
		/echo -p #@{BC%kolor_info}#@{n}# $[strrep("-",50 - strlen({i}))] [ Lacznie list: @{BC%kolor_info}$[--i]@{n} ] -- %;\
	/elseif	( strstr({REBINDER_LISTA_LISTY},{1}) == -1 ) \
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/echo -p #@{BC%kolor_info}#@{n}# Taka lista nie istnieje.                                                 %;\
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
	/else \
		/let REBINDER_KOLOR $[pobierz_kolor_z_listy({1})]%;\
		/if ( strstr(REBINDER_KOLOR," ") == -1 ) \
			/if (regmatch("^b(.*)",REBINDER_KOLOR)) \
				/if ( {P1} =~ "lue" ) \
					/echo -p #@{BC%kolor_info}#@{n}# -- [ OSOBY Z LISTY @{Cblue}$[toupper({1})]@{n} @{n}] $[strrep("-",50 - strlen({1}))] %;\
				/else \
					/echo -p #@{BC%kolor_info}#@{n}# -- [ OSOBY Z LISTY @{BC%P1}$[toupper({1})]@{n} @{n}] $[strrep("-",50 - strlen({1}))] %;\
				/endif %;\
			/else \
	  			/echo -p #@{BC%kolor_info}#@{n}# -- [ OSOBY Z LISTY @{C%REBINDER_KOLOR}$[toupper({1})]@{n}] $[strrep("-",50 - strlen({1}))] %;\
			/endif %;\
		/else \
			/let REBINDER_KOLOR_1 $[substr(REBINDER_KOLOR,0,strstr(REBINDER_KOLOR," "))]%;\
			/let REBINDER_KOLOR_2 $[substr(REBINDER_KOLOR,strstr(REBINDER_KOLOR," ")+1)]%;\
			/if (regmatch("^b(.*)",REBINDER_KOLOR_1)) \
				/if ( {P1} =~ "lue" ) \
					/echo -p #@{BC%kolor_info}#@{n}# -- [ OSOBY Z LISTY @{Cblue,Cbg%{REBINDER_KOLOR_2}}$[toupper({1})]@{n}] $[strrep("-",50 - strlen({1}))] %;\
				/else \
					/echo -p #@{BC%kolor_info}#@{n}# -- [ OSOBY Z LISTY @{BC%P1,Cbg%{REBINDER_KOLOR_2}}$[toupper({1})]@{n}] $[strrep("-",50 - strlen({1}))] %;\
				/endif %;\
			/else \
				/echo -p #@{BC%kolor_info}#@{n}# -- [ OSOBY Z LISTY @{C%REBINDER_KOLOR_1,Cbg%REBINDER_KOLOR_2}$[toupper({1})]@{n}] $[strrep("-",50 - strlen({1}))] %;\
			/endif %;\
		/endif%;\
		/echo -p #@{BC%kolor_info}#@{n}#                                                                          %;\
		/let REBINDER_WYSWIETLANI $[strcat(substr(rebinder_def_pomocniczy({1}),1),"@")]%;\
		/let i=1%;\
		/while ( strstr(REBINDER_WYSWIETLANI,"@") != 0 ) \
			/let REBINDER_AKTUALNIE_WYSWIETLANY $[substr(REBINDER_WYSWIETLANI,0,strstr(REBINDER_WYSWIETLANI,"@"))]%;\
			/echo -p #@{BC%kolor_info}#@{n}#    [ %i $[strrep(".",60 - strlen({i}) - strlen(REBINDER_AKTUALNIE_WYSWIETLANY))] $[strcat(toupper(substr({REBINDER_AKTUALNIE_WYSWIETLANY},0,1)),substr({REBINDER_AKTUALNIE_WYSWIETLANY},1))] ]    %;\
			/let REBINDER_WYSWIETLANI $[substr(REBINDER_WYSWIETLANI,strstr(REBINDER_WYSWIETLANI,"@") +1)]%;\
			/let i=$[++i]%;\
		/done%;\
		/echo -p #@{BC%kolor_info}#@{n}#                                                                          %;\
		/echo -p #@{BC%kolor_info}#@{n}# $[strrep("-",41 - strlen({i}))] [ Lacznie na tej liscie: @{BC%kolor_info}$[--i]@{n} ] -- %;\
	/endif

/def usun = \
	/if	( %{*} =~ NULL ) \
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/echo -p #@{BC%kolor_info}#@{n}# Jaka liste badz osobe usunac?                                            %;\
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
	/elseif	( %{1} =~ "liste" & %{2} =~ NULL ) \
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/echo -p #@{BC%kolor_info}#@{n}# Podaj nazwe listy, ktora chcesz usunac.                                  %;\
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
	/elseif ( {1} =~ "liste" & %{2} !~ NULL ) \
		/if	( strstr({REBINDER_LISTA_LISTY},{2}) == -1 ) \
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/echo -p #@{BC%kolor_info}#@{n}# Taka lista nie istnieje.                                                 %;\
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/elseif	( strstr({REBINDER_LISTA_LISTY},{2}) > -1) \
			/let REBINDER_NOW %REBINDER_LISTA_%{2} %;\
			/let REBINDER_KOLOR $[pobierz_kolor_z_listy({REBINDER_NOW})]%;\
			/let REBINDER_LISTA_LEWO=$[substr({REBINDER_LISTA_LISTY},0,strstr({REBINDER_LISTA_LISTY},{2})-1)]%;\
			/let REBINDER_LISTA_TEMP=$[substr({REBINDER_LISTA_LISTY},strstr({REBINDER_LISTA_LISTY},{2}))]%;\
			/let REBINDER_LISTA_PRAWO=$[substr({REBINDER_LISTA_TEMP},strstr({REBINDER_LISTA_TEMP},"@"))]%;\
			/set REBINDER_LISTA_LISTY=$[strcat({REBINDER_LISTA_LEWO}, {REBINDER_LISTA_PRAWO})]%;\
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/if ( strstr(REBINDER_KOLOR," ") == -1 ) \
				/if (regmatch("^b(.*)",REBINDER_KOLOR)) \
					/if ( {P1} =~ "lue" ) \
						/echo -p #@{BC%kolor_info}#@{n}# Lista "@{Cblue}$[toupper({2})]@{n}" zostala usunieta. %;\
					/else \
						/echo -p #@{BC%kolor_info}#@{n}# Lista "@{BC%P1}$[toupper({2})]@{n}" zostala usunieta. %;\
					/endif %;\
				/else \
					/echo -p #@{BC%kolor_info}#@{n}# Lista "@{C%REBINDER_KOLOR}$[toupper({2})]@{n}" zostala usunieta. %;\
				/endif %;\
			/else \
				/let REBINDER_KOLOR_1 $[substr(REBINDER_KOLOR,0,strstr(REBINDER_KOLOR," "))]%;\
				/let REBINDER_KOLOR_2 $[substr(REBINDER_KOLOR,strstr(REBINDER_KOLOR," ")+1)]%;\
				/if (regmatch("^b(.*)",REBINDER_KOLOR_1)) \
					/if ({P1} =~ "lue" ) \
						/echo -p #@{BC%kolor_info}#@{n}# Lista "@{Cblue,Cbg%REBINDER_KOLOR_2}$[toupper({2})]@{n}" zostala usunieta. %;\
					/else \
						/echo -p #@{BC%kolor_info}#@{n}# Lista "@{BC%P1,Cbg%REBINDER_KOLOR_2}$[toupper({2})]@{n}" zostala usunieta. %;\
					/endif %;\
				/else \
					/echo -p #@{BC%kolor_info}#@{n}# Lista "@{C%REBINDER_KOLOR_1,Cbg%REBINDER_KOLOR_2}$[toupper({2})]@{n}" zostala usunieta. %;\
				/endif %;\
			/endif%;\
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/rebinder_zapisz_liste LISTY%;\
			/rebinder_zapisz_liste $[tolower({2})] 0%;\
			/unset REBINDER_LISTA_%{2}%;\
			/purge REBINDER_%2*%;\
		/endif%;\
	/elseif ( strstr({REBINDER_LISTA_LISTY},{1}) == -1 ) \
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/echo -p #@{BC%kolor_info}#@{n}# Nie ma takiej listy.                                                     %;\
		/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
	/elseif ( strstr({REBINDER_LISTA_LISTY},{1}) > -1) \
		/if	( {2} =~ NULL ) \
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/echo -p #@{BC%kolor_info}#@{n}# Podaj jakies imie badz opis w mianowniku.                                %;\
			/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
		/elseif	( {2} !~ NULL ) \
			/if ( strstr(rebinder_def_pomocniczy({1}),{-1}) == -1 ) \
				/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
				/echo -p #@{BC%kolor_info}#@{n}# Podanej osoby nie ma na tej liscie.                                      %;\
				/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
			/else \
				/let REBINDER_LISTA_LEWO=$[substr(rebinder_def_pomocniczy({1}),0,strstr(rebinder_def_pomocniczy({1}),{-1})-1)]%;\
				/let REBINDER_LISTA_TEMP=$[substr(rebinder_def_pomocniczy({1}),strstr(rebinder_def_pomocniczy({1}),{-1}))]%;\
				/let REBINDER_LISTA_PRAWO=$[substr({REBINDER_LISTA_TEMP},strstr({REBINDER_LISTA_TEMP},"@"))]%;\
				/let NAME $[replace("[a-z]*","",{-1})] %;\
				/let NAME $[replace(" ","",{NAME})] %;\
				/purge REBINDER_%{1}_%{NAME} %;\
				/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
				/echo -p #@{BC%kolor_info}#@{n}# Wpis $[toupper({-1})] zostal usuniety z listy "$[toupper({1})]".         %;\
				/echo -p #@{BC%kolor_info}#@{n}# ------------------------------------------------------------------------ %;\
				/set REBINDER_LISTA_%1 $[strcat({REBINDER_LISTA_LEWO}, {REBINDER_LISTA_PRAWO})]%;\
				/rebinder_zapisz_liste $[tolower({1})]%;\
			/endif%;\
		/endif%;\
	/endif

/lists silent
