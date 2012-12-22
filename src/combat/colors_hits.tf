
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
    /set tmp_text=$[decode_attr({tmp_text},{tmp_color})]%;\
    /substitute %{tmp_text}

/def -t'* zostaje wyparowany *' -p15 _combat_incoming_trigger_parry_1 = \
    /substitute -p @{Crgb025}[  PARRY ] - %{*}

/def -t'* lecz tobie udaje sie go sparowac *' -p15 _combat_incoming_trigger_parry_2 = \
    /substitute -p @{Crgb025}[  PARRY ] - %{*}

/def -t'* lecz tobie udaje sie uniknac *' -p15 _combat_incoming_trigger_dodge_1 = \
    /substitute -p @{Crgb025}[  DODGE ] - %{*}

/def -t'* lecz tobie udaje sie oslonic *' -p15 _combat_incoming_trigger_cover_1 = \
    /substitute -p @{Crgb025}[ SHIELD ] - %{*}

/def -t'* nie udaje sie trafic ciebie *' -p15 _combat_incoming_trigger_miss_1 = \
    /substitute -p @{Crgb025}[  MISS  ] - %{*}

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

/def -t'Probujesz trafic *' -p15 _combat_outgoing_trigger_miss_2 = \
    /substitute -p @{Crgb152}[  MISS  ] - %{*}

/def -t'Wykonujesz zamaszyste * zbija je*' -p15 _combat_outgoing_trigger_parry_1 = \
    /substitute -p @{Crgb152}[  PARRY ] - %{*}

/def -T'Wykonujesz zamaszyste ciecie * oslania sie *' _combat_outgoing_trigger_parry_2 = \
    /substitute -p @{Crgb152}[ SHIELD ] - %{*}


;------------------------------------------------------------------------
;			    I HIT ENEMY - GP SPEC
;------------------------------------------------------------------------

/set _create_trigger_list=ledwo muskajac|lekko raniac|raniac|powaznie raniac|bardzo ciezko raniac|masakrujac|
/set _create_trigger_trigger_prefix=_combat_outgoing_spec_trigger
/set _create_trigger_trigger_name=_combat_outgoing_spec_process
/set _create_trigger_match_prefix=Wyprowadzasz szybkie pchniecie (.*),\s
/set _create_trigger_match_suffix=\s(go|ja|je)

/_create_trigger

/def _combat_outgoing_spec_process = \
    /substitute -p @{Crgb150}[ $[strrep("#", %{1})]$[strrep(" ", 6-%{1})] ] [ GP  SPEC ] - %{2}

/def -t'Wykorzystujac dogodny moment probujesz wyprowadzic celne *' -p15 _combat_outgoing_spec_trigger_dodge_1 = \
    /substitute -p @{Crgb152}[  DODGE ] [ GP  SPEC ] - %{*}

/def -t'Wykorzystujac dogodny moment wyprowadzasz celne * zbija cios *' -p15 _combat_outgoing_spec_trigger_parry_1 = \
    /substitute -p @{Crgb152}[  PARRY ] [ GP  SPEC ] - %{*}

/def -t'Wykorzystujac dogodny moment wyprowadzasz celne * oslania sie *' -p15 _combat_outgoing_spec_trigger_parry_2 = \
    /substitute -p @{Crgb152}[ SHIELD ] [ GP  SPEC ] - %{*}

;------------------------------------------------------------------------
;			    I HIT ENEMY - WKS SPEC
;------------------------------------------------------------------------

/set _create_trigger_list_separator=+
/set _create_trigger_list=(pozostawiajac ledwie sinca|ledwie zahaczajac)+(pozostawiajac krwawiace zadrapanie|lekko raniac)+(pozostawiajac dluga, poszarpana rane|mocno raniac)+(pozostawiajac gleboka rane z wystajacymi na wierzchu tkankami|bardzo mocno raniac)+zadajac smiertelne obrazenia+
/set _create_trigger_trigger_prefix=_combat_outgoing_spec_wks_trigger
/set _create_trigger_trigger_name=_combat_outgoing_spec_wks_process
/set _create_trigger_match_prefix=Wykorzystujac brak broni u przeciwnika,(.*)\. Wypracowanym uderzeniem ([^,]+),\s

/_create_trigger

/def _combat_outgoing_spec_wks_process = \
    /substitute -p @{Crgb150}[ $[strrep("#", %{1})]$[strrep(" ", 5-%{1})] ] [ WKS SPEC ] - %{2}

/def -t'Szybkim niczym mysl ruchem * wytracasz *' -p15 _combat_outgoing_spec_wks_1 = \
    /substitute -p @{Crgb414}[ DISARM ] [ WKS SPEC ] - %{*}

/def -t'Slamazarnym wymachem * probujesz wytracic *' -p15 _combat_outgoing_spec_wks_2 = \
    /substitute -p @{Crgb414}[  FAIL  ] [ WKS SPEC ] - %{*}

/def -t'Wyprowadzasz szybkie pchniecie * zbija je z linii ataku *' -p15 _combat_outgoing_spec_wks_parry_1 = \
    /substitute -p @{Crgb152}[  PARRY ] [ WKS SPEC ] - %{*}


;Wykorzystujac brak broni u przeciwnika, w mgnieniu oka wyprowadzasz cios runiczna dluga halabarda mierzac w potwornego wysokiego goblina. Nieznacznie tracisz rownowage, gdy twoja bron ze swistem przecina powietrze po jego udanym uniku.
;Wykorzystujac brak broni u przeciwnika, w mgnieniu oka wyprowadzasz cios runiczna dluga halabarda mierzac w jaskiniowego ogromnego trolla. Nieznacznie tracisz rownowage, gdy twoja bron ze swistem przecina powietrze po jego udanym uniku.
;Wykorzystujac brak broni u przeciwnika, blyskawicznie wyprowadzasz cios adamantytowa szpiczasta partyzana mierzac w brodatego pukacza. Nieznacznie tracisz rownowage, gdy twoja bron ze swistem przecina powietrze po jego udanym uniku.

