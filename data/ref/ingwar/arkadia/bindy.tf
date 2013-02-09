; Automagicly added line: tf_ver=1.0.4
;------------------------------------------------------------------------------
;|			     BINDOWANIE SZYBKIE				      |
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
;|				BINDY					      |
;------------------------------------------------------------------------------

/def kiershow = \
    /if ({1} =~ "on" | {1} =~ "1" | {1} =~ "wl") \
	/set ogolne_pokazuj_gdzie_ide=1 %;\
	/_echo ####### Od teraz pokazuje gdzie idziesz ###### %;\
    /elseif ({1} =~ "off" | {1} =~ "0" | {1} =~ "wyl") \
	/set ogolne_pokazuj_gdzie_ide=0 %;\
	/_echo ####### Od teraz nie pokazuje gdzie idziesz ###### %;\
    /else \
	/_echo Uzycie: /kiershow (on|off) %;\
    /endif

/def pmswitch = \
    /if ({ogolne_przemykanie}==0) \
      /pmon %;\
    /elseif ({ogolne_przemykanie}==1) \
      /pmdru %;\
    /else \
      /pmoff %;\
    /endif

/def pmon = \
    /set ogolne_przemykanie=1 %;\
    /_echo ####### Przemykanie wlaczone  ####### %;\
    /_kier_walk_state

/def pmoff = \
    /set ogolne_przemykanie=0 %;\
    /_echo ####### Przemykanie wylaczone ####### %;\
    /_kier_walk_state

/def pmdru = \
    /set ogolne_przemykanie=2 %;\
    /_echo ####### Przemykanie druzynowe ####### %;\
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
    /if ({ogolne_pokazuj_gdzie_ide}==1) \
	/echo Ide: %{druzyna_chodzenie} %{1} %;\
    /endif %;\
    /set poszedl=1 %;\
    %{druzyna_chodzenie} %{1}

/def kierswitch = \
    /if ({ogolne_kierunki}==0) \
      /k %;\
    /elseif ({ogolne_kierunki}==1) \
      /kier %;\
    /else \
      /nk %;\
    /endif

/def k = \
    /kiera %;\
    /_echo ####### Kierunki na numpadzie wlaczone(Cyferki dzialaja!!) #######

/def kier = \
    /kierb %;\
    /_echo ####### Kierunki na numpadzie wlaczone(Cyferki niedzialaja!!) #######

/def nok=/nk
/def nk = \
    /set ogolne_kierunki=0 %;\
    /_echo ####### Kierunki na numpadzie wylaczone ####### %;\
    /purge __kierunki_* 

/purge -msimple -ib'^[Os'
/purge -msimple -ib'^[Oy'

/def kiera = \
    /set ogolne_kierunki=1 %; \
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
    /def -b'^[O3'      __kierunki_9a          = /__kier_state ne %;\
    /def -b'^[OM'      __kierunki_enter       = /we %;\
    /def -b'^[On'      __kierunki_del         = /_special %;\
    /def -b'^[Ol'      __kierunki_plus        = kondycja wszystkich %;\
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
    /def -b'^[^[O3'    __kierunki_esc_9a      = przemknij ne %;\
    /def -b'^[^[OM'    __kierunki_esc_enter   = /echo esc_Enter %;\
    /def -b'^[^[On'    __kierunki_esc_del     = /echo esc_. %;\
    /def -b'^[^[Ol'    __kierunki_esc_plus    = /echo esc_+

/def kierb=\
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
    /def -b'9'      __kierunki_old_9           = /__kier_state ne %;\
    /def -b'^[0'    __kierunki_old_esc_0       = przemknij d  %;\
    /def -b'^[1'    __kierunki_old_esc_1       = przemknij sw %;\
    /def -b'^[2'    __kierunki_old_esc_2       = przemknij s  %;\
    /def -b'^[3'    __kierunki_old_esc_3       = przemknij se %;\
    /def -b'^[4'    __kierunki_old_esc_4       = przemknij w  %;\
    /def -b'^[5'    __kierunki_old_esc_5       = przemknij u  %;\
    /def -b'^[6'    __kierunki_old_esc_6       = przemknij e  %;\
    /def -b'^[7'    __kierunki_old_esc_7       = przemknij nw %;\
    /def -b'^[8'    __kierunki_old_esc_8       = przemknij n  %;\
    /def -b'^[9'    __kierunki_old_esc_9       = przemknij ne

/def spec = \
    /purge _special %;\
    /def _special = /eval %{*} %;\
    /echo #### Jako speca wykonujesz "%{*}". ####

/def _special = sp


