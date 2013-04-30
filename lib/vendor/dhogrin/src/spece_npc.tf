/def _npcspecuj = \
  /let _spec_skrot=%{1}%;\
  /let _spec_kto=%{2}%;\
  /let _spec_kogo=%{3}%;\
  /let _spec_ile=%{4}%;\
  /let _spec_na_ile=%{5}%;\
  /let _spec_gdzie=%{6}%; \
  /let _spec_co_robi=$[{_spec_ile}!="0" ? "specuje" : "probuje specowac"]%;\
    /if (regmatch(strcat("(", {druzyna-druzyna}, "|", {ogolne_leader-leader}, ")"), {_spec_kogo})) \
        /test _zaslony_set({_spec_kto}, toupper({_spec_kogo}, 1)) %;\
    /endif%; \
;  /let _spec_koment=$[strlen({7})>0 ? strcat(" (",{7},")") : ""]%;\
  /return substitute(strcat(decode_attr(strcat("@{BCwhite}-------> @{nCcyan}[",{_spec_skrot}," ",{_spec_ile},"/",{_spec_na_ile},"] @{BCyellow}",{_spec_kto}," @{Cwhite}",{_spec_co_robi}," @{Cblue}",{_spec_kogo},"@{Cwhite}",{_spec_koment},"."))))


#######################################################################################################################################################
#######################################################################################################################################################
#######################################################################################################################################################

#     ---> RYBOLUDZIE <----
; Aktualizacja: 23.04.13
/set _spece_npc_ryboludzie_label=Rybka
/def -aLg -Fp100 -mregexp -t' nadyma swe miesiste skrzela sprawiajac wrazenie wiekszego niz jest w rzeczywistosci. Uciekajace przez nie powietrze wydaje z siebie glosny syk. (.*) zaaferowan[aey] tym widokiem nie zauwaza jak [^ ]+ przeciwnik wyprowadza szybki cios (.*) mierzac w (.*)\.' _spec_npc_ryboludzie_line1 = \
  /set _spec_rybka_kto=%{PL}%; \
  /set _spec_rybka_kogo=%{P1}
/def -aLg -Fp100 -mregexp -t' nadyma swe miesiste skrzela sprawiajac wrazenie wiekszego niz jest w rzeczywistosci. Uciekajace przez nie powietrze wydaje z siebie glosny syk. Zaaferowany tym widokiem nie zauwazasz jak przeciwnik wyprowadza szybki cios (.*) mierzac w (.*)\.' _spec_npc_ryboludzie_line1_mnie = \
  /set _spec_rybka_kto=%{PL}%; \
  /set _spec_rybka_kogo=ciebie
  
/def -Fp100 -mregexp -t' w ostatniej chwili szczesliwie uskakuje, a z sykiem skrzel potwora laczy sie swist mijajacej broni.' _spece_npc_ryboludzie_kogos_0 = \
  /return (_npcspecuj({_spece_npc_ryboludzie_label}, {_spec_rybka_kto}, {_spec_rybka_kogo}, "0", "4"))
/def -Fp100 -mregexp -t' w ostatniej chwili wykonuje szybki uskok czesciowo unikajac morderczego ciosu. Swist broni laczy sie ze zgrzytem [^ ]+ zebow zaciskajacych sie pod wplywem bolu z wlasnie powstalej niewielkiej rany.' _spece_npc_ryboludzie_kogos_1 = \
  /return (_npcspecuj({_spece_npc_ryboludzie_label}, {_spec_rybka_kto}, {_spec_rybka_kogo}, "1", "4"))
/def -Fp100 -mregexp -t' w ostatniej chwili zauwaza pedzaca ku sobie bron, ktora ze swistem dosiega [^ ]+ ciala powodujac bolesne obrazenia.' _spece_npc_ryboludzie_kogos_2 = \
  /return (_npcspecuj({_spece_npc_ryboludzie_label}, {_spec_rybka_kto}, {_spec_rybka_kogo}, "2", "4"))
/def -Fp100 -mregexp -t' w ostatniej chwili zauwaza pedzaca ku sobie bron, ktora ze swistem dosiega [^ ]+ ciala powodujac rozlegle obrazenia.' _spece_npc_ryboludzie_kogos_3 = \
  /return (_npcspecuj({_spece_npc_ryboludzie_label}, {_spec_rybka_kto}, {_spec_rybka_kogo}, "3", "4"))


/def -Fp100 -mregexp -t'W ostatniej chwili szczesliwie uskakujesz, a z sykiem skrzel laczy sie swist mijajacej cie broni.' _spece_npc_ryboludzie_mnie_0 = \
  /return (_npcspecuj({_spece_npc_ryboludzie_label}, {_spec_rybka_kto}, {_spec_rybka_kogo}, "0", "4"))
/def -Fp100 -mregexp -t'W ostatniej chwili wykonujesz szybki uskok czesciowo unikajac morderczego ciosu. Swist broni laczy sie ze zgrzytem twoich zebow zaciskajacych sie pod wplywem bolu z wlasnie powstalej niewielkiej rany.' _spece_npc_ryboludzie_mnie_1 = \
  /return (_npcspecuj({_spece_npc_ryboludzie_label}, {_spec_rybka_kto}, {_spec_rybka_kogo}, "1", "4"))
/def -Fp100 -mregexp -t'W ostatniej chwili zauwazasz pedzaca ku tobie bron, ktora ze swistem dosiega twego ciala powodujac u ciebie bolesne obrazenia.' _spece_npc_ryboludzie_mnie_2 = \
  /return (_npcspecuj({_spece_npc_ryboludzie_label}, {_spec_rybka_kto}, {_spec_rybka_kogo}, "2", "4"))
/def -Fp100 -mregexp -t'W ostatniej chwili widzisz jak bron zmierza ku swemu nieuniknionemu przeznaczeniu. Ku twemu cialu, ktore jeszcze jest tak zywe i czujace. Bol pekajacych kosci i rozbijanych narzadow zalewa ciemna kurtyna twoje oczy. W ciemnosci slyszysz tylko dziki, pelen euforii syk ryboczleka, ktory nie znajac litosci swietuje swoje kolejne zwyciestwo.' _spece_npc_ryboludzie_mnie_4 = \
  /return (_npcspecuj({_spece_npc_ryboludzie_label}, {_spec_rybka_kto}, {_spec_rybka_kogo}, "4", "4"))

