/def _walk_binds = \
	/def key_nkp/ = /sneak off %;\
	/def key_nkp* = /sneak ON %;\
	/def key_nkp- = /sneak TEAM %;\
	/def key_f12 = /toggleauto %;\
	/if ( {ktype} =~ "mac" ) \
		/def key_f13 = /sneak off %;\
		/def key_f14 = /sneak ON %;\
		/def key_f15 = /sneak TEAM %;\
		/def key_f19 = /toggleauto %;\
	/endif
/_walk_binds

/def toggleauto = \
	/if ( {auto} =~ "off" ) \
		/set auto on %;\
		/repeat -%{delay} 1 /testujwyjscia %;\
	/else \
		/set lwgo=0 %;\
		/set auto off %;\
	/endif

/def delay = \
	/if ( {1} =~ "" )\
		/echo -p #@{BC%kolor_info}#@{n}# Delay: @{BC%kolor_info}%delay@{n}%;\
	/else \
		/set delay %{*} %;\
		/echo -p #@{BC%kolor_info}#@{n}# Delay: @{BC%kolor_info}%delay@{n}%;\
	/endif

/def wns = \
	/if ( {hide} =~ "on" )\
		/send ujawnij sie %;\
	/endif%;\
	/if ( {pack} =~ "on" )\
		/zp monety %;\
	/endif%;\
	/send kup bilet%;\
	/send wejdz na statek%;\
	/if ( {pack} =~ "on" )\
		/dp monety %;\
	/endif
/alias wns /wns

/def wdyl = \
	/if ( {hide} =~ "on" )\
		/send ujawnij sie %;\
	/endif%;\
	/if ( {pack} =~ "on" )\
		/zp monety %;\
	/endif%;\
	/send wsiadz do dylizansu %;\
	/if ( {pack} =~ "on" )\
		/dp monety %;\
	/endif
/alias wdyl /wdyl

/def skroc_kierunek =\
	/eval /set v=%dlugi_kierunek%;\
	/set v=$[replace("polnocny-","n",v)]%;\
	/set v=$[replace("poludniowy-","s",v)]%;\
	/set v=$[replace("polnoc","n",v)]%;\
	/set v=$[replace("poludnie","s",v)]%;\
	/set v=$[replace("wschod","e",v)]%;\
	/set v=$[replace("zachod","w",v)]%;\
	/set v=$[replace("gore","u",v)]%;\
	/set v=$[replace("gora","u",v)]%;\
	/set v=$[replace("dol","d",v)]%;\
	/eval /set krotki_kierunek=%{v}%;\
	/set lwgo=0

/def -i statusvar2
/def -i statusvar3
/def -i status

/set autostop=0

/def idz = \
	/set lwgo=1 %;\
	/set lwlast=%{1} %;\
	/if ( {sneak} =~ "off" )\
		/send %{1} %;\
		/hide off %;\
	/elseif ( {sneak} =~ "ON" )\
		/send przemknij %{1} %;\
		/hide ON %;\
	/elseif ( {sneak} =~ "TEAM" )\
		/send przemknij z druzyna %{1} %;\
		/hide ON %;\
	/endif %;\
	/def key_nkp5
/alias idz /idz %{*}

/def lw4=\
	/for a 0 12 /eval /unset _lw%%a %;\
	/set lwcount=0%;\
	/set lw=%lw,%;\
	/set lw2=%;\
	/while (lw!~"") /lw5%; /done%;\
	/set lw2=$[strcat(_lw0,_lw1,_lw2,_lw3,_lw4,_lw5,_lw6,_lw7,_lw8,_lw9,_lw10,_lw11,_lw12)]%;\
	/set exits=$[substr(lw2,0,strlen(lw2)-1)]%;\
	/status%;\
	/checkgo

/def -mregexp -Fp2 -t'podazasz .*za .* na (.*)\\.' ide_za_kims = \
	/if ({P1} =~ "polnoc" )				/set lwlast=n%;\
	/elseif ({P1} =~ "poludnie" )			/set lwlast=s%;\
	/elseif ({P1} =~ "zachod" )				/set lwlast=w%;\
	/elseif ({P1} =~ "wschod" )				/set lwlast=e%;\
	/elseif ({P1} =~ "polnocny-zachod" )	/set lwlast=nw%;\
	/elseif ({P1} =~ "polnocny-wschod" )	/set lwlast=ne%;\
	/elseif ({P1} =~ "poludniowy-zachod" )	/set lwlast=sw%;\
	/elseif ({P1} =~ "poludniowy-wschod" )	/set lwlast=se%;\
	/elseif ({P1} =~ "gore" )				/set lwlast=u%;\
	/elseif ({P1} =~ "dol" )				/set lwlast=d%;\
	/else									/set lwlast=X%;\
	/endif

/def unnormalset = \
	/alias ww /dounnormal %{*} %%; /set lwlast=dziwne %;\
	/echo -p #@{BC%kolor_info}#@{n}# Dziwne wyjscie - @{BC%kolor_info}%{*}@{n}. %;\

/def dounnormal = \
	/if ( {sneak} =~ "ON" ) \
		/send przemknij %{*} %;\
	/elseif ( {sneak} =~ "TEAM" ) \
		/send przemknij z druzyna %{*} %;\
	/else \
		/send %{*} %;\
	/endif

/def checkgo=\
	/if (lwgo==1) \
		/if (lwcount==2) \
			/if ( {auto} =~ "on" )\
				/repeat -%{delay} 1 /testujwyjscia%;\
			/else \
				/def key_nkp10 = /testujwyjscia%;\
			/endif%;\
		/else \
			/set lwgo=0%;\
			/set auto off %;\
		/endif %;\
	 /endif

