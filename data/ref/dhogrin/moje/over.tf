
;-----------------------------------------------
;           MAC NUM PAD
;-----------------------------------------------
/def key_nkp0 = /_bind_kb_key_nkp0
/def key_nkp. = /_bind_kb_key_nkpDot
/def key_nkpEnt = /_bind_kb_key_nkpEnt
/def key_nkp+ = /_bind_kb_key_nkpPlus
/def key_nkp- = /_bind_kb_key_nkpMinus

/def key_nkp1 = /_bind_kb_key_nkp1
/def key_nkp2 = /_bind_kb_key_nkp2
/def key_nkp3 = /_bind_kb_key_nkp3
/def key_nkp4 = /_bind_kb_key_nkp4
/def key_nkp5 = /_bind_kb_key_nkp5
/def key_nkp6 = /_bind_kb_key_nkp6

/def key_nkp7 = /_bind_kb_key_nkp7
/def key_nkp8 = /_bind_kb_key_nkp8
/def key_nkp9 = /_bind_kb_key_nkp9

/def key_nkp/ = /_bind_kb_key_nkpDivide

/def key_nkp* = /_bind_kb_key_nkpTimes

/~keyseq nkpEq		^[OX

/def key_nkpEq = /_bind_kb_key_nkpEquals

;-----------------------------------------------
;           NUM PAD MACROS
;-----------------------------------------------

/def _bind_kb_key_nkpEnt    = /dokey NEWLINE
/def _bind_kb_key_nkpPlus   = /send wesprzyj

/def _bind_kb_key_nkp1      = /_movement_go_sw
/def _bind_kb_key_nkp2      = /_movement_go_s
/def _bind_kb_key_nkp3      = /_movement_go_se
/def _bind_kb_key_nkp4      = /_movement_go_w
/def _bind_kb_key_nkp6      = /_movement_go_e
/def _bind_kb_key_nkp7      = /_movement_go_nw
/def _bind_kb_key_nkp8      = /_movement_go_n
/def _bind_kb_key_nkp9      = /_movement_go_ne
/def _bind_kb_key_nkp0      = /_movement_go_down
/def _bind_kb_key_nkpDot    = /_movement_go_up
/def _bind_kb_key_nkpMinus  = /_movement_go_exit

/def _bind_kb_key_nkp5      = /send zerknij


/def _movement_go_sw    = /_movement_go_exec sw
/def _movement_go_s     = /_movement_go_exec s
/def _movement_go_se    = /_movement_go_exec se
/def _movement_go_w     = /_movement_go_exec w
/def _movement_go_e     = /_movement_go_exec e
/def _movement_go_nw    = /_movement_go_exec nw
/def _movement_go_n     = /_movement_go_exec n
/def _movement_go_ne    = /_movement_go_exec ne
/def _movement_go_down  = /_movement_go_exec d
/def _movement_go_up    = /_movement_go_exec u
/def _movement_go_exit  = /_movement_go_exec wyjscie

/def _movement_go_exec =    \
\
    %{1}


/def -mregexp -t'(Sa|Jest) tutaj [a-z]+ widocz[a-z]+ wyjsc[a-z]*: ([^.]+)\.' = \
    /set tmp_text=$[replace(" i ", ", ", {P2})]%;\
    /substitute -p @{BCyellow} ==  @{BCgreen}%{tmp_text}

/def key_f18 = /send stan

/def dell = \
  przestan walczyc%; \
  opusc bron%; \
  otworz pierwszy przytroczony woreczek%; \
  wez zolty jasny kwiat z niego%; \
  zjedz zolty jasny kwiat%; \
  dobadz jednorecznego topora%; \
  zamknij otwarte woreczki

/def dziur = \
  przestan walczyc%; \
  opusc bron%; \
  otworz drugi przytroczony woreczek%; \
  wez cztery czterokanciaste rozgalezione lodygi z niego%; \
  rozgryz czterokanciaste rozgalezione lodygi%; \
  dobadz jednorecznego topora%; \
  zamknij otwarte woreczki

/def topor = \
    /send wez tarcze z plecaka%;\
    /send powsun bron drzewcowa do uprzezy%;\
    /send db%;\
    /send zaloz tarcze

/def partka = \
    /send wloz tarcze do plecaka%;\
    /send zatknij topor za pas%;\
    /send ddb


/def -t'hunvert (wskazuje|spoglada morderczo na) (.*)\.' -mregexp _wspierak = \
    /repeat $[rand(0, 100)/30.0 * -1] 1 /send zabij %{P2}

/def exp_solo = \
    /def _bind_kb_key_nkpEquals = /send nap

/def exp_team = \
    /def _bind_kb_key_nkpEquals = /send ws

/def key_f17 = /send nap

/def _bind_kb_key_nkpDivide = k wszystkich
/def _bind_kb_key_nkpEquals=ws