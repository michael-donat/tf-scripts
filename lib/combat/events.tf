/load ../src/combat/colors_hits.tf
/def tests = /reload%;/test_combat_events

/def -mregexp -t'.* wskazuje (.*) jako cel ataku.' _combat_event_set_attack_target = \
    /let target=%{P1}%;\
    /set _combat_attack_target=$(/odmien_B_M %{P1})%;\
    /test _combat_prompt_attack({target})5

/def -mregexp -t'.* wskazuje (.*).' _combat_event_set_attack_target_from_pointing = \
    /if ({P1}=~{_team_leader}) \
        /let target=%{P2}%;\
        /set _combat_attack_target=$(/odmien_B_M %{P2})%;\
        /test _combat_prompt_attack({target})%;\
    /endif

/def -mregexp -t'.* wydaje ci rozkaz ataku na (.*).' _combat_event_set_attack_target_from_order = \
    /let target=%{P1}%;\
    /set _combat_attack_target=$(/odmien_B_M %{P1})%;\
    /test _combat_prompt_attack({target})

/def -mregexp -t'(.*) spoglada morderczo na (.*).' _combat_event_set_attack_target_by_killer_look = \
    /if ({P1}=~{_team_leader}) \
        /let target=%{P2}%;\
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
        /let target=%{P2}%;\
        /if ({target}=~"ciebie") \
            /set _combat_defence_target=TY%;\
        /else \
            /set _combat_defence_target=$(/odmien_B_M %{target})%;\
            /test _combat_prompt_defence({target})%;\
        /endif%;\
    /endif

/def -mregexp -t'(.*) spoglada na siebie opiekunczo.' _combat_event_set_defence_target_by_caring_look = \
    /if ({P1}=~{_team_leader}) \
        /let target=%{P1}%;\
        /set _combat_defence_target=%{target}%;\
        /let target_B=$(/odmien_M_B %{target})%;\
        /let target_B=$(/ucfirstname %{target_B})%;\
        /test _combat_prompt_defence({target_B})%;\
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


;
;##############################      ZASLONY ZASLONY      ###########################
;

/def -aLg -p20 -mregexp -t' zrecznie zaslania (.*) przed ciosami (.*)\.$$' _combat_event_cover = \
    /let who=%{PL}%;\
    /let whom_B=%{P1}%;\
    /let from=%{P2}%;\
    /if ({whom_B}=~"cie") \
        /let whom=$[decode_attr("-- CIEBIE -- ", "Crgb150")]%;\
    /else \
        /let whom=$(/odmien_B_M %{whom_B})%;\
        /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /endif%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    \
    /echo -p >   %{who} @{Crgb150}ZASLANIA@{n} %{whom} @{Cgray13}przed ciosami@{Crgb530} %{from}

/def -aLg -p25 -mregexp -t'^Na rozkaz (.*) (.*) zaslania (.*) przed ciosami (.*)\.$$' _combat_event_cover_on_order = \
    /let order=%{P1}%;\
    /let who=%{P2}%;\
    /let whom_B=%{P3}%;\
    /let from=%{P4}%;\
    /if ({whom_B}=~"cie") \
        /let whom=$[decode_attr("-- CIEBIE -- ", "Crgb150")]%;\
    /else \
        /let whom=$(/odmien_B_M %{whom_B})%;\
        /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /endif%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    \
    /echo -p >   %{who} @{Crgb150}ZASLANIA@{n} %{whom} @{Cgray13}przed ciosami@{Crgb530} %{from} -@{Crgb025} rozkaz %{order}

/def -aLg -p20 -mregexp -t' zrecznie zaslania (.*) przed twoimi ciosami\.$$' _combat_event_cover_from_me = \
    /let who=%{PL}%;\
    /let whom_B=%{P1}%;\
    /let whom=$(/odmien_B_M %{whom_B})%;\
    /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    \
    /echo -p >   %{who} @{Crgb150}ZASLANIA@{n} %{whom} @{Crgb150}-- PRZED TOBA --

