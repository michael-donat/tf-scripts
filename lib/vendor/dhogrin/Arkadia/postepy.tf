;------------------------------------------------------------------------
;			    P O S T E P Y    				|
;------------------------------------------------------------------------

/set _postepy_current=-1

/def -p500 -mregexp -t'Poczyniles (.*) postepy, od momentu kiedy wszedles do gry\.' _postepy_lap = \
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
  /echo -p @{n}------------------------%; \
  /echo | Postepy      | Czas  |%; \
  /echo -p @{n}---------------+--------%; \
  /while ({__index}<={_postepy_current}) \
    /let __postep=$[_get_element({__index}, {_postepy_list})]%; \
    /let __czas=$(/listvar -v _postepy_czas_$[strcat({__index})])%; \
    /echo $[strcat("| ", pad({__postep},-13), "| ", {__czas}, " |")]%;  \
    /let __index=$[{__index}+1]%; \
  /done%; \
  /if ({_postepy_current}==-1) \
    /echo -p @{n}|              |       |%; \
  /endif%; \
  /echo -p @{n}------------------------
  
/def _postepy_show = \
  /let __postep=%{2}%; \
  /let __index=$[_get_index({__postep}, {_postepy_list})]%; \
  /_postepy_zanotuj %{__index}%; \
  /test substitute(strcat("@{B}", {1}, " [",{__index},"/15]"),"",1)
