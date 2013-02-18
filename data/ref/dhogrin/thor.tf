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

/def _condition_show = \
  /let __who=%{3}%; \
  /let __condition_color=%{1}%; \
  /let __condition_state=%{2}%; \
  /let __enemy_count=0%; \
  /if ({__who}=~"Ty") \
    /let __name_color=BCyellow%; \
    /test _update_statusbar_hp({__condition_state},{__condition_color})%; \
  /elseif (tolower({__who})=~{druzyna_L}) \
    /let __name_color=BCgreen%; \
  /elseif (_is_team_member(tolower({__who}))==1) \
    /let __name_color=Cgreen%; \
  /else \
    /let __name_color=n%; \
  /endif%; \
  /if ({3}!~"") \
    /let __enemy_count=$[_count_people({4})]%; \
  /endif%; \
  /test substitute(strcat("[", {__condition_state}, "/7", "]", "[", {__enemy_count}, "]", "[@{", {__condition_color}, "}", pad(strrep("#", {__condition_state}*2), 7*2), "@{n}]", " @{", {__name_color}, "}", {__who}, "."), "", 1)

/def _update_statusbar_hp = \
  /set _statusbar_var_hp=$[decode_attr(strcat("[", "@{", {2}, "}", pad(strrep("#", {1} * 2), 7 * 2),"@{n}]"))]

/def _count_people = \
  /let __string=$[replace(".", "|", replace(", ", "|", replace(" i ", "|", {1})))]%; \
;  /echo %{__string}%; \
  /let __count=0%; \
  /while ({__string}!~"") \
    /let __p=$[strstr({__string}, "|")]%; \
    /let __substring=$[substr({__string},0,{__p})]%; \
    /if (regmatch("(cztery|czworo) ", {__substring})) \
      /let __count=$[{__count}+4]%; \
    /elseif (regmatch("(trzy|trzech|troje) ", {__substring})) \
      /let __count=$[{__count}+3]%; \
    /elseif (regmatch("(dwa|dwie|dwoch|dwoje) ", {__substring})) \
      /let __count=$[{__count}+2]%; \
    /else \
      /let __count=$[{__count}+1]%; \
    /endif%; \
;    /echo %{__substring}%; \
    /let __string=$[substr({__string},{__p}+1)]%; \
  /done%; \
  /return %{__count}