/def -aLg -Fp1 -mregexp -t'^Zrecznie zaslaniasz (.*) przed ciosami (.*)\.$$' _combat_event_i_cover = \
    /let whom_B=%{P1}%;\
    /let from=%{P2}%;\
    /let whom=$(/odmien_B_M %{whom_B})%;\
    /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    \
    /echo -p >   @{Crgb150} -- TY -- ZASLANIASZ@{n} %{whom} @{Cgray13}przed ciosami@{Crgb530} %{from}

/def -aLg -Fp1 -mregexp -t'^Na rozkaz (.*) zaslaniasz (.*) przed ciosami (.*)\.$$' _combat_event_i_cover_on_order = \
    /let order=%{P1}%;\
    /let whom_B=%{P2}%;\
    /let from=%{P3}%;\
    /let whom=$(/odmien_B_M %{whom_B})%;\
    /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    \
    /echo -p >   @{Crgb150} -- TY -- ZASLANIASZ@{n} %{whom} @{Cgray13}przed ciosami@{Crgb530} %{from} -@{Crgb025} rozkaz %{order}

/def -aLg -p20 -mregexp -t' probuje zaslonic (.*) przed ciosami (.*), jednak nie jest w stanie tego uczynic\.$$' _combat_event_cover_unsuccessful = \
    /let who=%{PL}%;\
    /let whom_B=%{P1}%;\
    /let from=%{P2}%;\
    /if ({whom_B}=~"cie") \
        /let whom=$[decode_attr("-- CIEBIE -- ", "Crgb150")]%;\
    /else \
        /let whom=$(/odmien_B_M %{whom_B})%;\
        /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /endif%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    \
    /echo -p >   %{who} @{Crgb020}probuje zaslonic@{n} %{whom} @{Cgray13}przed ciosami@{Crgb530} %{from}

/def -aLg -p25 -mregexp -t'^Na rozkaz (.*) (.*) probuje zaslonic (.*) przed ciosami (.*), jednak nie jest w stanie tego uczynic\.$$' _combat_event_cover_on_order_unsuccessful = \
    /let order=%{P1}%;\
    /let who=%{P2}%;\
    /let whom_B=%{P3}%;\
    /let from=%{P4}%;\
    /if ({whom_B}=~"cie") \
        /let whom=$[decode_attr(" -- CIEBIE -- ", "Crgb150")]%;\
    /else \
        /let whom=$(/odmien_B_M %{whom_B})%;\
        /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /endif%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    \
    /echo -p >   %{who} @{Crgb020}probuje zaslonic@{n} %{whom} @{Cgray13}przed ciosami@{Crgb530} %{from} -@{Crgb025} rozkaz %{order}

/def -aLg -Fp1 -mregexp -t'^Probujesz zaslonic (.*) przed ciosami (.*), jednak nie jestes w stanie tego uczynic\.$$' _combat_event_i_cover_unsuccessful = \
    /let whom_B=%{P1}%;\
    /let from=%{P2}%;\
    /let whom=$(/odmien_B_M %{whom_B})%;\
    /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    \
    /echo -p >   @{Crgb020} -- TY -- probujesz zaslonic@{n} %{whom} @{Cgray13}przed ciosami@{Crgb530} %{from}

/def -aLg -Fp1 -mregexp -t'^Na rozkaz (.*) probujesz zaslonic (.*) przed ciosami (.*), jednak nie jestes w stanie tego uczynic\.$$' _combat_event_i_cover_on_order_unsuccessful = \
    /let order=%{P1}%;\
    /let whom_B=%{P2}%;\
    /let from=%{P3}%;\
    /let whom=$(/odmien_B_M %{whom_B})%;\
    /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    \
    /echo -p >   @{Crgb020} -- TY -- probujesz zaslonic@{n} %{whom} @{Cgray13}przed ciosami@{Crgb530} %{from} -@{Crgb025} rozkaz %{order}

