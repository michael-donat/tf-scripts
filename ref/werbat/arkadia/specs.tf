/def show_spec = \
	/return substitute(strcat(decode_attr(strcat("@{Ccyan}[", {1}, "@{nB} ", {2}, "@{nCcyan}/", {3}, "] ")), {PL}, {P0}, {PR}))

; gp
/eval /def -PBC%kolor_fight -Fp5 -t'Wykorzystujac dogodny moment .* (muskajac|raniac|masakrujac) cie .*' spec_gp_kolor_0
/eval /def -PC%kolor_spec -Fp5 -t'Wykorzystujac dogodny moment .* (muskajac|raniac|masakrujac) (?<!cie) .*' spec_gp_kolor_1

/def -mregexp -Fp2 -t'Wykorzystujac dogodny .* lecz' spec_gp0 = /show_spec GP 0 6
/def -mregexp -Fp2 -t'Wykorzystujac dogodny .*, ledwo muskajac' spec_gp1 = /show_spec GP 1 6
/def -mregexp -Fp2 -t'Wykorzystujac dogodny .*, lekko raniac' spec_gp2 = /show_spec GP 2 6
/def -mregexp -Fp2 -t'Wykorzystujac dogodny .*, raniac' spec_gp3 = /show_spec GP 3 6
/def -mregexp -Fp2 -t'Wykorzystujac dogodny .*, powaznie raniac' spec_gp4 = /show_spec GP 4 6
/def -mregexp -Fp2 -t'Wykorzystujac dogodny .*, bardzo ciezko raniac' spec_gp5 = /show_spec GP 5 6
/def -mregexp -Fp2 -t'Wykorzystujac dogodny .*, masakrujac' spec_gp6= /show_spec GP 6 6

; korsarz
/eval /def -PBC%kolor_fight -Fp5 -t'.* unika twego ciosu.*' spec_ks_kolor_0
/eval /def -PC%kolor_spec  -Fp5 -t'.* unika ciosu .*' spec_ks_kolor1

/def -mregexp -Fp2 -t'przecina tylko powietrze\\.$$' spec_ks_0 = /show_spec KOR 0 5
/def -mregexp -Fp2 -t'zadaje.* (ci |)tylko nieznaczne obrazenia\\.$$' spec_ks_1 = /show_spec KOR 1 5
/def -mregexp -Fp2 -t'otwiera szeroka rane na .*\\.$$' spec_ks_2 = /show_spec KOR 2 5
/def -mregexp -Fp2 -t'gleboko rozrywajac .* cialo\\.$$' spec_ks_3 = /show_spec KOR 3 5
/def -mregexp -Fp2 -t'powodujac ogromne obrazenia\\.$$' spec_ks_4 = /show_spec KOR 4 5
/def -mregexp -Fp2 -t'ciagnac za soba krwawy warkocz smierci\\.$$' spec_ks_5 = /show_spec KOR 5 5

; strażnik
/eval /def -PBC%kolor_fight -Fp5 -t'.* wytraca ci .*' spec_wks_kolor_0
/eval /def -PC%kolor_spec  -Fp5 -t'.* wytraca .*' spec_wks_kolor_1

/eval /def -PBC%kolor_fight -Fp5 -t'.* wykorzystujac twoj brak broni .*' spec_wks_kolor_0_1
/eval /def -PC%kolor_spec  -Fp5 -t'.* wykorzystujac (brak broni|oslabienie) .* trafia .*' spec_wks_kolor_1_1

/def -mregexp -Fp2 -t'probuje.* wytracic ' spec_wks_wyt0 = /show_spec STR WYT
/def -mregexp -Fp2 -t'.* wytraca(sz|) .* z r' spec_wks_wyt1 = /show_spec STR WYT

