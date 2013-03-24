
;--------------------------------------------------------
; GWIAZDKA -> I HIT ENEMY
;--------------------------------------------------------

/set _create_trigger_list=Wyprowadzasz potezny cios swym gwiezdnym toporem .* niewielki blysk swiatla swiadczy, ze zaledwie drasnales|Swist i blysk rozpraszanej energii .* twym gwiezdnym toporem mimo, iz zadales niewielkie obrazenia|Blask tysiecy gwiazd i glosny swist towarzysza .* gwiezdnym toporem, zadajac spore obrazenia i zalewajac ostrze posoka|Plynnym kolistym ruchem godzisz .* swym gwiezdnym toporem|Lsniace ostrze twego gwiezdnego topora zakresla szeroki luk, .* zadajac ogromne obrazenia|
/set _create_trigger_trigger_prefix=_combat_outgoing_weapon_gwiazdka_trigger
/set _create_trigger_trigger_name=_combat_outgoing_weapon_gwiazdka_process
;above will autogenerate basic triggers

/_create_trigger

/def _combat_outgoing_weapon_gwiazdka_process = \
    /substitute -p @{Cgreen}[GWIAZDKA] [ $[strrep("#", %{1})]$[strrep(" ", 5-%{1})] ] - %{2}