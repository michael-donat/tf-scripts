;******************************************************
;*                                                    *
;*   Zmiana wyglady wyznacznika wyjsc                 *
;*                          ver 1.2b, by Rindarin     *
;*                                                    *
;*                                                    *
;*  Prosty skrypt zamieniajacy wyglad:                *
;*                                                    *
;*  "Jest tutaj ilestam wyjsc"    na:                 *
;*                                                    *
;*  ====]    :) proste ale przydatne                 *
;*                                                    *
;*  Mam tylko wersje na Ishtar, dziala takze          *
;*  w Warlocku. Wersje dla Imperium podam innym       *
;*  razem :) Dodane testy dla Imperium.               *
;*                                                    *
;******************************************************

; Ishtar

/def -Fp200 -mregexp -t'(widoczne wyjscia:)' _wyj_2-4 = /substitute -p @{BxCbgblue}@{BxCgreen}====]@{n}@{n} @{BxCcyan}%{PR}@{n}
/def -Fp200 -mregexp -t'(widocznych wyjsc:)' _wyj_wiecej = /substitute -p @{BxCbgblue}@{BxCgreen}====]@{n}@{n} @{BxCcyan}%{PR}@{n}
/def -Fp200 -mregexp -t'(widoczne wyjscie:)' _wyj_jedno_arka = /substitute -p @{BxCbgblue}@{BxCgreen}====]@{n}@{n} @{BxCcyan}%{PR}@{n}

; Imperium

/def -Fp200 -mregexp -t'(widoczne wyjscie to:)' _wyj_jedno_imp = /substitute -p @{BxCbgblue}@{BxCgreen}====]@{n}@{n} @{BxCcyan}%{PR}@{n}
/def -Fp200 -mregexp -t'(wiedzie na )' _wyj_dwa_imp = /substitute -p @{BxCbgblue}@{BxCgreen}====]@{n}@{n} @{BxCcyan}%{PR}@{n}
/def -Fp200 -mregexp -t'(rozgalezia sie na )' _wyj_wiecej_imp = /substitute -p @{BxCbgblue}@{BxCgreen}====]@{n}@{n} @{BxCcyan}%{PR}@{n}
/def -Fp200 -mregexp -t'(trakt wiodacy na )' _wyj_dwa_noc_imp = /substitute -p @{Cbgblue}@{Cgreen}====]@{n}@{n} @{Ccyan}%{PR}@{n}
/def -Fp200 -mregexp -t'prowadzi tutaj w (jednym|dwoch) (kierunku|kierunkach): ' _wyj_1_2_imp = /substitute -p @{BxCbgblue}@{BxCgreen}====]@{n}@{n} @{BxCcyan}%{PR}@{n}
/def -Fp200 -mregexp -t'. Mozna jednak z niego zejsc i udac sie na ' _wyj_rozg_2_imp = /substitute -p %{PL}@{BxCcyan} i %{PR}@{n}
/def -Fp200 -mregexp -t'Wydeptane w kukurydzy sciezki prowadza na ' _wyj_kukurydza_ = /substitute -p %{BxCbgblue}@{BxCgreen}====]@{n}@{n} @{BxCcyan}%{PR}@{n}
/def -Fp200 -mregexp -t'Wedrowke przez rozlegle laki mozesz kontynuowac udajac sie na ' _wyj_laki = /substitute -p @{BxCgreen}====]@{n}@{n} @{BxCcyan}%{PR}@{n}
/def -Fp200 -mregexp -t'Wedrowke przez rozlegle laki mozesz kontynuowac w dowolnie wybranym kierunku.' _wyj_all = /substitute -p @{BxCgreen}====]@{n} @{BxCcyan}polnoc, poludnie, wschod, zachod, polnocny-wschod, polnocny-zachod, poludniowy-wschod, poludniowy-zachod.@{n}
/def -Fp200 -mregexp -t'. Po obydwu stronach uliczki znajduja sie sklepy.' _wyj_imp_urb = /substitute -p %{PL}@{BxCcyan}, polnoc i poludnie.@{n}
