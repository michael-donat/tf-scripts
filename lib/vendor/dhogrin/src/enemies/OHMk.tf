/set OHMksign=@{BxCyellow}(@{n}@{xCmagenta}+OHM+@{BxCyellow})@{n}
/def -Fp3 -mregexp -t'((J|j)akastam jakastam ktostam|Flyelz)([*,.\] ]|$)' _ohmk_kolorek_0 = /substitute -p @{}%{PL}%{P1}%{OHMksign}%{P3}%{PR}
/def -Fp3 -mregexp -t'((N|n)iepozorny przyjacielski halfling|Grippi)([*,.\] ]|$)' _ohmk_kolorek_1 = /substitute -p @{}%{PL}%{P1}%{OHMksign}%{P3}%{PR}
