;------------------------------------------------------------------------
;			    P O S T E P Y    				|
;------------------------------------------------------------------------

/set _postepy_list=minimalne|nieznaczne|bardzo male|male|nieduze|zadowalajace|spore|dosc duze|znaczne|duze|bardzo duze|ogromne|imponujace|wspaniale|gigantyczne|niebotyczne|

/set _postepy_current=-1

/def -Fp500 -mregexp -t'Poczyniles (.*) postepy, od momentu kiedy wszedles do gry\.' _postepy_lap = \
  /test _postepy_show({P0}, {P1})


/def _postepy_zanotuj = \
  /let __postep=%{1}%; \
  /if ({__postep}>{_postepy_current}) \
    /set _postepy_czas_%{__postep}=$[ftime("%H:%M", time())]%; \
    /set _postepy_current=%{__postep}%; \
  /endif

/def postepy = /_postepy_show_times

/def _postepy_show_times = \
  /let __index=0%; \
  /echo -p @{n}-----------------------%; \
  /echo | Postepy     | Czas  |%; \
  /echo -p @{n}--------------+--------%; \
  /while ({__index}<={_postepy_current}) \
    /let __postep=$[_get_element({__index}, {_postepy_list})]%; \
    /let __czas=$(/listvar -v _postepy_czas_$[strcat({__index})])%; \
    /echo $[strcat("| ", pad({__postep},-12), "| ", {__czas}, " |")]%;  \
    /let __index=$[{__index}+1]%; \
  /done%; \
  /if ({_postepy_current}==-1) \
    /echo -p @{n}|             |       |%; \
  /endif%; \
  /echo -p @{n}-----------------------

/def _postepy_show = \
  /let __postep=%{2}%; \
  /let __index=$[_get_index({__postep}, {_postepy_list})]%; \
  /_postepy_zanotuj %{__index}%; \
;  /test substitute(strcat("@{B}", {1}, " [",{__index},"/15]"),"",1)





/def _get_index = \
  /let __element=%{1}%; \
  /let __list=%{2}|%; \
  /let __i=-1%; \
  /while ({__list}!~"") \
    /let __i=$[{__i}+1]%; \
    /let __p=$[strstr({__list}, "|")]%; \
    /let __el=$[substr({__list},0,{__p})]%; \
    /if ({__el}=~{__element}) \
      /return %{__i}%; \
    /endif%; \
    /let __list=$[substr({__list},{__p}+1)]%; \
  /done%; \
  /return -1

/def _get_element = \
  /let __index=%{1}%; \
  /let __list=%{2}|%; \
  /let __i=-1%; \
  /while ({__list}!~"") \
    /let __i=$[{__i}+1]%; \
    /let __p=$[strstr({__list}, "|")]%; \
    /let __el=$[substr({__list},0,{__p})]%; \
    /if ({__i}=={__index}) \
      /return strcat({__el})%; \
    /endif%; \
    /let __list=$[substr({__list},{__p}+1)]%; \
  /done%; \
  /return ""