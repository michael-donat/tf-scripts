/def _bspecuj = \
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
  /return substitute(strcat(decode_attr(strcat("@{BCwhite}----> @{nCyellow}[",{_spec_skrot}," ",{_spec_ile},"/",{_spec_na_ile},"] @{BCyellow}",{_spec_kto}," @{Cwhite}",{_spec_co_robi}," @{Cblue}",{_spec_kogo},"@{Cwhite}",{_spec_koment},"."))))

#######################################################################################################################################################

; Ogromny ognisty trojzab
/set _spece_bronie_trojzab_label=Trojzab
; Aktualizacja 04.03.13
; Ktoś kogoś

/def -p200 -mregexp -t' wykonujac zamach uderza (.*) ogromnym ognistym trojzebem, trafiajac (?:[^ ]+ |)w (.*). Cios, ktory zaledwie (cie muska|muska ofiare), pozostawia na skorze lekkie, rozognione plomieniem smugi.' _spece_bronie_trojzab_1 = \
  /return (_bspecuj({_spece_bronie_trojzab_label}, {PL}, {P1}, "1", "X", {P2}))
/eval /def -p200 -mregexp -t' uderza (cie |)ogromnym ognistym trojzebem w (%{hitlocs})( (.*)|), pozostawiajac na [^ ]+ ciele broczace, rozpalone ogniem smugi.' _spece_bronie_trojzab_2 = \
  /return (_bspecuj({_spece_bronie_trojzab_label}, {PL}, {P4-cie}, "2", "X", {P1}))
/eval /def -p200 -mregexp -t' plonaca stala ogromnego ognistego trojzebu przebija (%{hitlocs}) (.*), z zaskakujaca latwoscia wyrywajac tkanki, rozrywajac arterie i napelniajac otoczenie straszliwym sykiem parujacej krwi i swadu palonego ciala.' _spece_bronie_trojzab_1X = \
  /return (_bspecuj({_spece_bronie_trojzab_label}, {PL}, {P2}, "Y", "X", {P1}))
/def -p200 -mregexp -t' straszliwym ciosem, przekraczajacym niemal mozliwosci smiertelnika, zaglebia ogromny ognisty trojzab w (.*) trafiajac [^ ]+ w (.*), rozplatujac [^ ]+ tkanki na podobienstwo patroszonej ryby. Cuchnacy odor plonacego ciala niemal tlumi ryk bolu towarzyszacy zweglaniu sie rozpalonej zelazem rany.' _spece_bronie_trojzab_2X = \
  /return (_bspecuj({_spece_bronie_trojzab_label}, {PL}, {P1}, "Y", "X", {P2}))
/def -p200 -mregexp -t' z moca uderza (.*) ogromnym ognistym trojzebem trafiajac [^ ]+ w (.*). Cicho wibrujacy metal wrzyna sie w cialo docierajac az do kosci. Swad palonej skory i miesa wypelnia otoczenie zamieniajac ziejaca czerwienia czelusc rany w skamienialy wegiel.' _spece_bronie_trojzab_3X = \
  /return (_bspecuj({_spece_bronie_trojzab_label}, {PL}, {P1}, "Y", "X", {P2}))
/def -p200 -mregexp -t' z impetem pozostawiajacym jeno plomienny rozmazany slad tchnacy piekielnym ogniem, wbija ogromny ognisty trojzab w (.*) rwac tkanki i skore (.*) na krwawe strzepy. Rozplatane cialo zajmujac sie zarem metalu, syczy tracac resztki wilgoci, upodabniajac w jednym momencie rane do spieczonego wierzchem wulkanu o gorejacym czerwienia wnetrzu\.' _spece_bronie_trojzab_X = \
  /return (_bspecuj({_spece_bronie_trojzab_label}, {PL}, {P2}, "X", "X", {P1}))


#######################################################################################################################################################
; Kunsztowny mithrylowy topor bojowy
/set _spece_bronie_mithryl_label=Mithryl
; Aktualizacja: 04.03.13
; Ja kogoś

