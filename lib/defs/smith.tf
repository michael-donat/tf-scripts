/def naprawa = \
    /send zaloz wszystkie zbroje%;\
    /def -t'Twe cialo chronia grube plyty mahakamskiej *' _trigger_equip_napraw_patriotka = /send napraw mahakamska wojenna zbroje plytowa%;\
    /def -t'Masz na sobie (.*)\.' -mregexp _trigger_equip_napraw = /test _trigger_equip_napraw_execute("%%{P1}")%;\
    /send i

/def _trigger_equip_napraw_execute = \
    /set _stuff_for_fixing=$[strcat(replace(', ','|', replace(' i ','|',{1})), "|") ]%;\
    /set _stuff_for_fixing_pointer=$[strstr({_stuff_for_fixing},"|")] %;\
    /set _stuff_for_fixing_i=0%;\
    \
    /while ({_stuff_for_fixing_pointer}!=-1) \
        /set _stuff_for_fixing_item=$[substr({_stuff_for_fixing},0,{_stuff_for_fixing_pointer})]%;\
        /set _stuff_for_fixing=$[substr({_stuff_for_fixing},{_stuff_for_fixing_pointer}+1)]%;\
        /set _stuff_for_fixing_pointer=$[strstr({_stuff_for_fixing},"|")] %;\
        /send napraw %{_stuff_for_fixing_item}%;\
     /done%;\
     /send naostrz bron%;\
     /purge \_trigger\_equip\_napraw*