#     ---> PAJAKI W SHEKHAL <---
; Aktualizacja 11.04.13
/set _spece_npc_pajak_label=Pajak
/def -Fp100 -mregexp -t'(Pajakowaty ruchliwy stwor) skacze w twoim kierunku! Pudluje i mija (cie) w sporej odleglosci.' _spec_pajaka_0 = \
  /return (_npcspecuj({_spece_npc_pajak_label}, {P1}, {P2}, "0", "2"))
/def -Fp100 -mregexp -t'Nagle (pajakowaty ruchliwy stwor) wybija sie i skacze w twoja strone. Przelatuje w sporej odleglosci, ale jeden z pazurow muska (cie).' _spec_pajaka_1 = \
  /return (_npcspecuj({_spece_npc_pajak_label}, {P1}, {P2}, "1", "2"))
/def -Fp100 -mregexp -t'Bez zadnego ostrzezenia, nagle (pajakowaty ruchliwy stwor) skacze na (ciebie). W locie wsciekle mlynkuje odnozami, jedno z nich celnie trafia, raniac cie lekko.' _spec_pajaka_2 = \
  /return (_npcspecuj({_spece_npc_pajak_label}, {P1}, {P2}, "2", "2"))
  
#     ---> TROLLE MAHAKAMSKIE <---
; Zwykły spec trolla
; Aktualizacja 11.04.13
/set _spece_npc_mahakam_troll_label=Troll
/def -Fp100 -mregexp -t' kompletnie ((cie) spudlowal|spudlowal (.*))\.' trolla_spec_0_1 = \
  /return (_npcspecuj({_spece_npc_mahakam_troll_label}, {PL}, strcat({P2}, {P3}), "0", "6"))
/def -Fp100 -mregexp -t' probowal ((cie) ciac lecz latwo udalo ci sie uniknac ciosu|ciac (.*) lecz udalo [^ ]+ sie uniknac ciosu)\.' trolla_spec_0_2 = \
  /return (_npcspecuj({_spece_npc_mahakam_troll_label}, {PL}, strcat({P2}, {P3}), "0", "6"))
/def -Fp100 -mregexp -t' zaatakowal ((cie) gwaltownie, lecz nie trafil|gwaltownie (.*), lecz nie trafil)\.' trolla_spec_0_3 = \
  /return (_npcspecuj({_spece_npc_mahakam_troll_label}, {PL}, strcat({P2}, {P3}), "0", "6"))
/def -Fp100 -mregexp -t' zamachnal sie na (.*), (ale|lecz) straszliwie spudlowal(!| !)' trolla_spec_0_4 = \
  /return (_npcspecuj({_spece_npc_mahakam_troll_label}, {PL}, {P1}, "0", "6"))
/def -Fp100 -mregexp -t' zamierzyl sie na (.*), lecz nie trafil\.' trolla_spec_0_5 = \
  /return (_npcspecuj({_spece_npc_mahakam_troll_label}, {PL}, {P1}, "0", "6"))
/def -Fp100 -mregexp -t' (asekuracyjnie zaatakowal|cial z determinacja|groznie sie zamachnal|niespodziewanie podskoczyl|uderzyl zza ucha|zaatakowal robiac serie unikow|zaatakowal schylajac sie nisko|zamachnal sie szeroko|ostro zaatakowal) i niemal bezsilnie dotknal (.*) w (nogi|korpus|glowe|lewe ramie|prawe ramie)(.*)\.' trolla_spec_1 = \
  /return (_npcspecuj({_spece_npc_mahakam_troll_label}, {PL}, {P2}, "1", "6", {P3}))
/def -Fp100 -mregexp -t' (asekuracyjnie zaatakowal|cial z determinacja|groznie sie zamachnal|niespodziewanie podskoczyl|uderzyl zza ucha|zaatakowal robiac serie unikow|zaatakowal schylajac sie nisko|zamachnal sie szeroko|ostro zaatakowal) i lekko dotknal (.*) w (nogi|korpus|glowe|lewe ramie|prawe ramie)(.*)\.' trolla_spec_2 = \
  /return (_npcspecuj({_spece_npc_mahakam_troll_label}, {PL}, {P2}, "2", "6", {P3}))
/def -Fp100 -mregexp -t' (asekuracyjnie zaatakowal|cial z determinacja|groznie sie zamachnal|niespodziewanie podskoczyl|uderzyl zza ucha|zaatakowal robiac serie unikow|zaatakowal schylajac sie nisko|zamachnal sie szeroko|ostro zaatakowal) i miekko dotknal (.*) w (nogi|korpus|glowe|lewe ramie|prawe ramie)(.*)\.' trolla_spec_3 = \
  /return (_npcspecuj({_spece_npc_mahakam_troll_label}, {PL}, {P2}, "3", "6", {P3}))
/def -Fp100 -mregexp -t' (asekuracyjnie zaatakowal|cial z determinacja|groznie sie zamachnal|niespodziewanie podskoczyl|uderzyl zza ucha|zaatakowal robiac serie unikow|zaatakowal schylajac sie nisko|zamachnal sie szeroko|ostro zaatakowal) i miekko puknal (.*) w (nogi|korpus|glowe|lewe ramie|prawe ramie)(.*)\.' trolla_spec_4 = \
  /return (_npcspecuj({_spece_npc_mahakam_troll_label}, {PL}, {P2}, "4", "6", {P3}))
/def -Fp100 -mregexp -t' (asekuracyjnie zaatakowal|cial z determinacja|groznie sie zamachnal|niespodziewanie podskoczyl|uderzyl zza ucha|zaatakowal robiac serie unikow|zaatakowal schylajac sie nisko|zamachnal sie szeroko|ostro zaatakowal) i mocno stuknal (.*) w (nogi|korpus|glowe|lewe ramie|prawe ramie)(.*)\.' trolla_spec_5 = \
  /return (_npcspecuj({_spece_npc_mahakam_troll_label}, {PL}, {P2}, "5", "6", {P3}))
/def -Fp100 -mregexp -t' (asekuracyjnie zaatakowal|cial z determinacja|groznie sie zamachnal|niespodziewanie podskoczyl|uderzyl zza ucha|zaatakowal robiac serie unikow|zaatakowal schylajac sie nisko|zamachnal sie szeroko|ostro zaatakowal) i solidnie walnal (.*) w (nogi|korpus|glowe|lewe ramie|prawe ramie)(.*)\.' trolla_spec_6 = \
  /return (_npcspecuj({_spece_npc_mahakam_troll_label}, {PL}, {P2}, "6", "6", {P3}))