/def -p200 -mregexp -t'Przy wtorze swistu powietrza (.*) uskakuje przed morderczym ciosem twojego kunsztownego mithrylowego topora bojowego\.' _spece_bronie_mithryl_ja_kogos_unik = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, "Ja", {P1}, "0", "6")) 
/def -p200 -mregexp -t'Twoj kunsztowny mithrylowy topor bojowy dotyka (.*) w (.*) robiac ladna, swieza rane\.' _spece_bronie_mithryl_ja_kogos_1 = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, "Ja", {P1}, "1", "6", {P2})) 
/eval /def -p200 -mregexp -t'Dobrze wymierzonym ciosem swego kunsztownego mithrylowego topora bojowego rabiesz (%{hitlocs}) (.*)\.' _spece_bronie_mithryl_ja_kogos_2 = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, "Ja", {P2}, "2", "6", {P1})) 
/def -p200 -mregexp -t'Swoim kunsztownym mithrylowym toporem bojowym tniesz gleboko (.*) w (.*), a do twych uszu dochodzi zgrzyt ostrza o kosci\.' _spece_bronie_mithryl_ja_kogos_3 = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, "Ja", {P1}, "3", "6", {P2})) 
/eval /def -p200 -mregexp -t'Tniesz gleboko swym kunsztownym mithrylowym toporem bojowym w (%{hitlocs}) (.*) i slyszysz glosny odglos druzgotanych kosci\.' _spece_bronie_mithryl_ja_kogos_4 = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, "Ja", {P2}, "4", "6", {P1})) 
/def -p200 -mregexp -t'(.*) niemal przewraca sie pod impetem twojego ciosu, gdy twoj kunsztowny mithrylowy topor bojowy trafia [^ ]+ w (.*)\.' _spece_bronie_mithryl_ja_kogos_5 = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, "Ja", {P1}, "5", "6", {P2})) 
/eval /def -p200 -mregexp -t'Twoj kunsztowny mithrylowy topor bojowy brutalnie druzgocze (%{hitlocs}) (.*) ze smiercionosna sila. (.*) pada na ziemie jako zmasakrowane i niemal nierozpoznawalne cialo\.' _spece_bronie_mithryl_ja_kogos_6 = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, "Ja", {P2}, "6", "6", {P1})) 

; Ktoś mnie
/def -p200 -mregexp -t'Przy wtorze swistu powietrza uskakujesz przed morderczm ciosem kunsztownego mithrylowego topora bojowego, zadanym przez (.*)\.' _spece_bronie_mithryl_ktos_mnie_unik = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, {P1}, "ciebie", "0", "6")) 
/def -p200 -mregexp -t'Dobrze wymierzonym ciosem swego kunsztownego mithrylowego topora bojowego (.*) rabie cie w (.*)\.' _spece_bronie_mithryl_ktos_mnie_2 = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, {P1}, "ciebie", "2", "6")) 

; Ktoś kogoś
/def -p200 -mregexp -t'Przy wtorze swistu powietrza (.*) uskakuje przed morderczym ciosem kunsztownego mithrylowego topora bojowego, zadanym przez (.*)\.' _spece_bronie_mithryl_ktos_kogos_unik = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, {P2}, {P1}, "0", "6"))
/def -p200 -mregexp -t'Kunsztowny mithrylowy topor bojowy (.*) dotyka (.*) w (.*) robiac ladna, swieza rane\.' _spece_bronie_mithryl_ktos_kogos_1 = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, {P1}, {P2}, "1", "6", {P3})) 
/eval /def -p200 -mregexp -t'Dobrze wymierzonym ciosem swego kunsztownego mithrylowego topora bojowego (.*) rabie (%{hitlocs}) (.*)\.' _spece_bronie_mithryl_ktos_kogos_2 = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, {P1}, {P3}, "2", "6", {P2})) 
/def -p200 -mregexp -t'Swoim kunsztownym mithrylowym toporem bojowym (.*) tnie gleboko (.*) w (.*), a do twych uszu dochodzi zgrzyt ostrza o kosci\.' _spece_bronie_mithryl_ktos_kogos_3 = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, {P1}, {P2}, "3", "6", {P3})) 
/eval /def -p200 -mregexp -t' tnie gleboko w (%{hitlocs}) (.*), a ty slyszysz glosny odglos druzgotanych kosci\.' _spece_bronie_mithryl_ktos_kogos_4 = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, {PL}, {P2}, "4", "6", {P1})) 
/def -p200 -mregexp -t'(.*) niemal przewraca sie pod impetem ciosu, gdy kunsztowny mithrylowy topor bojowy (.*) trafia [^ ]+ w (.*)\.' _spece_bronie_mithryl_ktos_kogos_5 = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, {P2}, {P1}, "5", "6", {P3})) 
/eval /def -p200 -mregexp -t'Kunsztowny mithrylowy topor bojowy (.*) brutalnie druzgocze (%{hitlocs}) (.*) ze smiercionosna sila. (.*) pada na ziemie jako zmasakrowane i niemal nierozpoznawalne cialo\.' _spece_bronie_mithryl_ktos_kogos_6 = \
  /return (_bspecuj({_spece_bronie_mithryl_label}, {P1}, {P3}, "6", "6", {P2})) 

#######################################################################################################################################################

; Ciezki zdobiony topor
; Aktualizacja: 20.07.11
/set _spece_bronie_zdobiony_label=Zdobiony

; Ja kogoś
/def -p200 -mregexp -t'Bierzesz plynny zamach swoim ciezkim zdobionym toporem w (.*) jednak przeciwnik wykonuje zgrabny zwod i unika niecelnego ciosu.' _spece_bronie_ciezki_zdobiony_ja_kogos_unik = \
  /return (_bspecuj({_spece_bronie_zdobiony_label}, "Ja", {P1}, "0", "7")) 
/def -p200 -mregexp -t'Uderzenie twojego ciezkiego zdobionego topora pozostawia na ciele (.*) dluga, czerwona szrame.' _spece_bronie_ciezki_zdobiony_ja_kogos_1 = \
  /return (_bspecuj({_spece_bronie_zdobiony_label}, "Ja", {P1}, "1", "7")) 
