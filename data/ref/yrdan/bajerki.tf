/def -Fp99999 -mregexp -t'okolo (.*) miedziak(i|ow).' wartosc_trig_1 = /substitute -p %{PL}okolo @{BxCwhite}$[{P1}/24000] mithryli, $[mod({P1},24000)/240] zlota, $[mod({P1},240)/12] srebra i $[mod({P1},12)] miedzi@{n} czyli jakies %{P1} miedzi.%{PR}

/def -Fp99999 -mregexp -t'wartych (.*) miedziakow.' wartosc_trig_2 = /substitute -p %{PL}wartych okolo @{BxCwhite}$[{P1}/24000] mithryli, $[mod({P1},24000)/240] zlota, $[mod({P1},240)/12] srebra i $[mod({P1},12)] miedzi@{n} czyli jakies %{P1} miedzi.%{PR}

/def -Fp99999 -mregexp -t'warte (.*) miedziakow.' wartosc_trig_3 = /substitute -p %{PL}warte okolo @{BxCwhite}$[{P1}/24000] mithryli, $[mod({P1},24000)/240] zlota, $[mod({P1},240)/12] srebra i $[mod({P1},12)] miedzi@{n} czyli jakies %{P1} miedzi.%{PR}

;/def -P1h -F -t'wskazuje (.*).$' wskazanie= /set cel_ataku=$[tolower({P1})]%;\
;    /echo -aBCcyan ============================================================= %;\
;    /echo -aBCcyan ============================================================= %;\
;    /f6 x %{cel_ataku}%;\
;    /echo -aBCcyan ============================================================= %;\
;    /echo -aBCcyan ============================================================= %;


; 
; Statystyka ciosow z 'nie rozwalajaca sie' tabelka.
; v. 1.1b
;
; Bagrum, ogr.
;
; update: 16/07/2004 13:40 
; * prostsze liczenie ogolnych ciosow
; * statystyka ciosow wyrazona w procentach



/set _cios_ledwo_muska=0
/set _cios_lekko_rani=0
/set _cios_rani=0
/set _cios_powaznie_rani=0
/set _cios_bardzo_ciezko_rani=0
/set _cios_masakruje=0