/def -mregexp -Fp2 -t'wykorzystujac.* brak .* rownowage' _spec_wks_0_1 = /show_spec STR 0 5
/def -mregexp -Fp2 -t'wykorzystujac.* brak .*, ledwie zahaczajac' _spec_wks_1 = /show_spec STR 1 5
/def -mregexp -Fp2 -t'wykorzystujac.* brak .*, pozostawiajac ledwie sinca' _spec_wks_1_1 = /show_spec STR 1 5
/def -mregexp -Fp2 -t'wykorzystujac.* brak .*, lekko raniac' _spec_wks_2 = /show_spec STR 2 5
/def -mregexp -Fp2 -t'wykorzystujac.* brak .*, pozostawiajac krwawiace zadrapanie' _spec_wks_2_1 = /show_spec STR 2 5
/def -mregexp -Fp2 -t'wykorzystujac.* brak .*, mocno raniac' _spec_wks_3 = /show_spec STR 3 5
/def -mregexp -Fp2 -t'wykorzystujac.* brak .*, pozostawiajac dluga, poszarpana rane' _spec_wks_3_1 = /show_spec STR 3 5
/def -mregexp -Fp2 -t'wykorzystujac.* brak .*, bardzo mocno raniac' _spec_wks_4 = /show_spec STR 4 5
/def -mregexp -Fp2 -t'wykorzystujac.* brak .*, pozostawiajac gleboka rane z wystajacymi na wierzchu tkankami' _spec_wks_4_1 = /show_spec STR 4 5
/def -mregexp -Fp2 -t'wykorzystujac .* (smiertelne obrazenia)' spec_wks_5 = /show_spec STR 5 5

; legionista
/eval /def -PBC%kolor_fight  -Fp5 -t'.* ciebie.* wyprowadzic .* (powodujac|konczac walke).*' spec_ohm_kolor_0
/eval /def -PC%kolor_spec  -Fp5 -t'.* wyprowadzic .* (powodujac|konczac walke).*' spec_ohm_kolor_1

/def -mregexp -Fp2 -t'wyprowadzic .* (przecinajac tylko powietrze|nie czyniac najmniejszej krzywdy)' spec_ohm_0 = /show_spec LEG 0 7
/def -mregexp -Fp2 -t'wyprowadzic .* (powodujac tylko ledwo zauwazalne obrazenia)' spec_ohm_1 = /show_spec LEG 1 7
/def -mregexp -Fp2 -t'wyprowadzic .* (powodujac tylko nieznaczne obrazenia)' spec_ohm_2 = /show_spec LEG 2 7
/def -mregexp -Fp2 -t'wyprowadzic .* (powodujac niemale obrazenia)' spec_ohm_3 = /show_spec LEG 3 7
/def -mregexp -Fp2 -t'wyprowadzic .* (powodujac liczne i glebokie obrazenia)' spec_ohm_4 = /show_spec LEG 4 7
/def -mregexp -Fp2 -t'wyprowadzic .* (powodujac rozlegle obrazenia)' spec_ohm_5 = /show_spec LEG 5 7
/def -mregexp -Fp2 -t'wyprowadzic .* (powodujac prawieze smiertelne obrazenia)' spec_ohm_6 = /show_spec LEG 6 7
/def -mregexp -Fp2 -t'wyprowadzic .* (w jednym momencie konczac walke)' spec_ohm_7 = /show_spec LEG 7 7

; partyzant
/eval /def -PBC%kolor_fight -Fp5 -t'.* (uderza|doskakuje) .* (raniac cie |cie masakrujac).*' spec_sc_kolor_0
/eval /def -PC%kolor_spec  -Fp5 -t'.* (uderza|doskakuje) .* (raniac|masakrujac) .*' spec_sc_kolor_1

/eval /def -PC%kolor_spec  -Fp5 -t'.* (ubiegajac reakcje .* probuje |uprzedzajac reakcje|blyskawicznym susem dopada |doskakuje .* w biegu skladajac sie|ulamku sekundy zabiega |z furia drapieznika rusza |natychmiast rzuca sie |krzykiem wpada na ).*' spec_sc_kolor_3