;##############################      ATAKI  ATAKI      ###########################

/def -aLg -mregexp -t'^Na rozkaz (.*) rzuca sie do ataku na ciebie!' _combat_event_attacks_me_on_order = \
    /echo -p >   @{Crgb025}Z rozkazu %{P1} @{Crgb500}ATAKUJE @{Crgb150}-- CIEBIE! --

/def -aLg -mregexp -t'^([a-z\s]*) atakuje (.*)(?:\.|!)$$' _combat_event_attacks = \
    /let who=%{P1}%;\
    /let whom_B=%{P2}%;\
    /if ({whom_B}=~"cie") \
        /let whom=$[decode_attr("-- CIEBIE! --", "Crgb150")]%;\
    /else \
        /let whom=$(/odmien_B_M %{whom_B})%;\
        /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /endif%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /echo -p >   %{who} @{Crgb500}ATAKUJE@{n} %{whom}

/def -aLg -p1 -mregexp -t' wspiera (.*) w walce z (.*)\.$$' _combat_event_supports = \
    /let who=%{PL}%;\
    /let whom_B=%{P1}%;\
    /let against=%{P2}%;\
    /let whom=$(/odmien_B_M %{whom_B})%;\
    /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /echo -p >   %{who} @{Crgb500}WSPIERA@{n} %{whom}@{Cgray13} w walce z @{Crgb530}%{against}

/def -aLg -p1 -mregexp -t'^Z typowym krasnoludzkim zacietrzewieniem (.*) rzuca sie na (.*) nie baczac na to, ze moze niebawem przyjdzie mu dolaczyc do swych Przodkow\.$$' _combat_event_attacks_kpzabij = \
    /let who=%{P1}%;\
    /let whom_B=%{P2}%;\
    /if ({whom_B}=~"ciebie") \
        /let whom=$[decode_attr("-- CIEBIE! --", "Crgb150")]%;\
    /else \
        /let whom=$(/odmien_B_M %{whom_B})%;\
        /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /endif%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /echo -p >   %{who} @{Crgb500}ATAKUJE@{n} %{whom}@{Crgb025} -> via kpzabij

/def -aLg -p1 -mregexp -t' mruzac oczy w oczekiwaniu plynacej z walki rozkoszy rzuca sie na (.*)(?:!|\.)$$' _combat_event_attacks_mczabij = \
    /let who=%{PL}%;\
    /let whom_B=%{P1}%;\
    /if ({whom_B}=~"ciebie") \
        /let whom=$[decode_attr("-- CIEBIE! --", "Crgb150")]%;\
    /else \
        /let whom=$(/odmien_B_M %{whom_B})%;\
        /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /endif%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /echo -p >   %{who} @{Crgb500}ATAKUJE@{n} %{whom}@{Crgb025} -> via mczabij

/def -aLg -mregexp -t' probuje zaatakowac (.*), lecz (.*) zagradza (?:mu|jej) droge\.$$' _combat_event_unable_to_attack = \
    /let who=%{PL}%;\
    /let whom_B=%{P1}%;\
    /let blocking=%{P2}%;\
    /let whom=$(/odmien_B_M %{whom_B})%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    \
    /echo -p >   %{who} @{Cred}nie atakuje@{n} %{whom} @{Cred}bo@{Crgb530} %{blocking}@{Cred} blokuje mu droge

/def -aLg -mregexp -t' probuje wesprzec (.*) w walce z (.*), lecz (.*) zagradza (?:mu|jej) droge\.$$' _combat_event_unable_to_support = \
    /let with_B=%{P1}%;\
    /let who=%{PL}%;\
    /let whom_B=%{P2}%;\
    /let blocking=%{P3}%;\
    /let whom=$(/odmien_B_M %{whom_B})%;\
    /let with=$(/odmien_B_M %{with_B})%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /let with=$[decode_attr({with_B}, $(/_team_get_name_color %{with}))]%;\
    \
    /echo -p >   %{who} @{Cred}nie wspiera@{n} %{with}@{Cred} w walce z @{n}%{whom} @{Cred}bo@{Crgb530} %{blocking}@{Cred} blokuje droge

