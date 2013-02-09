; by Evin, Ingwar

/def -Fp2 -mregexp -t'(zolt[a-z]* jasn[a-z]* kwiat[a-z]*)' _ziolo_Deliona = /substitute -p %{PL}%{P1} @{BCwhite}(Deliona zm-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(okraglaw[a-z]* aromatyczn[a-z]* lisc[a-z]*)' _ziolo_mieta = /substitute -p %{PL}%{P1} @{BCwhite}(Mieta kd+ zm- kac)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(rozetkowat[a-z]* lancetowat[a-z]* lisc[a-z]*)' _ziolo_babka = /substitute -p %{PL}%{P1} @{BCwhite}(Babka kd+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zlocistozolt[a-z]* kwiat[a-z]*)' _ziolo_Mniszek = /substitute -p %{PL}%{P1} @{BCwhite}(Mniszek kd+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(jasnofioletow[a-z]* delikatn[a-z]* kwiat[a-z]*)' _ziolo_Szafran = /substitute -p %{PL}%{P1} @{BCwhite}(Szafran kd+ wt+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(grub[a-z]* szaraw[a-z]* grzyb[a-z]*)' _ziolo_BorowikSzatanski = /substitute -p %{PL}%{P1} @{BCwhite}(Szatan T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(bial[a-z]* mal[a-z]* kwiat[a-z]*)' _ziolo_Glog = /substitute -p %{PL}%{P1} @{BCwhite}(Glog kd+ zm-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(szarozielon[a-z]* gabczast[a-z]* porost[a-z]*)' _ziolo_plucnica = /substitute -p %{PL}%{P1} @{BCwhite}(Plucnica o)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(delikatn[a-z]* czerwon[a-z]* grzyb[a-z]*)' _ziolo_Muchomor_Czerwony = /substitute -p %{PL}%{P1} @{BCwhite}(Muchomor T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(kolczast[a-z]* wysuszon[a-z]* roslin[a-z]*)' _ziolo_Oset = /substitute -p %{PL}%{P1} @{BCwhite}(Oset T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(fioletow[a-z]* lejkowat[a-z]* kwiat[a-z]*)' _ziolo_Bariwnek = /substitute -p %{PL}%{P1} @{BCwhite}(Barwinek kd+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(jasnopomaranczow[a-z]* kwiat[a-z]*)' _ziolo_Nagietek = /substitute -p %{PL}%{P1} @{BCwhite}(Nagietek kd+)@{n}%{P4}%{PR}
/def -Fp2 -mregexp -t'(strzalkowat[a-z]* aromatyczn[a-z]* lisc[a-z]*)' _ziolo_Szczaw = /substitute -p %{PL}%{P1} @{BCwhite}(Szczaw kd+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(fioletow[a-z]* zwart[a-z]* kwiatostan[a-z]*)' _ziolo_Lawenda = /substitute -p %{PL}%{P1} @{BCwhite}(Lawenda kd+ o)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zaostrzon[a-z]* podlozn[a-z]* lisc[a-z]*)' _ziolo_SzalwiaLekarska = /substitute -p %{PL}%{P1} @{BCwhite}(Szalwia kd+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(mal[a-z]* czerwon[a-z]* kwiat[a-z]*)' _ziolo_SerceKapitana = /substitute -p %{PL}%{P1} @{BCwhite}(Serce Kapitana kd+ int- wt-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(owlosion[a-z]* aromatyczn[a-z]* lisc[a-z]*)' _ziolo_MelisaLekarska = /substitute -p %{PL}%{P1} @{BCwhite}(Melisa kd+ o)@{n}%{P6}%{PR}
/def -Fp2 -mregexp -t'(zlocistopomaranczow[a-z]* duz[a-z]* kwiat[a-z]*)' _ziolo_Arnika = /substitute -p %{PL}%{P1} @{BCwhite}(Arnika kd+ zm-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zoltoszar[a-z]* niepozorn[a-z]* korzen[a-z]*)' _ziolo_Ranog = /substitute -p %{PL}%{P1} @{BCwhite}(Ranog kd+ o)@{n}%{P7}%{PR}
/def -Fp2 -mregexp -t'(duz[a-z]* granatow[a-z]* jagod[a-z]*)' _ziolo_Siezygron = /substitute -p %{PL}%{P1} @{BCwhite}(Siezygron o)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(brudnobrazow[a-z]* cuchnac[a-z]* galaz[a-z]*)' _ziolo_Bagiennik = /substitute -p %{PL}%{P1} @{BCwhite}(Bagiennik wt-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(brazowaw[a-z]* fosforyzujac[a-z]* m[a-z]*)' _ziolo_Grabiorog = /substitute -p %{PL}%{P1} @{BCwhite}(Grabiorog int- zr-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zielon[a-z]* sluzowat[a-z]* grzyb[a-z]*)' _ziolo_Pierscieniak1 = /substitute -p %{PL}%{P1} @{BCwhite}(Pierscieniak T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(ciemnoniebiesk[a-z]* sluzowat[a-z]* grzyb[a-z]*)' _ziolo_Pierscieniak3 = /substitute -p %{PL}%{P1} @{BCwhite}(Pierscieniak T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(niebieski[a-z]* sluzowat[a-z]* grzyb[a-z]*)' _ziolo_Pierscieniak4 = /substitute -p %{PL}%{P1} @{BCwhite}(Pierscieniak T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(miedzian[a-z]* sluzowat[a-z]* grzyb[a-z]*)' _ziolo_Pierscieniak5 = /substitute -p %{PL}%{P1} @{BCwhite}(Pierscieniak kd+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(brudnozolt[a-z]* fioletowo-zylkowan[a-z]* kwiat[a-z]*)' _ziolo_Lulek_Czarny = /substitute -p %{PL}%{P1} @{BCwhite}(Lulek T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(delikatn[a-z]* jasn[a-z]* grzyb[a-z]*)' _ziolo_Muchomor_Sromotnikowy = /substitute -p %{PL}%{P1} @{BCwhite}(Sromotnik T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(jaskrawozolt[a-z]* drobn[a-z]* kwiat[a-z]*)' _ziolo_Stulicha = /substitute -p %{PL}%{P1} @{BCwhite}(Stulicha T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(bial[a-z]* zmutowan[a-z]* grzyb[a-z]*)' _ziolo_Stroczek = /substitute -p %{PL}%{P1} @{BCwhite}(Stroczek T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(pomaranczow[a-z]* mal[a-z]* korzen[a-z]*)' _ziolo_Szalej = /substitute -p %{PL}%{P1} @{BCwhite}(Szalej T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(mazist[a-z]* bulwiast[a-z]* grzyb[a-z]*)' _ziolo_Casur = /substitute -p %{PL}%{P1} @{BCwhite}(Casur s+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(soczyst[a-z]* karminow[a-z]* m[a-z]*)' _ziolo_Drath = /substitute -p %{PL}%{P1} @{BCwhite}(Drath wt+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(dlug[a-z]* lodyg[a-z]*)' _ziolo_Konopie = /substitute -p %{PL}%{P1} @{BCwhite}(Konopie magia)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(eliptyczn[a-z]* zaostrzon[a-z]* lisc[a-z]*)' _ziolo_Ogorecznik = /substitute -p %{PL}%{P1} @{BCwhite}(Ogorecznik odw+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(rozow[a-z]* pachnac[a-z]* kwiat[a-z]*)' _ziolo_Roza = /substitute -p %{PL}%{P1} @{BCwhite}(Roza)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(tward[a-z]* czerwon[a-z]* owoc[a-z]*)' _ziolo_Borowka = /substitute -p %{PL}%{P1} @{BCwhite}(Borowka)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(mal[a-z]* fioletow[a-z]* owoc[a-z]*)' _ziolo_Jagoda = /substitute -p %{PL}%{P1} @{BCwhite}(Jagoda)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(mal[a-z]* czarn[a-z]* owoc[a-z]*)' _ziolo_Jerzyna = /substitute -p %{PL}%{P1} @{BCwhite}(Jezyna)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(mal[a-z]* czerwon[a-z]* owoc[a-z]*)' _ziolo_Malina = /substitute -p %{PL}%{P1} @{BCwhite}(Malina)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(niewielk[a-z]* czerwon[a-z]* owoc[a-z]*)' _ziolo_Poziomka = /substitute -p %{PL}%{P1} @{BCwhite}(Poziomka)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(nieduz[a-z]* brazow[a-z]* grzyb[a-z]*)' _ziolo_Maslak = /substitute -p %{PL}%{P1} @{BCwhite}(Maslak)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(grzyb[a-z]* such[a-z]* kapelusz[a-z]*)' _ziolo_Hubka = /substitute -p %{PL}%{P1} @{BCwhite}(Hubka)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(sredni[a-z]* kasztanowobrazow[a-z]* grzyb[a-z]*)' _ziolo_Podgrzybek_Brunatny = /substitute -p %{PL}%{P1} @{BCwhite}(Podgrzybek)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(miedzianozielon[a-z]* fosforyzujac[a-z]* grzyb[a-z]*)' _ziolo_Muchomor_Cesarski = /substitute -p %{PL}%{P1} @{BCwhite}(Muchomor Cesarski T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(grub[a-z]* brazow[a-z]* grzyb[a-z]*)' _ziolo_Borowik_Krolewski = /substitute -p %{PL}%{P1} @{BCwhite}(Borowik Krolewski)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(wysok[a-z]* jasnobrazow[a-z]* grzyb[a-z]*)' _ziolo_Borowik_Szlachetny = /substitute -p %{PL}%{P1} @{BCwhite}(Borowik)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zielon[a-z]* postrzepion[a-z]* galaz[a-z]*)' _ziolo_Drabik_Drzewikowaty = /substitute -p %{PL}%{P1} @{BCwhite}(Drabik)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(wysok[a-z]* czerwonaw[a-z]* grzyb[a-z]*)' _ziolo_Kozlarz_Czerwony = /substitute -p %{PL}%{P1} @{BCwhite}(Kozlarz)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zielon[a-z]* lancetowat[a-z]* lisci[a-z]*)' _ziolo_Trawa = /substitute -p %{PL}%{P1} @{BCwhite}(Trawa)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(czerwonaw[a-z]* duz[a-z]* lisc[a-z]*)' _ziolo_Rabarbar = /substitute -p %{PL}%{P1} @{BCwhite}(Rabarbar)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(smukl[a-z]* jasnozielon[a-z]* lodyg[a-z]*)' _ziolo_Centuria = /substitute -p %{PL}%{P1} @{BCwhite}(Centuria o)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zielon[a-z]* galezist[a-z]* ped[a-z]*)' _ziolo_Rdest = /substitute -p %{PL}%{P1} @{BCwhite}(Rdest kd+ T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(okazal[a-z]* pachnac[a-z]* kwiat[a-z]*)' _ziolo_Mak = /substitute -p %{PL}%{P1} @{BCwhite}(Mak Polny kd+ zm+ zr-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zdrewnial[a-z]* rozgalezion[a-z]* krzewin[a-z]*)' _ziolo_Macznica = /substitute -p %{PL}%{P1} @{BCwhite}(Macznica kd+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(ciemn[a-z]* poskrecan[a-z]* klacz[a-z]*)' _ziolo_Pieciornik = /substitute -p %{PL}%{P1} @{BCwhite}(Pieciornik kd+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(czterokanciast[a-z]* rozgalezion[a-z]* lodyg[a-z]*)' _ziolo_Dziurawiec = /substitute -p %{PL}%{P1} @{BCwhite}(Dziurawiec kd+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(srebrzystoszar[a-z]* owlosion[a-z]* lisc[a-z]*)' _ziolo_Naparstnica = /substitute -p %{PL}%{P1} @{BCwhite}(Naparstnica zm-)@{n}%{P6}%{PR}
/def -Fp2 -mregexp -t'(smukl[a-z]* zielon[a-z]* lodyg[a-z]*)' _ziolo_Nostrzyk = /substitute -p %{PL}%{P1} @{BCwhite}(Nostrzyk zm- glod- T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'( kanciast[a-z]* rozgalezion[a-z]* lodyg[a-z]*)' _ziolo_Bylica = /substitute -p %{PL}%{P1} @{BCwhite}(Bylica zm- glod-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(kosmatoowlosion[a-z]* kwiatostan[a-z]*)' _ziolo_Kasztanowiec = /substitute -p %{PL}%{P1} @{BCwhite}(Kasztanowiec zm-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(kremow[a-z]* owlosion[a-z]* kwiat[a-z]*)' _ziolo_Przelot = /substitute -p %{PL}%{P1} @{BCwhite}(Przelot. zm- mana-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(duz[a-z]* bial[a-z]* kwiat[a-z]*)' _ziolo_Bielun = /substitute -p %{PL}%{P1} @{BCwhite}(Bielun wt+ T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(lsniac[a-z]* czerwon[a-z]* owoc[a-z]*)' _ziolo_Deren = /substitute -p %{PL}%{P1} @{BCwhite}(Deren wt+ pragnienie+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(macznistoowlosion[a-z]* szaraw[a-z]* roslin[a-z]*)' _ziolo_Komosa = /substitute -p %{PL}%{P1} @{BCwhite}(Komosa zm- wt+ s+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zolt[a-z]* rurkowat[a-z]* kwiat[a-z]*)' _ziolo_Wrotycz = /substitute -p %{PL}%{P1} @{BCwhite}(Wrotycz o)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(bial[a-z]* rozgalezion[a-z]* korzen[a-z]*)' _ziolo_Mandragora = /substitute -p %{PL}%{P1} @{BCwhite}(Mandragora mana+ o)@{n}%{P6}%{PR}
/def -Fp2 -mregexp -t'(szar[a-z]* kolczast[a-z]* korzen[a-z]*)' _ziolo_Aralia = /substitute -p %{PL}%{P1} @{BCwhite}(Aralia o)@{n}%{P6}%{PR}
/def -Fp2 -mregexp -t'(brazow[a-z]* okragl[a-z]* nasion[a-z]*)' _ziolo_Kola = /substitute -p %{PL}%{P1} @{BCwhite}(Kola wt+ zm- glod- zr-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(rozgowat[a-z]* zoltozielon[a-z]* galaz[a-z]*)' _ziolo_Przesl = /substitute -p %{PL}%{P1} @{BCwhite}(Przesl wt+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(jasnozielon[a-z]* nieowlosion[a-z]* lodyg[a-z]*)' _ziolo_Lulecznica = /substitute -p %{PL}%{P1} @{BCwhite}(Lulecznica zm-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(wonn[a-z]* dzwonkowat[a-z]* kwiat[a-z]*)' _ziolo_Konwalia = /substitute -p %{PL}%{P1} @{BCwhite}(Konwalia zm- T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(sztywn[a-z]* smukl[a-z]* lodyg[a-z]*)' _ziolo_Lak = /substitute -p %{PL}%{P1} @{BCwhite}(Lak zm- wt+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(drobn[a-z]* bial[a-z]* kwiat[a-z]*)' _ziolo_Rumianek = /substitute -p %{PL}%{P1} @{BCwhite}(Rumianek o glod-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(wysok[a-z]* blekitn[a-z]* kwiat[a-z]*)' _ziolo_Chaber = /substitute -p %{PL}%{P1} @{BCwhite}(Chaber o glod+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(jasnobrunatn[a-z]* popekan[a-z]* galaz[a-z]*)' _ziolo_Bez = /substitute -p %{PL}%{P1} @{BCwhite}(Bez o)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zoltaw[a-z]* powyginan[a-z]* korzen[a-z]*)' _ziolo_Krzyzownica = /substitute -p %{PL}%{P1} @{BCwhite}(Krzyzownica o)@{n}%{P6}%{PR}
/def -Fp2 -mregexp -t'(jasnobrazow[a-z]* ulistnion[a-z]* lodyg[a-z]*)' _ziolo_Nawloc = /substitute -p %{PL}%{P1} @{BCwhite}(Nawloc o glod+ pragnienie+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(dziwn[a-z]* zoltoszar[a-z]* nasion[a-z]*)' _ziolo_Kulczyba = /substitute -p %{PL}%{P1} @{BCwhite}(Kulczyba T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(rozdet[a-z]* aromatyczn[a-z]* lodyg[a-z]*)' _ziolo_Szczwol = /substitute -p %{PL}%{P1} @{BCwhite}(Szczwol T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(oliwkowozielon[a-z]* gietk[a-z]* galaz[a-z]*)' _ziolo_Jemiola = /substitute -p %{PL}%{P1} @{BCwhite}(Jemiola s- wt-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(ciemn[a-z]* splatan[a-z]* korzen[a-z]*)' _ziolo_Ciemiernik = /substitute -p %{PL}%{P1} @{BCwhite}(Ciemiernik T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(czarn[a-z]* blyszczac[a-z]* fasolk[a-z]*)' _ziolo_Bobotrutka = /substitute -p %{PL}%{P1} @{BCwhite}(Bobotrutka T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(ciemnozielon[a-z]* rozwart[a-z]* rozyczk[a-z]*)' _ziolo_Rojnik = /substitute -p %{PL}%{P1} @{BCwhite}(Rojnik mana-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(pierzast[a-z]* ogonk[a-z]* lisc[a-z]*)' _ziolo_Potoslin = /substitute -p %{PL}%{P1} @{BCwhite}(Potoslin T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(grub[a-z]* walcowat[a-z]* klacz[a-z]*)' _ziolo_Pokrzyk = /substitute -p %{PL}%{P1} @{BCwhite}(Pokrzyk T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(szaraw[a-z]* pogiet[a-z]* klacz[a-z]*)' _ziolo_Rauwolfia = /substitute -p %{PL}%{P1} @{BCwhite}(Rauwolfia kd+ T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(wiotk[a-z]* drobn[a-z]* lodyz[a-z]*)' _ziolo_Kurzyslad = /substitute -p %{PL}%{P1} @{BCwhite}(Kurzyslad spost-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(wzniesion[a-z]* ukwiecon[a-z]* lodyg[a-z]*)' _ziolo_Tojad = /substitute -p %{PL}%{P1} @{BCwhite}(Tojad kd+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(duz[a-z]* fioletow[a-z]* kwiat[a-z]*)' _ziolo_Ostrozeczka = /substitute -p %{PL}%{P1} @{BCwhite}(Ostrozeczka T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(rozgalezion[a-z]* owlosion[a-z]* lodyg[a-z]*)' _ziolo_Stroiczka = /substitute -p %{PL}%{P1} @{BCwhite}(Stroiczka T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zielon miesist[a-z]* kwiat[a-z]*)' _ziolo_Ciemiezyca = /substitute -p %{PL}%{P1} @{BCwhite}(Ciemiezyca zr- spost-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(wysok[a-z]* zolt[a-z]* kwiat[a-z]*)' _ziolo_Starzec = /substitute -p %{PL}%{P1} @{BCwhite}(Starzec kd+ T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(rozgalezion[a-z]* wzniesion[a-z]* lodyg[a-z]*)' _ziolo_Jaskier = /substitute -p %{PL}%{P1} @{BCwhite}(Jaskier T)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(niepozorn[a-z]* sinozielon[a-z]* roslin[a-z]*)' _ziolo_Urzet = /substitute -p %{PL}%{P1} @{BCwhite}(Urzet glod-)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(szarozielon[a-z]* szorstk[a-z]* lisc[a-z]*)' _ziolo_Boldoa = /substitute -p %{PL}%{P1} @{BCwhite}(Boldoa)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(rozwiniet[a-z]* korzen[a-z]*)' _ziolo_Marzanna = /substitute -p %{PL}%{P1} @{BCwhite}(Marzanna )@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zolt[a-z]* jaskraw[a-z]* kwiat[a-z]*)' _ziolo_Podbial = /substitute -p %{PL}%{P1} @{BCwhite}(Podbial)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(galezist[a-z]* sinozielon[a-z]* lodyg[a-z]*)' _ziolo_Ostrozen = /substitute -p %{PL}%{P1} @{BCwhite}(Ostrozen)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(szorstk[a-z]* ciemnozielon[a-z]* galaz[a-z]*)' _ziolo_Poziewnik = /substitute -p %{PL}%{P1} @{BCwhite}(Poziewnik)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(czarn[a-z]* niewielk[a-z]* owoc[a-z]*)' _ziolo_Sliwa = /substitute -p %{PL}%{P1} @{BCwhite}(Sliwa)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(czarn[a-z]* aromatyczn[a-z]* ziaren[a-z]*)' _ziolo_Bulawinka = /substitute -p %{PL}%{P1} @{BCwhite}(Bulawinka)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(wzniesion[a-z]* owlosion[a-z]* lodyg[a-z]*)' _ziolo_Kociomietka = /substitute -p %{PL}%{P1} @{BCwhite}(Kociomietka)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zielon[a-z]* trzeszczac[a-z]* galaz[a-z]*)' _ziolo_Skrzyp = /substitute -p %{PL}%{P1} @{BCwhite}(Skrzyp)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zlocist[a-z]* spor[a-z]* ziol[a-z]*)' _ziolo_Cebula = /substitute -p %{PL}%{P1} @{BCwhite}(Cebula)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zdretwial[a-z]* zwiniet[a-z]* rur[a-z]*)' _ziolo_Kruszyna = /substitute -p %{PL}%{P1} @{BCwhite}(Kruszyna glod+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(zielon[a-z]* kwitnac[a-z]* lodyg[a-z]*)' _ziolo_Hyzop = /substitute -p %{PL}%{P1} @{BCwhite}(Hyzop glod+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(sztywn[a-z]* rozgalezion[a-z]* korzen[a-z]*)' _ziolo_Lukrecja = /substitute -p %{PL}%{P1} @{BCwhite}(Lukrecja pragnienie+)@{n}%{P6}%{PR}
/def -Fp2 -mregexp -t'(kanciast[a-z]* parzac[a-z]* lodyg[a-z]*)' _ziolo_Pokrzywa = /substitute -p %{PL}%{P1} @{BCwhite}(Pokrzywa glod+ pragnienie+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(wiotk[a-z]* kwitnac[a-z]* galaz[a-z]*)' _ziolo_Janowiec = /substitute -p %{PL}%{P1} @{BCwhite}(Janowiec pragnienie+)@{n}%{P5}%{PR}
/def -Fp2 -mregexp -t'(czarn[a-z]* aromatyczn[a-z]* korzen[a-z]*)' _ziolo_Lubczyk = /substitute -p %{PL}%{P1} @{BCwhite}(Lubczyk glod+)@{n}%{P6}%{PR}

/def ziola = \
	/if ({*} =~ "lecznicze" ) \
		/echo -p #@{BC%kolor_info}#@{n}# Ziola %{*}:@{n} babka, mniszek, szafran, barwinek, nagietek, szczaw, lawenda, pierscieniak, szalwia, sercekapitana, rdest, mak, macznica, pieciornik, dziurawiec. %;\
	/elseif ({*} =~ "odtrutki") \
		/echo -p #@{BC%kolor_info}#@{n}# Ziola %{*}:@{n} ranog, plucnica, siezygron, centuria, rumianek, chaber, bez, krzyzownica, nawloc. %;\
	/elseif ({*} =~ "regenerujace" ) \
		/echo -p #@{BC%kolor_info}#@{n}# Ziola %{*}:@{n} melisa, naparstnica, nostrzyk, bylica, kasztanowiec, przelot, tojad. %;\
	/elseif ({*} =~ "uniwersalne" )\
		/echo -p #@{BC%kolor_info}#@{n}# Ziola %{*}:@{n} arnika, glog, mieta. %;\
	/elseif ({*} =~ "trujace" )\
		/echo -p #@{BC%kolor_info}#@{n}#Ziola %{*}:@{n} oset, bagiennik, grabiorog, pierscieniak, lulek, muchomor, sromotnik, szatan, stulicha, stroczek, szalej, kulczyba, szczwol, jemiola, ciemiernik, bobotrutka, rojnik, potoslin, pokrzyk, rauwolfia, kurzyslad, ostrozeczka, stroiczka, ciemiezyca, starzec, jaskier. %;\
	/elseif ({*} =~ "obojetne" )\
		/echo -p #@{BC%kolor_info}#@{n}#Ziola %{*}:@{n} roza, pierscieniak, borowka, jagoda, jezyna, malina, maslak, hubka, podgrzybek, poziomka, muchomorcesarski, borowikkroleski, borowik, drabik, kozlarz, trawa, urzet, blodoa, marzanna, podbial, ostrozen, %;\
		/echo -p #@{BC%kolor_info}#@{n}#            poziewnik, sliwa, bulawinka, kociomietka, skrzyp, cebula, kruszyna, hyzop, lukrecja, pokrzywa, janowiec, lubczyk. %;\
	 /elseif ({*} =~ "nietypowe" )\
		/echo -p #@{BC%kolor_info}#@{n}#Ziola %{*}:@{n} casur, drath, deliona, konopie, ogorecznik, bielun, deren, komosa, wrotycz, mandragora, aralia, kola, przesl, lulecznica, konwalia, lak. %;\
	/else \
		/echo -p #@{BC%kolor_info}#@{n}# Dostepne typy:@{n} lecznicze, odtrutki, regenerujace, uniwersalne, trujace, obojetne, nietypowe. %;\
	/endif

/def deliona = \
	/echo -p #@{BC%kolor_info}#@{n}# Deliona - @{BC%kolor_info}zolty jasny kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}zmeczenie

/def mieta = \
	/echo -p #@{BC%kolor_info}#@{n}# Mieta  - @{BC%kolor_info}okraglawy aromatyczny lisc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Rozetrzec - @{BC%kolor_info}kondycja, powachac - @{BC%kolor_info}zmeczenie, wetrzec - @{BC%kolor_info}kac

/def babka = \
	/echo -p #@{BC%kolor_info}#@{n}# Babka - @{BC%kolor_info}rozetkowaty lancetowaty lisc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przylozyc - @{BC%kolor_info}kondycja

/def mniszek = \
	/echo -p #@{BC%kolor_info}#@{n}# Mniszek - @{BC%kolor_info}zlocistozolty kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc/zjesc - @{BC%kolor_info}kondycja

/def szafran = \
	/echo -p #@{BC%kolor_info}#@{n}# Szafran - @{BC%kolor_info}jasnofioletowy delikatny kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}kondycja (ususzony), wytrzymalosc

/def szatan = \
	/echo -p #@{BC%kolor_info}#@{n}# Borowik Szatanski - @{BC%kolor_info}gruby szarawy grzyb%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def glog = \
	/echo -p #@{BC%kolor_info}#@{n}# Glog - @{BC%kolor_info}bialy maly kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przerzuc - @{BC%kolor_info}kondycja, zjesc - @{BC%kolor_info}zmeczenie

/def plucnica = \
	/echo -p #@{BC%kolor_info}#@{n}# Plucnica - @{BC%kolor_info}szarozielony gabczasty porost%;\
	/echo -p #@{BC%kolor_info}#@{n}# Rozetrzec - @{BC%kolor_info}odtrutka

/def muchomor = \
	/echo -p #@{BC%kolor_info}#@{n}# Muchomor Czerwony - @{BC%kolor_info}delikatny czerwony grzyb%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def oset = \
	/echo -p #@{BC%kolor_info}#@{n}# Oset - @{BC%kolor_info}kolczasta wysuszona roslina%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc/przerzuc - @{BC%kolor_info}oslabia kondycje

/def barwinek = \
	/echo -p #@{BC%kolor_info}#@{n}# Barwinek - @{BC%kolor_info}fioletowy lejkowaty kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przylozyc - @{BC%kolor_info}kondycja

/def nagietek = \
	/echo -p #@{BC%kolor_info}#@{n}# Nagietek - @{BC%kolor_info}jasnopomaranczowy kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przylozyc - @{BC%kolor_info}kondycja

/def szczaw = \
	/echo -p #@{BC%kolor_info}#@{n}# Szczaw - @{BC%kolor_info}strzalkowaty aromatyczny lisc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}kondycja

/def lawenda = \
	/echo -p #@{BC%kolor_info}#@{n}# Lawenda - @{BC%kolor_info}fioletowy zwarty kwiatostan%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przylozyc - @{BC%kolor_info}kondycjaZjesc - @{BC%kolor_info}odtrutka

/def szalwia = \
	/echo -p #@{BC%kolor_info}#@{n}# Szalwia Lekarska - @{BC%kolor_info}zaostrzony podluzny lisc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}kondycja

/def sercekapitana = \
	/echo -p #@{BC%kolor_info}#@{n}# Serce Kapitana - @{BC%kolor_info}maly czerwony kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}kondycja (UWAGA: oslabia inteligencje i zrecznosc)

/def melisa = \
	/echo -p #@{BC%kolor_info}#@{n}# Melisa Lekarska - @{BC%kolor_info}owlosiony aromatyczny lisc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc/przezuc - @{BC%kolor_info}kondycja, ususzona - @{BC%kolor_info}odtrutka

/def arnika = \
	/echo -p #@{BC%kolor_info}#@{n}# Arnika - @{BC%kolor_info}zlocistopomaranczowy duzy kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przylozyc - @{BC%kolor_info}kondycja, zjesc - @{BC%kolor_info}zmeczenie

/def ranog = \
	/echo -p #@{BC%kolor_info}#@{n}# Ranog - @{BC%kolor_info}zoltoszary niepozorny korzen%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}odtrutka, kondycja

/def siezygron = \
	/echo -p #@{BC%kolor_info}#@{n}# Siezygron - @{BC%kolor_info}duza granatowa jagoda%;\
	/echo -p #@{BC%kolor_info}#@{n}# Rozgryzc - @{BC%kolor_info}odtrutka

/def bagiennik = \
	/echo -p #@{BC%kolor_info}#@{n}# Bagiennik - @{BC%kolor_info}brudnobrazowa cuchnaca galazka%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}oslabia wytrzymalosc

/def grabiorog = \
	/echo -p #@{BC%kolor_info}#@{n}# Grabiorog - @{BC%kolor_info}brazowy fosforyzujacy mech%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}oslabia inteligencje i zrecznosc

/def pierscieniak = \
	/echo -p #@{BC%kolor_info}#@{n}# Pierscieniak - @{BC%kolor_info}jasnozielony, zielony, niebieski lub miedziany sluzowaty grzyb%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zielone i niebieskie @{nBC%kolor_alarm}TRUJA@{nC%kolor_info}Miedziany - @{BC%kolor_info}kondycja

/def lulek = \
	/echo -p #@{BC%kolor_info}#@{n}# Lulek Czarny - @{BC%kolor_info}brudnozolty fioletowo-zylkowany kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def sromotnik = \
	/echo -p #@{BC%kolor_info}#@{n}# Muchomor Sromotnikowy - @{BC%kolor_info}delikatny jasny grzyb%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def stulicha = \
	/echo -p #@{BC%kolor_info}#@{n}# Stulicha - @{BC%kolor_info}jaskrawozolty drobny kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def stroczek = \
	/echo -p #@{BC%kolor_info}#@{n}# Stroczek - @{BC%kolor_info}bialy zmutowany grzybek%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def szalej = \
	/echo -p #@{BC%kolor_info}#@{n}# Szalej - @{BC%kolor_info}pomaranczowy maly korzen%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def casur = \
	/echo -p #@{BC%kolor_info}#@{n}# Casur - @{BC%kolor_info}mazisty bulwiasty grzyb%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}sila

/def drath = \
	/echo -p #@{BC%kolor_info}#@{n}# Drath - @{BC%kolor_info}soczysty karminowy mech%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}wytrzymalosc

/def konopie = \
	/echo -p #@{BC%kolor_info}#@{n}# Konopie - @{BC%kolor_info}dluga lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# Ususzyc+spalic - @{BC%kolor_info}ochrona przed magia

/def ogorecznik = \
	/echo -p #@{BC%kolor_info}#@{n}# Ogorecznik - @{BC%kolor_info}eliptyczny zaostrzony lisc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}odwaga

/def roza = \
	/echo -p #@{BC%kolor_info}#@{n}# Roza - @{BC%kolor_info}rozwy pachnacy kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def borowka = \
	/echo -p #@{BC%kolor_info}#@{n}# Borowka - @{BC%kolor_info}twardy czerwony owoc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def jagoda = \
	/echo -p #@{BC%kolor_info}#@{n}# Jagoda - @{BC%kolor_info}maly fioletowy owoc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def jerzyna = \
	/echo -p #@{BC%kolor_info}#@{n}# Jerzyna - @{BC%kolor_info}maly czarny owoc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def malina = \
	/echo -p #@{BC%kolor_info}#@{n}# Malina - @{BC%kolor_info}maly czerwony owoc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def poziomka = \
	/echo -p #@{BC%kolor_info}#@{n}# Poziomka - @{BC%kolor_info}niewielki czerwony owoc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def maslak = \
	/echo -p #@{BC%kolor_info}#@{n}# Maslak Zwyczajny - @{BC%kolor_info}nieduzy brazowy grzyb%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def hubka = \
	/echo -p #@{BC%kolor_info}#@{n}# Hubka - @{BC%kolor_info}grzybi suchy kapelusz%;\
	/echo -p #@{BC%kolor_info}#@{n}# Rozpalka (+krzesiwo)

/def podgrzybek = \
	/echo -p #@{BC%kolor_info}#@{n}# Podgrzybek Brunatny - @{BC%kolor_info}sredni kasztanowobrazowy grzyb%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def muchomorcesarski = \
	/echo -p #@{BC%kolor_info}#@{n}# Muchomor Cesarski - @{BC%kolor_info}miedzianozielony fosforyzujacy grzyb%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def borowikkrolewski = \
	/echo -p #@{BC%kolor_info}#@{n}# Borowik Krolewski - @{BC%kolor_info}gruby brazowy grzyb%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def borowik = \
	/echo -p #@{BC%kolor_info}#@{n}# Borowik Szlachetny - @{BC%kolor_info}wysoki jasnobrazowy grzyb%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def drabik = \
	/echo -p #@{BC%kolor_info}#@{n}# Drabik Drzewikowaty - @{BC%kolor_info}zielone postrzepione galazki%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def kozlarz = \
	/echo -p #@{BC%kolor_info}#@{n}# Kozlarz Czerwony - @{BC%kolor_info}wysoki czerwonawy grzyb%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def trawa = \
	/echo -p #@{BC%kolor_info}#@{n}# Trawa - @{BC%kolor_info}zielone lancetowate liscie%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def rabarbar = \
	/echo -p #@{BC%kolor_info}#@{n}# Rabarbar - @{BC%kolor_info}czerwonawy duzy lisc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def centuria = \
	/echo -p #@{BC%kolor_info}#@{n}# Centuria - @{BC%kolor_info}smukla jasnozielona lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# Odtrutka

/def rdest = \
	/echo -p #@{BC%kolor_info}#@{n}# Rdest Ptasi - @{BC%kolor_info}zielony galezisty ped%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przylozyc - @{BC%kolor_info}kondycja, zjesc - @{BC%kolor_info}@{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def mak = \
	/echo -p #@{BC%kolor_info}#@{n}# Mak Polny - @{BC%kolor_info}okazaly pachnacy kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}kondycja, (meczy, oslabia zrecznosc)

/def macznica = \
	/echo -p #@{BC%kolor_info}#@{n}# Macznica - @{BC%kolor_info}zdrewniala rozgaleziona krzewinka%;\
	/echo -p #@{BC%kolor_info}#@{n}# Rozgryzc (ususzona) - @{BC%kolor_info}kondycja

/def pieciornik = \
	/echo -p #@{BC%kolor_info}#@{n}# Pieciornik - @{BC%kolor_info}ciemne poskrecane klacze%;\
	/echo -p #@{BC%kolor_info}#@{n}# Rozgryzc - @{BC%kolor_info}kondycja

/def dziurawiec = \
	/echo -p #@{BC%kolor_info}#@{n}# Dziurawiec - @{BC%kolor_info}czterokanciasta rozgaleziona lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# Rozgryzc - @{BC%kolor_info}kondycja

/def naparstnica = \
	/echo -p #@{BC%kolor_info}#@{n}# Naparstnica - @{BC%kolor_info}srebrzystoszary owlosiony lisc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}zmeczenie

/def nostrzyk = \
	/echo -p #@{BC%kolor_info}#@{n}# Nostrzyk - @{BC%kolor_info}smukla zielona lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}zmeczenie, zjesc - @{BC%kolor_info}glod, rozgryzc - @{BC%kolor_info}@{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def bylica = \
	/echo -p #@{BC%kolor_info}#@{n}# Bylica - @{BC%kolor_info}kanciasta rozgaleziona lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przylozyc - @{BC%kolor_info}zmeczenie, zjesc - @{BC%kolor_info}glod

/def kasztanowiec = \
	/echo -p #@{BC%kolor_info}#@{n}# Kasztanowiec - @{BC%kolor_info}kosmatoowlosiony kwiatostan%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}zmeczenie

/def przelot = \
	/echo -p #@{BC%kolor_info}#@{n}# Przelot - @{BC%kolor_info}kremowy owlosiony kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Ususzyc/sproszkowac - @{BC%kolor_info}zmeczenie (meczy mentalnie)

/def bielun = \
	/echo -p #@{BC%kolor_info}#@{n}# Bielun - @{BC%kolor_info}duzy bialy kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Powachac - @{BC%kolor_info}wytrzymalosc, zjesc - @{BC%kolor_info}@{nBC%kolor_alarm}TRUJE@{nC%kolor_info}(anty: plucnica)

/def deren = \
	/echo -p #@{BC%kolor_info}#@{n}# Deren - @{BC%kolor_info}lsniacy czerwony owoc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}wytrzymalosc (wzmaga pragnienie)

/def komosa = \
	/echo -p #@{BC%kolor_info}#@{n}# Komosa  - @{BC%kolor_info}macznistoowlosiona szarawa roslina%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}zmeczenie, wytrzymalosc, zjesc - @{BC%kolor_info}sila

/def wrotycz = \
	/echo -p #@{BC%kolor_info}#@{n}# Wrotycz - @{BC%kolor_info}zolty rurkowaty kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Powachac - @{BC%kolor_info}odtrutka

/def mandragora = \
	/echo -p #@{BC%kolor_info}#@{n}# Mandragora - @{BC%kolor_info}bialy rozgaleziony korzen%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}mana, rozgryzc - @{BC%kolor_info}odtrutka

/def aralia = \
	/echo -p #@{BC%kolor_info}#@{n}# Aralia  - @{BC%kolor_info}szary kolczasty korzen%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zmeczenie, odtrutka

/def kola = \
	/echo -p #@{BC%kolor_info}#@{n}# Kola - @{BC%kolor_info}brazowe okragle nasinko%;\
	/echo -p #@{BC%kolor_info}#@{n}# Rozgryzc - @{BC%kolor_info}wytrzymalosc, zmeczenie, glod, zjesc - @{BC%kolor_info}oslabia zrecznosc

/def przesl = \
	/echo -p #@{BC%kolor_info}#@{n}# Przesl - @{BC%kolor_info}rozgowata zoltozielona galazka%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}wytrzymalosc

/def lulecznica = \
	/echo -p #@{BC%kolor_info}#@{n}# Lulecznica - @{BC%kolor_info}jasnozielona nieowlosiona lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przylozyc - @{BC%kolor_info}zmeczenie

/def konwalia = \
	/echo -p #@{BC%kolor_info}#@{n}# Konwalia - @{BC%kolor_info}wonny dzwonkowaty kwiatek%;\
	/echo -p #@{BC%kolor_info}#@{n}# Powachac - @{BC%kolor_info}zmeczenie, zjesc - @{BC%kolor_info}@{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def lak = \
	/echo -p #@{BC%kolor_info}#@{n}# Lak - @{BC%kolor_info}sztywna smukla lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}zmeczenie, Rozgryzc - @{BC%kolor_info}wytrzymalosc

/def rumianek = \
	/echo -p #@{BC%kolor_info}#@{n}# Rumianek - @{BC%kolor_info}drobny bialy kwiatek%;\
	/echo -p #@{BC%kolor_info}#@{n}# Powachac - @{BC%kolor_info}odtrutka, zjesc - @{BC%kolor_info}glod

/def chaber = \
	/echo -p #@{BC%kolor_info}#@{n}# Chaber - @{BC%kolor_info}wysoki blekitny kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przerzuc/powachac - @{BC%kolor_info}odtrutka, zjesc - @{BC%kolor_info}zwieksza glod

/def bez = \
	/echo -p #@{BC%kolor_info}#@{n}# Bez Czarny - @{BC%kolor_info}jasnobrunatna popekana galazka%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}odtrutka

/def krzyzownica= \
	/echo -p #@{BC%kolor_info}#@{n}# Krzyzownica - @{BC%kolor_info}zoltawy powyginany korzen%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}odtrutka

/def nawloc = \
	/echo -p #@{BC%kolor_info}#@{n}# Nawloc, - @{BC%kolor_info}jasnobrazowa ulistniona lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# Rozgryzc - @{BC%kolor_info}odtrutka (zwieksza glod i pragnienie)

/def kulczyba = \
	/echo -p #@{BC%kolor_info}#@{n}# Kulczyba - @{BC%kolor_info}dziwne zoltoszare nasinko%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info} (?)

/def szczwol = \
	/echo -p #@{BC%kolor_info}#@{n}# Szczwol - @{BC%kolor_info}rozdeta aromatyczna lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info} (?)

/def jemiola = \
	/echo -p #@{BC%kolor_info}#@{n}# Jemiola - @{BC%kolor_info}oliwkowozielona gietka galazka%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}oslabia sile i wytrzymalosc

/def ciemiernik = \
	/echo -p #@{BC%kolor_info}#@{n}# Ciemiernik - @{BC%kolor_info}ciemny splatany korzen%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info} (?)

/def bobotrutka = \
	/echo -p #@{BC%kolor_info}#@{n}# Bobotrutka - @{BC%kolor_info}czarna blyszczaca fasolka%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info} (?)

/def rojnik = \
	/echo -p #@{BC%kolor_info}#@{n}# Rojnik - @{BC%kolor_info}ciemnozielona rozwarta rozyczka%;\
	/echo -p #@{BC%kolor_info}#@{n}# Oslabia mane

/def potoslin = \
	/echo -p #@{BC%kolor_info}#@{n}# Potoslin - @{BC%kolor_info}pierzasty ogonkowy lisc%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def pokrzyk = \
	/echo -p #@{BC%kolor_info}#@{n}# Pokrzyk - @{BC%kolor_info}grube walcowate klacze%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def Rauwolfia = \
	/echo -p #@{BC%kolor_info}#@{n}# Rauwolfia - @{BC%kolor_info}szarawe pogiete klacze%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}kondycja, zjesc - @{BC%kolor_info}@{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def kurzyslad = \
	/echo -p #@{BC%kolor_info}#@{n}# Kurzyslad - @{BC%kolor_info}wiotka drobna lodyzka%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}zmiejsza spostrzegawczosc

/def tojad = \
	/echo -p #@{BC%kolor_info}#@{n}# Tojad - @{BC%kolor_info}wzniesiona ukwiecona lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}kondycja

/def ostrozeczka = \
	/echo -p #@{BC%kolor_info}#@{n}# Ostrozeczka - @{BC%kolor_info}duzy fioletowy kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info} (?)

/def stroiczka = \
	/echo -p #@{BC%kolor_info}#@{n}# Stroiczka - @{BC%kolor_info}rozgaleziona owlosiona lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# @{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def ciemiezyca = \
	/echo -p #@{BC%kolor_info}#@{n}# Ciemiezyca - @{BC%kolor_info}zielony miesisty kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}zmiejsza spostrzegawczosc, oslabia zrecznosc

/def starzec = \
	/echo -p #@{BC%kolor_info}#@{n}# Starzec - @{BC%kolor_info}wysoki zolty kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Sproszkowac - @{BC%kolor_info}kondycja, zjesc - @{BC%kolor_info}@{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def jaskier  = \
	/echo -p #@{BC%kolor_info}#@{n}# Jaskier - @{BC%kolor_info}rozgaleziona wzniesiona lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}@{nBC%kolor_alarm}TRUJE@{nC%kolor_info}

/def urzet = \
	/echo -p #@{BC%kolor_info}#@{n}# Urzet - @{BC%kolor_info}niepozorna sinozielona roslinka%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}glod

/def boldoa = \
	/echo -p #@{BC%kolor_info}#@{n}# Boldoa - @{BC%kolor_info}szarozielony szorstki lisc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efetku

/def marzanna = \
	/echo -p #@{BC%kolor_info}#@{n}# Marzanna  - @{BC%kolor_info}rozwiniete klacze%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def podbial = \
	/echo -p #@{BC%kolor_info}#@{n}# Podbial - @{BC%kolor_info}zolty jaskrawy kwiat%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def ostrozen = \
	/echo -p #@{BC%kolor_info}#@{n}# Ostrozen - @{BC%kolor_info}galezista sinozielona lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def poziewnik = \
	/echo -p #@{BC%kolor_info}#@{n}# Poziewnik - @{BC%kolor_info}szorstka ciemnozielona galazka%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def sliwa = \
	/echo -p #@{BC%kolor_info}#@{n}# Sliwa - @{BC%kolor_info}czarny niewielki owoc%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def bulawinka = \
	/echo -p #@{BC%kolor_info}#@{n}# Bulawinka - @{BC%kolor_info}czarne aromatyczne ziarenko%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def kociomietka = \
	/echo -p #@{BC%kolor_info}#@{n}# Kociomietka - @{BC%kolor_info}wzniesiona owlosiona lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def skrzyp = \
	/echo -p #@{BC%kolor_info}#@{n}# Skrzyp - @{BC%kolor_info}zielona trzeszczaca galazka%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def cebula = \
	/echo -p #@{BC%kolor_info}#@{n}# Cebula - @{BC%kolor_info}zlociste spore ziolo%;\
	/echo -p #@{BC%kolor_info}#@{n}# Bez efektu

/def kruszyna = \
	/echo -p #@{BC%kolor_info}#@{n}# Kruszyna - @{BC%kolor_info}zdrewniala zwinieta rurka%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}wzmaga glod

/def hyzop = \
	/echo -p #@{BC%kolor_info}#@{n}# Hyzop - @{BC%kolor_info}zielona kwitnaca lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}wzmaga glod

/def lukrecja = \
	/echo -p #@{BC%kolor_info}#@{n}# Lukrecja - @{BC%kolor_info}sztywny rozgaleziony korzen%;\
	/echo -p #@{BC%kolor_info}#@{n}# Przezuc - @{BC%kolor_info}zwieksza pragnienie

/def pokrzywa = \
	/echo -p #@{BC%kolor_info}#@{n}# Pokrzywa - @{BC%kolor_info}kanciasta parzaca lodyga%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}zwieksza glod i pragnienie

/def janowiec = \
	/echo -p #@{BC%kolor_info}#@{n}# Janowiec - @{BC%kolor_info}wiotka kwitnaca galazka%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}zwieksza pragnienie

/def lubczyk = \
	/echo -p #@{BC%kolor_info}#@{n}# Lubczyk - @{BC%kolor_info}czarny aromatyczny korzen%;\
	/echo -p #@{BC%kolor_info}#@{n}# Zjesc - @{BC%kolor_info}zwieksza glod