/def -p200 -mregexp -t'Ukosne ciecie twojego ciezkiego zdobionego topora pozostawia na ciele (.*) paskudna, krwawiaca szrame.' _spece_bronie_ciezki_zdobiony_ja_kogos_2 = \
  /return (_bspecuj({_spece_bronie_zdobiony_label}, "Ja", {P1}, "2", "7")) 
/def -p200 -mregexp -t'Silnym wymachem swojego ciezkiego zdobionego topora trafiasz (.*) w (.*) pozostawiajac na [^ ]+ ciele niewielka rane.' _spece_bronie_ciezki_zdobiony_ja_kogos_3 = \
  /return (_bspecuj({_spece_bronie_zdobiony_label}, "Ja", {P1}, "3", "7")) 
/def -p200 -mregexp -t'Trafiasz (.*) mocnym ciosem swojego ciezkiego zdobionego topora w (.*) raniac [^ ]+ znacznie.' _spece_bronie_ciezki_zdobiony_ja_kogos_4 = \
  /return (_bspecuj({_spece_bronie_zdobiony_label}, "Ja", {P1}, "4", "7")) 
/def -p200 -mregexp -t'Wykorzystujac chwile nieuwagi (.*) uderzasz poteznie swoim ciezkim zdobionym toporem tnac w (.*), by okrutnie rozerwac [^ ]+ tkanki.' _spece_bronie_ciezki_zdobiony_ja_kogos_5 = \
  /return (_bspecuj({_spece_bronie_zdobiony_label}, "Ja", {P1}, "5", "7", {P2})) 
/def -p200 -mregexp -t'Szybkim ciosem swojego zdobionego topora trafiasz (.*) w (.*) niemal pozbawiajac [^ ]+ zycia. Nastepny taki cios moze zakonczyc walke.' _spece_bronie_ciezki_zdobiony_ja_kogos_6 = \
  /return (_bspecuj({_spece_bronie_zdobiony_label}, "Ja", {P1}, "6", "7", {P2})) 
/def -p200 -mregexp -t'Dopadasz do (.*) i poteznie uderzajac od dolu swoim ciezkim zdobionym toporem tniesz [^ ]+ w (.*), nie szczedzac nawet kosci. Zmasakrowane cialo pada na ziemie by znieruchomiec na zawsze.' _spece_bronie_ciezki_zdobiony_ja_kogos_7 = \
  /return (_bspecuj({_spece_bronie_zdobiony_label}, "Ja", {P1}, "7", "7", {P2})) 

#######################################################################################################################################################

; Gwiezdny topor
; Aktualizacja: 04.03.13
; Ja kogoś
/set _spece_bronie_gwiazdka_label=Gwiazdka

/def -p200 -mregexp -t'Bierzesz zamach i nieudolnie kierujac blyszczacym ostrzem gwiezdnego topora, chybiasz (.*) czujac irytacje poteg zakletych w broni.' _spece_bronie_gwiazdka_ja_kogos_pudlo = \
  /return (_bspecuj({_spece_bronie_gwiazdka_label}, "Ja", {P1}, "0", "5")) 
/def -p200 -mregexp -t'Wyprowadzasz potezny cios swym gwiezdnym toporem w (.*), a niewielki blysk swiatla swiadczy, ze zaledwie drasnales (.*).' _spece_bronie_gwiazdka_ja_kogos_1 = \
  /return (_bspecuj({_spece_bronie_gwiazdka_label}, "Ja", {P2}, "1", "5", {P1})) 
/eval /def -p200 -mregexp -t'Swist i blysk rozpraszanej energii towarzysza uderzeniu w (%{hitlocs}) (.*) twym gwiezdnym toporem mimo, iz zadales niewielkie obrazenia.' _spece_bronie_gwiazdka_ja_kogos_2 = \
  /return (_bspecuj({_spece_bronie_gwiazdka_label}, "Ja", {P2}, "2", "5", {P1})) 
/eval /def -p200 -mregexp -t'Blask tysiecy gwiazd i glosny swist towarzysza szybkiemu jak mysl ruchowi twej reki, ktory godzi w (%{hitlocs}) (.*) gwiezdnym toporem, zadajac spore obrazenia i zalewajac ostrze posoka.' _spece_bronie_gwiazdka_ja_kogos_3 = \
  /return (_bspecuj({_spece_bronie_gwiazdka_label}, "Ja", {P2}, "3", "5", {P1})) 
/def -p200 -mregexp -t'Plynnym kolistym ruchem godzisz (.*) swym gwiezdnym toporem trafiajac go w (.*). Czujesz, ze twoja bron zadala duze obrazenia, zalewajac twa twarz ciepla posoka.' _spece_bronie_gwiazdka_ja_kogos_4 = \
  /return (_bspecuj({_spece_bronie_gwiazdka_label}, "Ja", {P1}, "4", "5", {P2})) 
