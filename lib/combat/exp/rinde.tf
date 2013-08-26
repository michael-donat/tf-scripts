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

/def klapa = \
    /def -msubstr -t'polnoc, poludniowy-zachod, wschod i poludnie' -n1 _rinde_klapa_kierunek1 = %%;\
        /test echo(decode_attr("          #    "), "Cwhite") %%;\
        /test echo(decode_attr("           #   "), "Cwhite") %%;\
        /test echo(decode_attr("    #########  "), "Cwhite") %%;\
        /test echo(decode_attr("           #   "), "Cwhite") %%;\
        /test echo(decode_attr("          #    "), "Cwhite") %%;\
        /set _map_room_ruiny_panika=%%{_map_room_ruiny_panika_d}%%;\
        /purge _rinde_klapa_kierunek*%;\
        \
    /def -msubstr -t'poludniowy-wschod, polnoc i zachod' -n1 _rinde_klapa_kierunek2 = %%;\
        /test echo(decode_attr("       #       "), "Cwhite") %%;\
        /test echo(decode_attr("      ###      "), "Cwhite") %%;\
        /test echo(decode_attr("     # # #     "), "Cwhite") %%;\
        /test echo(decode_attr("       #       "), "Cwhite") %%;\
        /test echo(decode_attr("       #       "), "Cwhite") %%;\
        /set _map_room_ruiny_panika=%%{_map_room_ruiny_panika_c}%%;\
        /purge _rinde_klapa_kierunek*%;\
        \
    /def -msubstr -t'poludniowy-zachod, polnocny-wschod i zachod' -n1 _rinde_klapa_kierunek3 = %;\
        /test echo(decode_attr("     #         "), "Cwhite") %%;\
        /test echo(decode_attr("    #          "), "Cwhite") %%;\
        /test echo(decode_attr("   ##########  "), "Cwhite") %%;\
        /test echo(decode_attr("    #          "), "Cwhite") %%;\
        /test echo(decode_attr("     #         "), "Cwhite") %%;\
        /set _map_room_ruiny_panika=%%{_map_room_ruiny_panika_e}%%;\
        /purge _rinde_klapa_kierunek*%;\
        \
    /def -msubstr -t'polnocny-wschod, polnoc, poludniowy-zachod, wschod i zachod' -n1 _rinde_klapa_kierunek4 = %;\
        /test echo(decode_attr("        # # #  "), "Cwhite") %%;\
        /test echo(decode_attr("          # #  "), "Cwhite") %%;\
        /test echo(decode_attr("        #   #  "), "Cwhite") %%;\
        /test echo(decode_attr("      #        "), "Cwhite") %%;\
        /test echo(decode_attr("    #          "), "Cwhite") %%;\
        /set _map_room_ruiny_panika=%%{_map_room_ruiny_panika_i}%%;\
        /purge _rinde_klapa_kierunek*%;\
    podnies klape