/def -mregexp -Fp2 -t'probuje.* dosiegnac .* jednak .* bron nieznacznie (chybia celu)' spec_sc_0 = /show_spec PAR 0 7
/def -mregexp -Fp2 -t'uderza.* .* (nieznacznie raniac)' spec_sc_1 = /show_spec PAR 1 7
/def -mregexp -Fp2 -t'uderza.* .* (lekko raniac)' spec_sc_2 = /show_spec PAR 2 7
/def -mregexp -Fp2 -t'uderza.* .* (bolesnie raniac)' spec_sc_3 = /show_spec PAR 3 7
/def -mregexp -Fp2 -t'uderza.* .* (powaznie raniac)' spec_sc_4 = /show_spec PAR 4 7
/def -mregexp -Fp2 -t'uderza.* .* (bardzo ciezko raniac)' spec_sc_6 = /show_spec PAR 5 7
/def -mregexp -Fp2 -t'uderza.* .* (potwornie raniac)' spec_sc_7 = /show_spec PAR 6 7
/def -mregexp -Fp2 -t'blyskawicznie doskakuje.* do .* (bezlitosnie masakrujac)' spec_sc_8 = /show_spec PAR 7 7
/def -mregexp -Fp2 -t'doskakuje.* do .* mordercze uderzenie' spec_sc_9 = /show_spec PAR 7 7
 
/def -mregexp -Fp2 -t'ubiegajac reakcje .* probuje zaskoczyc' spec_scatak_0 = /show_spec SCATAK 0 5
/def -mregexp -Fp2 -t'uprzedzajac reakcje .* (blyskawicznym ciosem|z wielkim pospiechem stara sie|bez namyslu uderza)' spec_scatak_1 = /show_spec SCATAK 1 5
/def -mregexp -Fp2 -t'blyskawicznym susem dopada .* ledwie zahaczajac' spec_scatak2 = /show_spec SCATAK 1 5
/def -mregexp -Fp2 -t'momentalnie doskakuje .* w biegu skladajac sie' spec_scatak_3 = /show_spec SCATAK 2 5
/def -mregexp -Fp2 -t'dziko hallakujac w ulamku sekundy zabiega od tylu' spec_scatak_4 = /show_spec SCATAK 3 5
/def -mregexp -Fp2 -t'z furia drapieznika rusza do ataku na' spec_scatak_5 = /show_spec SCATAK 4 5
/def -mregexp -Fp2 -t'wyprzedzajac nieudolny atak natychmiast rzuca sie w kierunku ' spec_scatak_6 = /show_spec SCATAK 5 5
/def -mregexp -Fp2 -t'z dzikim krzykiem wpada na' spec_scatak_7 = /show_spec SCATAK 5 5

; rycerz
/eval /def -PC%kolor_spec -Fp5 -t'.* bierze (potezny|mocny) zamach .*' spec_zs_kolor_1

/def -mregexp -Fp2 -t'bierze.* zamach .* (cios przeszywa powietrze)\\.$$' spec_zs_0 = /show_spec RYC 0 5
/def -mregexp -Fp2 -t'bierze.* zamach .* (pozostawiajac .* nieznaczne zadrapani.*)\\.$$' spec_zs_1 = /show_spec RYC 1 5
/def -mregexp -Fp2 -t'bierze.* zamach .* (pozostawiajac krwawiaca rane)\\.$$' spec_zs_2 = /show_spec RYC 2 5
/def -mregexp -Fp2 -t'bierze.* zamach .* (pozostawiajac duza krwawiaca rane)\\.$$' spec_zs_3 = /show_spec RYC 2 5
/def -mregexp -Fp2 -t'bierze.* zamach .* (twarz .* zalewa strumien krwi)\\.$$' spec_zs_4 = /show_spec RYC 4 5
/def -mregexp -Fp2 -t'bierze.* zamach .* (rozlegle obrazenia)\\.$$' spec_zs_5 = /show_spec RYC 4 5
/def -mregexp -Fp2 -t'bierze.* zamach .* (pada martw. na ziemie)\\.$$' spec_zs_6 = /show_spec RYC 5 5

