; ## Linie dodane automagicznie   : tf_ver=1.6.3
; ## 
; ## Wersja pliku                 : 1.6.3
; ## Ostatnia zmiana pliku        : 2008-11-07 21:28:10
; ## Plik pobrany                 : 2008-11-07 21:28:16
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
;------------------------------------------------------------------------------
;|                 BINDOWANIE SZYBKIE                      |
;------------------------------------------------------------------------------

/def szczury = \
    /f1 zabij szczura %;\
    /f2 wez ciala%%;wloz ciala do %%{ogolne_plecaka-plecaka} %;\
    /f3 wez ciala z %%{ogolne_plecaka-plecaka}%%;wrzuc ciala do ogniska

/def paczki = \
    /f1 wybierz paczke 1%%;wloz paczke do %%{ogolne_plecaka-plecaka} %;\
    /f2 wybierz paczke 2%%;wloz paczke do %%{ogolne_plecaka-plecaka} %;\
    /f3 wybierz paczke 3%%;wloz paczke do %%{ogolne_plecaka-plecaka} %;\
    /f4 wybierz paczke 4%%;wloz paczke do %%{ogolne_plecaka-plecaka} %;\
    /f5 przeczytaj tablice %;\
    /f6 wez paczke z %%{ogolne_plecaka-plecaka}%%;oddaj paczke

/def gremliny=\
    /f1 zabij gremlina %%; /zabiles zabij gremlina %;\
    /f2 zabij jaszczurke %%; /zabiles zabij jaszczurke

/def repty = \
    /f1 zabij reptiliona %;\
    /f2 zabij drugiego reptiliona %;\
    /f3 /zl %%; sp %%; /zgl %;\
    /f4 /zl %%; zabij reptiliona %%; /zgl

/def bagna = \
    /f1 zabij szkielet %;\
    /f2 zabij ghoula %;\
    /f3 zabij ozywienca %;\
    /f4 zabij licza %;\
    /f5 zabij golema

/def skavy = \
    /f1 zabij skavena %;\
    /f2 /zl %%; sp %%; /zgl %;\
    /f3 /zl %%; ob skaveny %%; /zgl %;\
    /f4 /zl %%; zabij skavena %%; /zgl %;\
    /f5 /zl %%; zabij drugiego skavena %%; /zgl %;\
    /f6 /zl %%; zabij trzeciego skavena %%; /zgl

/def mahakam = \
    /f1 zabij pukacza %;\
    /f2 zabij echinopsa %;\
    /f3 zabij kobolda %;\
    /f4 zabij goblina %;\
    /f5 zabij vrana %;\
    /f6 zabij bobolaka

/def kadrin = \
    /f1 zabij goblina %;\
    /f2 zabij orka %;\
    /f3 zabij trolla %;\
    /f4 zabij giganta

/def smocze = \
    /f1 /zl%%;spojrz%%;/zgl %;\
    /f2 zabij smoczego ogra %;\
    /f3 zabij ambulla %;\
    /f4 zabij trolla %;\
    /f5 zabij strzyge %;\
    /f6 zabij gargoyle

/def snotlingi= /zwierzeta
/def zwierzeta = \
    /f1 zabij snotlinga %;\
    /f2 zabij niedzwiedzia %;\
    /f3 zabij niedzwiedzice %;\
    /f4 zabij wilka %;\
    /f5 zabij kozice

/def mutanty = \
    /f1 zabij mutanta %;\
    /f2 zabij drugiego mutanta %;\
    /f3 zabij trzeciego mutanta %;\
    /f4 wejdz do namiotu %;\
    /f5 wejdz do chaty %;\
    /f6 wyjscie