/def -aLg -mregexp -t' probuje zaatakowac (.*), (?:ale|lecz) zagradzasz (?:mu|jej) droge(?:!|\.)$$' _combat_event_unable_to_attack_cause_of_me = \
    /let who=%{PL}%;\
    /let whom_B=%{P1}%;\
    /let whom=$(/odmien_B_M %{whom_B})%;\
    /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /let who=$[decode_attr({who}, "Crgb530")]%;\
    \
    /echo -p >   %{who} @{Cred}chce zaatakowac@{n} %{whom}@{Cred} ale @{Crgb140}-- TY --@{Cred} blokujesz droge

/def -aLg -mregexp -t' probuje zaatakowac (.*), ale (.*) zagradza (?:mu|jej) droge!$$' _combat_event_unable_to_attack_cause_of_someone = \
    /let who=%{PL}%;\
    /let whom_B=%{P1}%;\
    /let blocking=%{P2}%;\
    /if ({whom_B}=~"ciebie") \
        /let whom=$[decode_attr("-- CIEBIE! --", "Crgb150")]%;\
    /else \
        /let whom=$(/odmien_B_M %{whom_B})%;\
        /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /endif%;\
    /let who=$[decode_attr({who}, "Crgb530")]%;\
    \
    /echo -p >   %{who} @{Cred}chce zaatakowac@{n} %{whom}@{Cred} ale @{Crgb530}%{blocking}@{Cred} blokuje droge

/def -aLg -mregexp -t'^Atakujesz (.*), lecz (.*) zagradza ci droge\.$$' _combat_event_iam_unable_to_attack = \
    /let whom_B=%{P1}%;\
    /let blocking=%{P2}%;\
    \
    /echo -p >   @{Cred}-- ty -- chcesz zaatakowac@{Crgb530} %{whom_B}@{Cred} ale @{Crgb530}%{blocking}@{Cred} blokuje ci droge

/def -aLg -mregexp -t'^Probujesz wesprzec (.*) w walce (.*), lecz (.*) zagradza ci droge\.$$' _combat_event_iam_unable_to_support = \
    /let whom_B=%{P1}%;\
    /let who=%{P2}%;\
    /let blocking=%{P2}%;\
    \
    /echo -p >   @{Cred}-- ty -- nie mozesz wesprzec@{Crgb530} %{whom_B}@{Cred} w walce z @{Crgb530}%{who}@{Cred} bo @{Crgb530}%{blocking}@{Cred} blokuje ci droge

;##############################      PRZEBIJANIE  PRZEBIJANIE      ###########################

/def -aLg -mregexp -t' rzuca sie na (.*), bezskutecznie probujac przebic sie przez (jego|jej) ochrone\.$$' _combat_event_cover_break_failed = \
    /let who=%{PL}%;\
    /let whom_B=%{P1}%;\
    /let whom=$(/odmien_B_M %{P1})%;\
    /let whom_D=$(/odmien_M_D %{whom})%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /let whom=$[decode_attr($(/ucfirstname %{whom_D}), $(/_team_get_name_color %{whom}))]%;\
    /echo -p >   %{who} @{Crgb145}nie moze przebic ochrony@{n} %{whom}

/def -aLg -mregexp -t'^Bezskutecznie rzucasz sie na (.*), probujac przebic sie przez (jego|jej) ochrone\.$$' _combat_event_cover_break_i_failed = \
    /let whom_B=%{P1}%;\
    /let whom=$(/odmien_B_M %{P1})%;\
    /let whom_D=$(/odmien_M_D %{whom})%;\
    /let whom=$[decode_attr($(/ucfirstname %{whom_D}), $(/_team_get_name_color %{whom}))]%;\
    /echo -p >   @{Crgb145}-- TY -- nie mozesz przebic ochrony@{n} %{whom}

