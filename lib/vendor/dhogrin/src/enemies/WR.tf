/set WRsign=@{BxCred}(@{BxCcyan}~WR~@{BxCred})@{n}
/def -Fp3 -mregexp -t'((C|c)zarnowlosy czarnooki (mutant|mutantka|mezczyzna)|Arid)([*,.\] ]|$)' _wrog_wr_0 = /substitute -p @{}%{PL}%{P1}%{WRsign}%{P4}%{PR}
/def -Fp3 -mregexp -t'((P|p)rzygarbiony wysuszony (mutant|mutantka|mezczyzna)|Heklert)([*,.\] ]|$)' _wrog_wr_1 = /substitute -p @{}%{PL}%{P1}%{WRsign}%{P4}%{PR}
/def -Fp3 -mregexp -t'((P|p)onury brzuchaty (mutant|mutantka|ogr)|Maldun)([*,.\] ]|$)' _wrog_wr_2 = /substitute -p @{}%{PL}%{P1}%{WRsign}%{P4}%{PR}