/purge -msimple -ib'^[[5~'
/purge -msimple -ib'^[[6~'
/purge -msimple -ib'^[^[[5~'
/purge -msimple -ib'^[^[[6~'

/def -ib'^[[5~'		_bindy_PgUp = /test morescroll(-winlines() * (kbnum?:1) + 1)
/def -ib'^[[6~' 	_bindy_PgDn = /test morescroll(winlines() * (kbnum?:1) - 1)
/def -ib'^[^[[5~' 	_bindy_Alt_PgUp = /test morescroll(-winlines() * (kbnum?:1) / 2)
/def -ib'^[^[[6~' 	_bindy_Alt_PgDn = /test morescroll(winlines() * (kbnum?:1) / 2)

/purge -msimple -ib'^[[3~'
/def -ib'^[[3~' _bindy_delete = /dokey_dch

/purge -msimple -ib'^[OA'
/purge -msimple -ib'^[OB'
/purge -msimple -ib'^[[A'
/purge -msimple -ib'^[[B'
/purge -msimple -ib'^R'
/purge -msimple -ib'^I'
/def -ib'^[OA' 	_bindy_up_1 	= /dokey searchb 
/def -ib'^[OB'	_bindy_down_1	= /dokey searchf 
/def -ib'^[[A' 	_bindy_up_2	= /dokey searchb
/def -ib'^[[B' 	_bindy_down_2	= /dokey searchf

/def -b'^R' 	_bindy_reconnect= /reconnect

/def -ib'^I'	_bindy_tab	= /complete
/def -b'^[^M'   _bindy_escenter	= /sub off %;/dokey newline %;/sub full

/def -b'^[\''	_bindy_powtorz	= /dokey recallb%;/dokey newline

/def -b']'	_bindy_stan	= stan
/def -b'['	_bindy_kondycja	= kondycja wszystkich


/for i 1 12 \
    /def _F%{i} = /eval $[strcat("%{", "ogolne_bindy_f", {i}, "}")] %;\
    /def F%{i} = \
      /set ogolne_bindy_f%{i}=%%{*} %%;\
      /echo -p -aCgreen Od teraz @{B}"F%{i}"@{n} oznacza @{B}"%%{*}"@{n}.

/if ({ogolne_bindy_f1} =~ NULL) \
    /set ogolne_bindy_f1=/pomoc %;\
    /set ogolne_bindy_f2=/help %;\
    /set ogolne_bindy_f3=/echo Pusto F3. %;\
    /set ogolne_bindy_f4=/echo Pusto F4. %;\
    /set ogolne_bindy_f5=/echo Pusto F5. %;\
    /set ogolne_bindy_f6=/echo Pusto F6. %;\
    /set ogolne_bindy_f7=/swiatloswitch %;\
    /set ogolne_bindy_f8=/autolootswitch %;\
    /set ogolne_bindy_f9=/pmswitch %;\
    /set ogolne_bindy_f10=/kierswitch %;\
    /set ogolne_bindy_f11=przestan walczyc %;\
    /set ogolne_bindy_f12=ob wroga %;\
/endif

/def bindy = \
    /for i 1 12 /eval /echo -p -aCgreen @{B}"$$[pad(strcat("F", {i}),-3)]" @{n}oznacza @{B}"$$[strcat("%%{", "ogolne_bindy_f", {i}, "}")]"@{n}


