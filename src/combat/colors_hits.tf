
;------------------------------------------------------------------------
;			    ENEMY HITS ME - BASIC
;------------------------------------------------------------------------

/set _create_trigger_list=ledwo muska cie|lekko rani cie|rani cie|powaznie rani cie|bardzo ciezko rani cie|masakruje cie|
/set _create_trigger_trigger_prefix=_combat_incoming_trigger
/set _create_trigger_trigger_name=_combat_incoming_process
/set _create_trigger_match_prefix=^([A-z]+ |[A-z]+ [a-z]+ |[A-z]+ [a-z]+ [a-z]+ )
;above will autogenerate basic triggers

/_create_trigger

/def _combat_incoming_process = \
    /if ({1} > 3) \
        /set tmp_color=Crgb500%;\
    /else \
        /set tmp_color=Crgb520%;\
    /endif%;\
    /set tmp_text=[ $[strrep("#", %{1})]$[strrep(" ", 6-%{1})] ] - %{2}%;\
    /set tmp_test=$[decode_attr({tmp_text},{tmp_color})]%;\
    /substitute %{tmp_test}

/def -t'* zostaje wyparowany *' -p15 _combat_incoming_trigger_parry_1 = \
    /substitute -p @{Crgb025}[  PARRY ] - %{*}

/def -t'* lecz tobie udaje sie go sparowac *' -p15 _combat_incoming_trigger_parry_2 = \
    /substitute -p @{Crgb025}[  PARRY ] - %{*}

/def -t'* lecz tobie udaje sie uniknac *' -p15 _combat_incoming_trigger_dodge_1 = \
    /substitute -p @{Crgb025}[  DODGE ] - %{*}

/def -t'* lecz tobie udaje sie oslonic *' -p15 _combat_incoming_trigger_cover_1 = \
    /substitute -p @{Crgb025}[ SHIELD ] - %{*}

;------------------------------------------55------------------------------
;			    I HIT ENEMY - BASIC
;------------------------------------------------------------------------

/set _create_trigger_list=Ledwo muskasz|Lekko ranisz|Ranisz|Powaznie ranisz|Bardzo ciezko ranisz|Masakrujesz|
/set _create_trigger_trigger_prefix=_combat_outgoing_trigger
/set _create_trigger_trigger_name=_combat_outgoing_process
;above will autogenerate basic triggers

/_create_trigger

/def _combat_outgoing_process = \
    /substitute -p @{Crgb150}[ $[strrep("#", %{1})]$[strrep(" ", 6-%{1})] ] - %{2}

/def -t'* unika twego ciosu' -p15 _combat_outgoing_trigger_dodge_1 = \
    /substitute -p @{Crgb152}[  DODGE ] - %{*}

/def -t'Nie udaje ci sie trafic *' -p15 _combat_outgoing_trigger_miss_1 = \
    /substitute -p @{Crgb152}[  MISS  ] - %{*}

;Probujesz trafic okrutnego goblina ciezkim krotkim toporem, lecz ten unika twojego ciosu.
;Wykonujesz zamaszyste ciecie ciezkim krotkim toporem mierzac w agresywnego goblina, lecz ten zbija je z lini ataku

;------------------------------------------------------------------------
;			    I HIT ENEMY - GP SPEC
;------------------------------------------------------------------------

/set _create_trigger_list=ledwo muskajac|lekko raniac|raniac|powaznie raniac|bardzo ciezko raniac|masakrujac|
/set _create_trigger_trigger_prefix=_combat_outgoing_spec_trigger
/set _create_trigger_trigger_name=_combat_outgoing_spec_process
/set _create_trigger_match_prefix=Wykorzystujac dogodny moment wyprowadzasz celne (.*),\s
/set _create_trigger_match_suffix=\s(go|ja)

/_create_trigger

/def _combat_outgoing_spec_process = \
    /substitute -p @{Cgreen}[GP SPEC] [ $[strrep("#", %{1})]$[strrep(" ", 6-%{1})] ] - %{2}