; Ryk!
; Aktualizacja: 11.04.13
/set _spece_npc_mahakam_troll_ryk_label=Trolla RYK
/def -Fp100 -mregexp -t' ryczac glosno robi kilka zamachow (.*) probujac trafic (.*) w (.*).'  trolla_spec_ryk_0 = \
  /return (_npcspecuj({_spece_npc_mahakam_troll_ryk_label}, {PL}, {P2}, "0", "3"))
/def -Fp100 -mregexp -t' ryczac glosno (robi|wykonuje) duzy zamach (.*) i trafia (.*) niegroznie w (.*).'  trolla_spec_ryk_1 = \
  /return (_npcspecuj({_spece_npc_mahakam_troll_ryk_label}, {PL}, {P3}, "1", "3"))
/def -Fp100 -mregexp -t' ryczac glosno (robi|wykonuje) szybki zamach (.*) i trafia (.*) silnie w (.*).'  trolla_spec_ryk_2 = \
  /return (_npcspecuj({_spece_npc_mahakam_troll_ryk_label}, {PL}, {P3}, "2", "3"))
/def -Fp100 -mregexp -t' ryczac przerazajaco (robi|wykonuje) szybki zamach (.*) i trafia (.*) bardzo silnie w (.*)otwierajac spora, krwawiaca rane.'  trolla_spec_ryk_3 = \
  /return (_npcspecuj({_spece_npc_mahakam_troll_ryk_label}, {PL}, {P3}, "3", "3"))

#     ---> GOBLINY Z IMPERIUM <---
/def -Fp100 -mregexp -t'(Nozdrza (.*) goblina (.*) ostrzec cie (.*))' sub_goblinaspecwemnie0_tarcza = /substitute -p @{BCwhite}-------> @{Ccyan}[Goblin 0/3] @{Cwhite}proba speca @{Cyellow}%{P2} goblina @{Cblue}we mnie @{Cwhite}(tarcza).
/def -Fp100 -mregexp -t'(W slepiach (.*) goblina pojawia sie (.*) tuz przed twoja glowa.)' sub_goblinaspecwemnie0_pudlo = /substitute -p @{BCwhite}-------> @{Ccyan}[Goblin 0/3] @{Cwhite}proba speca @{Cyellow}%{P2} goblina @{Cblue}we mnie @{Cwhite}(pudlo).
/def -Fp100 -mregexp -t'(Z gardla (.*) goblina wydobywa sie (.*) uderzenie zeslizguje sie po (twej|twym|twych) (.*))' sub_goblinaspecwemnie0_zbroja = /substitute -p @{BCwhite}-------> @{Ccyan}[Goblin 0/3] @{Cwhite}proba speca @{Cyellow}%{P2} goblina @{Cblue}we mnie @{Cwhite}(zbroja).
/def -Fp100 -mregexp -t'(W slepiach (.*) goblina pojawia sie (.*) kaleczy ci (.*))' sub_goblinaspecwemnie1 = /substitute -p @{BCwhite}-------> @{Ccyan}[Goblin 1/3] @{Cwhite}spec @{Cyellow}%{P2} goblina @{Ccyan}KALECZAC@{Cblue} cie@{BCwhite}.
/def -Fp100 -mregexp -t'(W slepiach (.*) goblina pojawia sie (.*) rozkrwawia ci (.*))' sub_goblinaspecwemnie2 = /substitute -p @{BCwhite}-------> @{Ccyan}[Goblin 2/3] @{Cwhite}spec @{Cyellow}%{P2} goblina @{Ccyan}ROZKRWAWIAJAC@{Cblue} cie@{BCwhite}.
/def -Fp100 -mregexp -t'(W slepiach (.*) goblina pojawia sie (.*) rani ci (.*))' sub_goblinaspecwemnie3 = /substitute -p @{BCwhite}-------> @{Ccyan}[Goblin 3/3] @{Cwhite}spec @{Cyellow}%{P2} goblina @{Ccyan}RANIAC@{Cblue} cie@{BCwhite}.
/def -Fp100 -mregexp -t'((.*) goblin doskakuje do (.*) i (.*) kaleczy (.*))' sub_goblinaspecwkogos1 = /substitute -p @{BCwhite}-------> @{Ccyan}[Goblin 1/3] @{Cyellow}%{P2} goblin@{Cwhite} specuje @{Cblue}%{P3} @{Ccyan}KALECZAC@{BCwhite}.
/def -Fp100 -mregexp -t'((.*) goblin doskakuje do (.*) i (.*) rozkrwawia (.*))' sub_goblinaspecwkogos2 = /substitute -p @{BCwhite}-------> @{Ccyan}[Goblin 2/3] @{Cyellow}%{P2} goblin@{Cwhite} specuje @{Cblue}%{P3} @{Ccyan}ROZKRWAWIAJAC@{BCwhite}.
/def -Fp100 -mregexp -t'((.*) goblin doskakuje do (.*) i (.*) rani (.*))' sub_goblinaspecwkogos3 = /substitute -p @{BCwhite}-------> @{Ccyan}[Goblin 3/3] @{Cyellow}%{P2} goblin@{Cwhite} specuje @{Cblue}%{P3} @{Ccyan}RANIAC@{BCwhite}@{Cgray23}%{P7}.