/def -p2 -t'*nie mozesz dalej podazac w tym kierunku*' lwstop0 = \
	/beep 1 %;\
	/set lwgo=0 %;\
	/set auto off

/def -p2 -t'*nie dasz rady isc w tym kierunku*' lwstop1 = \
	/beep 1 %;\
	/set lwgo=0 %;\
	/set auto off

/def -Fp2 -t'*atakuje cie*' lwstop2 = \
	/set lwgo=0 %;\
	/set auto off

/def testujwyjscia=\
	/if ((_lw0!~"") & (lwlast!~"e"))      /set lwlast=w%; w%;\
	/elseif ((_lw1!~"") & (lwlast!~"se")) /set lwlast=nw%; nw%;\
	/elseif ((_lw2!~"") & (lwlast!~"s"))  /set lwlast=n%; n%;\
	/elseif ((_lw3!~"") & (lwlast!~"sw")) /set lwlast=ne%; ne%;\
	/elseif ((_lw4!~"") & (lwlast!~"w"))  /set lwlast=e%; e%;\
	/elseif ((_lw5!~"") & (lwlast!~"nw")) /set lwlast=se%; se%;\
	/elseif ((_lw6!~"") & (lwlast!~"n"))  /set lwlast=s%; s%;\
	/elseif ((_lw7!~"") & (lwlast!~"ne")) /set lwlast=sw%; sw%;\
	/elseif ((_lw8!~"") & (lwlast!~"d"))  /set lwlast=u%; u%;\
	/elseif ((_lw9!~"") & (lwlast!~"u"))  /set lwlast=d%; d%;\
	/else \
		/beep 1 %;\
		/set lwgo=0%;\
		/set auto off %;\
	/endif%;\
	/def key_nkp5

/def -i -b'Ol' = /key_nkp+
/def key_nkp8 = /idz n
/def key_nkp2 = /idz s
/def key_nkp4 = /idz w
/def key_nkp6 = /idz e
/def key_nkp7 = /idz nw
/def key_nkp9 = /idz ne
/def key_nkp1 = /idz sw
/def key_nkp3 = /idz se
/def key_nkp+ = /idz u
/def key_nkp. = /idz d

/def -mregexp -p2 -h'SEND ^n$' = /idz n
/def -mregexp -p2 -h'SEND ^s$' = /idz s
/def -mregexp -p2 -h'SEND ^w$' = /idz w
/def -mregexp -p2 -h'SEND ^e$' = /idz e
/def -mregexp -p2 -h'SEND ^nw$' = /idz nw
/def -mregexp -p2 -h'SEND ^ne$' = /idz ne
/def -mregexp -p2 -h'SEND ^sw$' = /idz sw
/def -mregexp -p2 -h'SEND ^se$' = /idz se
/def -mregexp -p2 -h'SEND ^d$' = /idz d
/def -mregexp -p2 -h'SEND ^u$' = /idz u

/def sneak = \
	/if ( {1} =~ NULL )\
		/echo -p #@{BC%kolor_info}#@{n}# Przemykanie: @{BC%kolor_info}%sneak@{n}%;\
	/elseif ( {1} =~ "off" ) \
		/set sneak %{1} %;\
		/status_edit -r1 sneak:4:BC%{kolor_main} %;\
	/elseif ( {1} =~ "ON" ) \
		/set sneak %{1} %;\
		/status_edit -r1 sneak:4:BC%{kolor_alarm} %;\
	/elseif ( {1} =~ "TEAM" ) \
		/set sneak %{1} %;\
		/status_edit -r1 sneak:4:BC%{kolor_alarm} %;\
	/endif

/def hide = \
	/if ( {1} =~ NULL )\
		/echo -p #@{BC%kolor_info}#@{n}# Ukrycie: @{BC%kolor_info}%hide@{n}%;\
	/elseif ( {1} =~ "off" ) \
		/set hide %{1} %;\
		/status_edit -r1 hide:3:BC%{kolor_main} %;\
	/elseif ( {1} =~ "ON" ) \
		/set hide %{1} %;\
		/status_edit -r1 hide:3:BC%{kolor_alarm} %;\
	/endif

/def -mregexp -Fp2 -t'Chowasz sie .* potrafisz' hideon0 = /hide ON
/def -mregexp -Fp2 -t'Nie potrafisz ukryc sie jeszcze bardziej' hideon1 = /hide ON
/def -E(hide=~"off") -mregexp -Fp2 -t'Podazasz skradajac sie za ' hideon2 = /hide ON
/def -mregexp -Fp2 -t'.* ujawnia cie.*' hideoff0 = /hide off
/def -mregexp -Fp2 -t'Nie jestes juz schowan.' hideoff1 = /hide off
/def -mregexp -Fp2 -t'Nie jestes w stanie sie tu dobrze schowac' hideoff2 = /hide off
/def -mregexp -Fp2 -t'Wychodzisz z ukrycia' hideoff3 = /hide off
/def -mregexp -Fp2 -t'Przeciez nie jestes ukryt' hideoff4 = /hide off
/def -mregexp -Fp2 -t'Jest tu zbyt ciezko sie schowac' hideoff5 = /hide off
/def -E(hide=~'ON') -mregexp -Fp2 -t'Podazasz za ' hideoff6 = /hide off
/def -mregexp -Fp2 -t'Nie jestes w stanie wymknac' sneakoff0 = /sneak off
/def -mregexp -Fp2 -t'Nie jestes dowodca zadnej druzyny.' sneakoff1 = /sneak ON

