
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
    /substitute -p %{P1} @{Crgb055}%{P2} %{1}/16@{n} %{P3}

;------------------------------------------------------------------------
;			    OCENA WARTOSCI
;------------------------------------------------------------------------

/def -p1 -mregexp -t'okolo (.*) miedziak(i|ow).' wartosc_trig_1 = /substitute -p %{PL}okolo @{BxCwhite}$[{P1}/24000] mithryli, $[mod({P1},24000)/240] zlota, $[mod({P1},240)/12] srebra i $[mod({P1},12)] miedzi@{n} czyli jakies %{P1} miedzi.%{PR}
/def -p1 -mregexp -t'wartych (.*) miedziakow.' wartosc_trig_2 = /substitute -p %{PL}wartych okolo @{BxCwhite}$[{P1}/24000] mithryli, $[mod({P1},24000)/240] zlota, $[mod({P1},240)/12] srebra i $[mod({P1},12)] miedzi@{n} czyli jakies %{P1} miedzi.%{PR}
/def -p1 -mregexp -t'warte (.*) miedziakow.' wartosc_trig_3 = /substitute -p %{PL}warte okolo @{BxCwhite}$[{P1}/24000] mithryli, $[mod({P1},24000)/240] zlota, $[mod({P1},240)/12] srebra i $[mod({P1},12)] miedzi@{n} czyli jakies %{P1} miedzi.%{PR}

;------------------------------------------------------------------------
;			    OCENA ZBROI I BRONI
;------------------------------------------------------------------------

/set _create_trigger_list=minimalne|nieznaczne|bardzo male|male|nieduze|zadowalajace|spore|dosc duze|znaczne|duze|bardzo duze|ogromne|imponujace|wspaniale|gigantyczne|niebotyczne|
/set _create_trigger_trigger_prefix=_info_level_trigger
/set _create_trigger_trigger_name=_info_level_process
/set _create_trigger_match_prefix=^(Poczynil[a-z]s)\s(
/set _create_trigger_match_suffix=)\s(.*)
;above will autogenerate basic triggers

/_create_trigger

/def -p0 _info_level_process = \
    /substitute -p %{P1} @{Crgb055}%{P2} %{1}/16@{n} %{P3}