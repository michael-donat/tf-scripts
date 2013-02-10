
;------------------------------------------------------------------------
;			    POSTEPY
;------------------------------------------------------------------------

/set _create_trigger_list=minimalne|nieznaczne|bardzo male|male|nieduze|zadowalajace|spore|dosc duze|znaczne|duze|bardzo duze|ogromne|imponujace|wspaniale|gigantyczne|niebotyczne|
/set _create_trigger_trigger_prefix=_info_level_trigger
/set _create_trigger_trigger_name=_info_level_process
/set _create_trigger_match_prefix=^(Poczynil[a-z]s)\s(
/set _create_trigger_match_suffix=)\s(.*)
;above will autogenerate basic triggers

/_create_trigger

/def -p0 _info_level_process = \
    /set lvl=$[{1}-1]%;\
    /substitute -p %{P1} @{Crgb055}%{P2} %{lvl}/15@{n} %{P3}

;------------------------------------------------------------------------
;			    OCENA WARTOSCI
;------------------------------------------------------------------------

/def -p1 -mregexp -t'okolo (.*) miedziak(i|ow).' wartosc_trig_1 = /substitute -p %{PL}okolo @{BxCwhite}$[{P1}/24000] mithryli, $[mod({P1},24000)/240] zlota, $[mod({P1},240)/12] srebra i $[mod({P1},12)] miedzi@{n} czyli jakies %{P1} miedzi.%{PR}
/def -p1 -mregexp -t'wartych (.*) miedziakow.' wartosc_trig_2 = /substitute -p %{PL}wartych okolo @{BxCwhite}$[{P1}/24000] mithryli, $[mod({P1},24000)/240] zlota, $[mod({P1},240)/12] srebra i $[mod({P1},12)] miedzi@{n} czyli jakies %{P1} miedzi.%{PR}
/def -p1 -mregexp -t'warte (.*) miedziakow.' wartosc_trig_3 = /substitute -p %{PL}warte okolo @{BxCwhite}$[{P1}/24000] mithryli, $[mod({P1},24000)/240] zlota, $[mod({P1},240)/12] srebra i $[mod({P1},12)] miedzi@{n} czyli jakies %{P1} miedzi.%{PR}

;------------------------------------------------------------------------
;			POZIOMY DOSWIADCZENIA				|
;------------------------------------------------------------------------
;/def -p4 -mregexp -F -t'((Wyglada na|Wygladasz na) (kompletnego zoltodzioba.))'		                        _poziomy_graczy1 = /substitute -p %{P2} @{BxCrgb454}%{P3}[1/13] @{n}%{P5}%{PR}
;/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (stawia pierwsze kroki.))'		    _poziomy_graczy2 = /substitute -p %{P2} @{BxCrgb454}%{P3}[2/13] @{n}%{P5}%{PR}
;/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (jeszcze niewiele widzial.))'		    _poziomy_graczy3 = /substitute -p %{P2} @{BxCrgb454}%{P3}[3/13] @{n}%{P5}%{PR}
;/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (niewiele wie o swiecie.))' 		    _poziomy_graczy4 = /substitute -p %{P2} @{BxCrgb454}%{P3}[4/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos|Wygladasz na kogos) (niedoswiadczonego.))' 		                    _poziomy_graczy5 = /substitute -p %{P2} @{BxCrgb454}%{P3} [1/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (widzial juz to i owo.))' 		        _poziomy_graczy6 = /substitute -p %{P2} @{BxCrgb454}%{P3} [2/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (pewnie stapa po swiecie.))'		    _poziomy_graczy7 = /substitute -p %{P2} @{BxCrgb454}%{P3} [3/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (niejedno widzial.))'			        _poziomy_graczy8 = /substitute -p %{P2} @{BxCrgb454}%{P3} [4/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (swoje przezyl.))' 			        _poziomy_graczy9 = /substitute -p %{P2} @{BxCrgb454}%{P3} [5/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na|Wygladasz na) (kogos doswiadczonego.))'		 	                        _poziomy_graczy10 = /substitute -p %{P2} @{BxCrgb454}%{P3} [6/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (wiele przeszedl.))' 			        _poziomy_graczy11 = /substitute -p %{P2} @{BxCrgb454}%{P3} [7/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (widzial kawal swiata.))'		        _poziomy_graczy12 = /substitute -p %{P2} @{BxCrgb454}%{P3} [8/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos|Wygladasz na kogos) (bardzo doswiadczonego.))' 		                _poziomy_graczy13 = /substitute -p %{P2} @{BxCrgb454}%{P3} [9/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (zwiedzil caly swiat.))' 		        _poziomy_graczy14 = /substitute -p %{P2} @{BxCrgb454}%{P3} [10/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos|Wygladasz na kogos) (wielce doswiadczonego.))' 		                _poziomy_graczy15 = /substitute -p %{P2} @{BxCrgb454}%{P3} [11/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na kogos, kto|Wygladasz na kogos, kto) (widzial i doswiadczyl wszystkiego.))'	_poziomy_graczy16 = /substitute -p %{P2} @{BxCrgb454}%{P3} [12/13] @{n}%{P5}%{PR}
/def -p4 -mregexp -F -t'((Wyglada na|Wygladasz na) (osobe owiana legenda.))' 		                            _poziomy_graczy17 = /substitute -p %{P2} @{BxCrgb454}%{P3} [13/13] @{n}%{P5}%{PR}