; zboj
/eval /def -PBC%kolor_spec -Fp5 -t'.* uderzeniem .* trafia cie .*' spec_zb_kolor_0
/eval /def -PBC%kolor_spec -Fp5 -t'.* wali cie na odlew.*' spec_zb_kolor_0_1
/eval /def -PC%kolor_spec -Fp5 -t'.* uderzeniem .* trafia (?<!cie) .*' spec_zb_kolor_1
/eval /def -PC%kolor_spec -Fp5 -t'.* wali.*(?<! cie ).*na odlew.*' spec_zb_kolor_1_1

/def -mregexp -Fp2 -t'uderzeniem .* trafia.* (muskajac nieznacznie)' spec_zb_0 = /show_spec ZBOJ 1 8
/def -mregexp -Fp2 -t'uderzeniem .* trafia.* (trafiajac lekko)' spec_zb_1 = /show_spec ZBOJ 2 8
/def -mregexp -Fp2 -t'uderzeniem .* trafia.* (otwierajac spora rane)' spec_zb_2 = /show_spec ZBOJ 3 8
/def -mregexp -Fp2 -t'uderzeniem .* trafia.* (duze krwistoczerwone)' spec_zb_3 = /show_spec ZBOJ 4 8
/def -mregexp -Fp2 -t'uderzeniem .* trafia.* (pojawia sie duza rana)' spec_zb_4 = /show_spec ZBOJ 5 8
/def -mregexp -Fp2 -t'uderzeniem .* trafia.* (pojawia sie ogromna rana)' spec_zb_5 = /show_spec ZBOJ 6 8
/def -mregexp -Fp2 -t'szeroki zamach .* wali .* na odlew' spec_zb_6 = /show_spec ZBOJ 7 8
/def -mregexp -Fp2 -t'uderza.* mocno w glowe .* bez zycia' spec_zb_7 = /show_spec ZBOJ 8 8

; fanatyk
/eval /def -PC%kolor_spec -Fp5 -t'.*(przeciwnika rzuca sie do ataku|Bezlitosny,).*' spec_mc_kolor_1

/def -mregexp -Fp2 -t'bierze.* potezny zamach i wyprowadza.* .* ktory ma (?:cie |)zmasakrowac' spec_mc_0 = /show_spec FAN 0 7
/def -mregexp -Fp2 -t'rzuca.* sie do ataku\\. .* trafia.* .* (ledwo muskajac)' spec_mc_1 = /show_spec FAN 1 7
/def -mregexp -Fp2 -t'rzuca.* sie do ataku\\. .* trafia.* .* (lekko raniac)' spec_mc_2 = /show_spec FAN 2 7
/def -mregexp -Fp2 -t'rzuca.* sie do ataku\\. .* trafia.* .* ((?<!lekko |powaznie |bardzo ciezko )raniac)' spec_mc_3 = /show_spec FAN 3 7
/def -mregexp -Fp2 -t'rzuca.* sie do ataku\\. .* trafia.* .* (powaznie raniac)' spec_mc_4 = /show_spec FAN 4 7
/def -mregexp -Fp2 -t'rzuca.* sie do ataku\\. .* trafia.* .* (bardzo ciezko raniac)' spec_mc_5 = /show_spec FAN 5 7
/def -mregexp -Fp2 -t'rzuca.* sie do ataku\\. .* trafia.* .* (masakrujac)' spec_mc_6 = /show_spec FAN 6 7
/def -mregexp -Fp2 -t'(osuwa(?:sz|) sie (?:powoli |)na ziemie), ostatnimi silami' spec_mc_7 = /show_spec FAN 7 7

