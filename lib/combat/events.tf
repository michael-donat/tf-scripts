
/def -mregexp -t'.* wskazuje (.*) jako cel ataku.' _combat_event_set_attack_target = \
    /let target=%{P1}%;\
    /set _combat_attack_target=$(/odmien_B_M %{P1})%;\
    /test _combat_prompt_attack({target})

/def -mregexp -t'.* wydaje ci rozkaz ataku na (.*).' _combat_event_set_attack_target_from_order = \
    /let target=%{P1}%;\
    /set _combat_attack_target=$(/odmien_B_M %{P1})%;\
    /test _combat_prompt_attack({target})

/def -mregexp -t'(.*) spoglada morderczo na (.*).' _combat_event_set_attack_target_by_killer_look = \
    /if ({P1}=~{_team_leader}) \
        /let target=%{P1}%;\
        /set _combat_attack_target=$(/odmien_B_M %{P2})%;\
        /test _combat_prompt_attack({target})%;\
    /endif

/def -mregexp -t'.* wskazuje (.*) jako cel obrony.' _combat_event_set_defence_target = \
    /let target=%{P1}%;\
    /if ({P1}=~"ciebie") \
        /set _combat_defence_target=TY%;\
    /else \
        /set _combat_defence_target=$(/odmien_B_M %{P1})%;\
        /test _combat_prompt_defence({target})%;\
    /endif

/def -mregexp -t'(.*) spoglada opiekunczo na (.*).' _combat_event_set_defence_target_by_killer_look = \
    /if ({P1}=~{_team_leader}) \
        /let target=%{P1}%;\
        /if ({target}=~"ciebie") \
            /set _combat_defence_target=TY%;\
        /else \
            /set _combat_defence_target=$(/odmien_B_M %{target})%;\
            /test _combat_prompt_defence({target})%;\
        /endif%;\
    /endif



/def -mregexp -Fp2 -t'(Powoli osuwasz sie na ziemie|Potem robi sie ciemno|Sila uderzania zamroczyla cie|czujesz, ze tracisz przytomnosc|Nagle czujesz jak na glowe spada ci ciezki sznur|Nagle czujesz, ze tracisz kontrole nad swym cialem| wali cie na odlew)' _combat_event_stun = \
	/let label=$[strcat(decode_attr(" --*  OGLUSZENIE *-- ", "BCbgblue"), "  ")]%;\
	/test _fast_bind_set({label}, "")

/def -mregexp -p2 -t'(Powoli dochodzisz do siebie|Czujesz jak slabosc po zadanym ciosie w glowe mija|Udaje ci sie uwolnic z sieci|Powoli odzyskujesz swobode ruchow)' _combat_event_nostun = \
	/_fast_bind_clear

/def -mregexp -Fp2 -t'(.* wytraca ci (.*) z (rak|reki)|Uderzenie jest tak silne, ze bezwiednie puszczasz|zakleszczajac lewakiem twoj .* Czujesz potezne szarpniecie)' _combat_event_disarm = \
    /let label=$[strcat(decode_attr(" --*  WYTRACENIE *-- ", "BCbgred"), "  ")]%;\
    /test _fast_bind_set({label},"")

