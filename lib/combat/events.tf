
/def _set_targetting_mode_set_target = \
    /def -p50 -mregexp -t' wskazuje (.*) jako cel ataku\.$$' _combat_event_set_attack_target = \
        /test processTargetSet("%%{P1}")%;\
    \
    /def -p50 -mregexp -t' wskazuje (.*) jako cel obrony\.$$' _combat_event_set_defence_target = \
        /test processDefenceSet("%%{P1}", "%%{PL}")%;\

/def _set_targetting_mode_point_at = \
    /def -p49 -mregexp -t' wskazuje (.*)\.$$' _combat_event_set_attack_target = \
        /if ({PL}=~{_team_leader}) \
            /test processTargetSet("%%{P1}")%%;\
        /endif

/def _set_targetting_mode_look_at_target = \
    /def -mregexp -t' spoglada morderczo na (.*)\.$$' _combat_event_set_attack_target = \
        /if ({PL}=~{_team_leader}) \
            /test processTargetSet("%%{P1}")%%;\
        /endif%;\
    \
    /def -mregexp -t' spoglada opiekunczo na (.*)\.$$' _combat_event_set_defence_target = \
        /if ({PL}=~{_team_leader}) \
            /test processDefenceSet("%%{P1}", "%%{PL}")%%;\
        /endif%;\
    \
    /def -mregexp -t' spoglada na siebie opiekunczo\.$$' _combat_event_set_defence_target_on_self = \
        /if ({PL}=~{_team_leader}) \
            /test processDefenceSet("siebie", "%%{PL}")%%;\
        /endif

/def -mregexp -t'.* wydaje ci rozkaz ataku na (.*).' _combat_event_set_attack_target_from_order = \
    /test processTargetSet({P1})


;
;##############################      WYCOFKA WYCOFKA      ###########################
;

/def -aLg -Fp20 -mregexp -t' unosi swoja .* i szybko przesuwa sie za (.*), kryjac sie przed twoimi atakami\.$$' _combat_event_retreat_from_you_ok = \
    /test displayRetreat({PL}, {P1}, 'twoimi', 'true')

/def -aLg -Fp20 -mregexp -t' unosi swoja .* i szybko przesuwa sie w strone (.*), bezskutecznie probujac skryc sie za (?:nim|nia) przed twoimi atakami\.$$' _combat_event_retreat_from_you_fail = \
    /test displayRetreat({PL}, {P1}, 'twoimi', 'false')

/def -aLg -Fp20 -mregexp -t' unosi swoja .* i szybko przesuwa sie za (.*), kryjac sie przed atakami (.*)\.$$' _combat_event_retreat_ok = \
    /test displayRetreat({PL}, {P1}, {P2}, 'true')

/def -aLg -p20 -mregexp -t' unosi swoja .* i szybko przesuwa sie w strone (.*), bezskutecznie probujac skryc sie za (?:nim|nia) przed atakami (.*)\.$$' _combat_event_retreat_fail = \
    /test displayRetreat({PL}, {P1}, {P2}, 'false')

/def -aLg -p20 -mregexp -t' unosi swoja .* i szybko przesuwa sie w twoja strone, bezskutecznie probujac skryc sie za toba przed atakami (.*)\.$$' _combat_event_retreat_behind_me_fail = \
    /test displayRetreat({PL}, 'ciebie', {P3}, 'false')

;
;##############################      ZASLONY ZASLONY      ###########################
;

/def -aLg -p20 -mregexp -t' zrecznie zaslania (.*) przed ciosami (.*)\.$$' _combat_event_cover = \
    /test displayGuard({PL}, {P1}, {P2}, 'true')

/def -aLg -p25 -mregexp -t'^Na rozkaz (.+) (.+) zaslania (.*) przed ciosami (.*)\.$$' _combat_event_cover_on_order = \
    /test displayGuard({P2}, {P3}, {P4}, 'true', {P1})

/def -aLg -p20 -mregexp -t' probuje zaslonic (.*) przed twoimi ciosami, jednak nie jest w stanie tego uczynic\.$$' _combat_event_cover_from_me_fail = \
    /test displayGuard({PL}, {P1}, 'twoimi', 'false')