; miecznik
/eval /def -PBC%kolor_fight -Fp5 -t'.*(potezny mlyniec|rusza do przodu|poprawia chwyt na|niespodziewanie skreca|wyrzuca do przodu) .* (zacina|tnie|rozcina) (cie|ci) .*' spec_miecznik_kolor_0 = /echo dupa
/eval /def -PC%kolor_spec -Fp5 -t'.*(potezny mlyniec|rusza do przodu|poprawia chwyt na|niespodziewanie skreca|wyrzuca do przodu) .* (zacina|tnie|rozcina) (?<!cie |ci ).*' spec_miecznik_kolor_1

/def -mregexp -Fp2 -t'(potezny mlyniec|rusza do przodu|poprawia chwyt na|niespodziewanie skreca|wyrzuca do przodu) .* (cudem|ktore jednak)' spec_miecz_0 = /show_spec MIECZ 0 7
/def -mregexp -Fp2 -t'(potezny mlyniec|rusza do przodu|poprawia chwyt na|niespodziewanie skreca|wyrzuca do przodu) .* ledwo zacina' spec_miecz_1 = /show_spec MIECZ 1 7
/def -mregexp -Fp2 -t'(potezny mlyniec|rusza do przodu|poprawia chwyt na|niespodziewanie skreca|wyrzuca do przodu) .* bolesnie zacina' spec_miecz_2 = /show_spec MIECZ 2 7
/def -mregexp -Fp2 -t'(potezny mlyniec|rusza do przodu|poprawia chwyt na|niespodziewanie skreca|wyrzuca do przodu) .* plytko tnie' spec_miecz_3 = /show_spec MIECZ 3 7
/def -mregexp -Fp2 -t'(potezny mlyniec|rusza do przodu|poprawia chwyt na|niespodziewanie skreca|wyrzuca do przodu) .* (?<!plytko |gleboko |potworna moca )tnie' spec_miecz_4 = /show_spec MIECZ 4 7
/def -mregexp -Fp2 -t'(potezny mlyniec|rusza do przodu|poprawia chwyt na|niespodziewanie skreca|wyrzuca do przodu) .* gleboko tnie' spec_miecz_5 = /show_spec MIECZ 5 7
/def -mregexp -Fp2 -t'(potezny mlyniec|rusza do przodu|poprawia chwyt na|niespodziewanie skreca|wyrzuca do przodu) .* niemalze rozcina' spec_miecz_6 = /show_spec MIECZ 6 7
/def -mregexp -Fp2 -t'(potezny mlyniec|rusza do przodu|poprawia chwyt na|niespodziewanie skreca|wyrzuca do przodu) .* z potworna moca tnie' spec_miecz_7 = /show_spec MIECZ 7 7

; nozownik
/eval /def -PC%kolor_spec -Fp5 -t'.*(ciele nieznaczne|odskakuje.*zadajac|obracajac w |dekoncentracje .* wbija|doskakuje do .* a|z nieuwagi .* kluj|wyk.* zmeczyc |poziomym.* godzi|by trafiajac |krwawa bruzda|blyskawicznie .* i trafiajac|zaciska mocniej.* i paskudnie|mruzac oczy uwaznie|uwaznie sledzi|wyprowadz.* celujac|dopada do .* trafiajac|zwinnym, kocim|zwinnie uchyla sie przed|zrecznym.* cios|Unikajac .* blyskawi|Wykorz.* oslabienie).*' spec_ra_kolor_1

