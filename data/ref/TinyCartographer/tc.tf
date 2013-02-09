; TinyCartographer TF interface

;SET THIS PATH TO POINT TO THE NAMED PIPE
/set path_to_fifo=potok

/set tc_mode=0
/set cmd=%;
; sends command in %cmd to the named pipe %path_to_fifo 
/def tcsend = /set map_handler=$[tfopen(%{path_to_fifo}, "w")]%;/test $[tfwrite(map_handler, %{cmd})]%;/test $[tfclose(map_handler)]

/def go = %{*}%;/set cmd=GO: %{*}%;/tcsend
; blindGO creates a room in place where you'd go and makes a link to and from the actual room
; if there's no room (just trying invisible exits or sth) /tcrev undoes last move
/def blindGo = %{*}%;/set cmd=BLINDGO: %{*}%;/tcsend

/def t_c1 = /blindGo poludniowy-zachod
/def t_c2 = /blindGo poludnie
/def t_c3 = /blindGo poludniowy-wschod
/def t_c4 = /blindGo zachod

/def t_c6 = /blindGo wschod
/def t_c7 = /blindGo polnocny-zachod
/def t_c8 = /blindGo polnoc
/def t_c9 = /blindGo polnocny-wschod

/def tc1 = /go poludniowy-zachod
/def tc2 = /go poludnie
/def tc3 = /go poludniowy-wschod
/def tc4 = /go zachod

/def tc6 = /go wschod
/def tc7 = /go polnocny-zachod
/def tc8 = /go polnoc
/def tc9 = /go polnocny-wschod


/def key_f7 = /if (%tc_mode == 0) /bind 1 = /tc1%;/bind 2 = /tc2%;/bind 3 = /tc3%;/bind 4 = /tc4%;/bind 5 = /tcput%;/bind 6 = /tc6%;/bind 7 = /tc7%;/bind 8 = /tc8%;/bind 9 = /tc9%;/set tc_mode=1%;/echo -aBCgreen TinyCartographer normal mapping%; \
/elseif (%tc_mode == 1) /bind 1 = /t_c1%;/bind 2 = /t_c2%;/bind 3 = /t_c3%;/bind 4 = /t_c4%;/bind 5 = /tcrev%;/bind 6 = /t_c6%;/bind 7 = /t_c7%;/bind 8 = /t_c8%;/bind 9 = /t_c9%;/set tc_mode=2%;/echo -aBCgreen TinyCartographer blind mapping%; \
 /else /unbind 1%;/unbind 2%;/unbind 3%;/unbind 4%;/unbind 5%;/unbind 6%;/unbind 7%;/unbind 8%;/unbind 9%;/set chod=wtf%;/set tc_mode=0%;/echo -aBCgreen TinyCartographer mapping stopped%;/endif

; puts room with exits %tcexits on map
/def tcput = /set cmd=ADD: %tcexits%;/tcsend

; undoes last move with blind or normal walking
/def tcrev = /set cmd=REV%;/tcsend

; removes target exit from actual location
/def tcrm = /set cmd=RMEXIT: %{*}%;/tcsend

; sets the description for actual room
; example: /ds The Bridge of Death. Time to save game.
/def ds = /set cmd=DESCRIPT: %{*}%;/tcsend

; moves all rooms for x, y roomsizes
; example: /tcmove 2 -5 
; will move everything two rooms right and five up
/def tcmove = /set cmd=MOVEALL: %{*}%;/tcsend
; makes a link between last and actual room.
; first argument is the name of exit leading from last to actual
; second (optional) is the name of exit leading back to last room
; example: /ln polnoc, wyjscie or /ln drzwi [coma IS important]
/def ln = /set cmd=LINK: %{*}%;/tcsend

; these work exactly as they're named
/def tcsave = /set cmd=SAVE: %{*}%;/tcsend
/def tcload = /set cmd=LOAD: %{*}%;/tcsend
/def tcclean = /set cmd=CLEAN%;/tcsend
/def tcquit = /set cmd=FINISH%;/tcsend

/def -F -aBCblue -mregexp -t"^(Jest|Sa) tutaj (.*) widoczn(e|ych) wyjsc(|ie|ia): " tcchodzik = \
  /set tcexits=$[replace (" i ", ";", replace (", ", ";", replace(".", "", %{PR})))] 
