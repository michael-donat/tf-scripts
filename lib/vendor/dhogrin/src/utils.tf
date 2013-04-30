/def _count_people = \
  /let __string=$[replace(".", "|", replace(", ", "|", replace(" i ", "|", {1})))]%; \
  /let __count=0%; \
  /while ({__string}!~"") \
    /let __p=$[strstr({__string}, "|")]%; \
    /let __substring=$[substr({__string},0,{__p})]%; \
    /if (regmatch("(piec) ", {__substring})) \
      /let __count=$[{__count}+5]%; \
    /elseif (regmatch("(cztery|czworo|czterej) ", {__substring})) \
      /let __count=$[{__count}+4]%; \
    /elseif (regmatch("(trzy|trzech|troje|trzej) ", {__substring})) \
      /let __count=$[{__count}+3]%; \
    /elseif (regmatch("(dwa|dwie|dwoch|dwoje|dwaj) ", {__substring})) \
      /let __count=$[{__count}+2]%; \
    /else \
      /let __count=$[{__count}+1]%; \
    /endif%; \
    /let __string=$[substr({__string},{__p}+1)]%; \
  /done%; \
  /return %{__count}

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

; zamienia liczbę na jeden znak (jesli liczba > 9, to 'X')
/def _one_digit = \
  /if ({*}>9) \
    /return "X"%; \
  /elseif ({*}==0) \
    /return " "%; \
  /endif%; \
  /return %{*}

; usuwa (~MC~) z imienia
/def _string_rem_name = \
    /result substr({1}, 0, strchr(strcat({1}, " ("), "(") - 1)

/def _string_to_varname = \
    /result replace(" ", "_", tolower(_string_rem_name({1})))

    
