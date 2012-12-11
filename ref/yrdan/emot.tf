/def emot = \
/let _var=$[rand(0,70)] %; \
/if (!_var) \
        /let _emot=powiedz do wroga Z przyjemnoscia cie zmasakruje. %; \
    /elseif (_var == 1) \
        /let _emot=krzyknij Arrrrgghhh!!%; \
    /elseif (_var == 2) \
        /let _emot=nasplun wrogowi %; \
    /elseif (_var == 3) \
        /let _emot=naryknij %; \
    /elseif (_var == 4) \
        /let _emot=szepnij wrogowi Gin poczwaro! %; \
    /elseif (_var == 5) \
        /let _emot=popatrz spokojnie na wroga %; \
    /elseif (_var == 6) \
        /let _emot=powiedz do wroga No coz.. pora umierac...%; \
    /elseif (_var == 7) \
        /let _emot=krzyknij Gotow na smierc pod sztandarem Czarnego Gryfa! %; \
    /elseif (_var == 8) \
        /let _emot=zarechocz nerwowo%; \
    /elseif (_var == 9) \
        /let _emot=rozejrzyj sie ponuro%; \
    /elseif (_var == 10) \
        /let _emot=szepnij wrogowi Nie boj sie. Smierc ponoc boli tylko chwilke.%; \
    /elseif (_var == 11) \
        /let _emot=powiedz do wroga Trudno...%; \
    /elseif (_var == 12) \
        /let _emot=powiedz Snotlinskie lajno.%; \
    /elseif (_var == 13) \
        /let _emot=szepnij wrogowi Cmierdziuch, lepij zwiwaj! %; \
    /elseif (_var == 14) \
        /let _emot=powiedz do wroga Zobaczysz co to walka! %; \
    /elseif (_var == 15) \
        /let _emot=nawzrusz %; \
    /else \
        /let _emot=%;\
    /endif %; \
%{_emot}%;\