/def -mregexp -Fp2 -t"spreza sie do skoku (probujac ugodzic).* sw.* o wlos" spec_ra_0_1 = /show_spec NOZ 0 8
/def -mregexp -Fp2 -t"^Wykorzystujac dogodna sytuacje, .* rzuca sie na .* jednak .* zaskoczyc" spec_ra_0_2 = /show_spec NOZ 0 8
/def -mregexp -Fp2 -t"zamierza sie na .* jednak .* (unika ciosu)" spec_ra_03 = /show_spec NOZ 0 8
/def -mregexp -Fp2 -t"wyko.* by trafic .* i pozos.* ciele (nieznaczne drasniecie)" spec_ra_1_1 = /show_spec NOZ 1 8
/def -mregexp -Fp2 -t"odskakuje .* zadajac.* (nieznaczne obrazenia)" spec_ra_1_2 = /show_spec NOZ 1 8
/def -mregexp -Fp2 -t"obracajac w .* zwod i trafia .* pozost.* (nieznaczne obrazenia)" spec_ra_1_3 = /show_spec NOZ 1 8
/def -mregexp -Fp2 -t"wyk.* dekoncentracje .* wbija .* (lekkie drasniecie)" spec_ra_2_1 = /show_spec NOZ 2 8
/def -mregexp -Fp2 -t"^Wykorzys.* chwile .* doskakuje do .* (lekkie drasniecie)" spec_ra_2_2 = /show_spec NOZ 2 8
/def -mregexp -Fp2 -t"korzyst.* z nieuwagi .* kluj.* (lekkie drasniecie)" spec_ra_2_3 = /show_spec NOZ 2 8
/def -mregexp -Fp2 -t"wyk.* zmeczyc .* i gdy .* (wbija).*" spec_ra_3_1 = /show_spec NOZ 3 8
/def -mregexp -Fp2 -t"poziomym.* godzi w .* trafiajac .* (bolesny grymas).*" spec_ra_3_2 = /show_spec NOZ 3 8
/def -mregexp -Fp2 -t"uwazn.* ruchy .* by trafiajac .* (bolesna rane).*" spec_ra_4_1 = /show_spec NOZ 4 8
/def -mregexp -Fp2 -t"blyskaw.* od .* znacz.* (krwawa bruzda).*" spec_ra_4_2 = /show_spec NOZ 4 8
/def -mregexp -Fp2 -t"blyskawicznie .* i trafiajac .* w .*(krwawiaca rane).*" spec_ra_5_1 = /show_spec NOZ 5 8
/def -mregexp -Fp2 -t"zaciska mocniej.* i (paskudnie rani) .* trafiajac .*" spec_ra_5_2 = /show_spec NOZ 5 8
/def -mregexp -Fp2 -t"mruzac oczy uwaznie obserwuje .* a gdy .* (rozlegle obrazenia)" spec_ra_5_3 = /show_spec NOZ 5 8
/def -mregexp -Fp2 -t"uwaznie sledzi .* aby .* (znaczne obrazenia)" spec_ra_5_4 = /show_spec NOZ 5 8
/def -mregexp -Fp2 -t"wyprowadz.* celujac w .* Bron .* (az po rekojesc).*" spec_ra_6_1 = /show_spec NOZ 6 8
/def -mregexp -Fp2 -t"zaciska mocniej palce na .* dopada do .* trafiajac .* (powazne obrazenia)" spec_ra_6_2 = /show_spec NOZ 6 8
/def -mregexp -Fp2 -t"zwinnym, kocim .* doskoczyc do .* i wyrzuc.* a z (potwornej rany).*" spec_ra_7_1 = /show_spec NOZ 7 8
/def -mregexp -Fp2 -t"zwinnie uchyla sie przed .* i wykorzystujac .* (bardzo powazne obrazenia)" = /show_spec NOZ 7 8
/def -mregexp -Fp2 -t"zrecznym.* cios .* rownoczes.* (koniec walki).*" spec_ra_8_1 = /show_spec NOZ 8 8
/def -mregexp -Fp2 -t"^Unikajac .* blyskaw.* ofiary (uchodzi zycie).*" spec_ra_8_2 = /show_spec NOZ 8 8
/def -mregexp -Fp2 -t"^Wykorz.* i oslabienie .* siln.* (ostatnie sily).*" spec_ra_8_3 = /show_spec NOZ 8 8
/def -mregexp -Fp2 -t"^Unikajac uderzenia .* blyskawicznie .* (zakonczenia zywotu).*" spec_ra_8_4 = /show_spec NOZ 8 8