/eval /def -p200 -mregexp -t'Lsniace ostrze twego gwiezdnego topora zakresla szeroki luk, blyskawicznie godzac w (%{hitlocs}) (.*), a fontanna swietlistej energii tryska z rany niczym posoka, zadajac ogromne obrazenia.' _spece_bronie_gwiazdka_ja_kogos_5 = \
  /return (_bspecuj({_spece_bronie_gwiazdka_label}, "Ja", {P2}, "5", "5", {P1})) 

; Akutalizacja: 05.11.12
; Ktoś kogoś
/def -p200 -mregexp -t' bierze zamach i nieudolnie kierujac blyszczacym ostrzem gwiezdnego topora, chybia (.*).' _spece_bronie_gwiazdka_ktos_kogos_pudlo = \
  /return (_bspecuj({_spece_bronie_gwiazdka_label}, {PL}, {P1}, "0", "5")) 
/def -p200 -mregexp -t' wyprowadza potezny cios swym gwiezdnym toporem w (.*), a niewielki blysk swiatla swiadczy, ze zaledwie (?:drasnela|drasnal) (.*).' _spece_bronie_gwiazdka_ktos_kogos_1 = \
  /return (_bspecuj({_spece_bronie_gwiazdka_label}, {PL}, {P2}, "1", "5", {P1})) 
/eval /def -p200 -mregexp -t'Swist i blysk rozpraszanej energii towarzysza uderzeniu gwiezdnego topora (.*) w (%{hitlocs}) (.*) mimo, iz (zadal|zadala) niewielkie obrazenia.' _spece_bronie_gwiazdka_ktos_kogos_2 = \
  /return (_bspecuj({_spece_bronie_gwiazdka_label}, {P1}, {P3}, "2", "5", {P2})) 
/eval /def -p200 -mregexp -t'Blask tysiecy gwiazd i glosny swist towarzysza szybkiemu jak mysl ruchowi reki (.*), ktory godzi w (%{hitlocs}) (.*) gwiezdnym toporem, zadajac spore obrazenia i zalewajac ostrze posoka.' _spece_bronie_gwiazdka_ktos_kogos_3 = \
  /return (_bspecuj({_spece_bronie_gwiazdka_label}, {P1}, {P3}, "3", "5", {P2})) 
/def -p200 -mregexp -t' plynnym kolistym ruchem godzi (.*) swym gwiezdnym toporem trafiajac [^ ]+ w (.*). Duze obrazenia zadane przez bron, zalewaja twarz (.*) ciepla posoka.' _spece_bronie_gwiazdka_ktos_kogos_4 = \
  /return (_bspecuj({_spece_bronie_gwiazdka_label}, {PL}, {P1}, "4", "5", {P2})) 
/eval /def -p200 -mregexp -t'Lsniace ostrze gwiezdnego topora (.*) zakresla szeroki luk, blyskawicznie godzac (%{hitlocs}) (.*), a fontanna swietlistej energii tryska z rany niczym posoka, zadajac ogromne obrazenia.' _spece_bronie_gwiazdka_ktos_kogos_5 = \
  /return (_bspecuj({_spece_bronie_gwiazdka_label}, {P1}, {P3}, "5", "5", {P2})) 

#######################################################################################################################################################

; Zabkowany zakrzywiony sztylet
; Aktualizacja: 05.03.13
/set _spece_bronie_zabkowany_label=Zabkowany

; Ktoś kogoś
/def -p200 -mregexp -t' trafia (.*) w (.*), delikatnie znaczac koncem ostrza [^ ]+ sztyletu krwawa prege na [^ ]+ skorze.' _spece_bronie_zabkowany_ktos_kogos_1 = \
  /return (_bspecuj({_spece_bronie_zabkowany_label}, {PL}, {P1}, "1", "7", {P2})) 
/def -p200 -mregexp -t' trafia (.*) w (.*), znaczac ostrzem [^ ]+ sztyletu,? krwawa bruzde na [^ ]+ ciele.' _spece_bronie_zabkowany_ktos_kogos_2 = \
  /return (_bspecuj({_spece_bronie_zabkowany_label}, {PL}, {P1}, "2", "7", {P2})) 
/def -p200 -mregexp -t' trafia (.*) zabkowanym zakrzywionym sztyletem w (.*), znaczac ostrzem na jego ciele krwawa bruzde o poszarpanych brzegach.' _spece_bronie_zabkowany_ktos_kogos_3 = \
  /return (_bspecuj({_spece_bronie_zabkowany_label}, {PL}, {P1}, "3", "7", {P2})) 
/def -p200 -mregexp -t' trafia (.*) zabkowanym zakrzywionym sztyletem raniac [^ ]+ dotkliwie w (.*).' _spece_bronie_zabkowany_ktos_kogos_4 = \
  /return (_bspecuj({_spece_bronie_zabkowany_label}, {PL}, {P1}, "4", "7", {P2})) 
/eval /def -p200 -mregexp -t' wbija zabkowany zakrzywiony sztylet w (%{hitlocs}) (.*), zostawiajac brzydka, poszarpana rane.' _spece_bronie_zabkowany_ktos_kogos_5 = \
  /return (_bspecuj({_spece_bronie_zabkowany_label}, {PL}, {P2}, "5", "7", {P1})) 