#     ---> ZWIERZOCZLEKI <---
/def -Fp100 -mregexp -t'(Nozdrza (.*) zwierzoczleka (.*) ostrzec cie (.*))' sub_zwierzaspecwemnie0_tarcza = /substitute -p @{BCwhite}-------> @{Ccyan}[Zwierz 0/3] @{Cwhite}proba speca @{Cyellow}%{P2} zwierzoczleka @{Cblue}we mnie @{Cwhite}(tarcza).
/def -Fp100 -mregexp -t'(Pysk (.*) zwierzoczleka otwiera sie (.*) tuz przed twoja glowa.)' sub_zwierzaspecwemnie0_pudlo = /substitute -p @{BCwhite}-------> @{Ccyan}[Zwierz 0/3] @{Cwhite}proba speca @{Cyellow}%{P2} zwierzoczleka @{Cblue}we mnie @{Cwhite}(pudlo).
/def -Fp100 -mregexp -t'(Z gardla (.*) zwierzoczleka wydobywa sie (.*) zeslizguje sie po (twej|twym|twych) (.*))' sub_zwierzaspecwemnie0_zbroja = /substitute -p @{BCwhite}-------> @{Ccyan}[Zwierz 0/3] @{Cwhite}proba speca @{Cyellow}%{P2} zwierzoczleka @{Cblue}we mnie @{Cwhite}(zbroja).
/def -Fp100 -mregexp -t'(Pysk (.*) zwierzoczleka otwiera sie (.*) kaleczy ci (.*))' sub_zwierzaspecwemnie1 = /substitute -p @{BCwhite}-------> @{Ccyan}[Zwierz 1/3] @{Cwhite}spec @{Cyellow}%{P2} zwierzoczleka @{Cblue} cie@{BCwhite}.
/def -Fp100 -mregexp -t'(Pysk (.*) zwierzoczleka otwiera sie (.*) rozcina ci (.*))' sub_zwierzaspecwemnie2 = /substitute -p @{BCwhite}-------> @{Ccyan}[Zwierz 2/3] @{Cwhite}spec @{Cyellow}%{P2} zwierzoczleka @{Cblue} cie@{BCwhite}.
/def -Fp100 -mregexp -t'(Pysk (.*) zwierzoczleka otwiera sie (.*) rani ci (.*))' sub_zwierzaspecwemnie3 = /substitute -p @{BCwhite}-------> @{Ccyan}[Zwierz 3/3] @{Cwhite}spec @{Cyellow}%{P2} zwierzoczleka @{Cblue} cie@{BCwhite}.
/def -Fp100 -mregexp -t'((.*) zwierzoczlek zamaszystym ciosem (.*) kaleczy (.*) (korpus|lewe|prawe|lewa|prawa|glowe|nogi)(.*))' sub_zwierzaspecwkogos1 = /substitute -p @{BCwhite}-------> @{Ccyan}[Zwierz 1/3] @{Cyellow}%{P2} zwierzoczlek@{Cwhite} specuje @{Cblue}%{P4} @{BCwhite}.
/def -Fp100 -mregexp -t'((.*) zwierzoczlek zamaszystym ciosem (.*) rozcina (.*) (korpus|lewe|prawe|lewa|prawa|glowe|nogi)(.*))' sub_zwierzaspecwkogos2 = /substitute -p @{BCwhite}-------> @{Ccyan}[Zwierz 2/3] @{Cyellow}%{P2} zwierzoczlek@{Cwhite} specuje @{Cblue}%{P4} @{BCwhite}.
/def -Fp100 -mregexp -t'((.*) zwierzoczlek zamaszystym ciosem (.*) rani (.*) (korpus|lewe|prawe|lewa|prawa|glowe|nogi)(.*))' sub_zwierzaspecwkogos3 = /substitute -p @{BCwhite}-------> @{Ccyan}[Zwierz 3/3] @{Cyellow}%{P2} zwierzoczlek@{Cwhite} specuje @{Cblue}%{P4} @{BCwhite}@{Cgray23}%{P7}.

#     ---> HOBGOBLINY Z IMPERIUM <---
/def -Fp100 -mregexp -t'(Nozdrza (.*) hobgoblina (.*) ostrzec cie (.*))' sub_hobgoblinaspecwemnie0_tarcza = /substitute -p @{BCwhite}-------> @{Ccyan}[Hobgoblin 0/3] @{Cwhite}proba speca @{Cyellow}%{P2} hobgoblina @{Cblue}we mnie @{Cwhite}(tarcza).
/def -Fp100 -mregexp -t'(W slepiach (.*) hobgoblina pojawia sie (.*) tuz przed twoja glowa.)' sub_hobgoblinaspecwemnie0_pudlo = /substitute -p @{BCwhite}-------> @{Ccyan}[Hobgoblin 0/3] @{Cwhite}proba speca @{Cyellow}%{P2} hobgoblina @{Cblue}we mnie @{Cwhite}(pudlo).
/def -Fp100 -mregexp -t'(Z gardla (.*) hobgoblina wydobywa sie (.*) uderzenie zeslizguje sie po (twej|twym|twych) (.*))' sub_hobgoblinaspecwemnie0_zbroja = /substitute -p @{BCwhite}-------> @{Ccyan}[Hobgoblin 0/3] @{Cwhite}proba speca @{Cyellow}%{P2} hobgoblina @{Cblue}we mnie @{Cwhite}(zbroja).
/def -Fp100 -mregexp -t'(W slepiach (.*) hobgoblina pojawia sie (.*) kaleczy ci (.*))' sub_hobgoblinaspecwemnie1 = /substitute -p @{BCwhite}-------> @{Ccyan}[Hobgoblin 1/3] @{Cwhite}spec @{Cyellow}%{P2} hobgoblina @{Cblue} cie@{BCwhite}.
/def -Fp100 -mregexp -t'(W slepiach (.*) hobgoblina pojawia sie (.*) rozkrwawia ci (.*))' sub_hobgoblinaspecwemnie2 = /substitute -p @{BCwhite}-------> @{Ccyan}[Hobgoblin 2/3] @{Cwhite}spec @{Cyellow}%{P2} hobgoblina @{Cblue} cie@{BCwhite}.
/def -Fp100 -mregexp -t'(W slepiach (.*) hobgoblina pojawia sie (.*) rani ci (.*))' sub_hobgoblinaspecwemnie3 = /substitute -p @{BCwhite}-------> @{Ccyan}[Hobgoblin 3/3] @{Cwhite}spec @{Cyellow}%{P2} hobgoblina @{Cblue} cie@{BCwhite}.
/def -Fp100 -mregexp -t'((.*) hobgoblin doskakuje do (.*) i (.*) kaleczy (.*))' sub_hobgoblinaspecwkogos1 = /substitute -p @{BCwhite}-------> @{Ccyan}[Hobgoblin 1/3] @{Cyellow}%{P2} hobgoblin@{Cwhite} specuje @{Cblue}%{P3} @{BCwhite}.
/def -Fp100 -mregexp -t'((.*) hobgoblin doskakuje do (.*) i (.*) rozkrwawia (.*))' sub_hobgoblinaspecwkogos2 = /substitute -p @{BCwhite}-------> @{Ccyan}[Hobgoblin 2/3] @{Cyellow}%{P2} hobgoblin@{Cwhite} specuje @{Cblue}%{P3} @{BCwhite}.
/def -Fp100 -mregexp -t'((.*) hobgoblin doskakuje do (.*) i (.*) rani (.*))' sub_hobgoblinaspecwkogos3 = /substitute -p @{BCwhite}-------> @{Ccyan}[Hobgoblin 3/3] @{Cyellow}%{P2} hobgoblin@{Cwhite} specuje @{Cblue}%{P3} @{BCwhite}@{Cgray23}%{P7}.

