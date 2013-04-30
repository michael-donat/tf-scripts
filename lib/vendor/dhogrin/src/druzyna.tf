/def -Fp400 -mregexp -t'Dolaczasz do druzyny (.*)\. Od teraz jej sklad stanowicie (.*)\.' _druzyna_dolaczanie_trigger = \
  /_druzyna_lap_sklad %{P2}%; \
  /_walka_druzyna_update%; \
  /_walka_cooldown_rozkaz 30

/def -Fp400 -mregexp -t' dolacza do twojej druzyny\. Od teraz jej sklad stanowicie (.*)\.' _druzyna_dolaczanie_trigger_2 = \
  /_druzyna_lap_sklad %{P1}%; \
  /_walka_druzyna_update%; \
  /_walka_cooldown_rozkaz 30
  
  
/def -Fp400 -mregexp -t'^Druzyne prowadzi (.*), zas ty jestes jej jedynym czlonkiem\.' _druzyna_lap_sklad_1 = \
  /set druzyna_L=$[tolower({P1})]%; \
  /let __druzyna=ty, %{P1}%; \
  /_druzyna_lap_sklad %{__druzyna}

/def -Fp400 -mregexp -t'^Druzyne prowadzi (.*) i oprocz ciebie (jest|sa) w niej jeszcze(|:) (.*)\.' _druzyna_lap_sklad_2 = \
  /set druzyna_L=$[tolower({P1})]%; \
  /let __druzyna=ty, %{P1}, %{P4}%; \
  /_druzyna_lap_sklad %{__druzyna}
  
/def -Fp400 -mregexp -t'^Przewodzisz druzynie, w ktorej oprocz ciebie (jest jeszcze|sa(| w niej) jeszcze:) (.*)\.$' _druzyna_lap_sklad_3 = \
  /set druzyna_L=%{myName}%; \
  /let __druzyna=ty, %{P3}%; \
  /_druzyna_lap_sklad %{__druzyna}
  
/def -Fp400 -mregexp -t' przekazuje ci prowadzenie druzyny\.' _druzyna_lap_dowodce = \
  /set druzyna_L=%{myName}%; \
  /_walka_cooldown_rozkaz 30
  
/def -p400 -mregexp -t'(Nie jestes w zadnej druzynie\.|Porzucasz druzyne, ktorej przewodziles\.|Porzucasz swoja druzyne\.| rozwiazuje druzyne\.)' _druzyna_lap_pusta = \
  /_druzyna_wyczysc
  
  
/def _druzyna_wyczysc = \
  /set druzyna_M=%; \
  /set druzyna_B=%; \
  /set druzyna_N=%; \
  /set druzyna_D=%; \
  /set druzyna_L=
  
  
/def _druzyna_lap_sklad = \
  /set druzyna_M $[tolower(substr(replace(", ", "|", replace(" i ", "|", {*})), 3))]%; \
  /_druzyna_odmien%; \
  /_walka_druzyna_update
;  /echo Zlapane: %{*}%; \
;  /echo Druzyna_M: %{druzyna_M}%; \
;  /echo Druzyna_B: %{druzyna_B}%; \
;  /echo Druzyna_N: %{druzyna_N}%; \
;  /echo Druzyna_D: %{druzyna_D}

/def _druzyna_odmien = \
  /unset druzyna_B%; \
  /unset druzyna_N%; \
  /unset druzyna_D%; \
  /let __string=$[strcat(replace(".", "|", replace(", ", "|", replace(" i ", "|", {druzyna_M}))),"|")]%; \
  /while ({__string}!~"") \
    /let __odmieniac=1%; \
    /let __p=$[strstr({__string}, "|")]%; \
    /let __substring=$[substr({__string},0,{__p})]%; \
    /if ({__substring}=/"statua*") \
      /let __odmieniac=0%; \
    /endif%; \
    /if ({__odmieniac}==1) \
      /let __name=$(/odmien_M_B %{__substring})%; \
      /set druzyna_B=$[strcat({druzyna_B}, "|", {__name})]%; \
      /let __name=$(/odmien_M_N %{__substring})%; \
      /set druzyna_N=$[strcat({druzyna_N}, "|", {__name})]%; \
      /let __name=$(/odmien_M_D %{__substring})%; \
      /set druzyna_D=$[strcat({druzyna_D}, "|", {__name})]%; \
    /endif%; \
    /let __string=$[substr({__string},{__p}+1)]%; \
  /done%; \
  /set druzyna_B=$[substr({druzyna_B}, 1)]%; \
  /set druzyna_N=$[substr({druzyna_N}, 1)]%; \
  /set druzyna_D=$[substr({druzyna_D}, 1)]
  
/def _is_team_member = \
  /if (strstr({druzyna_M}, {1})>=0) \
    /return 1%; \
  /else \
    /return 0%; \
  /endif
  
/def _is_team_member_B = \
  /if (strstr({druzyna_B}, {1})>=0) \
    /return 1%; \
  /else \
    /return 0%; \
  /endif
  
/def _is_team_member_D = \
  /if (strstr({druzyna_D}, {1})>=0) \
    /return 1%; \
  /else \
    /return 0%; \
  /endif
  
/def -mregexp -t' (przybywaja|przybywa) za toba' _druzyna_przybywa_za_mna = \
  /set przybyli=$[tolower(replace(", ","|", replace(" i ", "|", {PL})))]%; \
  /set LostToCheck=%{druzyna_M}|%; \
  /CheckIfSome1Lost
    
/def CheckIfSome1Lost = \
  /set Zagubieni=%; \
  /set IluBrakuje=0%; \
  /while (LostToCheck !~ "") \
    /let __pp=$[strstr({LostToCheck},"|")]%;\
    /set OneLostGuy=$[substr({LostToCheck},0,__pp)]%;\
    /if (strstr({przybyli},{OneLostGuy})<0)\
      /addtl %{OneLostGuy}%;\
    /endif%;\
    /set LostToCheck=$[substr({LostToCheck},{__pp}+1)]%;\
  /done%;\
  /if (Zagubieni !~ NULL) /echo -p @{}           @{BCred}BRAKUJE %{IluBrakuje}: @{BCblue}%{Zagubieni}%; /endif

/def addtl = \
  /set IluBrakuje=$[{IluBrakuje}+1]%; \
  /set Brakujacy=$[toupper({*},1)]%; \
  /if ({Zagubieni}=~NULL) \
    /set Zagubieni=%{Brakujacy}%; \
  /else \
    /set Zagubieni=%{Zagubieni}, %{Brakujacy}%; \
  /endif


