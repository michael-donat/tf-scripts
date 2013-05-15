; werbat
/set kolor_info=magenta
/set c_info=rgb014

;dho
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