/def -p200 -mregexp -t' wbija zabkowany zakrzywiony sztylet gleboko w cialo (.*), a stalowe zeby na ostrzu broni dra tkanki ofiary, gdy wyszarpuje ja gwaltownie.' _spece_bronie_zabkowany_ktos_kogos_6 = \
  /return (_bspecuj({_spece_bronie_zabkowany_label}, {PL}, {P1}, "6", "7")) 
/def -p200 -mregexp -t' plynnym ruchem obraca w dloni zabkowany zakrzywiony sztylet, by zadac (.*) mordercze uderzenie od gory, nieomal [^ ]+ rozplatujac.' _spece_bronie_zabkowany_ktos_kogos_7 = \
  /return (_bspecuj({_spece_bronie_zabkowany_label}, {PL}, {P1}, "7", "7", {P2})) 



#######################################################################################################################################################

; Dlugi zabkowany topor
; Aktualizacja: 04.09.12
; Ja kogoś

/def -p200 -mregexp -t'Mocnym wymachem dlugiego zabkowanego topora bitewnego usilujesz dosiegnac cialo (.*), lecz twoj przeciwnik umiejetnie zbija to uderzenie (.*).' _zabkowany_topor_ja_kogos_0_v2 = /substitute -p @{BCwhite}----> @{Cyellow}[Toporek 0/7] @{Cwhite}probuje specowac @{Cblue}%{P1}@{Cwhite}.
/def -p200 -mregexp -t'Zgrabny unik (.*) sprawia, ze ostrze twojego dlugiego zabkowanego topora bitewnego omija [^ ]+ w bezpiecznej odleglosci.' _zabkowany_topor_ja_kogos_0 = /substitute -p @{BCwhite}----> @{Cyellow}[Toporek 0/7] @{Cwhite}probuje specowac @{Cblue}%{P1}@{Cwhite}.
/eval /def -p200 -mregexp -t'Spokojnym, precyzyjnie wymierzonym uderzeniem dlugiego zabkowanego topora bitewnego zadrapujesz (%{hitlocs}) (.*).' _zabkowany_topor_ja_kogos_1 = /substitute -p @{BCwhite}----> @{Cyellow}[Toporek 1/7] @{Cwhite}specuje @{Cblue}%%{P2}@{Cwhite}.
/def -p200 -mregexp -t'Zebate ostrze dlugiego zabkowanego topora bitewnego przecina skore i zadrapuje cialo (.*), gdy celnym uderzeniem udaje ci sie trafic [^ ]+ w (.*).' _zabkowany_topor_ja_kogos_2 = /substitute -p @{BCwhite}----> @{Cyellow}[Toporek 2/7] @{Cwhite}specuje @{Cblue}%{P1}@{Cwhite}.
/def -p200 -mregexp -t'Szybkim wypadem zupelnie zaskakujesz swego przeciwnika. Korzystajac z powstalej okazji, silnie uderzasz (.*) w (.*) dlugim zabkowanym toporem bitewnym, pozostawiajac paskudnie rozorane przeciecia.' _zabkowany_topor_ja_kogos_3 = /substitute -p @{BCwhite}----> @{Cyellow}[Toporek 3/7] @{Cwhite}specuje @{Cblue}%{P1}@{Cwhite}.
/def -p200 -mregexp -t'Zachodzac przeciwnika od boku, mocno uderzasz (.*) dlugim zabkowanym toporem bitewnym w (.*). Ostrze gladko przecina skore, pozostawiajac gleboka, poszarpana rane.' _zabkowany_topor_ja_kogos_4 = /substitute -p @{BCwhite}----> @{Cyellow}[Toporek 4/7] @{Cwhite}specuje @{Cblue}%{P1}@{Cwhite}.
/def -p200 -mregexp -t'Cofasz sie nieznacznie, by po chwili blyskawicznie wyskoczyc do ataku i silnie uderzyc (.*) dlugim zabkowanym toporem bitewnym w (.*). Cios pozostawia po sobie poszarpana, silnie broczaca krwia rane.' _zabkowany_topor_ja_kogos_5 = /substitute -p @{BCwhite}----> @{Cyellow}[Toporek 5/7] @{Cwhite}specuje @{Cblue}%{P1}@{Cwhite}.
/def -p200 -mregexp -t'Dostrzegajac oslabienie (.*), wykonujesz serie szybkich acz silnych razow dlugim zabkowanym toporem bitewnym, ktore trafiaja [^ ]+ w (.*), pozostawiajac po sobie glebokie, poszarpane rany.' _zabkowany_topor_ja_kogos_6 = /substitute -p @{BCwhite}----> @{Cyellow}[Toporek 6/7] @{Cwhite}specuje @{Cblue}%{P1}@{Cwhite}.
/def -p200 -mregexp -t'Markujac pare uderzen, szukasz luk w obronie (.*). Gdy dostrzegasz slabosc, wyskakujesz szybko do przodu, by z obszernego zamachu dlugim zabkowanym toporem bitewnym poteznie uderzyc swego przeciwnika w (.*), natychmiast powalajac [^ ]+ na ziemie.' _zabkowany_topor_ja_kogos_7 = /substitute -p @{BCwhite}----> @{Cyellow}[Toporek 7/7] @{Cwhite}specuje @{Cblue}%{P1}@{Cwhite}.

