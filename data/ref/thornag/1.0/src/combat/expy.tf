/def exp_set = /echo%;/echo -p ======  %{*}   ==============%;/echo

/def f3_target = /set target2=%{*}


/def exp_orson = \
    /exp_set ORSON%;\
    /f3_target pierwszego straznika%;\
    /def 1 = /attack pierwszego straznika%%;/f3_target pierwszego straznika%;\
    /def 2 = /attack charyzmatycznego mezczyzne%%;/f3_target charyzmatycznego mezczyzny%;\
    /def 3 = /attack kaplana%%;/f3_target kaplana

/def -t'Przedsionek Swiatyni Wiecznego Ognia.' exp_trigger_1 = /exp_orson

/def exp_fusta = \
    /exp_set FUSTA%;\
    /f3_target drugiego korsarza%;\
    /def 1 = /attack pierwszego korsarza%%;/f3_target pierwszego korsarza%;\
    /def 2 = /attack drugiego korsarza%%;/f3_target drugiego korsarza%;\

/def -t'Zwrotna nieduza fusta.' exp_trigger_2 = /exp_fusta

;Bogaty namiot. - zboje - mustafa

;Przechodzisz przez nie majac wrazenie, ze opuszczasz bezpieczne tereny i to nie wiadomo czy nie na zawsze...