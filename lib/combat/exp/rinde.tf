/def studnia = wejdz do studni%;przecisnij sie przez otwor
/def podest = wejdz na podest%%;wejdz do grobowca
/def otwor = przecisnij sie przez otwor
/def sciana = wejdz w sciane
/def glaz = zeskocz na glaz%;wskocz do wody%;zanurkuj pod wode
/def wespnij = wespnij sie do gory%;wespnij sie na gore
/def rzezba = obroc rzezbe
/def wcisnij = wcisnij plaskorzezbe
/def klucz = ob plaskorzezbe
/def kluczz = ob pierwsza plaskorzezbe%;ob druga plaskorzezbe%;ob trzecia plaskorzezbe%;ob czwarta plaskorzezbe%;ob piata plaskorzezbe

/def -msubstr -t'polnoc, poludniowy-zachod, wschod i poludnie' -n1 _rinde_klapa_kierunek1 = \
    /test echo(decode_attr("          #    "), "Cwhite") %;\
	/test echo(decode_attr("           #   "), "Cwhite") %;\
	/test echo(decode_attr("    #########  "), "Cwhite") %;\
	/test echo(decode_attr("           #   "), "Cwhite") %;\
	/test echo(decode_attr("          #    "), "Cwhite") %;\
	/purge _rinde_klapa_kierunek*

/def -msubstr -t'poludniowy-wschod, polnoc i zachod' -n1 _rinde_klapa_kierunek2 = \
	/test echo(decode_attr("       #       "), "Cwhite") %;\
	/test echo(decode_attr("      ###      "), "Cwhite") %;\
	/test echo(decode_attr("     # # #     "), "Cwhite") %;\
	/test echo(decode_attr("       #       "), "Cwhite") %;\
	/test echo(decode_attr("       #       "), "Cwhite") %;\
	/purge _rinde_klapa_kierunek*

/def -msubstr -t'poludniowy-zachod, polnocny-wschod i zachod' -n1 _rinde_klapa_kierunek3 = \
	/test echo(decode_attr("     #         "), "Cwhite") %;\
	/test echo(decode_attr("    #          "), "Cwhite") %;\
	/test echo(decode_attr("   ##########  "), "Cwhite") %;\
	/test echo(decode_attr("    #          "), "Cwhite") %;\
	/test echo(decode_attr("     #         "), "Cwhite") %;\
	/purge _rinde_klapa_kierunek*

/def -msubstr -t'polnocny-wschod, polnoc, poludniowy-zachod, wschod i zachod' -n1 _rinde_klapa_kierunek4 = \
	/test echo(decode_attr("        # # #  "), "Cwhite") %;\
	/test echo(decode_attr("          # #  "), "Cwhite") %;\
	/test echo(decode_attr("        #   #  "), "Cwhite") %;\
	/test echo(decode_attr("      #        "), "Cwhite") %;\
	/test echo(decode_attr("    #          "), "Cwhite") %;\
	/purge _rinde_klapa_kierunek*


;Ta dosc duza plaskorzezba wykonana jest z zoltego piaskowca i przedstawia pysk kozla. I chociaz rzezba mocno juz jest zniszczona wciaz mozna poznac, ze jej tworca
;    staral sie jak najwierniej oddac szczegoly, mozna nawet rozpoznac poszczegolne pasma brody zwierzecia. W swym rozwartym pysku koziol trzyma stalowa obrecz,
;    bedaca pierwszym ogniwem poteznego lancucha, ktory ukosem pnie sie ku gorze i znika w ciemnym otworze na srodku sufitu.