;------------------------------------------------------------------------------
;                 RYBY
;------------------------------------------------------------------------------
/def ryby = \
    /f2 zatnij rybe na wedce %;\
    /f3 ocen rybe%%;wloz rybe do plecaka%%;zaloz kotwiczke na wedke%%;zawies rybke na wedce%%;zarzuc wedke %;\
    /f4 wyciagnij siec%%;zarzuc siec%%;wyciagnij wedke%%;/_f3  %;\
    /def -mregexp -t'toczy walke ze zlapana na .* ryba(, ktora jednak| i) zdaje sie zdobywac (nad nia|chwilowa) przewage' ryby_ktos_lowi = /_anty_flood_hide 1 %;\
    /def -P0xB -t'Wyciagasz zlapana rybe na powierzchnie.' ryby_lowie_1 = /msg No to nastepna. ----> F3 %;\
    /def -P0xB -t'Nagle dostrzegasz, ze zanurzony w wodzie sznurek .* napina sie!' ryby_lowie_2 =/beep%%;/msg Ha! Mam Cie.... ----> F2 %;\
    /def -P0xB -t'Zawies co na czym' ryby_lowie_3 = /msg Oho rybki sie skonczyly(albo kotwiczki i do sklepu!) ----> F4  %;\
    /def -P0xB -t'Sznurek .* opada swobodnie na wode, zapewne zlapanej nan rybie udalo sie zerwac.' ryby_lowie_4 =/msg Grrr, a byla taaaaka sztuka ----> F3 %;\
    /msg Piwko w dlon i lowimy.

;------------------------------------------------------------------------------
;|                BINDY                          |
;------------------------------------------------------------------------------
; komendy znalezione gdzies na sieci przez Evina 
; Toggel keypad numeric / application mode 
/def _keypad = \
    /if (ogolne_keypad) \
        /echo -r \033> %;\
    /else \
        /echo -r \033= %;\
    /endif
    
/_keypad

/def keypad = \
    /if ({*} =~ NULL) \
        /if ({ogolne_keypad}) \
            /keypad off %;\
        /else \
            /keypad on %;\
        /endif %;\
    /elseif ($(/_is_on %{*})) \
        /set ogolne_keypad=1 %;\
        /msg Keypad wlaczony. %;\
        /_keypad %;\
    /elseif ($(/_is_off %{*})) \
        /unset ogolne_keypad %;\
        /msg Keypad wylaczony. %;\
        /_keypad %;\
    /else \
        /msg Keypad wlaczyc czy wylaczyc? %;\
    /endif
    