#######################################################################################################################################################

; poreczny polkolisty topor bojowy
; Aktualizacja: 05.03.13
; Ja kogoś
/set _spece_bronie_poreczny_label=Toporek
/def -p200 -mregexp -t'(Dostrzegajac szanse na dogodny atak, gwaltownym ruchem uderzasz|Przestepujesz w bok, by z silnego zamachu uderzyc|Przez chwile rozwazasz najlepszy sposob na atak, by wreszcie szybkim ruchem uderzyc zza lewego ucha|Nagle wyskakujesz do przodu, by z szerokiego wymachu uderzyc|Wykonujesz pare markowanych wymachow, by wreszcie jednym z nich uderzyc) (.*) porecznym polkolistym toporem bojowym, (ale|jednak|lecz) twemu przeciwnikowi udaje sie (odskoczyc|wykonac unik|(sparowac|odbic|zbic) ten cios .*).' _spece_bronie_pulkulisty_ja_kogos_0_odbite = \
  /return (_bspecuj({_spece_bronie_poreczny_label}, "Ja", {P2}, "0", "7"))
/def -p200 -mregexp -t'(Dostrzegajac szanse na dogodny atak, gwaltownym ruchem uderzasz|Przestepujesz w bok, by z silnego zamachu uderzyc|Przez chwile rozwazasz najlepszy sposob na atak, by wreszcie szybkim ruchem uderzyc zza lewego ucha|Nagle wyskakujesz do przodu, by z szerokiego wymachu uderzyc|Wykonujesz pare markowanych wymachow, by wreszcie jednym z nich uderzyc) (.*) porecznym polkolistym toporem bojowym w (.*), zaledwie muskajac.' _spece_bronie_pulkulisty_ja_kogos_1 = \
  /return (_bspecuj({_spece_bronie_poreczny_label}, "Ja", {P2}, "1", "7", {P3}))
/def -p200 -mregexp -t'(Dostrzegajac szanse na dogodny atak, gwaltownym ruchem uderzasz|Przestepujesz w bok, by z silnego zamachu uderzyc|Przez chwile rozwazasz najlepszy sposob na atak, by wreszcie szybkim ruchem uderzyc zza lewego ucha|Nagle wyskakujesz do przodu, by z szerokiego wymachu uderzyc|Wykonujesz pare markowanych wymachow, by wreszcie jednym z nich uderzyc) (.*) porecznym polkolistym toporem bojowym w (.*), czyniac niewielka ranke.' _spece_bronie_pulkulisty_ja_kogos_2 = \
  /return (_bspecuj({_spece_bronie_poreczny_label}, "Ja", {P2}, "2", "7", {P3}))
/def -p200 -mregexp -t'(Dostrzegajac szanse na dogodny atak, gwaltownym ruchem uderzasz|Przestepujesz w bok, by z silnego zamachu uderzyc|Przez chwile rozwazasz najlepszy sposob na atak, by wreszcie szybkim ruchem uderzyc zza lewego ucha|Nagle wyskakujesz do przodu, by z szerokiego wymachu uderzyc|Wykonujesz pare markowanych wymachow, by wreszcie jednym z nich uderzyc) (.*) porecznym polkolistym toporem bojowym w (.*), pozostawiajac wyrazna rane.' _spece_bronie_pulkulisty_ja_kogos_3 = \
  /return (_bspecuj({_spece_bronie_poreczny_label}, "Ja", {P2}, "3", "7", {P3}))
/def -p200 -mregexp -t'(Dostrzegajac szanse na dogodny atak, gwaltownym ruchem uderzasz|Przestepujesz w bok, by z silnego zamachu uderzyc|Przez chwile rozwazasz najlepszy sposob na atak, by wreszcie szybkim ruchem uderzyc zza lewego ucha|Nagle wyskakujesz do przodu, by z szerokiego wymachu uderzyc|Wykonujesz pare markowanych wymachow, by wreszcie jednym z nich uderzyc) (.*) porecznym polkolistym toporem bojowym w (.*), dosc powaznie [^ ]+.' _spece_bronie_pulkulisty_ja_kogos_4 = \
  /return (_bspecuj({_spece_bronie_poreczny_label}, "Ja", {P2}, "4", "7", {P3}))
/def -p200 -mregexp -t'(Dostrzegajac szanse na dogodny atak, gwaltownym ruchem uderzasz|Przestepujesz w bok, by z silnego zamachu uderzyc|Przez chwile rozwazasz najlepszy sposob na atak, by wreszcie szybkim ruchem uderzyc zza lewego ucha|Nagle wyskakujesz do przodu, by z szerokiego wymachu uderzyc|Wykonujesz pare markowanych wymachow, by wreszcie jednym z nich uderzyc) (.*) porecznym polkolistym toporem bojowym w (.*), bardzo powaznie raniac.' _spece_bronie_pulkulisty_ja_kogos_5 = \
  /return (_bspecuj({_spece_bronie_poreczny_label}, "Ja", {P2}, "5", "7", {P3}))