/def -mregexp -p2 -t'((probujesz|muskasz|ranisz|masakrujesz) .* (noga|stopa|lokciem|piescia|kolanem)|Bol .* staje sie mniej odczuwalny.|lecac lagodnym lukiem, laduje na ziemi obok ciebie)' _combat_event_no_weapon = \
    /let label=$[strcat(decode_attr(" DOBADZ BRONI -- F1  ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "db", 1)

/def -p1 -mregexp -t'(.*) atakuje cie!' _combat_event_attacks_me = \
    /substitute -p @{Crgb015} >>@{Crgb530} %{P1}@{Crgb015} << @{Cred}ATAKUJE@{Crgb015} >> @{Crgb140}CIEBIE @{Crgb015}<<



/def -p20 -mregexp -t'(.*) zrecznie zaslania (.*) przed ciosami (.*).' _combat_event_cover = \
    /let who=%{P1}%;\
    /let whom_B=%{P2}%;\
    /let from=%{P3}%;\
    /let whom=$(/odmien_B_M %{whom_B})%;\
    /if ({_combat_attack_target}=~{whom}) \
        /test _combat_prompt_guard_break({whom_B})%;\
    /endif%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    \
    /substitute -p >   %{who} @{Crgb145}zaslania@{n} %{whom} @{Cgray13}przed ciosami@{Crgb530} %{from}

/def -p20 -mregexp -t'(.*) rzuca sie na (.*) przebijajac sie przez (jego|jej) ochrone.' _combat_event_cover_break = \
    /let who=%{P1}%;\
    /let whom_B=%{P2}%;\
    /let whom=$(/odmien_B_M %{P2})%;\
    /let whom_D=$(/odmien_M_D %{whom})%;\
    /if ({_combat_defence_target}=~{whom}) \
        /test _combat_prompt_defence_with_order({whom_B})%;\
    /endif%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /let whom=$[decode_attr($(/ucfirstname %{whom_D}), $(/_team_get_name_color %{whom}))]%;\
    /substitute -p >   %{who} @{Crgb145}przebil ochrone@{n} %{whom}

/def -p20 -mregexp -t'(.*) probuje zaslonic (.*) przed ciosami (.*), jednak nie jest w stanie tego uczynic.' _combat_event_cover_failed = \
    /let who=%{P1}%;\
    /let whom_B=%{P2}%;\
    /let from=%{P3}%;\
    /let whom=$(/odmien_B_M %{whom_B})%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    \
    /substitute -p >   %{who} @{Cgray13}probuje zaslonic@{n} %{whom} @{Cgray13}przed ciosami@{Crgb530} %{from}

/def -p20 -mregexp -t'(.*) rzuca sie na (.*), bezskutecznie probujac przebic sie przez (jego|jej) ochrone.' _combat_event_cover_break_faled = \
    /let who=%{P1}%;\
    /let whom_B=%{P2}%;\
    /let whom=$(/odmien_B_M %{P2})%;\
    /let whom_D=$(/odmien_M_D %{whom})%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /let whom=$[decode_attr($(/ucfirstname %{whom_D}), $(/_team_get_name_color %{whom}))]%;\
    /substitute -p >   %{who} @{Cgray13}nie moze przebic ochrony@{n} %{whom}

/def -p20 -mregexp -t'(.*) probuje zaatakowac (.*), lecz (.*) zagradza (mu|jej) droge.' _combat_event_unable_to_attack = \
    /let who=%{P1}%;\
    /let whom_B=%{P2}%;\
    /let blocking=%{P3}%;\
    /let whom=$(/odmien_B_M %{whom_B})%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    \
    /substitute -p >   %{who} @{Crgb145}atakuje@{n} %{whom} @{Cgray13}ale@{Crgb530} %{blocking}@{Cgray13} blokuje mu droge

/def -p20 -mregexp -t'(.*) probuje wesprzec (.*) w walce z (.*), lecz (.*) zagradza (mu|jej) droge.' _combat_event_unable_to_support = \
    /let with_B=%{P2}%;\
    /let who=%{P1}%;\
    /let whom_B=%{P3}%;\
    /let blocking=%{P4}%;\
    /let whom=$(/odmien_B_M %{whom_B})%;\
    /let with=$(/odmien_B_M %{with_B})%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /let with=$[decode_attr({with_B}, $(/_team_get_name_color %{with}))]%;\
    \
    /substitute -p >   %{who} @{Crgb145}chce wesprzec@{n} %{with}@{Cgray13} w walce z @{n}%{whom} @{Cgray13}ale@{Crgb530} %{blocking}@{Cgray13} blokuje mu droge

/def t = \
/showme Varriz probuje zaatakowac tegiego butnego mezczyzne, lecz dlugoreki czarnowlosy mezczyzna zagradza mu droge.%;\
/showme Ravena probuje wesprzec Hunverta w walce z klekoczacym strasznym kosciotrupem, lecz gnijacy martwy mezczyzna zagradza jej droge.%;\
/showme Dhogrin rzuca sie na postawna burkliwa kobiete, bezskutecznie probujac przebic sie przez jej ochrone.%;\
/showme Dhogrin rzuca sie na postawna burkliwa kobiete przebijajac sie przez jej ochrone.%;\
/showme Dhogrin zrecznie zaslania postawna burkliwa kobiete przed ciosami Raveny.%;\
/showme Dhogrin zrecznie zaslania postawna burkliwa kobiete przed ciosami wrogow.%;\
/showme Grodo probuje zaslonic postawna burkliwa kobiete przed ciosami okrutnego kobolda, jednak nie jest w stanie tego uczynic.