#     ---> ORKI Z IMPERIUM <---
/def -Fp100 -mregexp -t'(Nozdrza (.*) orka (.*) ostrzec cie (.*))' sub_orkaspecwemnie0_tarcza = /substitute -p @{BCwhite}-------> @{Ccyan}[Ork 0/3] @{Cwhite}proba speca @{Cyellow}%{P2} orka @{Cblue}we mnie @{Cwhite}(tarcza).
/def -Fp100 -mregexp -t'(W slepiach (.*) orka pojawia sie (.*) tuz przed twoja glowa.)' sub_orkaspecwemnie0_pudlo = /substitute -p @{BCwhite}-------> @{Ccyan}[Ork 0/3] @{Cwhite}proba speca @{Cyellow}%{P2} orka @{Cblue}we mnie @{Cwhite}(pudlo).
/def -Fp100 -mregexp -t'(Z gardla (.*) orka wydobywa sie (.*) uderzenie zeslizguje sie po (twej|twym|twych) (.*))' sub_orkaspecwemnie0_zbroja = /substitute -p @{BCwhite}-------> @{Ccyan}[Ork 0/3] @{Cwhite}proba speca @{Cyellow}%{P2} orka @{Cblue}we mnie @{Cwhite}(zbroja).
/def -Fp100 -mregexp -t'(W slepiach (.*) orka pojawia sie (.*) kaleczy ci (.*))' sub_orkaspecwemnie1 = /substitute -p @{BCwhite}-------> @{Ccyan}[Ork 1/3] @{Cwhite}spec @{Cyellow}%{P2} orka @{Cblue} cie@{BCwhite}.
/def -Fp100 -mregexp -t'(W slepiach (.*) orka pojawia sie (.*) rozkrwawia ci (.*))' sub_orkaspecwemnie2 = /substitute -p @{BCwhite}-------> @{Ccyan}[Ork 2/3] @{Cwhite}spec @{Cyellow}%{P2} orka @{Cblue} cie@{BCwhite}.
/def -Fp100 -mregexp -t'(W slepiach (.*) orka pojawia sie (.*) rani ci (.*))' sub_orkaspecwemnie3 = /substitute -p @{BCwhite}-------> @{Ccyan}[Ork 3/3] @{Cwhite}spec @{Cyellow}%{P2} orka @{Cblue} cie@{BCwhite}.
/def -Fp100 -mregexp -t'((.*) ork doskakuje do (.*) i (.*) kaleczy (.*))' sub_orkaspecwkogos1 = /substitute -p @{BCwhite}-------> @{Ccyan}[Ork 1/3] @{Cyellow}%{P2} ork@{Cwhite} specuje @{Cblue}%{P3} @{BCwhite}.
/def -Fp100 -mregexp -t'((.*) ork doskakuje do (.*) i (.*) rozkrwawia (.*))' sub_orkaspecwkogos2 = /substitute -p @{BCwhite}-------> @{Ccyan}[Ork 2/3] @{Cyellow}%{P2} ork@{Cwhite} specuje @{Cblue}%{P3} @{BCwhite}.
/def -Fp100 -mregexp -t'((.*) ork doskakuje do (.*) i (.*) rani (.*))' sub_orkaspecwkogos3 = /substitute -p @{BCwhite}-------> @{Ccyan}[Ork 3/3] @{Cyellow}%{P2} ork@{Cwhite} specuje @{Cblue}%{P3} @{BCwhite}.

#     ---> SNOTLINGI <---
; Aktualizacja: 29.03.12
/def -Fp200 -mregexp -t'(Ustawiasz|(.*) ustawia) sie bokiem wobec (.*) i ' _snotaspec0v3 = /if ({P2} =~ "") /set tekst_ciebie ciebie%; /else /unset tekst_ciebie%; /endif%;/substitute -p @{BCwhite}-------> @{Ccyan}[Snot 0/4] @{Cwhite}proba speca @{Cyellow}%{P3} @{Cwhite}w @{Cblue}%{P2}%{tekst_ciebie}@{BCwhite} (bron).
/def -Fp100 -mregexp -t'(Katem oka dostrzegasz, iz (.*) szykuje sie do skoku na (.*)\. (.*))' sub_snotaspec0v1 = /substitute -p @{BCwhite}-------> @{Ccyan}[Snot 0/4] @{Cyellow}%{P2} @{Cwhite}probuje specowac @{Cblue}%{P3}@{BCwhite} (tarcza).
/def -Fp100 -mregexp -t'((.*) z impetem skacze na (.*), nie ma jednak dosc sily, (.*))' sub_snotaspec0v2 = /substitute -p @{BCwhite}-------> @{Ccyan}[Snot 0/4] @{Cyellow}%{P2} @{Cwhite}probuje specowac @{Cblue}%{P3}@{BCwhite} (zbroja).
/def -Fp100 -mregexp -t'(Odbiwszy sie od ziemi (.*) doskakuje do (.*), nieumiejetnie (.*))' sub_snotaspec0v4 = /substitute -p @{BCwhite}-------> @{Ccyan}[Snot 0/4] @{Cyellow}%{P2} @{Cwhite}probuje specowac @{Cblue}%{P3}@{BCwhite} (pudlo).
/def -Fp100 -mregexp -t'(Odbiwszy sie od ziemi (.*) doskakuje do (.*) i piszczac przerazliwie bije (.*) lekko w (.*))' sub_snotaspec1 = /substitute -p @{BCwhite}-------> @{Ccyan}[Snot 1/4] @{Cyellow}%{P2} @{Cwhite}specuje @{Cblue}%{P3}@{BCwhite}.
/def -Fp100 -mregexp -t'(Odbiwszy sie od ziemi (.*) doskakuje do (.*) i piszczac przerazliwie bije (.*) odczuwalnie w (.*))' sub_snotaspec2 = /substitute -p @{BCwhite}-------> @{Ccyan}[Snot 2/4] @{Cyellow}%{P2} @{Cwhite}specuje @{Cblue}%{P3}@{BCwhite}.
/def -Fp100 -mregexp -t'(Odbiwszy sie od ziemi (.*) doskakuje do (.*) i piszczac przerazliwie bije (.*) calkiem mocno w (.*))' sub_snotaspec3 = /substitute -p @{BCwhite}-------> @{Ccyan}[Snot 3/4] @{Cyellow}%{P2} @{Cwhite}specuje @{Cblue}%{P3}@{BCwhite}.
/def -Fp100 -mregexp -t'(Odbiwszy sie od ziemi (.*) doskakuje do (.*) i piszczac przerazliwie bije (.*) bolesnie w (.*))' sub_snotaspec4 = /substitute -p @{BCwhite}-------> @{Ccyan}[Snot 4/4] @{Cyellow}%{P2} @{Cwhite}specuje @{Cblue}%{P3}@{BCwhite}.

