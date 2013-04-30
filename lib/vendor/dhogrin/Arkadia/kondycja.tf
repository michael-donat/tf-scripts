;------------------------------------------------------------------------
;			   ... KONDYCJA ... 				  |
;------------------------------------------------------------------------

/def -Fp150 -mregexp -t'(Jestes| jest) w swietnej kondycji\.( Atakuj[^ ]+ [^ \.]+(.*)|)$' _condition_swietna = \
  /test _condition_show("Cgreen", 7, {PL-Ty}, {P3})
/def -Fp150 -mregexp -t'(Jestes| jest) w dobrym stanie\.( Atakuj[^ ]+ [^ \.]+(.*)|)$' _condition_dobra = \
  /test _condition_show("BxCgreen", 6, {PL-Ty}, {P3})
/def -Fp150 -mregexp -t'(Jestes| jest) lekko rann[yae]\.( Atakuj[^ ]+ [^ \.]+(.*)|)$' _condition_lekko = \
  /test _condition_show("BxCyellow", 5, {PL-Ty}, {P3})
/def -Fp150 -mregexp -t'(Jestes| jest) rann[yae]\.( Atakuj[^ ]+ [^ \.]+(.*)|)$' _condition_ranny = \
  /test _condition_show("Cyellow", 4, {PL-Ty}, {P3})
/def -Fp150 -mregexp -t'(Jestes| jest) w zlej kondycji\.( Atakuj[^ ]+ [^ \.]+(.*)|)$' _condition_zla = \
  /test _condition_show("Crgb530", 3, {PL-Ty}, {P3})
/def -Fp150 -mregexp -t'(Jestes| jest) ciezko rann[yae]\.( Atakuj[^ ]+ [^ \.]+(.*)|)$' _condition_ciezko = \
  /test _condition_show("Crgb520", 2, {PL-Ty}, {P3})
/def -Fp150 -mregexp -t'(Jestes| jest) ledwo zyw[yae]\.( Atakuj[^ ]+ [^ \.]+(.*)|)$' _condition_ledwo = \
  /test _condition_show("Crgb510", 1, {PL-Ty}, {P3})

;------------------------------------------------------------------------
;			   ... STAMINA ... 				  |
;------------------------------------------------------------------------

/eval /def -Fp150 -mregexp -t' i jestes (%{_zmeczenie_list})\.' _stamina_lapaj = \
  /test _stamina_update({P1})

/eval /def -Fp150 -mregexp -t'Czujesz sie (%{_zmeczenie_list})\.' _stamina_lapaj_2 = \
  /test _stamina_update({P1})
  
/eval /def -Fp150 -mregexp -t'Glosno sapiac, przystajesz na chwile, ocierasz swa dlonia krople potu z czola sygnalizujac ze jestes (%{_zmeczenie_list})\.' _stamina_lapaj_3 = \
  /test _stamina_update({P1})
  
/def _stamina_update = \
  /let __level=%{*}%; \
  /let __index=$[10-_get_index({__level}, {_zmeczenie_list})]%; \
  /test _update_statusbar_st({__index}, "Cyellow")
  
/def _condition_show = \
  /let __who=%{3}%; \
  /let __wwho=$[replace("[","",replace("]","",{__who}))]%; \
  /let __condition_color=%{1}%; \
  /let __condition_state=%{2}%; \
  /let __enemy_count=0%; \
  /if ({__who}=~"Ty") \
    /let __name_color=BCyellow%; \
    /test _update_statusbar_hp({__condition_state},{__condition_color})%; \
  /elseif (tolower({__wwho})=~{druzyna_L}) \
    /let __name_color=BCgreen%; \
  /elseif (_is_team_member(tolower({__wwho}))==1) \
    /let __name_color=Cgreen%; \
  /else \
    /let __name_color=n%; \
  /endif%; \
  /if ({3}!~"") \
    /let __enemy_count=$[_count_people({4})]%; \
  /endif%; \
  /if ({__enemy_count}>0 & (_is_team_member(tolower({__wwho}))==1 | {__wwho}=~"Ty")) \
    /let __enemy= @{BCyellow}<@{BCgreen}<@{BCmagenta}<@{BCblue}<@{Bn}- %; \
  /else \
    /let __enemy=$(/listvar -v _walka_ktokogo_lista_$[_string_to_varname({__wwho})]) %;\
    /let __enemy=$[(strlen(__enemy) & (_is_team_member_B(tolower(__enemy)) | {__enemy}=~"ciebie")) ? strcat(" @{Bn}-@{BCyellow}>@{BCgreen}>@{BCmagenta}>@{BCblue}> @{Bn}", {__enemy}) : ""] %;\
  /endif%; \
  /test substitute(strcat("[", {__condition_state}, "/7", "]", "[", _one_digit({__enemy_count}), "]", "[@{", {__condition_color}, "}", pad(strrep("#", {__condition_state}*2), 7*2), "@{n}]", " @{", {__name_color}, "}", {__who}, ".", {__enemy}), "", 1)