/def -aLg -mregexp -t'^Rzucasz sie na (.*) przebijajac sie przez (jego|jej) ochrone\.$$' _combat_event_cover_i_break = \
    /let whom_B=%{P1}%;\
    /let whom=$(/odmien_B_M %{P1})%;\
    /let whom_D=$(/odmien_M_D %{whom})%;\
    /let whom=$[decode_attr($(/ucfirstname %{whom_D}), $(/_team_get_name_color %{whom}))]%;\
    /echo -p >   @{Crgb145}-- TY -- PRZEBIJASZ OBRONE@{n} %{whom}

/def -aLg -mregexp -t' rzuca sie na (.*) przebijajac sie przez (jego|jej) ochrone\.$$' _combat_event_cover_break = \
    /let who=%{PL}%;\
    /let whom_B=%{P1}%;\
    /let whom=$(/odmien_B_M %{P1})%;\
    /let whom_D=$(/odmien_M_D %{whom})%;\
    /let whom=$[decode_attr($(/ucfirstname %{whom_D}), $(/_team_get_name_color %{whom}))]%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /echo -p >   %{who} @{Crgb145}PRZEBIL OCHRONE@{n} %{whom}

;######################## INNE INNE INNE ###############################

/def -ag -t'Zabiles *' -p15 _combat_event_kill_1 = \
    /echo -p @{Cbgred} |  ############  Z A B I L E S  ############%;\
    /echo -p @{Cbgred} |  ############  Z A B I L E S  ############%;\
    /echo -p @{Cbgred} |  ############  Z A B I L E S  ############%;\

/def -mregexp -ag -t'(.*) (polegl|umarl)(a|)\.' -p15 _combat_event_kill_2 = \
    /echo%;\
    /echo -p @{Cred} |  ############  Z G O N  ############%;\
    /echo -p @{Cred} |  ############  Z G O N  ############    %{P1}%;\
    /echo -p @{Cred} |  ############  Z G O N  ############%;\
    /echo