/def bind_me = \
    \
    /purge -msimple -ib'^[[[A' %;\
    /def -b'^[[[A'    _bind_f1_1       = /_F1  %;\
    /purge -msimple -ib'^[OP' %;\
    /def -b'^[OP'     _bind_f1_2       = /_F1  %;\
    /purge -msimple -ib'^[[11~' %;\
    /def -b'^[[11~'   _bind_f1_3       = /_F1  %;\
    /def -b'^[[M'     _bind_f1_4       = /_F1  %;\
    \
    /def -b'^[[[B'    _bind_f2_1       = /_F2  %;\
    /def -b'^[OQ'     _bind_f2_2       = /_F2  %;\
    /def -b'^[[12~'   _bind_f2_3       = /_F2  %;\
    /def -b'^[[N'     _bind_f2_4       = /_F2  %;\
    \
    /def -b'^[[[C'    _bind_f3_1       = /_F3  %;\
    /def -b'^[OR'     _bind_f3_2       = /_F3  %;\
    /def -b'^[[13~'   _bind_f3_3       = /_F3  %;\
    /def -b'^[[O'     _bind_f3_4       = /_F3  %;\
    \
    /def -b'^[[[D'    _bind_f4_1       = /_F4  %;\
    /def -b'^[OS'     _bind_f4_2       = /_F4  %;\
    /def -b'^[[14~'   _bind_f4_3       = /_F4  %;\
    /def -b'^[[P'     _bind_f4_4       = /_F4  %;\
    \
    /def -b'^[[[E'    _bind_f5_1       = /_F5  %;\
    /def -b'^[[15~'   _bind_f5_2       = /_F5  %;\
    /def -b'^[[16~'   _bind_f5_3       = /_F5  %;\
    /def -b'^[[Q'     _bind_f5_4       = /_F5  %;\
    /def -b'^[m'      _bind_f5_5       = /_F5  %;\
    \
    /def -b'^[[17~'   _bind_f6_1       = /_F6  %;\
    /def -b'^[[R'     _bind_f6_2       = /_F6  %;\
    \
    /def -b'^[[18~'   _bind_f7_1       = /_F7  %;\
    /def -b'^[[S'     _bind_f7_2       = /_F7  %;\
    \
    /def -b'^[[19~'   _bind_f8_1       = /_F8  %;\
    /def -b'^[[T'     _bind_f8_2       = /_F8  %;\
    \
    /def -b'^[[20~'   _bind_f9_1       = /_F9  %;\
    /def -b'^[[U'     _bind_f9_2       = /_F9  %;\
    \
    /def -b'^[[21~'   _bind_f10_1      = /_F10 %;\
    /def -b'^[[V'     _bind_f10_2      = /_F10 %;\
    \
    /def -b'^[[23~'   _bind_f11_1      = /_F11 %;\
    /def -b'^[[W'     _bind_f11_2      = /_F11 %;\
    \
    /def -b'^[[24~'   _bind_f12_1      = /_F12 %;\
    /def -b'^[[X'     _bind_f12_2      = /_F12 %;\
    \
    \
    /def -b'^[^[[[A'  _bind_escf1_1    = /ESCF1  %;\
    /def -b'^[^[OP'   _bind_escf1_2    = /ESCF1  %;\
    /def -b'^[^[[11~' _bind_escf1_3    = /ESCF1  %;\
    /def -b'^[^[[[B'  _bind_escf2_1    = /ESCF2  %;\
    /def -b'^[^[OQ'   _bind_escf2_2    = /ESCF2  %;\
    /def -b'^[^[[12~' _bind_escf2_3    = /ESCF2  %;\
    /def -b'^[^[[[C'  _bind_escf3_1    = /ESCF3  %;\
    /def -b'^[^[OR'   _bind_escf3_2    = /ESCF3  %;\
    /def -b'^[^[[13~' _bind_escf3_3    = /ESCF3  %;\
    /def -b'^[^[[[D'  _bind_escf4_1    = /ESCF4  %;\
    /def -b'^[^[OS'   _bind_escf4_2    = /ESCF4  %;\
    /def -b'^[^[[14~' _bind_escf4_3    = /ESCF4  %;\
    /def -b'^[^[[[E'  _bind_escf5_1    = /ESCF5  %;\
    /def -b'^[^[[15~' _bind_escf5_2    = /ESCF5  %;\
    /def -b'^[^[[16~' _bind_escf5_3    = /ESCF5  %;\
    /def -b'^[^[[34~' _bind_escf5_4    = /ESCF5  %;\
    /def -b'^[^[m'    _bind_escf5_5    = /ESCF5  %;\
    /def -b'^[^[[17~' _bind_escf6_1    = /ESCF6  %;\
    /def -b'^[^[[18~' _bind_escf7_1    = /ESCF7  %;\
    /def -b'^[^[[19~' _bind_escf8_1    = /ESCF8  %;\
    /def -b'^[^[[20~' _bind_escf9_1    = /ESCF9  %;\
    /def -b'^[^[[21~' _bind_escf10_1   = /ESCF10 %;\
    /def -b'^[^[[23~' _bind_escf11_1   = /ESCF11 %;\
    /def -b'^[^[[24~' _bind_escf12_1   = /ESCF12 %;\
    /def -b'^[[25~'   _bindshift1_1  = /SHIFTF1  %;\
    /def -b'^[[26~'   _bindshift2_1  = /SHIFTF2  %;\
    /def -b'^[[28~'   _bindshift3_1  = /SHIFTF3  %;\
    /def -b'^[[29~'   _bindshift4_1  = /SHIFTF4  %;\
    /def -b'^[[31~'   _bindshift5_1  = /SHIFTF5  %;\
    /def -b'^[[32~'   _bindshift6_1  = /SHIFTF6  %;\
    /def -b'^[[33~'   _bindshift7_1  = /SHIFTF7  %;\
    /def -b'^[[34~'   _bindshift8_1  = /SHIFTF8 

/bind_me