;; Toggle application cursor keys 
/def _curpad = \
    /if (ogolne_curpad) \
        /echo -r \033[?1l %;\
    /else \
        /echo -r \033[?1h %;\
    /endif 

/_curpad

/def curpad = \
    /if ({*} =~ NULL) \
        /if ({ogolne_curpad}) \
            /curpad off %;\
        /else \
            /curpad on %;\
        /endif %;\
    /elseif ($(/_is_on %{*})) \
        /set ogolne_curpad=1 %;\
        /msg Curpad wlaczony. %;\
        /_curpad %;\
    /elseif ($(/_is_off %{*})) \
        /unset ogolne_curpad %;\
        /msg Curpad wylaczony. %;\
        /_curpad %;\
    /else \
        /msg Curpad wlaczyc czy wylaczyc? %;\
    /endif

/def kiershow = \
    /if ({*} =~ NULL) \
        /if ({ogolne_pokazuj_gdzie_ide}) \
            /kiershow off %;\
        /else \
            /kiershow on %;\
        /endif %;\
    /elseif ($(/_is_on %{*})) \
        /set ogolne_pokazuj_gdzie_ide=1 %;\
        /msg Od teraz pokazuje gdzie idziesz. %;\
    /elseif ($(/_is_off %{*})) \
        /unset ogolne_pokazuj_gdzie_ide %;\
        /msg Od teraz nie pokazuje gdzie idziesz. %;\
    /else \
        /msg Uzycie: /kiershow (on|off). %;\
    /endif

/def _pmswitch = \
    /if ({ogolne_przemykanie}==0) \
      /pmon %;\
    /elseif ({ogolne_przemykanie}==1) \
      /pmdru %;\
    /else \
      /pmoff %;\
    /endif

/def pmon = \
    /set ogolne_przemykanie=1 %;\
    /msg Przemykanie wlaczone. %;\
    /_kier_walk_state

/def pmoff = \
    /set ogolne_przemykanie=0 %;\
    /msg Przemykanie wylaczone. %;\
    /_kier_walk_state

/def pmdru = \
    /set ogolne_przemykanie=2 %;\
    /msg Przemykanie druzynowe. %;\
    /_kier_walk_state

/def _kier_walk_state = \
    /purge __kier_state_* %;\
    /if ({ogolne_przemykanie}==0) \
        /unset druzyna_chodzenie %;\
    /elseif ({ogolne_przemykanie}==1) \
        /set druzyna_chodzenie=przemknij%;\
    /else \
        /set druzyna_chodzenie=przemknij z druzyna%;\
    /endif

/_kier_walk_state

/def __kier_state = \
    /let _com_kier=$[strcat(strlen({druzyna_chodzenie}) ? strcat({druzyna_chodzenie}, " ") : "", {1})] %;\
    /if (!{2}) \
        /if ({ogolne_pokazuj_gdzie_ide}==1) \
            /msg Ide: "@{BCblue}%{_com_kier}@{nCgreen}". %;\
        /endif %;\
        /if ({move_time} !~ NULL) \
            /msg Nacisnieto klawisz.. Stopuje chodzika. %;\
            /_idz_stop %;\
        /endif %;\
    /else \
        /msg Ide automagicznie: "@{BCblue}%{_com_kier}@{nCgreen}"! %;\
    /endif %;\
    /set poszedl=1 %;\
    /set last_move=%{1} %;\
    /set last_move_rev=$[_kier_przeciwny({1})] %;\
    /_send_safe %{druzyna_chodzenie} %{1}

/def _kierswitch = \
    /if ({ogolne_kierunki}==0) \
      /k %;\
    /elseif ({ogolne_kierunki}==1) \
      /kier %;\
    /else \
      /nk %;\
    /endif

/def k = \
    /kiera %;\
    /msg Kierunki na numpadzie wlaczone(Cyferki dzialaja!!).

/def kier = \
    /kierb %;\
    /msg Kierunki na numpadzie wlaczone(Cyferki niedzialaja!!).

/def nok = /nk
/def nk = \
    /set ogolne_kierunki=0 %;\
    /msg Kierunki na numpadzie wylaczone. %;\
    /purge __kierunki_* 

/purge -msimple -ib'^[Op'
/purge -msimple -ib'^[Oq'
/purge -msimple -ib'^[Or'
/purge -msimple -ib'^[Os'
/purge -msimple -ib'^[Ot'
/purge -msimple -ib'^[Ou'
/purge -msimple -ib'^[Ov'
/purge -msimple -ib'^[Ow'
/purge -msimple -ib'^[Ox'
/purge -msimple -ib'^[Oy'
/purge -msimple -ib'^[OM'
/purge -msimple -ib'^[On'
/purge -msimple -ib'^[Ol'
/purge -msimple -ib'^[^[Op'
/purge -msimple -ib'^[^[Oq'
/purge -msimple -ib'^[^[Or'
/purge -msimple -ib'^[^[Os'
/purge -msimple -ib'^[^[Ot'
/purge -msimple -ib'^[^[Ou'
/purge -msimple -ib'^[^[Ov'
/purge -msimple -ib'^[^[Ow'
/purge -msimple -ib'^[^[Ox'
/purge -msimple -ib'^[^[Oy'
/purge -msimple -ib'^[^[OM'
/purge -msimple -ib'^[^[On'
/purge -msimple -ib'^[^[Ol'

/def key_nkp+ = /__kier_state %%{nietypowe_wyjscie}

/def kiera = \
    /set ogolne_kierunki=1 %;\
    /purge __kierunki_* %;\
    /def -b'^[Op'      __kierunki_0           = /__kier_state d %;\
    /def -b'^[Oq'      __kierunki_1           = /__kier_state sw %;\
    /def -b'^[Or'      __kierunki_2           = /__kier_state s %;\
    /def -b'^[Os'      __kierunki_3           = /__kier_state se %;\
    /def -b'^[Ot'      __kierunki_4           = /__kier_state w %;\
    /def -b'^[Ou'      __kierunki_5           = /__kier_state u %;\
    /def -b'^[Ov'      __kierunki_6           = /__kier_state e %;\
    /def -b'^[Ow'      __kierunki_7           = /__kier_state nw %;\
    /def -b'^[Ox'      __kierunki_8           = /__kier_state n %;\
    /def -b'^[Oy'      __kierunki_9           = /__kier_state ne %;\
;    /def -b'^[O3'      __kierunki_9a          = /__kier_state ne %;\
    /def -b'^[OM'      __kierunki_enter       = /we %;\
    /def -b'^[On'      __kierunki_del         = /_send_safe %%{ogolne_special_bind-zerknij} %;\
    /def -b'^[Ol'      __kierunki_plus        = /__kier_state %%{nietypowe_wyjscie} %;\
    /def -b'^[^[Op'    __kierunki_esc_0       = przemknij d  %;\
    /def -b'^[^[Oq'    __kierunki_esc_1       = przemknij sw %;\
    /def -b'^[^[Or'    __kierunki_esc_2       = przemknij s  %;\
    /def -b'^[^[Os'    __kierunki_esc_3       = przemknij se %;\
    /def -b'^[^[Ot'    __kierunki_esc_4       = przemknij w  %;\
    /def -b'^[^[Ou'    __kierunki_esc_5       = przemknij u  %;\
    /def -b'^[^[Ov'    __kierunki_esc_6       = przemknij e  %;\
    /def -b'^[^[Ow'    __kierunki_esc_7       = przemknij nw %;\
    /def -b'^[^[Ox'    __kierunki_esc_8       = przemknij n  %;\
    /def -b'^[^[Oy'    __kierunki_esc_9       = przemknij ne %;\
;    /def -b'^[^[O3'    __kierunki_esc_9a      = przemknij ne %;\
    /def -b'^[^[OM'    __kierunki_esc_enter   = /echo esc_Enter %;\
    /def -b'^[^[On'    __kierunki_esc_del     = /echo esc_. %;\
    /def -b'^[^[Ol'    __kierunki_esc_plus    = /echo esc_+

/def kierb = \
    /set ogolne_kierunki=2 %; \
    /purge __kierunki_* %;\
    /def -b'0'      __kierunki_old_0           = /__kier_state d %;\
    /def -b'1'      __kierunki_old_1           = /__kier_state sw %;\
    /def -b'2'      __kierunki_old_2           = /__kier_state s %;\
    /def -b'3'      __kierunki_old_3           = /__kier_state se %;\
    /def -b'4'      __kierunki_old_4           = /__kier_state w %;\
    /def -b'5'      __kierunki_old_5           = /__kier_state u %;\
    /def -b'6'      __kierunki_old_6           = /__kier_state e %;\
    /def -b'7'      __kierunki_old_7           = /__kier_state nw %;\
    /def -b'8'      __kierunki_old_8           = /__kier_state n %;\
    /def -b'9'      __kierunki_old_9           = /__kier_state ne
;   /def -b'^[0'    __kierunki_old_esc_0       = przemknij d  %;\
;   /def -b'^[1'    __kierunki_old_esc_1       = przemknij sw %;\
;   /def -b'^[2'    __kierunki_old_esc_2       = przemknij s  %;\
;   /def -b'^[3'    __kierunki_old_esc_3       = przemknij se %;\
;   /def -b'^[4'    __kierunki_old_esc_4       = przemknij w  %;\
;   /def -b'^[5'    __kierunki_old_esc_5       = przemknij u  %;\
;   /def -b'^[6'    __kierunki_old_esc_6       = przemknij e  %;\
;   /def -b'^[7'    __kierunki_old_esc_7       = przemknij nw %;\
;   /def -b'^[8'    __kierunki_old_esc_8       = przemknij n  %;\
;   /def -b'^[9'    __kierunki_old_esc_9       = przemknij ne

/if (ogolne_kierunki == 1) \
    /kiera %;\
/elseif (ogolne_kierunki == 2) \
    /kierb %;\
/endif

/def spec = \
    /set ogolne_special_bind=%{*} %;\
    /msg Wcisnij . azeby wykonac "@{B}%{*}@{n}".

/def fast_bind = \
    /msg Binduje jednorazowo pod F1 "@{B}%{*}@{n}" %;\
    /set ogolne_bindy_f1 %{*} %%;\
        /set ogolne_bindy_f1 /msg Brak akcji

/purge -msimple -ib'^[[5~'
/purge -msimple -ib'^[[6~'
/purge -msimple -ib'^[^[[5~'
/purge -msimple -ib'^[^[[6~'

/def -ib'^[[5~' _bind_pgup = /test morescroll(-winlines() * (kbnum?:1) + 4)
/def -ib'^[[6~' _bind_pgdn = /test morescroll(winlines() * (kbnum?:1) - 4)
/def -ib'^[^[[5~' _bind_esc_pgup = /test morescroll(-winlines() * (kbnum?:1) / 2)
/def -ib'^[^[[6~' _bind_esc_pgdn = /test morescroll(winlines() * (kbnum?:1) / 2)

/purge -msimple -ib'^[OA'
/purge -msimple -ib'^[[A'
/purge -msimple -ib'^[OB'
/purge -msimple -ib'^[[B'
/def -ib'^[OA' _bind_up_1 = /dokey_searchb 
/def -ib'^[[A' _bind_up_2 = /dokey_searchb
/def -ib'^[OB' _bind_down_1 = /dokey_searchf 
/def -ib'^[[B' _bind_down_2 = /dokey_searchf 

/purge -msimple -ib'^I'
/def -ib'^I' _bind_tab = /complete

/purge -msimple -ib'^R'
/def -b'^R'    _bindy_reconnect = /reconnect

/def -b'^[^M' _bindy_esc_enter    = /sub off %;/dokey newline %;/sub full

/def -b'^[\'' _bindy_powtorz    = /dokey recallb%;/dokey newline

/def -b']'    _bindy_stan    = /_send_safe stan
/def -b'['    _bindy_kondycja    = /_send_safe kondycja wszystkich


/for i 1 12 \
    /def _F%{i} = /_send_safe $[strcat("%{", "ogolne_bindy_f", {i}, "}")] %;\
    /def F%{i} = \
        /if ({#}) \
            /set ogolne_bindy_f%{i}=%%{*} %%;\
            /echo -p -aCgreen Od teraz @{B}"F%{i}"@{n} oznacza @{B}"%%{*}"@{n}. %%;\
        /else \
            /echo -p -aCgreen @{B}"F%{i}"@{n} oznacza @{B}"$[strcat("%{", "ogolne_bindy_f", {i}, "}")]"@{n}. %%;\
        /endif %;\
    /def _AF%{i} = /_send_safe $[strcat("%{", "ogolne_bindy_af", {i}, "}")] %;\
    /def AF%{i} = \
        /if ({#}) \
            /set ogolne_bindy_af%{i}=%%{*} %%;\
            /echo -p -aCgreen Od teraz @{B}"AF%{i}"@{n} oznacza @{B}"%%{*}"@{n}. %%;\
        /else \
            /echo -p -aCgreen @{B}"AF%{i}"@{n} oznacza @{B}"$[strcat("%{", "ogolne_bindy_af", {i}, "}")]"@{n}. %%;\
        /endif %;\
    /def _SF%{i} = /_send_safe $[strcat("%{", "ogolne_bindy_sf", {i}, "}")] %;\
    /def SF%{i} = \
        /if ({#}) \
            /set ogolne_bindy_sf%{i}=%%{*} %%;\
            /echo -p -aCgreen Od teraz @{B}"SF%{i}"@{n} oznacza @{B}"%%{*}"@{n}. %%;\
        /else \
            /echo -p -aCgreen @{B}"SF%{i}"@{n} oznacza @{B}"$[strcat("%{", "ogolne_bindy_sf", {i}, "}")]"@{n}. %%;\
        /endif

/if ({ogolne_bindy_f1} =~ NULL) \
    /set ogolne_bindy_f1=/pomoc %;\
    /set ogolne_bindy_f2=/help %;\
    /set ogolne_bindy_f3=/echo Pusto F3. %;\
    /set ogolne_bindy_f4=/echo Pusto F4. %;\
    /set ogolne_bindy_f5=/echo Pusto F5. %;\
    /set ogolne_bindy_f6=/echo Pusto F6. %;\
    /set ogolne_bindy_f7=/_swiatloswitch %;\
    /set ogolne_bindy_f8=/_autolootswitch %;\
    /set ogolne_bindy_f9=/_pmswitch %;\
    /set ogolne_bindy_f10=/_kierswitch %;\
    /set ogolne_bindy_f11=przestan walczyc %;\
    /set ogolne_bindy_f12=ob wroga %;\
/endif

/def bindy = \
    /for i 1 12 /eval /msg @{B}"$$[pad(strcat("F", {i}),-3)]" @{n}oznacza @{B}"$$[strcat("%%{", "ogolne_bindy_f", {i}, "}")]"@{n} %;\
    /for i 1 12 /eval /msg @{B}"$$[pad(strcat("AF", {i}),-3)]" @{n}oznacza @{B}"$$[strcat("%%{", "ogolne_bindy_af", {i}, "}")]"@{n} %;\
    /for i 1 12 /eval /msg @{B}"$$[pad(strcat("SF", {i}),-3)]" @{n}oznacza @{B}"$$[strcat("%%{", "ogolne_bindy_sf", {i}, "}")]"@{n}

/def key_nkp- = /_idz_next
/def _F4_num = /_idz_next

/def _bind_one = \
    /eval /purge -msimple -ib'%{1}' %;\
    /eval /def -b'%{1}' _bind_%{2} = /_%{3}

/def _bind_me = \
    /test _bind_one("^[[[A", "f1_1", "F1") %;\
    /test _bind_one("^[OP", "f1_2", "F1") %;\
    /test _bind_one("^[[11~", "f1_3", "F1") %;\
    /test _bind_one("^[[M", "f1_4", "F1") %;\
    \
    /test _bind_one("^[[[B", "f2_1", "F2") %;\
    /test _bind_one("^[OQ", "f2_2", "F2") %;\
    /test _bind_one("^[[12~", "f2_3", "F2") %;\
    /test _bind_one("^[[N", "f2_4", "F2") %;\
    \
    /test _bind_one("^[[[C", "f3_1", "F3") %;\
    /test _bind_one("^[OR", "f3_2", "F3") %;\
    /test _bind_one("^[[13~", "f3_3", "F3") %;\
    /test _bind_one("^[[O", "f3_4", "F3") %;\
    \
    /test _bind_one("^[[[D", "f4_1", "F4") %;\
    /test _bind_one("^[OS", "f4_2", "F4_num") %;\
    /test _bind_one("^[[14~", "f4_3", "F4") %;\
    /test _bind_one("^[[P", "f4_4", "F4") %;\
    \
    /test _bind_one("^[[[E", "f5_1", "F5") %;\
    /test _bind_one("^[[15~", "f5_2", "F5") %;\
    /test _bind_one("^[[16~", "f5_3", "F5") %;\
    /test _bind_one("^[[Q", "f5_4", "F5") %;\
    /test _bind_one("^[m", "f5_5", "F5") %;\
    \
    /test _bind_one("^[[17~", "f6_1", "F6") %;\
    /test _bind_one("^[[R", "f6_2", "F6") %;\
    \
    /test _bind_one("^[[18~", "f7_1", "F7") %;\
    /test _bind_one("^[[S", "f7_2", "F7") %;\
    \
    /test _bind_one("^[[19~", "f8_1", "F8") %;\
    /test _bind_one("^[[T", "f8_2", "F8") %;\
    \
    /test _bind_one("^[[20~", "f9_1", "F9") %;\
    /test _bind_one("^[[U", "f9_2", "F9") %;\
    \
    /test _bind_one("^[[21~", "f10_1", "F10") %;\
    /test _bind_one("^[[V", "f10_2", "F10") %;\
    \
    /test _bind_one("^[[23~", "f11_1", "F11") %;\
    /test _bind_one("^[[W", "f11_2", "F11") %;\
    \
    /test _bind_one("^[[24~", "f12_1", "F12") %;\
    /test _bind_one("^[[X", "f12_2", "F12") %;\
    \
    \
    /test _bind_one("^[^[[[A", "escf1_1", "AF1") %;\
    /test _bind_one("^[^[OP", "escf1_2", "AF1") %;\
    /test _bind_one("^[^[[11~", "escf1_3", "AF1") %;\
    /test _bind_one("^[^[[[B", "escf2_1", "AF2") %;\
    /test _bind_one("^[^[OQ", "escf2_2", "AF2") %;\
    /test _bind_one("^[^[[12~", "escf2_3", "AF2") %;\
    /test _bind_one("^[^[[[C", "escf3_1", "AF3") %;\
    /test _bind_one("^[^[OR", "escf3_2", "AF3") %;\
    /test _bind_one("^[^[[13~", "escf3_3", "AF3") %;\
    /test _bind_one("^[^[[[D", "escf4_1", "AF4") %;\
    /test _bind_one("^[^[OS", "escf4_2", "AF4") %;\
    /test _bind_one("^[^[[14~", "escf4_3", "AF4") %;\
    /test _bind_one("^[^[[[E", "escf5_1", "AF5") %;\
    /test _bind_one("^[^[[15~", "escf5_2", "AF5") %;\
    /test _bind_one("^[^[[16~", "escf5_3", "AF5") %;\
    /test _bind_one("^[^[[34~", "escf5_4", "AF5") %;\
    /test _bind_one("^[^[m", "escf5_5", "AF5") %;\
    /test _bind_one("^[^[[17~", "escf6_1", "AF6") %;\
    /test _bind_one("^[^[[18~", "escf7_1", "AF7") %;\
    /test _bind_one("^[^[[19~", "escf8_1", "AF8") %;\
    /test _bind_one("^[^[[20~", "escf9_1", "AF9") %;\
    /test _bind_one("^[^[[21~", "escf10_1", "AF10") %;\
    /test _bind_one("^[^[[23~", "escf11_1", "AF11") %;\
    /test _bind_one("^[^[[24~", "escf12_1", "AF12") %;\
    /test _bind_one("^[[25~", "shift1_1", "SF1") %;\
    /test _bind_one("^[[26~", "shift2_1", "SF2") %;\
    /test _bind_one("^[[28~", "shift3_1", "SF3") %;\
    /test _bind_one("^[[29~", "shift4_1", "SF4") %;\
    /test _bind_one("^[[31~", "shift5_1", "SF5") %;\
    /test _bind_one("^[[32~", "shift6_1", "SF6") %;\
    /test _bind_one("^[[33~", "shift7_1", "SF7") %;\
    /test _bind_one("^[[34~", "shift8_1", "SF8")
    
/_bind_me