/def -aLg -p20 -mregexp -t' zrecznie zaslania (.*) przed twoimi ciosami\.$$' _combat_event_cover_from_me = \
    /test displayGuard({PL}, {P1}, 'twoimi', 'true')

/def -aLg -Fp1 -mregexp -t'^Zrecznie zaslaniasz (.*) przed ciosami (.*)\.$$' _combat_event_i_cover = \
    /test displayGuard('ty', {P1}, {P2}, 'true')

/def -aLg -Fp1 -mregexp -t'^Na rozkaz (.*) zaslaniasz (.*) przed ciosami (.*)\.$$' _combat_event_i_cover_on_order = \
    /test displayGuard('ty', {P2}, {P3}, 'true', {P1})

/def -aLg -p20 -mregexp -t' probuje zaslonic (.*) przed ciosami (.*), jednak nie jest w stanie tego uczynic\.$$' _combat_event_cover_unsuccessful = \
    /test displayGuard({PL}, {P1}, {P2}, 'false')

/def -aLg -p25 -mregexp -t'^Na rozkaz (.+) (.+) probuje zaslonic (.*) przed ciosami (.*), jednak nie jest w stanie tego uczynic\.$$' _combat_event_cover_on_order_unsuccessful = \
    /test displayGuard({P2}, {P3}, {P4}, 'false', {P1})

/def -aLg -Fp1 -mregexp -t'^Probujesz zaslonic (.*) przed ciosami (.*), jednak nie jestes w stanie tego uczynic\.$$' _combat_event_i_cover_unsuccessful = \
    /test displayGuard('ty', {P1}, {P2}, 'false')

/def -aLg -Fp1 -mregexp -t'^Na rozkaz (.*) probujesz zaslonic (.*) przed ciosami (.*), jednak nie jestes w stanie tego uczynic\.$$' _combat_event_i_cover_on_order_unsuccessful = \
    /test displayGuard('ty', {P2}, {P3}, 'false', {P1})



;##############################      ATAKI  ATAKI      ###########################



/def -aLg -mregexp -t'^Na rozkaz (.*) rzuca sie do ataku na ciebie!' _combat_event_attacks_me_on_order = \
    /echo -p >   @{Crgb025}Z rozkazu %{P1} @{Crgb500}ATAKUJE @{Crgb150}-- CIEBIE! --

/def -aLg -p1 -mregexp -t'^Z typowym krasnoludzkim zacietrzewieniem (.*) rzuca sie na (.*) nie baczac na to, ze moze niebawem przyjdzie mu dolaczyc do swych Przodkow\.$$' _combat_event_attacks_kpzabij = \
    /test displayAttack({P1}, {P2}, ' -> via kpzabij')

/def -aLg -mregexp -t'^([a-z\s]*) atakuje (.*)(?:\.|!)$$' _combat_event_attacks = \
    /test displayAttack({P1}, {P2})

/def -aLg -p1 -mregexp -t' mruzac oczy w oczekiwaniu plynacej z walki rozkoszy rzuca sie na (.*)(?:!|\.)$$' _combat_event_attacks_sla-mczabij = \
    /test displayAttack({PL}, {P1}, ' -> via sla-mczabij')

/def -aLg -p1 -mregexp -t'Glosno wyjac z pochylonym nisko lbem, (.*) rzuca sie na (.*), niczym wyglodnialy wilk polujacy na swa ofiare\.$$' _combat_event_attacks_okzabij = \
    /test displayAttack({P1}, {P2}, ' -> via ogr-atak')

/def -aLg -p1 -mregexp -t' przerazliwie ryczac i toczac piane z pyska niczym wsciekly byk atakuje (.*)\.$$' _combat_event_attacks_wzzabij = \
    /test displayAttack({PL}, {P1}, ' -> via zarlok-atak')

/def -aLg -p1 -mregexp -t' zanoszac sie szalonym smiechem rzuca sie na (.*)[!.]' _combat_event_attacks_ras-mczabij = \
    /test displayAttack({PL}, {P1}, ' -> via ras-mczabij')