/set _ciosnamnie_ledwo_muska=0
/set _ciosnamnie_lekko_rani=0
/set _ciosnamnie_rani=0
/set _ciosnamnie_powaznie_rani=0
/set _ciosnamnie_bardzo_ciezko_rani=0
/set _ciosnamnie_masakruje=0
  
  /def -mregexp -t'Ledwo muskasz' ledwo_muskam = /set _cios_ledwo_muska=$[++_cios_ledwo_muska]
  /def -mregexp -t'Lekko ranisz' lekko_ranie = /set _cios_lekko_rani=$[++_cios_lekko_rani]
  /def -mregexp -t'(?-i)Ranisz' ranie = /set _cios_rani=$[++_cios_rani]
  /def -mregexp -t'Powaznie ranisz' powaznie_ranie = /set _cios_powaznie_rani=$[++_cios_powaznie_rani]
  /def -mregexp -t'Bardzo ciezko ranisz' bardzo_ciezko_ranie = /set _cios_bardzo_ciezko_rani=$[++_cios_bardzo_ciezko_rani]
  /def -mregexp -t'Masakrujesz' masakruje = /set _cios_masakruje=$[++_cios_masakruje]
  
  /def -p10 -mregexp -t'lekko rani cie' lekko_rani_mnie = /set _ciosnamnie_lekko_rani=$[++_ciosnamnie_lekko_rani]
  /def -p10 -mregexp -t'powaznie rani cie' powaznie_rani_mnie = /set _ciosnamnie_powaznie_rani=$[++_ciosnamnie_powaznie_rani]
  /def -p10 -mregexp -t'bardzo ciezko rani cie' bardzo_ciezko_rani_mnie = /set _ciosnamnie_bardzo_ciezko_rani=$[++_ciosnamnie_bardzo_ciezko_rani]
  /def -mregexp -t'ledwo muska cie' ledwo_muska_mnie = /set _ciosnamnie_ledwo_muska=$[++_ciosnamnie_ledwo_muska]
  /def -mregexp -t'rani cie' rani_mnie = /set _ciosnamnie_rani=$[++_ciosnamnie_rani]
  /def -mregexp -t'masakruje cie' masakruje_mnie = /set _ciosnamnie_masakruje=$[++_ciosnamnie_masakruje]
  
  /def suma = \
   /let x=0%; \
      /while ({#}) \
           /test ({x}:={x}+{1}) %;\
              /shift %;\
               /done %; \
                /result {x}
                 
                 
                 /def suma_ciosow = /set ciosy=$(/suma $(/listvar -v _cios_*))
                 /def suma_ciosow_na_mnie = /set ciosy_na_mnie=$(/suma $(/listvar -v _ciosnamnie_*))
                 /def _licz_procenty_ciosow = \
                  /set _cioslm_proc=$[substr(expr({_cios_ledwo_muska}*100.00/{ciosy}), 0, 5)]%; \
                   /set _cioslr_proc=$[substr(expr({_cios_lekko_rani}*100.00/{ciosy}), 0, 5)]%; \
                    /set _ciosrn_proc=$[substr(expr({_cios_rani}*100.00/{ciosy}), 0, 5)]%; \
                     /set _ciosprn_proc=$[substr(expr({_cios_powaznie_rani}*100.00/{ciosy}), 0, 5)]%; \
                      /set _ciosbcr_proc=$[substr(expr({_cios_bardzo_ciezko_rani}*100.00/{ciosy}), 0, 5)]%; \
                       /set _ciosmsk_proc=$[substr(expr({_cios_masakruje}*100.00/{ciosy}), 0, 5)]%; \
                        /set _cioslmnm_proc=$[substr(expr({_ciosnamnie_ledwo_muska}*100.00/{ciosy_na_mnie}), 0, 5)]%; \
                         /set _cioslrnm_proc=$[substr(expr({_ciosnamnie_lekko_rani}*100.00/{ciosy_na_mnie}), 0, 5)]%; \
                          /set _ciosrnnm_proc=$[substr(expr({_ciosnamnie_rani}*100.00/{ciosy_na_mnie}), 0, 5)]%; \
                           /set _ciosprnm_proc=$[substr(expr({_ciosnamnie_powaznie_rani}*100.00/{ciosy_na_mnie}), 0, 5)]%; \
                            /set _ciosbcrnm_proc=$[substr(expr({_ciosnamnie_bardzo_ciezko_rani}*100.00/{ciosy_na_mnie}), 0, 5)]%; \
                             /set _ciosmsknm_proc=$[substr(expr({_ciosnamnie_masakruje}*100.00/{ciosy_na_mnie}), 0, 5)]
                              
                              
                              /def stats = \
                                /suma_ciosow %; \
                                  /suma_ciosow_na_mnie %; \
                                    /_licz_procenty_ciosow %; \
                                      /echo -p -aCgreen $[strcat("+", strrep("-", 77), "+")] %; \
                                        /echo -p -aCgreen $[pad("|", 1, "Statystyka  ciosow", 47, "|", 31)] %; \
                                          /echo -p -aCgreen $[strcat("+", strrep("-", 77), "+")] %; \
                                            /echo -p -aCgreen $[pad("|", 1, "Cios", 14, "|", 13, "Moje", 13, "|", 11, "Na mnie", 15, "|", 12)] %; \
                                              /echo -p -aCgreen $[strcat("+", strrep("-", 26), "+", strrep("-", 23), "+", strrep("-", 26), "+")] %; \
                                                /echo -p -aCgreen $[pad("|", 1, "@{B}Ledwo muska", 17, "@{n}@{Cgreen}|", 27, {_cios_ledwo_muska}, 10, "(", 3, {_cioslm_proc}, -5, "%", 1, ")", 1, "|", 4, {_ciosnamnie_ledwo_muska}, 10, "(", 3, {_cioslmnm_proc}, -5, "%", 1, ")", 1, "|", 7)] %; \
                                                  /echo -p -aCgreen $[pad("|", 1, "@{B}Lekko rani", 16, "@{n}@{Cgreen}|", 28, {_cios_lekko_rani}, 10, "(", 3, {_cioslr_proc}, -5, "%", 1, ")", 1, "|", 4, {_ciosnamnie_lekko_rani}, 10, "(", 3, {_cioslrnm_proc}, -5, "%", 1, ")", 1, "|", 7)] %; \
                                                    /echo -p -aCgreen $[pad("|", 1, "@{B}Rani", 10, "@{n}@{Cgreen}|", 34, {_cios_rani}, 10, "(", 3, {_ciosrn_proc}, -5, "%", 1, ")", 1, "|", 4, {_ciosnamnie_rani}, 10, "(", 3, {_ciosrnnm_proc}, -5, "%", 1, ")", 1, "|", 7)] %; \
                                                      /echo -p -aCgreen $[pad("|", 1, "@{B}Powaznie rani", 19, "@{n}@{Cgreen}|", 25, {_cios_powaznie_rani}, 10, "(", 3, {_ciosprn_proc}, -5, "%", 1, ")", 1, "|", 4, {_ciosnamnie_powaznie_rani}, 10, "(", 3, {_ciosprnm_proc}, -5, "%", 1, ")", 1, "|", 7)] %; \
                                                        /echo -p -aCgreen $[pad("|", 1, "@{B}Bardzo ciezko rani", 24, "@{n}@{Cgreen}|", 20, {_cios_bardzo_ciezko_rani}, 10, "(", 3, {_ciosbcr_proc}, -5, "%", 1, ")", 1, "|", 4, {_ciosnamnie_bardzo_ciezko_rani}, 10, "(", 3, {_ciosbcrnm_proc}, -5, "%", 1, ")", 1, "|", 7)] %; \
                                                          /echo -p -aCgreen $[pad("|", 1, "@{B}Masakruje", 15, "@{n}@{Cgreen}|", 29, {_cios_masakruje}, 10, "(", 3, {_ciosmsk_proc}, -5, "%", 1, ")", 1, "|", 4, {_ciosnamnie_masakruje}, 10, "(", 3, {_ciosmsknm_proc}, -5, "%", 1, ")", 1, "|", 7)] %; \
                                                            /echo -p -aCgreen $[strcat("+", strrep("-", 26), "+", strrep("-", 23), "+", strrep("-", 26), "+")]%; \
                                                              /echo -p -aCgreen $[pad("|", 1, "Ogolem", 8, "|", 19, {ciosy}, 10, "(", 3, "100.0%", 6, ")", 1, "|", 4, {ciosy_na_mnie}, 10, "(", 3, "100.0%", 5, ")", 1, "|", 7)]%;\
                                                                /echo -p -aCgreen $[strcat("+", strrep("-", 26), "+", strrep("-", 23), "+", strrep("-", 26), "+")]
                                                                
                                                                
                                                                /def czyscstaty = \
                                                                 /set _cios_ledwo_muska=0%;\
                                                                  /set _cios_lekko_rani=0%;\
                                                                   /set _cios_rani=0%;\
                                                                    /set _cios_powaznie_rani=0%;\
                                                                     /set _cios_bardzo_ciezko_rani=0%;\
                                                                      /set _cios_masakruje=0%;\
                                                                       /set _ciosnamnie_ledwo_muska=0%;\
                                                                        /set _ciosnamnie_lekko_rani=0%;\
                                                                         /set _ciosnamnie_rani=0%;\
                                                                          /set _ciosnamnie_powaznie_rani=0%;\
                                                                           /set _ciosnamnie_bardzo_ciezko_rani=0%;\
                                                                            /set _ciosnamnie_masakruje=0
                                                                            