#     ---> JASZCZURKI <---
/def -Fp100 -mregexp -t'((.*) doskakuje sprawnie do (.*) i zanurza niegroznie ostre zeby w (.*) szyi!)' sub_jaszczuraspec1 = /substitute -p @{BCwhite}-------> @{Ccyan}[Jaszczur 1/1] @{Cyellow}%{P2} @{Cwhite}specuje niegroznie @{Cblue}%{P3}.

#     ---> GOLEMY <---
/def -Fp100 -mregexp -t'(Nagle (.*) wykonuje zamaszysty cios ciezka jak mlot kowalski piescia, lecz ty zbijasz (.*))' sub_golemaspecwemnie0_tarcza = /substitute -p @{BCwhite}-------> @{Ccyan}[Golem 0/3] @{Cyellow}%{P2} @{Cwhite}probuje specowac @{Cblue}ciebie@{BCwhite} (tarcza).
/def -Fp100 -mregexp -t'(Nagle (.*) wykonuje zamaszysty cios ciezka jak mlot kowalski piescia celujac w (.*), lecz (ten|ta) zbija (.*))' sub_golemaspecwkogos0_tarcza = /substitute -p @{BCwhite}-------> @{Ccyan}[Golem 0/3] @{Cyellow}%{P2} @{Cwhite}probuje specowac @{Cblue}%{P3}@{BCwhite} (tarcza).
/def -Fp100 -mregexp -t'(Nagle (.*) wykonuje zamaszysty cios ciezka jak mlot kowalski piescia, lecz uderzenie zatrzymuje sie (.*))' sub_golemaspecwemnie0_zbroja = /substitute -p @{BCwhite}-------> @{Ccyan}[Golem 0/3] @{Cyellow}%{P2} @{Cwhite}probuje specowac @{Cblue}ciebie@{BCwhite} (zbroja).
/def -Fp100 -mregexp -t'(Nagle (.*) wykonuje zamaszysty cios ciezka jak mlot kowalski piescia celujac w (.*), lecz uderzenie zatrzymuje sie (.*))' sub_golemaspecwkogos0_zbroja = /substitute -p @{BCwhite}-------> @{Ccyan}[Golem 0/3] @{Cyellow}%{P2} @{Cwhite}probuje specowac @{Cblue}%{P3}@{BCwhite} (zbroja).
/def -Fp100 -mregexp -t'(Z ukrytych w ramieniu (.*) otworow tryskaja strumienie pary, a pancerna piesc mija (.*) o cal.)' sub_golemaspec0_pudlo = /substitute -p @{BCwhite}-------> @{Ccyan}[Golem 0/3] @{Cwhite}proba speca @{Cyellow}%{P2} @{Cwhite}w @{Cblue}%{P3}@{BCwhite} (pudlo).
/def -Fp100 -mregexp -t'(Z ukrytych w ramieniu (.*) otworow tryskaja strumienie pary i potezna, ciezka jak mlot kowalski piesc uderza (.*) (prawe ramie|lewe ramie|nogi|korpus|glowe) z gluchym chrzestem.)' sub_golemaspec1 = /substitute -p @{BCwhite}-------> @{Ccyan}[Golem 1/3] @{Cwhite}spec @{Cyellow}%{P2} @{Cwhite}w @{Cblue}%{P3}@{BCwhite}.
/def -Fp100 -mregexp -t'(Z ukrytych w ramieniu (.*) otworow tryskaja strumienie pary i potezna, ciezka jak mlot kowalski piesc uderza (.*) (prawe ramie|lewe ramie|nogi|korpus|glowe) z gluchym chrzestem, pozbawiajac (go|ja|cie) na chwile oddechu.)' sub_golemaspec2 = /substitute -p @{BCwhite}-------> @{Ccyan}[Golem 2/3] @{Cwhite}spec @{Cyellow}%{P2} @{Cwhite}w @{Cblue}%{P3}@{BCwhite}.
/def -Fp100 -mregexp -t'(Z ukrytych w ramieniu (.*) otworow tryskaja strumienie pary i potezna, ciezka jak mlot kowalski piesc uderza (.*) (prawe ramie|lewe ramie|nogi|korpus|glowe) z gluchym chrzestem, odrzucajac (go|ja|cie) na kilka krokow do tylu.)' sub_golemaspec3 = /substitute -p @{BCwhite}-------> @{Ccyan}[Golem 3/3] @{Cwhite}spec @{Cyellow}%{P2} @{Cwhite}w @{Cblue}%{P3}@{BCwhite}.

#     ---> CHOBOLDY <---
/def -Fp200 -mregexp -t'(chobold bierze szeroki zamach dlugimi lapskami i uderza (.+) zeslizguja)' _choboldaspectarcza = /substitute -p @{BxCgreen}>> CHOBOLDA SPEC @{BxCwhite}(0/2)@{BxCgreen} << @{n} %{PL}%{P5}%{P1}%{PR}
/def -Fp200 -mregexp -t'(chobold bierze szeroki zamach dlugimi lapskami celujac (.+) zeslizguja)' _choboldaspectarcza2 = /substitute -p @{BxCgreen}>> CHOBOLDA SPEC @{BxCwhite}(0/2)@{BxCgreen} << @{n} %{PL}%{P5}%{P1}%{PR}
/def -Fp200 -mregexp -t'(chobold bierze szeroki zamach dlugimi lapskami celujac (.+) odbijaja sie)' _choboldaspeczbroja = /substitute -p @{BxCgreen}>> CHOBOLDA SPEC @{BxCwhite}(0/2)@{BxCgreen} << @{n} %{PL}%{P5}%{P1}%{PR}
/def -Fp200 -mregexp -t'(chobold bierze szeroki zamach dlugimi lapskami i uderza (.+) niegroznie)' _choboldaspec1 = /substitute -p @{BxCgreen}>> CHOBOLDA SPEC @{BxCwhite}(1/2)@{BxCgreen} << @{n} %{PL}%{P5}%{P1}%{PR}
/def -Fp200 -mregexp -t'(chobold bierze szeroki zamach dlugimi lapskami i uderza (.+) nieznacznie)' _choboldaspec2 = /substitute -p @{BxCgreen}>> CHOBOLDA SPEC @{BxCwhite}(2/2)@{BxCgreen} << @{n} %{PL}%{P5}%{P1}%{PR}