/def -aLg -p1 -mregexp -t' glosno krzyczac: Krew dla Boga Krwi! Czaszki dla Tronu Czaszek! rzuca sie na (.*)[!.]' _combat_event_attacks_kho-mczabij = \
    /test displayAttack({PL}, {P1}, ' -> via kho-mczabij')

/def -aLg -p1 -mregexp -t' z pelnym przebieglosci blyskiem w oku rzuca sie na (.*)[!.]' _combat_event_attacks_tzc-mczabij = \
    /test displayAttack({PL}, {P1}, ' -> via tzc-mczabij')

/def -aLg -p1 -mregexp -t' przyzywajac chrypiacym glosem imie Nurgla rzuca sie na (.*)[!.]' _combat_event_attacks_nur-mczabij = \
    /test displayAttack({PL}, {P1}, ' -> via nur-mczabij')

/def -aLg -p1 -mregexp -t' wykrzykujac glosno swoja nienawisc rzuca sie na (.*)[!.]' _combat_event_attacks_mal-mczabij = \
    /test displayAttack({PL}, {P1}, ' -> via mal-mczabij')

/def -aLg -p1 -mregexp -t' wykrzywiajac twarz w okrutnym grymasie rzuca sie na (.*)[!.]' _combat_event_attacks_scozabij = \
    /test displayAttack({PL}, {P1}, ' -> via scozabij')

/def -aLg -p1 -mregexp -t'Przy ogluszajacym akompaniamencie okrzyku bojowego \'von Raugen!\' (.*) rzuca sie na (.*), wiazac [^ ]+ walka!' _combat_event_attacks_vrzabij = \
    /test displayAttack({P1}, {P2}, ' -> via vrzabij')

/def -aLg -p1 -mregexp -t'W oczach (.*) rozpala sie swiety ogien nienawisci i z imieniem Morra na ustach rzuca sie do walki z (.*)[!.]' _combat_event_attacks_morrzabij = \
    /test displayAttack({P1}, {P2}, ' -> via morzabij')

;##############################      WSPIERANIE  WSPIERANIE      ###########################

/def -aLg -p1 -mregexp -t' wspiera (.*) w walce z (.*)\.$$' _combat_event_supports = \
    /let who=%{PL}%;\
    /let whom_B=%{P1}%;\
    /let against=%{P2}%;\
    /let whom=$(/odmien_B_M %{whom_B})%;\
    /let whom=$[decode_attr({whom_B}, $(/_team_get_name_color %{whom}))]%;\
    /let who=$[decode_attr({who}, $(/_team_get_name_color %{who}))]%;\
    /echo -p >   %{who} @{Crgb500}WSPIERA@{n} %{whom}@{Cgray13} w walce z @{Crgb530}%{against}

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

/def -p100  -mregexp -t' rzuca sie na ciebie, bezskutecznie probujac przebic sie przez twoja ochrone\.$$' _combat_event_my_cover_break_failed = \
    /test displayGuardBreakAttempt({PL}, '', "false")

/def -p100  -mregexp -t' rzuca sie na ciebie przebijajac sie przez twoja ochrone\.$$' _combat_event_my_cover_break = \
    /test displayGuardBreakAttempt({PL}, '', "true")

/def -p100 -mregexp -t' rzuca sie na (.*), bezskutecznie probujac przebic sie przez (jego|jej) ochrone\.$$' _combat_event_cover_break_failed = \
    /test displayGuardBreakAttempt({PL}, {P1}, "false")

/def -p100 -mregexp -t'^Bezskutecznie rzucasz sie na (.*), probujac przebic sie przez (jego|jej) ochrone\.$$' _combat_event_cover_break_i_failed = \
    /test displayGuardBreakAttempt('', {P1}, "false")

/def -p100 -mregexp -t'^Rzucasz sie na (.*) przebijajac sie przez (jego|jej) ochrone\.$$' _combat_event_cover_i_break = \
    /test displayGuardBreakAttempt('', {P1}, "true")

/def -p100 -mregexp -t' rzuca sie na (.*) przebijajac sie przez (jego|jej) ochrone\.$$' _combat_event_cover_break = \
    /test displayGuardBreakAttempt({PL}, {P1}, "true")


