; /druzyna
; /kk - kondycja wszystkuch

;-------- TEMP
/def _bind_kb_key_nkpDivide = k wszystkich
/def _bind_kb_key_nkpEquals=ws

/def zaslon = \
    /if ({2} =~ "") \
        /send zaslon %{1}%;\
    /else \
        /send zaslon %{1} przed %{2} %{3} %{4}%;\
    /endif

/alias z /zaslon %{*}
/alias zz /send przestan zaslaniac
/alias zzz /send przestan kryc sie za zaslona

/alias kk k wszystkich
/alias ll zerknij
/alias ls sp
/alias mm wez monety z plecaka
/alias mmm wloz monety do plecaka
/alias wk wez monety z ciala
/alias koks napij sie z buklaka%;stan

/alias ' jpowiedz %{*}
/alias '' powiedz %{*}

/def naprawa = \
    /send zaloz wszystkie zbroje%;\
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
     /purge \_trigger\_equip\_napraw

/def lec = n%; wejdz w szczeline%; e%; e%; ob dostojnego goblina%; w%; w%; s%; s

/def zas = \
    /def key_f13 = z %{1}%;\
    /def key_f14 = z %{2}%;\
    /def key_f15 = z %{3}

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