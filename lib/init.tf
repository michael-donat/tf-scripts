
; load and connect
/load lib/init/worlds.tf

; init logging
/load lib/init/log.tf

; init keyboard maps
/load lib/init/kbmac.tf

; load settings
/load lib/init/settings.tf

; load and init libraries
/cd lib
/load functions.tf
/load init/includes.tf

; reload def
/def reload = /purge * %; /cd .. %; /load lib/init.tf
/def showme = /test $[fake_recv({*})]