;############################ RANDOM EVENTS ###############

/def -mregexp -Fp2 -t'(Powoli osuwasz sie na ziemie|Potem robi sie ciemno|Sila uderzania zamroczyla cie|czujesz, ze tracisz przytomnosc|Nagle czujesz jak na glowe spada ci ciezki sznur|Nagle czujesz, ze tracisz kontrole nad swym cialem| wali cie na odlew)' _combat_event_stun = \
	/let label=$[strcat(decode_attr(" --*  OGLUSZENIE *-- ", "BCbgblue"), "  ")]%;\
	/test _fast_bind_set({label}, "")

/def -mregexp -p2 -t'(Powoli dochodzisz do siebie|Czujesz jak slabosc po zadanym ciosie w glowe mija|Udaje ci sie uwolnic z sieci|Powoli odzyskujesz swobode ruchow)' _combat_event_nostun = \
	/_fast_bind_clear

/def -mregexp -Fp120 -t'(.* wytraca ci (.*) z (rak|reki)|Uderzenie jest tak silne, ze bezwiednie puszczasz|zakleszczajac lewakiem twoj .* Czujesz potezne szarpniecie)' _combat_event_disarm = \
    /let label=$[strcat(decode_attr(" --*  WYTRACENIE *-- ", "BCbgred"), "  ")]%;\
    /set im_disarmed=1%;\
    /test _fast_bind_set({label},"")

/def -Fp2 -t'Bol * staje sie mniej odczuwalny.' _combat_event_can_wield = \
    /let label=$[strcat(decode_attr(" -- DOBADZ BRONI --  ", "BCbgblue"), "  ")]%;\
    /set im_disarmed=0%;\
    /test _fast_bind_set({label}, "db", 1)

/def -mregexp -p2 -t'((Nie udaje ci sie trafic|probujesz|muskasz|ranisz|masakrujesz) .* (noga|stopa|lokciem|piescia|kolanem)|lecac lagodnym lukiem, laduje na ziemi obok ciebie)' _combat_event_no_weapon = \
    /if ({im_disarmed}==1) /return%; /endif%;\
    /let label=$[strcat(decode_attr(" -- DOBADZ BRONI --  ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "ddb%%;db", 1)


;######################## INNE INNE INNE ###############################

/def -p100 -ag -t'Zabiles *' -p15 _combat_event_kill_1 = \
    /echo -p @{Cbgred} |  ############  Z A B I L E S  ############%;\
    /echo -p @{Cbgred} |  ############  Z A B I L E S  ############%;\
    /echo -p @{Cbgred} |  ############  Z A B I L E S  ############%;\

/def -p100 -mregexp -ag -t'(.*) (z cichym jekiem osuwa sie na ziemie|polegl|umarl)(a|)\.' -p15 _combat_event_kill_2 = \
    /echo%;\
    /echo -p @{Cred} |  ############  Z G O N  ############%;\
    /echo -p @{Cred} |  ############  Z G O N  ############    %{P1}%;\
    /echo -p @{Cred} |  ############  Z G O N  ############%;\
    /echo

;######################## DLA PROWADZACEGO ###########################
;Potezny dostojny goblin silnym ciosem dwurecznego gnomiego mlota oglusza Hunverta.
;Hunvert powoli dochodzi do siebie.

/def -Fp100 -mregexp -t'oglusza ([A-Za-z]+)\.$$' ogluszenie_czlonka_druzyny = \
    /let whom_B=%{P1}%;\
    /let whom=$(/odmien_B_M %{whom_B})%;\
    /let is_member=$[_team_is_member({whom})]%;\
    /if ({is_member}==1) \
        /warn OGLUSZENIE %{whom_B}%;\
    /endif

/def -Fp100 -mregexp -t' powoli dochodzi do siebie\.$$' ogluszenie_czlonka_druzyny_end = \
    /let whom=%{PL}%;\
    /let is_member=$[_team_is_member({whom})]%;\
    /if ({is_member}==1) \
        /info %{whom} WSTAL%;\
    /endif