/def -p200 -mregexp -t'(Dostrzegajac szanse na dogodny atak, gwaltownym ruchem uderzasz|Przestepujesz w bok, by z silnego zamachu uderzyc|Przez chwile rozwazasz najlepszy sposob na atak, by wreszcie szybkim ruchem uderzyc zza lewego ucha|Nagle wyskakujesz do przodu, by z szerokiego wymachu uderzyc|Wykonujesz pare markowanych wymachow, by wreszcie jednym z nich uderzyc) (.*) porecznym polkolistym toporem bojowym w (.*), pozostawiajac paskudnie wygladajaca, (kluta|cieta) rane.' _spece_bronie_pulkulisty_ja_kogos_6 = \
  /return (_bspecuj({_spece_bronie_poreczny_label}, "Ja", {P2}, "6", "7", {P3}))
/def -p200 -mregexp -t'(Dostrzegajac szanse na dogodny atak, gwaltownym ruchem uderzasz|Przestepujesz w bok, by z silnego zamachu uderzyc|Przez chwile rozwazasz najlepszy sposob na atak, by wreszcie szybkim ruchem uderzyc zza lewego ucha|Nagle wyskakujesz do przodu, by z szerokiego wymachu uderzyc|Wykonujesz pare markowanych wymachow, by wreszcie jednym z nich uderzyc) (.*) porecznym polkolistym toporem bojowym. Twa bron (.*)' _spece_bronie_pulkulisty_ja_kogos_7 = \
  /return (_bspecuj({_spece_bronie_poreczny_label}, "Ja", {P2}, "7", "7"))

#######################################################################################################################################################

; misterny obosieczny topor
; Aktualizacja: 28.02.13
; Ja humanoida (i nh też trochę)

/eval /def -p200 -mregexp -t'Ostrze twojego misternego obosiecznego topora trafia (.*), nie czyniac [^ ]+ zadnej krzywdy.' _misterny_ja_kogos_0 = /substitute -p @{BCwhite}----> @{Cyellow}[Misterny 0/7] @{BCwhite}probuje specowac @{Cblue}%%{P1}@{Cwhite}.
/eval /def -p200 -mregexp -t'Z oszczednego zamachu uderzasz swym misternym obosiecznym toporem w ((%{hitlocs}) (.*), znaczac ostrze broni kilkoma kroplami krwi.|(.*), nieznacznie raniac )' _misterny_ja_kogos_1 = /substitute -p @{BCwhite}----> @{Cyellow}[Misterny 1/7] @{BCwhite}specuje @{Cblue}%%{P3}%%{P4}@{Cwhite}.
/eval /def -p200 -mregexp -t'Twoj misterny obosieczny topor zahacza o (%{hitlocs}) (.*), (pozostawiajac plytka, nierowna rane|zadajac nieduze obrazenia).' _misterny_ja_kogos_2 = /substitute -p @{BCwhite}----> @{Cyellow}[Misterny 2/7] @{BCwhite}specuje @{Cblue}%%{P2}@{Cwhite}.
/eval /def -p200 -mregexp -t'Z szerokiego zamachu tniesz misternym obosiecznym toporem w (%{hitlocs}) (.*), (a tryskajaca z tej rany krew zrasza ziemie.|raniac [^ ]+.)' _misterny_ja_kogos_3 = /substitute -p @{BCwhite}----> @{Cyellow}[Misterny 3/7] @{BCwhite}specuje @{Cblue}%%{P2}@{Cwhite}.
/eval /def -p200 -mregexp -t'Rozpedzone ostrze dzierzonego przez ciebie misternego obosiecznego topora bezlitosnie wbija sie w (%{hitlocs}) (.*), (zadajac [^ ]+ ciezka rane|ciezko [^ ]+ raniac).' _misterny_ja_kogos_4 = /substitute -p @{BCwhite}----> @{Cyellow}[Misterny 4/7] @{BCwhite}specuje @{Cblue}%%{P2}@{Cwhite}.
/eval /def -p200 -mregexp -t'Przy akompaniamencie oszalamiajacego syku przecinanego powietrza krwawe ostrze twego misternego obosiecznego topora (wrzyna sie|godzi) w (%{hitlocs}) (.*), (odrzucajac [^ ]+ w tyl niczym szmaciana lalke.|zadajac ogromne obrazenia!)' _misterny_ja_kogos_5 = /substitute -p @{BCwhite}----> @{Cyellow}[Misterny 5/7] @{BCwhite}specuje @{Cblue}%%{P3}@{Cwhite}.
/eval /def -p200 -mregexp -t'Druzgoczacym atakiem misternego obosiecznego topora brutalnie rozcinasz (%{hitlocs}) (.*), zatrzymujac ped swej morderczej broni dopiero wtedy, kiedy zbrukane posoka ostrze grzeznie pomiedzy koscmi ofiary.' _misterny_ja_kogos_6 = /substitute -p @{BCwhite}----> @{Cyellow}[Misterny 6/7] @{BCwhite}specuje @{Cblue}%%{P2}@{Cwhite}.
/eval /def -p200 -mregexp -t'Szybkim wypadem wymijasz (.*) i wykorzystujac rozpedzona mase swego misternego obosiecznego topora bez trudu wyprowadzasz w pedzie dwa smiertelne ciosy.' _misterny_ja_kogos_7 = /substitute -p @{BCwhite}----> @{Cyellow}[Misterny 7/7] @{BCwhite}specuje @{Cblue}%%{P1}@{Cwhite}.