; NPCE
; ----

; Mekan

/eval /def -PBC%kolor_fight -Fp5 -t'.* robi szybki, wyuczony wypad, .*raniac cie .*' speckan_kolor_0
/eval /def -PC%kolor_spec  -Fp5 -t'.* robi szybki, wyuczony wypad, .*raniac (?!cie ).*' speckan_kolor_1	
 
/def -mregexp -Fp2 -t'robi szybki, wyuczony wypad, (nieznacznie raniac)' speckan_0 = /show_spec MEKAN 1 6
/def -mregexp -Fp2 -t'robi szybki, wyuczony wypad, (lekko raniac)' speckan_1 = /show_spec MEKAN 2 6
/def -mregexp -Fp2 -t'robi szybki, wyuczony wypad, (raniac)' speckan_2 = /show_spec MEKAN 3 6
/def -mregexp -Fp2 -t'robi szybki, wyuczony wypad, (powaznie raniac)' speckan_3 = /show_spec MEKAN 4 6
/def -mregexp -Fp2 -t'robi szybki, wyuczony wypad, (bardzo ciezko raniac)' speckan_4 = /show_spec MEKAN 5 6

; Ryboludzie

/eval /def -PBC%kolor_fight -Fp5 -t'W ostatniej chwili (wykonujesz szybki uskok|zauwazasz pedzaca).*' spec_ryba_kolor_0
/eval /def -PC%kolor_spec  -Fp5 -t'.* w ostatniej chwili (wykonuje szybki uskok|zauwaza pedzaca).*' spec_ryba_kolor_1

/def -mregexp -Fp2 -t'ostatniej chwili szczesliwie uskakuje' spec_ryba_0 = /show_spec RYBA 0 4
/def -mregexp -Fp2 -t'ostatniej chwili wykonuje.* szybki' spec_ryba_1 = /show_spec RYBA 1 4
/def -mregexp -Fp2 -t'ostatniej chwili zauwaza.* (bolesne obrazenia)' spec_ryba_2 = /show_spec RYBA 2 4
/def -mregexp -Fp2 -t'ostatniej chwili zauwaza.* (rozlegle obrazenia)' spec_ryba_3 = /show_spec RYBA 3 4

; Imperium

;;/eval /def -PBC%kolor_fight -Fp5 -t'Nagle .* zamaszysty cios .* cie w .*' spec_imp_kolor0
/eval /def -PC%kolor_spec -Fp5 -t'Nagle .* zamaszysty cios .* (?<!cie )w .*' spec_imp_kolor1

/def -mregexp -Fp2 -t'Nagle .* zamaszysty cios .* lecz' spec_imp_0 = /show_spec IMP 0 6
/def -mregexp -Fp2 -t'Nagle .* zamaszysty cios .* ktory ledwo muska' spec_imp_1 = /show_spec IMP 1 6
/def -mregexp -Fp2 -t'Nagle .* zamaszysty cios .* ktory lekko rani' spec_imp_2 = /show_spec IMP 2 6
/def -mregexp -Fp2 -t'Nagle .* zamaszysty cios .* ktory rani ' spec_imp_3 = /show_spec IMP 3 6
/def -mregexp -Fp2 -t'Nagle .* zamaszysty cios .* ktory powaznie rani' spec_imp_4 = /show_spec IMP 4 6
/def -mregexp -Fp2 -t'Nagle .* zamaszysty cios .* ktory bardzo ciezko rani' spec_imp_5 = /show_spec IMP 5 6
/def -mregexp -Fp2 -t'Nagle .* zamaszysty cios .* ktory prawie smiertelnie rani' spec_imp_6 = /show_spec IMP 6 6
