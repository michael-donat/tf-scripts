;------------------------------------------------------------------------
;			   ... ZLICZANIE ... 				  |
;------------------------------------------------------------------------

/def -Fp200 -mregexp -t'(skradajac sie | )(przybywa|podaza)(ja|) (?!za)' _przybywanie_licz = \
  /test _podlicz_przybywajacych({PL},{PL},{P0},{PR},0)
  
/def -Fp200 -mregexp -t'Wraz z (.*) podazasz( skradajac sie|) za ' _przybywanie_licz_2 = \
  /test _podlicz_przybywajacych({P1},{PL},{P0},{PR},2)
  
/def -Fp200 -mregexp -t' przybywa(|ja) za toba ' _przybywanie_licz_3 = \
  /test _podlicz_przybywajacych({PL},{PL},{P0},{PR},1)

/def -Fp200 -mregexp -t'Podazasz (skradajac sie |)za ' _przybywanie_licz_4 = \
  /test _podlicz_przybywajacych("Wynik rowny dwa, poprosze!",{PL},{P0},{PR},0)
  
/def -mregexp -F -t'( przybywa | przybywaja )(?!za toba)' _ktosik_przybywa = /substitute -p %{PL}@{BCyellow}$[toupper({P1})]@{n}%{PR}
/def -mregexp -F -t'( podaza | podazaja )' _ktosik_podaza = /substitute -p %{PL}@{BCyellow}$[toupper({P1})]@{n}%{PR}
  
/def _podlicz_przybywajacych = \
  /let __ile=$[_count_people(strcat({1},"."))+{5}]%; \
  /substitute -p @{nCblue}[ @{nBCwhite}%{__ile}@{nCblue} ] @{n}%{2}%{3}%{4}

;------------------------------------------------------------------------
;		   ... CHODZENIE NA NUMERYCZNEJ ... 			  |
;------------------------------------------------------------------------

/set _movement=1
/set _movement_tryb=0
/set _kompas=0

/def m = \
  /set _movement=1%; \
  /echo Wlaczono chodzenie na numerycznej.

/def t = \
  /set _movement=0%; \
  /echo Wylaczono chodzenie na numerycznej.

/def key_nkp0 = /_move_lazik
/def key_nkp5 = spojrz
/def key_nkp1 = /_move sw
/def key_nkp2 = /_move s
/def key_nkp3 = /_move se
/def key_nkp4 = /_move w
/def key_nkp6 = /_move e
/def key_nkp7 = /_move nw
/def key_nkp8 = /_move n
/def key_nkp9 = /_move ne
/def key_nkp, = /_move d
/def key_nkp- = /_move u
/def key_nkp. = zmeczenie
/def key_nkpEnt = /x

/def key_nkp/ = \
  /set _movement_tryb=$[mod({_movement_tryb}+1,3)]%; \
  /if ({_movement_tryb}==0) \
    /echo Wybrano zwykle chodzenie na numerycznej.%; \
  /elseif ({_movement_tryb}==1) \
    /echo Wybrano skradanie sie na numerycznej.%; \
  /elseif ({_movement_tryb}==2) \
    /echo Wybrano skradanie sie z druzyna na numerycznej.%; \
  /endif

/def _move = \
  /let __dir=%{*}%; \
  /if ({_movement}==1 & {_kompas}==1) \
    sprawdz kierunki%; \
  /endif%; \
  /if ({_movement}==1 & {_movement_tryb}==0) \
    %{__dir}%; \
  /elseif ({_movement}==1 & {_movement_tryb}==1) \
    przemknij %{__dir}%; \
  /elseif ({_movement}==1 & {_movement_tryb}==2) \
    przemknij z druzyna %{__dir}%; \
  /endif
  
/def _move_lazik = \
  /if ({_movement}==1) \
    /_move_lazik_do%; \
  /endif
  
/def _move_lazik_do = idz