; ## Linie dodane automagicznie   : tf_ver=1.4.8
; ## 
; ## Wersja pliku                 : 1.4.8
; ## Ostatnia zmiana pliku        : 2009-01-06 21:07:41
; ## Plik pobrany                 : 2009-01-06 21:08:08
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
;-------------------------------------------------------------------------------
;|                 Pokazywanie skrzyni w dziwny i nietypowy sposob
;-------------------------------------------------------------------------------
/purge -i _eq_is_magic
/def -i _eq_is_magic = \
    /if (regmatch("\
; Topory
            gwiezdn. topor|\
            jasniejacy.* niebieskim.* topor|\
            kunsztown. mithrylow. topor|\
            opalizujac. runiczn. topor|\
            mistern. obosieczn. topor|\
; Mloty
            adamantytow.* mlot|\
            gigantyczn. granitow. mlot|\
            mahakamsk.* runiczn. mlot|\
            wielki.* runiczn.* mlot.* wojenn|\
            kosciany.* kilof|\
            upiorny.* ciemny.* mlot.* bojowy|\
            zdobiony.* jasniejac.* mlot.* bojowy|\
; Drzewcowki
            srebrzyst. kos. bojow|\
            ogromn. ognist. trojz[ea]b|\
            adamantytow. szpiczast. partyzan|\
; Miecze
            poszczerbion. obureczn. miecz|\
            polyskliw. smukl. espadon|\
            czarn. jednoreczn. miecz|\
; Sztylety
            snieznobial. lsniac. sztylet|\
; Maczugi
            niebieskaw. zdobion. bulaw|\
            dwureczn. krysztalow. korbacz|\
            czarnoblekitn. pulsujac. morgenstern|\
; Zbroje
            dlug.+ krasnoludzk.+ bajdan|\
            snieznobial. lsniac. pancerz|\
            snieznobial. luskow. kolczug|\
            mithrylow.+ mahakamsk.+ kolczug|\
; Helmy
            czarn. zdobion. helm|\
            ciemn. owaln. mask|\
; Plaszcze
            dlug.+ czarn. szat|\
            zielon. luskowat. plaszcz|\
			szmaragdowozielon. mistern. plaszcz|\
; Inne
            czerwon. zakrwawion. pierscien|\
            niewielk.* zmatowial.* pierscien|\
            azurow. koscistobial. amulet|\
            szeroki.* inkrustowan.* pas|\
            zdobion. ciezki.? pas|\
            #NIC#", {*})) \
        /return 1 %;\
    /endif

/purge -i _eq_is_special
/def -i _eq_is_special = \
    /if (regmatch("\
; Topory
; Mloty
            zielonkaw. bretonsk.+ mlot|\
; Drzewcowki
            mistern. elfi. wloczni|\
            stalowoszar. falist. partyzan|\
; Miecze
            prost. smukl. rapier|\
            polerowan. blekitn. szabl|\
            smukl. lsniac. scimitar|\
; Sztylety
            polyskujac. zdobion. sztylet|\
            tileanskie sprezynowe stilett|\
            stalow. zakrzywion. sztylet|\
            dlugi.* tileansk.+ sztylet|\
            zabkowan. zakrzywion. sztylet|\
; Maczugi
            kolczast. wielk.+ maczug|\
            novigradzk.+ czarn. lami|\
; Zbroje
; Helmy
; Plaszcze
; Inne
            ciezk. zdobion. kusz|\
            szkarlatn. ciernist. pierscien|\
            #NIC#", {*})) \
        /return 1 %;\
    /endif

/purge -i _eq_is_weapon
/def -i _eq_is_weapon = \
    /if (regmatch("\
            topor| berdysz| siekier| czekan| oskard| kilof| tasak| tabar| nadziak| miecz| szabl| szabel| rapier| scimitar| katzbalger| stilett| pal| sztylet| halabard| falchion| mlot| obusz| wlocznie| pik[ei]| noz| maczug| morgenstern| kordelas| mizerykordi| buzdygan| korbacz| gal[ae]z| bulaw| drag| kiscien| nog[ai] stolow| wekier| walek| lamia| kos[aye ]| szponton| partyzan| glewi| gizarm| dzid| naginat| rohatyn| korsek | cep| trojz[ea]b| ronkon| runk| flamberg| poltorak| bulat| nimsz| szamszir| lami| spis[ay]| schiavon| lewak| sierp| lask| wid(e|)l| saif| koncerz| kij| espadon| claymor| cinquend| szpad|karabel|baselard|jatagan| kafar| multon|\
            #NIC#", {*})) \
        /return 1 %;\
    /endif

/purge -i _eq_is_shield
/def -i _eq_is_shield = \
    /if (regmatch("\
            tarcz|puklerz|pawez|\
            #NIC#", {*})) \
        /return 1 %;\
    /endif

/purge -i _eq_is_body_armour
/def -i _eq_is_body_armour = \
    /if (regmatch("\
            napiersnik|kirys|kolczug|karacen|kaftan|koszulk|tunik|zbroj|bajdan[aye]|anim[eay]| kurt|kamizel| becht|pancerz|brygantyn|\
            #NIC#", {*})) \
        /return 1 %;\
    /endif

/purge -i _eq_is_arms_armour
/def -i _eq_is_arms_armour = \
    /if (regmatch("\
            nareczak|naramiennik|rekawic|karwasz|\
            #NIC#", {*})) \
        /return 1 %;\
    /endif

/purge -i _eq_is_legs_armour
/def -i _eq_is_legs_armour = \
    /if (regmatch("\
            nagolennik|spoden|nogawic| but(|y|ow)$$|trzewik|spodni|spodnic|naudziak|sandal|nakolannik|buturlykow|\
            #NIC#", {*})) \
        /return 1 %;\
    /endif

/purge -i _eq_is_head_armour
/def -i _eq_is_head_armour = \
    /if (regmatch("\
            helm|misiurk|kaptur|morion|basinet|salad|przylbic|diadem|szyszak|narbut[ay]| armet|casquett| czapk|beret|turban|gigantyczn. wzmacnian. czaszk| barbut|kapalin|\
            #NIC#", {*})) \
        /return 1 %;\
    /endif

/purge -i _eq_is_coat
/def -i _eq_is_coat = \
    /if (regmatch("\
            plaszcz|peleryn| tog| szat|bloniaste skrzydl|\
            #NIC#", {*})) \
        /return 1 %;\
    /endif

/def skrzynia = \
    /if ({*}=~"off") \
      /set ogolne_skrzynia_dluga=0 %;\
      /echo -aCgreen Pokazuje normalna zawartosc skrzyn. %;\
      /_skrzynia %;\
    /elseif ({*}=~"on") \
      /set ogolne_skrzynia_dluga=1 %;\
      /echo -aCgreen Pokazuje zawartosc skrzyn w bardziej zakrecone formie. %;\
      /echo -aCgreen -p Podswietlam: @{B}%{ogolne_skrzynia_podswietl-NIC}@{n}. %;\
      /_skrzynia %;\
    /elseif ({*}=~NULL) \
      /if ({ogolne_skrzynia_dluga}==0) \
        /skrzynia on %;\
      /else \
        /skrzynia off %;\
      /endif %;\
    /else \
      /set ogolne_skrzynia_podswietl=%{*} %;\
      /echo -aCgreen -p Podswietlam w skrzyni: @{B}%{ogolne_skrzynia_podswietl-NIC}@{n}. %;\
    /endif

/def i = \
    i %;\
    /purge _skrzynia_trig_tmp* %;\
    /rstart -5 1 /purge _skrzynia_trig_tmp* %;\
    /def -1 -ag -mregexp -t'^(Masz przy sobie) (.*)\\\\.$$' _skrzynia_trig_tmp_1 = /test _skrzynia_pokaz(strcat({P1}, ":"), {P2})
    
/def eq = \
    i %;\
    /purge _skrzynia_trig_tmp* %;\
    /rstart -5 1 /purge _skrzynia_trig_tmp* %;\
    /def -1 -ag -mregexp -t'^Trzymasz (?:oburacz |)(.*?)(?: w .*? rece|)(?: oraz (.*?) w .*? rece|)\\\\.$$' _skrzynia_trig_tmp_1 = \
;    /def -1 -ag -mregexp -t'Trzymasz (?:oburacz |)(?:(.+) w .+ rece oraz |)(.+)(?: w .+ rece)\\\\.$$' _skrzynia_trig_tmp_1 = \
        /set _skrzynia_tmp_eq=$$[strcat({P1}, ", ", {P2})] %;\
    /def -1 -ag -mregexp -t'^(Masz na sobie) (.*)\\\\.$$' _skrzynia_trig_tmp_2 = \
        /test _skrzynia_pokaz(strcat({P1}, ":"), strcat({P2}, ", ", {_skrzynia_tmp_eq})) %%;\
        /unset _skrzynia_tmp_eq %;\
    /def -1 -ag -mregexp -t'^Masz przy sobie' _skrzynia_trig_tmp_3 = \
        /if ({_skrzynia_tmp_eq} !~ NULL) \
            /test _skrzynia_pokaz("Masz na sobie:", {_skrzynia_tmp_eq}) %%;\
            /unset _skrzynia_tmp_eq %%;\
        /endif

/def _skrzynia = \
    /purge _skrzynia_trig_* %;\
    /if ({ogolne_skrzynia_dluga}==1) \
        /def -agCgreen -mregexp -t'(zauwazasz miedzy innymi| zawiera(?:|ja)|powieszono|zawieszone sa|znajduja sie tam:|Dostrzegasz na nich:|Na (?:polnocnej|wschodniej) scianie widzisz:|znajduja sie na nich:|W podniszczonym koszu znajduja sie) (.+, .+ i .+)\\\\.$$' _skrzynia_trig_1 = /test _skrzynia_pokaz(strcat({PL}, {P1}, ":"), {P2}) %;\
    /endif

/_skrzynia

/purge -i _skrzynia_pokaz
/def -i _skrzynia_pokaz = \
    /let _tmp=$[replace(", ", "|", {2})] %;\
    /let _tmp=$[strcat(replace(" i ", "|", {_tmp}), "|")] %;\
    /let _tmp=$[replace("||", "|", {_tmp})] %;\
    /while /let i=$[strstr({_tmp},"|")] %; /@test i > -1 %; /do \
        /let _name=$[substr({_tmp},0,i)] %;\
        /let _tmp=$[substr({_tmp},i+1)] %;\
        /let _ile=$(/_zam_licz %{_name}) %;\
        /if ({_ile} != 1) \
            /let _name=$[substr({_name}, strchr({_name}, " ") + 1)] %;\
        /endif %;\
        /if (_eq_is_magic({_name})) \
            /let _name=$[strcat(decode_attr("@{BCblue}[magic] "), {_name})] %;\
        /elseif (_eq_is_special({_name})) \
            /let _name=$[strcat(decode_attr("@{Cblue}[special] "), {_name})] %;\
        /endif %;\
        /if (regmatch({ogolne_skrzynia_podswietl-NICO}, {_name})) \
            /let _name=$[strcat(decode_attr(strcat("@{BCred}[", {_ile}, "] ")), substr({_name}, 0, strstr({_name}, "]") + 1), decode_attr(strcat("@{BCgreen}", substr({_name}, strstr({_name}, "]") + 1))))] %;\
        /else \
            /let _name=$[strcat("[", {_ile}, "] ", {_name})] %;\
        /endif %;\
        /if (_eq_is_weapon({_name})) \
            /let _tmp_zb_1=$[strcat(_tmp_zb_1, _name, "|")] %;\
        /elseif (_eq_is_body_armour({_name})) \
            /let _tmp_zb_2=$[strcat(_tmp_zb_2, _name, "|")] %;\
        /elseif (_eq_is_coat({_name})) \
            /let _tmp_zb_3=$[strcat(_tmp_zb_3, _name, "|")] %;\
        /elseif (_eq_is_head_armour({_name})) \
            /let _tmp_zb_4=$[strcat(_tmp_zb_4, _name, "|")] %;\
        /elseif (_eq_is_arms_armour({_name})) \
            /let _tmp_zb_5=$[strcat(_tmp_zb_5, _name, "|")] %;\
        /elseif (_eq_is_legs_armour({_name})) \
            /let _tmp_zb_6=$[strcat(_tmp_zb_6, _name, "|")] %;\
        /elseif (_eq_is_shield({_name})) \
            /let _tmp_zb_7=$[strcat(_tmp_zb_7, _name, "|")] %;\
        /else \
            /let _tmp_zb_8=$[strcat(_tmp_zb_8, _name, "|")] %;\
        /endif %;\
    /done %;\
    /let _tmp_nag_1=BRONIE %;\
    /let _tmp_nag_2=PANCERZE %;\
    /let _tmp_nag_3=WIERZCH %;\
    /let _tmp_nag_4=GLOWA %;\
    /let _tmp_nag_5=RECE %;\
    /let _tmp_nag_6=NOGI %;\
    /let _tmp_nag_7=TARCZE %;\
    /let _tmp_nag_8=INNE %;\
    /let _szer=$[wrapsize / 2 - 4] %;\
    /test echo(strcat(" ", strrep("_", {_szer} * 2 + 5), " ")) %;\
    /test echo(strcat("/     ", pad({1}, -({_szer} * 2 - 5)), "     \\\\")) %;\
    /test echo(strcat("|", strrep("_", {_szer} * 2 + 5), "|")) %;\
    /let i=0 %;\
    /while (i < 4) \
        /let i1=$[{i} * 2 + 1] %;\
        /let i2=$[{i} * 2 + 2] %;\
;       /echo %i1 - %i2 %;\
        /eval /set _zb=%%_tmp_zb_%{i1} %;\
        /eval /set _zb2=%%_tmp_zb_%{i2} %;\
        /eval /set _na=%%_tmp_nag_%{i1} %;\
        /eval /set _na2=%%_tmp_nag_%{i2} %;\
        /if ({_zb} !~ NULL | {_zb2} !~ NULL) \
            /test echo(strcat("| ", pad({_na}, - {_szer}), " | ", pad({_na2}, - {_szer}), " |")) %;\
            /test echo(strcat("|@{BCblack}", strrep("-", {_szer} * 2 + 5), "@{nCwhite}|"), "", 1) %;\
            /while (_zb !~ "" | _zb2 !~ "") \
                /let _k=$[strstr({_zb},"|")] %;\
                /let _name=$[substr({_zb},0,_k)] %;\
                /let _name=$[substr(_name, 0, {_szer})] %;\
                /set _zb=$[substr({_zb},_k+1)] %;\
                /let _k2=$[strstr({_zb2},"|")] %;\
                /let _name2=$[substr({_zb2},0,_k2)] %;\
                /let _name2=$[substr(_name2, 0, {_szer})] %;\
                /set _zb2=$[substr({_zb2},_k2+1)] %;\
                /test echo(strcat("| ", pad({_name}, - {_szer}), " | ", pad({_name2}, - {_szer}), " |")) %;\
            /done %;\
            /test echo(strcat("|", strrep("_", {_szer} * 2 + 5), "|")) %;\
        /endif %;\
        /test ++i %;\
    /done %;\
    /unset _zb %;\
    /unset _zb2 %;\
    /unset _na %;\
    /unset _na2

/purge -i _zam_licz
/def -i _zam_licz = \
    /if ({1} =~ "dwa" | {1} =~ "dwie" | {1} =~ "dwoch") \
        /test echo(2) %;\
    /elseif ({1} =~ "trzy" | {1} =~ "trzech") \
        /test echo(3) %;\
    /elseif ({1} =~ "cztery" | {1} =~ "czterej") \
        /test echo(4) %;\
    /elseif ({1} =~ "piec" | {1} =~ "pieciu") \
        /test echo(5) %;\
    /elseif ({1} =~ "szesc" | {1} =~ "szeciu") \
        /test echo(6) %;\
    /elseif ({1} =~ "siedem" | {1} =~ "siedmiu") \
        /test echo(7) %;\
    /elseif ({1} =~ "osiem" | {1} =~ "osmiu") \
        /test echo(8) %;\
    /elseif ({1} =~ "dziewiec" | {1} =~ "dziewieciu") \
        /test echo(9) %;\
    /elseif ({1} =~ "dziesiec" | {1} =~ "dziesieciu") \
        /test echo(10) %;\
    /elseif ({1} =~ "jedenascie" | {1} =~ "jedynastu") \
        /test echo(11) %;\
    /elseif ({1} =~ "dwanascie" | {1} =~ "dwunastu") \
        /test echo(12) %;\
    /elseif ({1} =~ "trzynascie" | {1} =~ "trzynastu") \
        /test echo(13) %;\
    /elseif ({1} =~ "czternascie" | {1} =~ "czternastu") \
        /test echo(14) %;\
    /elseif ({1} =~ "pietnascie" | {1} =~ "pietnastu") \
        /test echo(15) %;\
    /elseif ({1} =~ "szesnascie" | {1} =~ "szesnastu") \
        /test echo(16) %;\
    /elseif ({1} =~ "siedemnascie" | {1} =~ "siedemnastu") \
        /test echo(17) %;\
    /elseif ({1} =~ "osiemnascie" | {1} =~ "osiemnastu") \
        /test echo(18) %;\
    /elseif ({1} =~ "dziewietnascie" | {1} =~ "dziewietnastu") \
        /test echo(19) %;\
    /elseif ({1} =~ "dwadziescia" | {1} =~ "dwudziestu") \
        /test echo(20) %;\
    /elseif (regmatch("(\\d+)", {1})) \
        /test echo(decode_attr(strcat("@{nCwhite}", {1}))) %;\
    /elseif ({1} =~ "wiele" | {1} =~ "wielu") \
        /test echo("X") %;\
    /else \
       /test echo(1) %;\
    /endif