;------------------------------------------------------------------------
;			STOWARZYSZENIA				|
;------------------------------------------------------------------------
/def -mregexp -F -t'.*nosi piekna (zlota|srebrna|miedziana) obrecz( wysadzana (krwawymi rubinami|kosztownymi kamieniami)|)' _wyroznik_stowarzyszenia_OK = /echo -p @{Cbgblue}@{BCwhite}...:: OGR Z OGRZEJ KOMPANII ::...@{n}
/def -mglob -F -t'*szyi, na skorzanym rzemieniu wisi*' _wyroznik_stowarzyszenia_LE = /echo -p @{Cbgblue}@{BCwhite}...:: LESNY ELF ::...@{n}
/def -mregexp -F -t'Nosi (.*) kubraczek, tradycyjny stroj Elfow z Gor Sinych.' _wyroznik_stowarzyszenia_SE = /echo -p @{Cbgblue}@{BCwhite}...:: SINY ELF ::...@{n}
/def -mglob -F -t'*Wzor i kolor kiltu swiadcza o przynaleznosci do Krasnoludow z Gor Kranca Swiata*' _wyroznik_stowarzyszenia_KGKS = /echo -p @{Cbgblue}@{BCwhite}...:: KRASNOLUD GKS ::...@{n}
/def -mglob -F -t'*welniany krasnoludzki kilt*' _wyroznik_stowarzyszenia_KGKS2 = /echo -p @{Cbgblue}@{BCwhite}...:: KRASNOLUD GKS (Bezdomny) ::...@{n}
/def -mregexp -F -t'Klamre (jego|jej) pasa zdobi herb klanu.*' _wyroznik_stowarzyszenia_KM = /echo -p @{Cbgblue}@{BCwhite}...:: KRASNOLUD MAHAKAMU ::...@{n}
/def -mglob -F -t'*oznaka przynaleznosci do Cechu Kupcow Novigradzkich*' _wyroznik_stowarzyszenia_CKN = /echo -p @{Cbgblue}@{BCwhite}...:: KUPIEC NOVIGRADZKI ::...@{n}
/def -mglob -F -t'*jest oznaka przynaleznosci do grona pracownikow najemnych Cechu Kupcow Novigradzkich.' _wyroznik_stowarzyszenia_PHCKN = /echo -p @{Cbgblue}@{BCwhite}...:: PARTNER HANDLOWY CKN ::...@{n}
/def -mglob -F -t'*zamek ze znakiem Stowarzyszenia Gnomich Wynalazcow*' _wyroznik_stowarzyszenia_SGW = /echo -p @{Cbgblue}@{BCwhite}...:: GNOM Z SGW ::...@{n}
/def -mglob -F -t'*ryngraf, na ktorym wyryto*Skorpion*' _wyroznik_stowarzyszenia_WKS = /echo -p @{Cbgblue}@{BCwhite}...:: KOMPANIA SKORPION ::...@{n}
/def -mregexp -F -t'.* skory oznaczajaca (jego|jej) przynaleznosc do osadnikow.*' _wyroznik_stowarzyszenia_Osadnicy = /echo -p @{Cbgblue}@{BCwhite}...:: OSADNIK ::...@{n}
/def -mregexp -F -t'Nosi wiewiorczy ogon (.*) swiadczacy (.*)' _wyroznik_stowarzyszenia_SC = /echo -p @{Cbgblue}@{BCwhite}...:: WIEWIORA ::...@{n}
/def -mglob -F -t'*Przez srodek jego glowy przebiega czub*' _wyroznik_stowarzyszenia_ZT = /echo -p @{Cbgblue}@{BCwhite}...:: ZABOJCA TROLLI ::...@{n}
/def -mglob -F -t'*charakterystyczna dla Stowarzyszenia Polelfow*' _wyroznik_stowarzyszenia_Polelfy = /echo -p @{Cbgblue}@{BCwhite}...::  POLELF/KA ::...@{n}
/def -mregexp -F -t'Przy pasie nosi.*zacieznej piechoty z Ochotniczego Hufca Mahakamu\.' _wyroznik_stowarzyszenia_OHM = /echo -p @{Cbgblue,BCwhite}...:: OHM ::...@{n}
/def -mregexp -F -t'zawiazana .* ze znakiem czarnego gryfa.' _wyroznik_stowarzyszenia_KG = /echo -p @{Cbgblue,BCwhite}...:: NAJEMNIK KG::...
/def -F -mregexp -t'(^Twarz [^ ]+ pocieta jest .* wojownik)' _wyroznik_stowarzyszenia_GL = /echo -p @{Cbgblue,BCwhite}...:: GLADIATOR ::...
/def -F -mregexp -t'(^Jest (kadetem|uczniem|pomocnikiem|mistrzem|gladiatorem) ((|z(|e) )Szkoly [wW]alki von Raugen|(|z )Nulnijskiej Szkoly Gladiatorow))' _wyroznik_stowarzyszenia_GL2 = /echo -p @{Cbgblue,BCwhite}...:: GLADIATOR ::...
/def -F -mregexp -t'nieustepliwe niczym skelliganskie sztormy spojrzenie i twarz wysmagana lodowatymi wichrami swiadcza o tym, ze masz przed soba' _wyroznik_stowarzyszenia_Korsarze = /echo -p @{Cbgblue,BCwhite}...:: KORSARZ ::...