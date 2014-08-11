
/eval /set logdir=%{TFLOGDIR}

; init logging
/load lib/init/log.tf

; init keyboard maps
/load lib/init/kbmac.tf

; load settings
/load lib/init/settings.tf

/cd lib

; load and init libraries
/load functions.tf
/load init/includes.tf

; reload def
/def reload = /purge * %; /cd .. %; /load lib/init.tf
/def showme = /test $[fake_recv({*})]

/def -ag -h'Redef' hide_redef

/def _nkp5bind

/def clear5 = \
    /def _nkp5bind

/def clearstate = \
    /clear5

/targetting 1
/move +
/orders -

/pointing + - -

/map +

;load python stuff
/def pyload = \
    /python_load py.start%;\
    /python_load gmcp%;\
    /python_load util

/pyload