; Ja niehumanoida
/eval /def -p200 -mregexp -t'Ostrze twego misternego obosiecznego topora rozblyskuje w szalonym pedzie gdy biorac potezny zamach uderzasz nim w (%{hitlocs}) (.*).'  _misterny_ja_kogos_nh_6 = /substitute -p @{BCwhite}----> @{Cyellow}[Misterny 6/7] @{BCwhite}specuje @{Cblue}%%{P2}@{Cwhite}.
/eval /def -p200 -mregexp -t'Rzucajac sie do ostatecznego ataku wyprowadzasz straszliwe, pelne sily ciecie swym misternym obosiecznym toporem, ktore z mordercza precyzja smiertelnie godzi (.*) w (.*), ostatecznie konczac boj.' _misterny_ja_kogos_nh_7 = /substitute -p @{BCwhite}----> @{Cyellow}[Misterny 7/7] @{BCwhite}specuje @{Cblue}%%{P1}@{Cwhite}.

; Ja spec

/eval /def -p200 -mregexp -t'Szybkim ciosem jednego ze szpikulcow misternego obosiecznego topora uderzasz w (%{hitlocs}) (.*), pozostawiajac niewielkie zadrapanie.' _misterny_plus_ja_kogos_1 = /substitute -p @{BCwhite}----> @{Cyellow}[Mister+ 1/7] @{BCwhite}specuje @{Cblue}%%{P2}@{Cwhite}.
/eval /def -p200 -mregexp -t'Ostrym jak sztylet gornym szpikulcem sterczacym ze styliska misternego obosiecznego topora godzisz (.*) w (.*), (spuszczajac [^ ]+ nieco krwi|lekko [^ ]+ raniac).' _misterny_plus_ja_kogos_2 = /substitute -p @{BCwhite}----> @{Cyellow}[Mister+ 2/7] @{BCwhite}specuje @{Cblue}%%{P1}@{Cwhite}.
/eval /def -p200 -mregexp -t'Korzystajac z nadarzajacej sie okazji, gwaltownym uderzeniem styliska misternego obosiecznego topora wbijasz sterczacy zen szpic w (%{hitlocs}) (.*), pozostawiajac gleboka rane.' _misterny_plus_ja_kogos_3 = /substitute -p @{BCwhite}----> @{Cyellow}[Mister+ 3/7] @{BCwhite}specuje @{Cblue}%%{P2}@{Cwhite}.
/eval /def -p200 -mregexp -t'Naglym pchnieciem wbijasz sterczacy z nasady zelezca misternego obosiecznego topora kolec w (%{hitlocs}) (.*), (powodujac paskudny krwotok.|zadajac powazne obrazenia.)' _misterny_plus_ja_kogos_4 = /substitute -p @{BCwhite}----> @{Cyellow}[Mister+ 4/7] @{BCwhite}specuje @{Cblue}%%{P2}@{Cwhite}.
/eval /def -p200 -mregexp -t'Z impetem wyrzucasz przed siebie misterny obosieczny topor, idealnie wymierzajac cios gornego szpica w (%{hitlocs}) (.*), bardzo ciezko [^ ]+ raniac' _misterny_plus_ja_kogos_5 = /substitute -p @{BCwhite}----> @{Cyellow}[Mister+ 5/7] @{BCwhite}specuje @{Cblue}%%{P2}@{Cwhite}.
/eval /def -p200 -mregexp -t'Zdradliwe pchniecie ozdobiona siedmiocalowym kolcem rekojescia twego misternego obosiecznego topora zupelnie zaskakuje (.*), pozwalajac ci przebic [^ ]+ (.*) prawie na wylot!' _misterny_plus_ja_kogos_6 = /substitute -p @{BCwhite}----> @{Cyellow}[Mister+ 6/7] @{BCwhite}specuje @{Cblue}%%{P2}@{Cwhite}.
/eval /def -p200 -mregexp -t'Szybki niczym atak kobry cios gornego szpikulca sterczacego z twojego misternego obosiecznego topora z mordercza sila trafia (.*) w (.*), momentalnie pozbawiajac [^ ]+ zycia. Bezwladne cialo pada u twych stop, wciaz jeszcze broczac krwia ze smiertelnej rany.' _misterny_plus_ja_kogos_7 = /substitute -p @{BCwhite}----> @{Cyellow}[Mister+ 7/7] @{BCwhite}specuje @{Cblue}%%{P1}@{Cwhite}.