#     ---> GREMLINY <---
/def -p200 -mregexp -t'(gryzie (.+) bardzo lekko)' _gremlinaspec1 = /substitute -p @{BxCgreen}>> GREMLINA SPEC @{BxCwhite}(1/3)@{BxCgreen} << @{n} %{PL}%{P5}%{P1}%{PR}
/def -p200 -mregexp -t'(gryzie (.+) niegroznie)' _gremlinaspec2 = /substitute -p @{BxCgreen}>> GREMLINA SPEC @{BxCwhite}(2/3)@{BxCgreen} << @{n} %{PL}%{P5}%{P1}%{PR}
/def -p199 -mregexp -t'(gryzie (.+) lekko)' _gremlinaspec3 = /substitute -p @{BxCgreen}>> GREMLINA SPEC @{BxCwhite}(3/3)@{BxCgreen} << @{n} %{PL}%{P5}%{P1}%{PR}


#     ---> KILMULISY <--- aktualizacja 25.05.10
/def -Fp100 -mregexp -t'( glosno fukajac i burczac wymachuje pazurami, nieznacznie raniac (.*) w (.*).)' kilmulis_1= /substitute -p @{BCwhite}-------> @{Ccyan}[KILM 1/4] @{Cyellow}%{PL} @{Cwhite}specuje @{Cblue}%{P2} @{Cwhite}(%{P3})
/def -Fp100 -mregexp -t'( glosno fukajac i burczac wymachuje pazurami, lekko raniac (.*) w (.*).)' kilmulis_2= /substitute -p @{BCwhite}-------> @{Ccyan}[KILM 2/4] @{Cyellow}%{PL} @{Cwhite}specuje @{Cblue}%{P2} @{Cwhite}(%{P3})
/def -Fp100 -mregexp -t'( glosno fukajac i burczac wymachuje pazurami, raniac (.*) w (.*).)' kilmulis_3= /substitute -p @{BCwhite}-------> @{Ccyan}[KILM 3/4] @{Cyellow}%{PL} @{Cwhite}specuje @{Cblue}%{P2} @{Cwhite}(%{P3})
/def -Fp100 -mregexp -t'( glosno fukajac i burczac wymachuje pazurami, gleboko raniac (.*) w (.*).)' kilmulis_4= /substitute -p @{BCwhite}-------> @{Ccyan}[KILM 4/4] @{Cyellow}%{PL} @{Cwhite}specuje @{Cblue}%{P2} @{Cwhite}(%{P3})

#     ---> KORREDY <--- aktualizacja 25.05.10
/def -Fp100 -mregexp -t'( macha groznie ostrymi jak brzytwa szponami, nieznacznie rozdrapujac (.*) (nogi|korpus|glowe|lewe ramie|prawe ramie))' korred_1 = /substitute -p @{BCwhite}-------> @{Ccyan}[KORR 1/4] @{Cyellow}%{PL} @{Cwhite}specuje @{Cblue}%{P2} @{Cwhite}(%{P3})
/def -Fp100 -mregexp -t'( macha groznie ostrymi jak brzytwa szponami, lekko rozdrapujac (.*) (nogi|korpus|glowe|lewe ramie|prawe ramie))' korred_2 = /substitute -p @{BCwhite}-------> @{Ccyan}[KORR 2/4] @{Cyellow}%{PL} @{Cwhite}specuje @{Cblue}%{P2} @{Cwhite}(%{P3})
/def -Fp100 -mregexp -t'( macha groznie ostrymi jak brzytwa szponami, rozdrapujac (.*) (nogi|korpus|glowe|lewe ramie|prawe ramie))' korred_3 = /substitute -p @{BCwhite}-------> @{Ccyan}[KORR 3/4] @{Cyellow}%{PL} @{Cwhite}specuje @{Cblue}%{P2} @{Cwhite}(%{P3})
/def -Fp100 -mregexp -t'( macha groznie ostrymi jak brzytwa szponami, paskudnie rozdrapujac (.*) (nogi|korpus|glowe|lewe ramie|prawe ramie))' korred_4 = /substitute -p @{BCwhite}-------> @{Ccyan}[KORR 4/4] @{Cyellow}%{PL} @{Cwhite}specuje @{Cblue}%{P2} @{Cwhite}(%{P3})

#     ---> REDCAPY <--- aktualizacja 11.04.13
/set _spece_npc_redcap_label=REDC
/def -p200 -mregexp -t'Korzystajac z przewagi, jaka daja mu dlugie lapy, (.*) wykonuje (.*) mierzac w (.*), bron jednak zatrzymuje sie na (.*) tarczy ofiary.' redcap_0_tarcza_wkogos = \
  /return (_npcspecuj({_spece_npc_redcap_label}, {P1}, {P3}, "0", "4"))
/def -p200 -mregexp -t'Korzystajac z przewagi, jaka daja mu dlugie lapy, (.*) wykonuje (.*), bron jednak zatrzymuje sie na (.*) tarczy.' redcap_0_tarcza_wemnie = \
  /return (_npcspecuj({_spece_npc_redcap_label}, {P1}, "ciebie", "0", "4"))
/def -p199 -mregexp -t'Korzystajac z przewagi, jaka daja mu dlugie lapy, (.*) wykonuje (.*) mierzac w (.*), bron jednak zatrzymuje sie na (.*) ofiary.' redcap_0_zbroja_wkogos = \
  /return (_npcspecuj({_spece_npc_redcap_label}, {P1}, {P3}, "0", "4"))