/def test_combat_events = \
/showme%;\
/showme ##############################      ZASLONY ZASLONY      ###########################%;\
/showme #%;\
/showme #               Brak druzyny, celu ataku i obrony%;\
/showme #%;\
/echo%;\
/_combat_clear_attack_target%;/_combat_clear_defence_target%;\
/showme Dhogrin zrecznie zaslania Ravene przed ciosami postawnej burkliwej kobiety.%;\
/showme Dhogrin zrecznie zaslania postawna burkliwa kobiete przed ciosami wrogow.%;\
/showme Imrod zrecznie zaslania cie przed ciosami Sagita.%;\
/showme Imrod zrecznie zaslania cie przed ciosami wrogow.%;\
/showme Na rozkaz Hunverta Oja zaslania cie przed ciosami morderczego kobolda.%;\
/showme Na rozkaz Galnosa Ghardrim zaslania Samora przed ciosami uwaznego ogolonego mezczyzny.%;\
/showme Na rozkaz Hunverta Oja zaslania cie przed ciosami wrogow.%;\
/showme Na rozkaz Galnosa Ghardrim zaslania Samora przed ciosami wrogow.%;\
/showme Na twoj rozkaz Connie zaslania cie przed ciosami Armanzora.%;\
/showme Na twoj rozkaz Loptak probuje zaslonic cie przed ciosami Iluandile, jednak nie jest w stanie tego uczynic.%;\
/showme Mlody smagly mezczyzna zrecznie zaslania mlodego zylastego mezczyzne przed twoimi ciosami.%;\
/showme Zrecznie zaslaniasz Dalgara przed ciosami jaskiniowego ogromnego trolla.%;\
/showme Na rozkaz Hunverta zaslaniasz Gharkha przed ciosami ogromnego kudlatego mezczyzny.%;\
/showme >%;\
/showme Grodo probuje zaslonic postawna burkliwa kobiete przed ciosami okrutnego kobolda, jednak nie jest w stanie tego uczynic.%;\
/showme Grodo probuje zaslonic cie przed ciosami poteznego martwego mezczyzny, jednak nie jest w stanie tego uczynic.%;\
/showme Na rozkaz Hunverta Gwilli probuje zaslonic cie przed ciosami poteznego martwego mezczyzny, jednak nie jest w stanie tego uczynic.%;\
/showme Probujesz zaslonic Varriza przed ciosami okrutnego kobolda, jednak nie jestes w stanie tego uczynic.%;\
/showme Na rozkaz Hunverta probujesz zaslonic Groda przed ciosami ogromnego smierdzacego wichta i wysokiego agresywnego wichta, jednak nie jestes w stanie tego uczynic.%;\
/showme >%;\
/showme >%;\
/showme%;\
/showme ##############################      ATAKI ATAKI      ###########################%;\
/showme #%;\
/showme #               Brak druzyny, celu ataku i obrony%;\
/showme #%;\
/showme%;\
/showme Dlugoreki potezny redcap atakuje cie!%;\
/showme Wspierasz Meksora w walce z jaskiniowym ogromnym trollem.%;\
/showme Geronia atakuje Belmora.%;\
/showme Na rozkaz Sagita Iluandile rzuca sie do ataku na ciebie!%;\
/showme Pokraczny ogromny redcap wspiera pokracznego poteznego redcapa w walce z Borubarem.%;\
/showme Z typowym krasnoludzkim zacietrzewieniem Borubar rzuca sie na pokracznego poteznego redcapa nie baczac na to, ze moze niebawem przyjdzie mu dolaczyc do swych Przodkow.%;\
/showme Z typowym krasnoludzkim zacietrzewieniem Borubar rzuca sie na ciebie nie baczac na to, ze moze niebawem przyjdzie mu dolaczyc do swych Przodkow.%;\
/showme Thrangorn mruzac oczy w oczekiwaniu plynacej z walki rozkoszy rzuca sie na ciebie!%;\
/showme Thrangorn mruzac oczy w oczekiwaniu plynacej z walki rozkoszy rzuca sie na Borubara!%;\
/showme Varriz probuje zaatakowac tegiego butnego mezczyzne, lecz dlugoreki czarnowlosy mezczyzna zagradza mu droge.%;\
/showme Ravena probuje wesprzec Hunverta w walce z klekoczacym strasznym kosciotrupem, lecz gnijacy martwy mezczyzna zagradza jej droge.%;\
/showme Heimo probuje zaatakowac Groda, lecz zagradzasz mu droge.%;\
/showme Grozny goblin probuje zaatakowac Varriza, ale zagradzasz mu droge!%;\
/showme Okrutny kobold probuje zaatakowac ciebie, ale Hunvert zagradza mu droge!%;\
/showme Probujesz wesprzec Hunverta w walce z silna burkliwa kobieta, lecz smukla burkliwa kobieta zagradza ci droge.%;\
/showme Atakujesz muskularnego goblina, lecz zezowaty goblin zagradza ci droge.%;\
/showme Na rozkaz Bushiego Hunvert rzuca sie do ataku na trupiobladego demonicznego mezczyzne!%;\
/showme Na rozkaz Dhogrina rzucasz sie do ataku na przerazajacego wysokiego goblina!%;\
/showme >%;\
/showme Dhogrin rzuca sie na postawna burkliwa kobiete, bezskutecznie probujac przebic sie przez jej ochrone.%;\
/showme Dhogrin rzuca sie na postawna burkliwa kobiete przebijajac sie przez jej ochrone.%;\
/showme Bezskutecznie rzucasz sie na pomniejszego czarnego demona, probujac przebic sie przez jego ochrone.%;\
/showme Rzucasz sie na Xamusa przebijajac sie przez jego ochrone.%;\
/showme Na rozkaz Bushiego Talos rzuca sie do ataku na pomniejszego czarnego demona, ale wpada na wiekszego czarnego demona!%;\
/showme DODAJ SWOJE ROZKAZY

