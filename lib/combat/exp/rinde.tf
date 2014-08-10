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

;Ta dosc duza plaskorzezba wykonana jest z bialego marmuru i przedstawia pysk kozla.
;Ta dosc duza plaskorzezba wykonana jest z alabastru i przedstawia ysk kozla.
;Ta dosc duza plaskorzezba wykonana jest z czerwongo marmuru i przedstawia pysk kozla.
;Ta dosc duza plaskorzezba wykonana jest  zoltego piaskowca i przedstawia pysk kozla.
;Pierwsza z plaskorzezb wykuta jest w czarnym granicie.
;Drugi trojzab wykuto w bialym marmurze.
;Srodkowy trojzab wykonano z zoltego piaskowca.
;Czwarta plaskorzezba wykuta zostala w alabastrze.
;Ostatnia z plaskorzezb wykonana zostala z czerwonego marmuru.
;Jest on jedynym zrodlem swiatla w tym zamknietym pomieszczeniu. Gdyby nie zolta poswiata, ktora emanuje, pokoj pograzyl by sie w ciemnosciach. Ciekawym zdaje sie byc fakt, iz kat, w ktorym umieszczony jest kaganek, oswietlony jest cala tecza barw. Zupelnie jakby ta mala lampa, posiadala inne kolory szkielek, od strony sciany. Czyzby kolor, ktorym oswietla pomieszczenie mial cos sugerowac?
;We wnece stoi mala mosiezna lampa, ktora zdaje sie byc na stale przymocowana do jej otoczenia. Jak widac to dzieki jej kolorowym szybkom, cale pomieszczenie spowite jest zielona poswiata. Ciekawy efekt tworzy tecza barw wewnatrz wneki, zupelnie jakby lampa potrafila swiecic na wiele roznych kolorow, a teraz, nie wiedziec czemu, oswietla pokoj tylko jednym.
;Maly metalowy kaganek zdaje sie byc trwale przymocowany do sciany na ktorej wisi. Jak widac to dzieki jego kolorowym szybkom, cale pomieszczenie spowite jest czerwona poswiata. Godnym zastanowienia faktem jest to, iz sciana tuz za kagankiem spowita jest cala tecza barw, zas na zewnatrz pada tylko ta jedna. Dlaczego akurat ta? Hmm...

;Pierwsza z plaskorzezb wykuta jest w czarnym granicie.
;Drugi trojzab wykuto w bialym marmurze.
;Srodkowy trojzab wykonano z zoltego piaskowca.
;Czwarta plaskorzezba wykuta zostala w alabastrze.
;Ostatnia z plaskorzezb wykonana zostala z czerwonego marmuru.

/def klapa = \
    /def -msubstr -t'polnoc, poludniowy-zachod, wschod i poludnie' -n1 _rinde_klapa_kierunek1 = %%;\
        /test echo(decode_attr("          #    "), "Cwhite") %%;\
        /test echo(decode_attr("           #   "), "Cwhite") %%;\
        /test echo(decode_attr("    #########  "), "Cwhite") %%;\
        /test echo(decode_attr("           #   "), "Cwhite") %%;\
        /test echo(decode_attr("          #    "), "Cwhite") %%;\
        /set _map_room_ruiny_panika=%%{_map_room_ruiny_panika_d}%%:\
        /purde _rinde_klapa_kierunek*%;\
        \
    /def -msubstr -t'poludniowy-wschod, polnoc i zachod' -n1 _rinde_klapa_kierunek2 = %%;\
        /test echo(decode_attr("       #       "), "Cwhite") %%;\
        /test echo(decode_attr("      ###      "), "Cwhite") %%;\
        /test echo(decode_attr("     # # #     "), "Cwhite") %%;\
        /test echo(decode_attr("       #       "), "Cwhite") %%;\
        /test echo(decode_attr("       #       "), "Cwhite") %%;\
        /set _map_room_ruiny_panika=%%{_map_room_ruiny_panika_c}%%;\
        /purde _rinde_klapa_kierunek*%;\
        \
    /def -msubstr -t'poludniowy-zachod, polnocny-wschod i zachod' -n1 _rinde_klapa_kierunek3 = %%;\
        /test echo(decode_attr("     #         "), "Cwhite") %%;\
        /test echo(decode_attr("    #          "), "Cwhite") %%;\
        /test echo(decode_attr("   ##########  "), "Cwhite") %%;\
        /test echo(decode_attr("    #          "), "Cwhite") %%;\
        /test echo(decode_attr("     #         "), "Cwhite") %%;\
        /set _map_room_ruiny_panika=%%{_map_room_ruiny_panika_e}%%;\
        /purde _rinde_klapa_kierunek*%;\
        \
    /def -msubstr -t'polnocny-wschod, polnoc, poludniowy-zachod, wschod i zachod' -n1 _rinde_klapa_kierunek4 = %%;\
        /test echo(decode_attr("        # # #  "), "Cwhite") %%;\
        /test echo(decode_attr("          # #  "), "Cwhite") %%;\
        /test echo(decode_attr("        #   #  "), "Cwhite") %%;\
        /test echo(decode_attr("      #        "), "Cwhite") %%;\
        /test echo(decode_attr("    #          "), "Cwhite") %%;\
        /set _map_room_ruiny_panika=%%{_map_room_ruiny_panika_i}%%;\
        /purde _rinde_klapa_kierunek*%;\
    podnies klape