/def -p199 -mregexp -t'Korzystajac z przewagi, jaka daja mu dlugie lapy, (.*) wykonuje (.*), bron jednak zatrzymuje sie na (.*).' redcap_0_zbroja_wemnie = \
  /return (_npcspecuj({_spece_npc_redcap_label}, {P1}, "ciebie", "0", "4"))
/def -p200 -mregexp -t'Korzystajac z przewagi, jaka daja mu dlugie lapy, (.*) wykonuje (na odlew|szeroki|szalenczy) zamach [^ ]+ [^ ]+ [^ ]+( mierzac w (.*)\.|\.) (Cios bez problemow dosiega celu, trafiajac [^ ]+ w|Cios trafia (.*) w) (.*)( i|,) pozostawiajac nieznaczne drasniecie.' redcap_1 = \
  /return (_npcspecuj({_spece_npc_redcap_label}, {P1}, strcat({P4}, {P6}), "1", "4", {P7}))
/def -p200 -mregexp -t'Korzystajac z przewagi, jaka daja mu dlugie lapy, (.*) wykonuje (na odlew|szeroki|szalenczy) zamach [^ ]+ [^ ]+ [^ ]+( mierzac w (.*)\.|\.) (Cios bez problemow dosiega celu, trafiajac [^ ]+ w|Cios trafia (.*) w) (.*)( i|,) pozostawiajac nieznaczne zadrapania.' redcap_2 = \
  /return (_npcspecuj({_spece_npc_redcap_label}, {P1}, strcat({P4}, {P6}), "2", "4", {P7}))
/def -p200 -mregexp -t'Korzystajac z przewagi, jaka daja mu dlugie lapy, (.*) wykonuje (na odlew|szeroki|szalenczy) zamach [^ ]+ [^ ]+ [^ ]+( mierzac w (.*)\.|\.) (Cios bez problemow dosiega celu, trafiajac [^ ]+ w|Cios trafia (.*) w) (.*)( i|,) pozostawiajac bolesna prege.' redcap_3 = \
  /return (_npcspecuj({_spece_npc_redcap_label}, {P1}, strcat({P4}, {P6}), "3", "4", {P7}))

#     ---> ZOMBI albo OZYWIENCE z Kurhanu <--- aktualizacja 22.07.10
/def -p100 -mregexp -t' probuje ((.*) trafic|trafic (.*)) poteznym ciosem z polobrotu, ale z latwoscia unikasz tak wyraznego zamachu\.' spec_kurhan_0_unik_wemnie = /substitute -p @{BCwhite}-------> @{Ccyan}[KURHAN 0/4] @{Cyellow}%{PL} @{Cwhite}probuje specowac @{Cblue}%{P2}%{P3} @{Cwhite}(unik).
/def -p100 -mregexp -t' probuje ((.*) trafic|trafic (.*)) poteznym ciosem z polobrotu, ale [^ ]+ z latwoscia unika ciosu\.' spec_kurhan_0_unik_wkogos = /substitute -p @{BCwhite}-------> @{Ccyan}[KURHAN 0/1] @{Cyellow}%{PL} @{Cwhite}probuje specowac @{Cblue}%{P2}%{P3} @{Cwhite}(unik).
/def -p99 -mregexp -t' z polobrotu uderza (.*) [^ ]+ [^ ]+ [^ ]+ raniac [^ ]+ w (.*)\.' spec_kurhan_1_wkogos = /substitute -p @{BCwhite}-------> @{Ccyan}[KURHAN 1/1] @{Cyellow}%{PL} @{Cwhite}specuje @{Cblue}%{P1} @{Cwhite}(%{P2}).
/def -p100 -mregexp -t' z polobrotu uderza cie [^ ]+ [^ ]+ [^ ]+ nieznacznie raniac cie w (.*)\.' spec_kurhan_1 = /substitute -p @{BCwhite}-------> @{Ccyan}[KURHAN 1/4] @{Cyellow}%{PL} @{Cwhite}specuje @{Cblue}cie @{Cwhite}(%{P1}).
/def -p100 -mregexp -t' z polobrotu uderza cie [^ ]+ [^ ]+ [^ ]+ lekko raniac cie w (.*)\.' spec_kurhan_2 = /substitute -p @{BCwhite}-------> @{Ccyan}[KURHAN 2/4] @{Cyellow}%{PL} @{Cwhite}specuje @{Cblue}cie @{Cwhite}(%{P1}).
/def -p100 -mregexp -t' z polobrotu uderza cie [^ ]+ [^ ]+ [^ ]+ raniac cie w (.*)\.' spec_kurhan_3 = /substitute -p @{BCwhite}-------> @{Ccyan}[KURHAN 3/4] @{Cyellow}%{PL} @{Cwhite}specuje @{Cblue}cie @{Cwhite}(%{P1}).
/def -p100 -mregexp -t' z polobrotu uderza cie [^ ]+ [^ ]+ [^ ]+ powaznie raniac cie w (.*)\.' spec_kurhan_4 = /substitute -p @{BCwhite}-------> @{Ccyan}[KURHAN 4/4] @{Cyellow}%{PL} @{Cwhite}specuje @{Cblue}cie @{Cwhite}(%{P1}).
;nieznacznie raniac, lekko raniac, raniac

#     ---> KOSCIOTRUPY z Lyrii <--- aktualizacja 07.08.10
/def -p99 -mregexp -t'Pod naporem poteznych ciosow (.*)( zostajesz|, (.*) zostaje) zmuszony do zdecydowanie pewniejszej obrony\. Jeden z zamaszystych atakow trafia ((cie)|[^ ]+), pozostawiajac widoczny krwawy slad\.' spec_kostek_1 = /substitute -p @{BCwhite}-------> @{Ccyan}[Kostek 1/2] @{Cwhite}spec @{Cyellow}%{P1} @{Cwhite}w @{Cblue}%{P3}%{P5}@{Cwhite}.
/def -p99 -mregexp -t'Pod naporem poteznych ciosow (.*)( zostajesz|, (.*) zostaje) zmuszony do zdecydowanie pewniejszej obrony\. Jeden z zamaszystych atakow trafia ((cie)|[^ ]+), pozostawiajac nieduza otwarta rane\.' spec_kostek_2 = /substitute -p @{BCwhite}-------> @{Ccyan}[Kostek 2/2] @{Cwhite}spec @{Cyellow}%{P1} @{Cwhite}w @{Cblue}%{P3}%{P5}@{Cwhite}.