    /set hitlocs=(cialo|ogonek|prawe ramie|lewe ramie|pokryty twarda skora tulow|twarda glowe|kosmaty tulow|luskowate cialo|szponiaste rece|kosciane nogi|oslizgle cialo|lewa reke|prawa reke|lewa noge|prawa noge|glowe|korpus|nogi|tulow|leb|kudlate cialo|kamienna reke|jedna z lian|okolice korzeni|tors|lepek|kudlate cielsko|prawa lape|lewa lape|metalowy korpus|pobruzdzona glowe|cienki szczekoczulek|kamienny korpus|plamiasta glowe|umiesnione prawe ramie|umiesnione lewe ramie|pysk|widmowe nogi|kudlate cialo)

/def _psnr = \
/return substitute(strcat(decode_attr(strcat("@{BCgreen}>> ", {1}, {2}, " @{BCgreen}SPEC@{BCwhite} ", {3}, " @{BCgreen}<< ")), {PL}, {P0}, {PR}))

/def _specuj = \
  /let _spec_skrot=%{1}%;\
  /let _spec_kolor=%{2}%;\
  /let _spec_kto=%{3}%;\
  /let _spec_kogo=%{4}%;\
  /let _spec_ile=%{5}%;\
  /let _spec_na_ile=%{6}%;\
  /let _spec_co_robi=$[{_spec_ile}!="0" ? "specuje" : "probuje specowac"]%;\
    /if (regmatch(strcat("(", {druzyna-druzyna}, "|", {ogolne_leader-leader}, ")"), {_spec_kogo})) \
        /test _zaslony_set({_spec_kto}, toupper({_spec_kogo}, 1)) %;\
    /endif%; \
;  /let _spec_koment=$[strlen({7})>0 ? strcat(" (",{7},")") : ""]%;\
  /return substitute(strcat(decode_attr(strcat("@{BCwhite}-------> ",{_spec_kolor},"[",{_spec_skrot}," ",{_spec_ile},"/",{_spec_na_ile},"] @{Cyellow}",{_spec_kto}," @{BCwhite}",{_spec_co_robi}," @{Cblue}",{_spec_kogo},"@{Cwhite}",{_spec_koment},"."))))

#     ---> WYRÓŻNIKI RÓŻNYCH STOWARZYSZEŃ <---
/def -mregexp -F -t'.*nosi piekna (zlota|srebrna|miedziana) obrecz( wysadzana (krwawymi rubinami|kosztownymi kamieniami)|)' _wyroznik_stowarzyszenia_OK = /echo -p @{Cbgblue}@{BCwhite}...:: OGR Z OGRZEJ KOMPANII ::...@{n}
/def -mglob -F -t'*szyi, na skorzanym rzemieniu wisi*' _wyroznik_stowarzyszenia_LE = /echo -p @{Cbgblue}@{BCwhite}...:: LESNY ELF ::...@{n}
/def -mregexp -F -t'Nosi (.*) kubraczek, tradycyjny stroj Elfow z Gor Sinych.' _wyroznik_stowarzyszenia_SE = /echo -p @{Cbgblue}@{BCwhite}...:: SINY ELF ::...@{n}

/def -mglob -F -t'*Wzor i kolor kiltu swiadcza o przynaleznosci do Krasnoludow z Gor Kranca Swiata*' _wyroznik_stowarzyszenia_KGKS = /echo -p @{Cbgblue}@{BCwhite}...:: KRASNOLUD GKS ::...@{n}
/def -mglob -F -t'*welniany krasnoludzki kilt*' _wyroznik_stowarzyszenia_KGKS2 = /echo -p @{Cbgblue}@{BCwhite}...:: KRASNOLUD GKS (Bezdomny) ::...@{n}
/def -mregexp -F -t'Klamre (jego|jej) pasa zdobi herb klanu.*' _wyroznik_stowarzyszenia_KM = /echo -p @{Cbgblue}@{BCwhite}...:: KRASNOLUD MAHAKAMU ::...@{n}
/def -mglob -F -t'*oznaka przynaleznosci do Cechu Kupcow Novigradzkich*' _wyroznik_stowarzyszenia_CKN = /echo -p @{Cbgblue}@{BCwhite}...:: KUPIEC NOVIGRADZKI ::...@{n}
/def -mglob -F -t'*jest oznaka przynaleznosci do grona pracownikow najemnych Cechu Kupcow Novigradzkich.' _wyroznik_stowarzyszenia_PHCKN = /echo -p @{Cbgblue}@{BCwhite}...:: PARTNER HANDLOWY CKN ::...@{n}
/def -mglob -F -t'*zamek ze znakiem Stowarzyszenia Gnomich Wynalazcow*' _wyroznik_stowarzyszenia_SGW = /echo -p @{Cbgblue}@{BCwhite}...:: GNOM Z SGW ::...@{n}
/def -mglob -F -t'*ryngraf, na ktorym wyryto*Skorpion*' _wyroznik_stowarzyszenia_WKS = /echo -p @{Cbgblue}@{BCwhite}...:: KOMPANIA SKORPION ::...@{n}
/def -mregexp -F -t'.* skory oznaczajaca (jego|jej) przynaleznosc do osadnikow.*' _wyroznik_stowarzyszenia_Osadnicy = /echo -p @{Cbgblue}@{BCwhite}...:: OSADNIK ::...@{n}
/def -mregexp -F -t'Nosi wiewiorczy ogon (.*) swiadczacy (.*)' _wyroznik_stowarzyszenia_SC = /echo -p @{Cbgblue}@{BCwhite}...:: WIEWIORA ::...@{n}
/def -mglob -F -t'*Przez srodek jego glowy przebiega czub*' _wyroznik_stowarzyszenia_ZT = /echo -p @{Cbgblue}@{BCwhite}...:: ZABOJCA TROLLI ::...@{n}
/def -mglob -F -t'*charakterystyczna dla Stowarzyszenia Polelfow*' _wyroznik_stowarzyszenia_Polelfy = /echo -p @{Cbgblue}@{BCwhite}...::  POLELF/KA ::...@{n}
/def -mregexp -F -t'Przy pasie nosi.*zacieznej piechoty z Ochotniczego Hufca Mahakamu\.' _wyroznik_stowarzyszenia_OHM = /echo -p @{Cbgblue,BCwhite}...:: OHM ::...@{n}
/def -mregexp -F -t'zawiazana .* ze znakiem czarnego gryfa.' _wyroznik_stowarzyszenia_KG = /echo -p @{Cbgblue,BCwhite}...:: NAJEMNIK KG::...
/def -F -mregexp -t'(^Twarz [^ ]+ pocieta jest .* wojownik)' _wyroznik_stowarzyszenia_GL = /echo -p @{Cbgblue,BCwhite}...:: GLADIATOR ::...
/def -F -mregexp -t'(^Jest (kadetem|uczniem|pomocnikiem|mistrzem|gladiatorem) ((|z(|e) )Szkoly [wW]alki von Raugen|(|z )Nulnijskiej Szkoly Gladiatorow))' _wyroznik_stowarzyszenia_GL2 = /echo -p @{Cbgblue,BCwhite}...:: GLADIATOR ::...
/def -F -mregexp -t'nieustepliwe niczym skelliganskie sztormy spojrzenie i twarz wysmagana lodowatymi wichrami swiadcza o tym, ze masz przed soba' _wyroznik_stowarzyszenia_Korsarze = /echo -p @{Cbgblue,BCwhite}...:: KORSARZ ::...



#      #####  ###   ####   ####   ####                                                                                     
#     ##      #  #  #     ##  ##  #                                                                                           
#      ####   ###   ###   #       ###                                                                                         
#         ##  #     #     ##  ##  #                                                                                           
#     #####   #     ####   ####   ####         

#######################################################################################################################################################

; Zbója spec
; Aktualizacja: 01.09.12
/set _spec_kolor_zboja=@{Cmagenta}

/def -p200 -mregexp -t'Szybkim skretem ciala (.*) unika silnego ciosu ([^ ]+ [^ ]+ [^ ]+) (.*).' _zboja_spec_0 = \
  /substitute -p @{BCwhite}-------> @{Cmagenta}[ZBOJ 0/6] @{Cblue}%{P1} @{BCwhite}unika specaa @{Cyellow}%{P2}@{Cwhite}.
/def -p200 -mregexp -t' slamazarnym uderzeniem (.*) trafia (.*) w (.*), gdzie robi sie calkiem sporych rozmiarow siniak.' _zboja_spec_1 = \
  /return (_specuj("ZBOJ",{_spec_kolor_zboja}, {PL}, {P2}, "1", "6",{P3}))
/def -p200 -mregexp -t' wolnym uderzeniem (.*) trafia (.*) w (.*), gdzie pojawia sie rozlegly krwiak.' _zboja_spec_2 = \
  /return (_specuj("ZBOJ",{_spec_kolor_zboja}, {PL}, {P2}, "2", "6",{P3}))
/def -p200 -mregexp -t' szybkim uderzeniem (.*) trafia (.*) w (.*), gdzie pojawiaja sie duze krwistoczerwone obrzeki.' _zboja_spec_3 = \
  /return (_specuj("ZBOJ",{_spec_kolor_zboja}, {PL}, {P2}, "3", "6",{P3}))
/def -p200 -mregexp -t' bardzo szybkim uderzeniem (.*) trafia (.*) w (.*). W miejscu trafienia otwiera sie duza rana, zas sam przeciwnik zostaje odrzucony do tylu.' _zboja_spec_4 = \
  /return (_specuj("ZBOJ",{_spec_kolor_zboja}, {PL}, {P2}, "4", "6",{P3}))
/def -p200 -mregexp -t' blyskawicznym uderzeniem (.*) trafia (.*) w (.*). Slychac odglos pekajacych kosci, zas sam przeciwnik zostaje odrzucony daleko do tylu.' _zboja_spec_5 = \
  /return (_specuj("ZBOJ",{_spec_kolor_zboja}, {PL}, {P2}, "5", "6",{P3}))
/eval /def -p200 -mregexp -t'Odglosy walki zaglusza przerazliwy chrzest miazdzonych kosci gdy (.*) uderza w (%{hitlocs}) (.*), ([^ ]+) bez zycia pada na ziemie.' _zboja_spec_6 = \
  /substitute -p @{BCwhite}-------> @{Cmagenta}[ZBOJ 6/6]@{Cwhite} dobicie @{Cblue}%%{P3}@{Cwhite} (%%{P2}).

/def -p200 -mregexp -t' bierze szeroki zamach (.*) i probuje walnac (.*) na odlew. Przeciwnik jednak w pore unika nadchodzacego ciosu.' _zboja_ogluszenie_0 = \
  /return (_specuj("OGLUSZENIE",{_spec_kolor_zboja}, {PL}, {P2}, "0", "2","unik"))
/def -p200 -mregexp -t' bierze szeroki zamach (.*) i probuje walnac (.*) na odlew. Przeciwnik jednak w pore oslania sie (.*).' _zboja_ogluszenie_0_v2 = \
  /return (_specuj("OGLUSZENIE",{_spec_kolor_zboja}, {PL}, {P2}, "0", "2","zbite"))
/def -p200 -mregexp -t' bierze szeroki zamach (.*) i wali (.*) na odlew. Blyskawiczna poprawka w postaci poteznego uderzenia znad glowy jakims cudem chybia i dogodny moment nie zostaje jednak wykorzystany.' _zboja_ogluszenie_0_v3 = \
  /return (_specuj("OGLUSZENIE",{_spec_kolor_zboja}, {PL}, {P2}, "0", "2","pudlo"))

/def -p200 -mregexp -t' bierze szeroki zamach (.*) i wali (.*) na odlew. (Ten cios przeciwnik jest jeszcze w stanie ustac, lecz po natychmiastowej poprawce w postaci poteznego uderzenia znad glowy wyraznie zaczyna slaniac sie na nogach.|Nim jestes w stanie zareagowac unosi bron nad glowe i poprawia kolejnym poteznym uderzeniem. Az robi ci sie ciemno przed oczami...)' _zboja_ogluszenie_1 = \
  /return (_specuj("OGLUSZENIE",{_spec_kolor_zboja}, {PL}, {P2}, "1", "2"))
/def -p200 -mregexp -t' bierze szeroki zamach (.*) i wali (.*) na odlew. Ten cios przeciwnik jest jeszcze w stanie strzymac, lecz po natychmiastowej poprawce w postaci poteznego uderzenia znad glowy wyraznie wyglada na zamroczonego.' _zboja_ogluszenie_1_v2 = \
  /return (_specuj("OGLUSZENIE",{_spec_kolor_zboja}, {PL}, {P2}, "1", "2"))

/def -p200 -mregexp -t' bierze szeroki zamach (.*) i wali (.*) na odlew. Juz unosi bron, by poprawic kolejnym uderzeniem znad glowy, gdy chyba dociera do niego, ze nie ma juz takiej potrzeby...' _zboja_ogluszenie_3 = \
  /return (_specuj("OGLUSZENIE",{_spec_kolor_zboja}, {PL}, {P2}, "2", "2"))


#######################################################################################################################################################


; GP Spec
; Aktualizacja: 01.09.12
; Ktoś kogoś
/set _spec_kolor_gp=@{Cmagenta}

/def -p200 -mregexp -t'Wykorzystujac dogodny moment (.*) probuje wyprowadzic celne (ciecie|pchniecie|uderzenie) (.*) w (.*), lecz pudluje przy tym haniebnie\.' _gp_spec_pudlo = \
  /return (_specuj("GP",{_spec_kolor_gp}, {P1}, {P4}, "0", "6", "pudlo"))
/def -p200 -mregexp -t'Wykorzystujac dogodny moment (.*) probuje wyprowadzic celne (ciecie|pchniecie|uderzenie) (.*) w (.*), lecz [^ ]+ zwinnie unika ciosu\.' _gp_spec_unik = \
  /return (_specuj("GP",{_spec_kolor_gp}, {P1}, {P4}, "0", "6", "unik"))
/def -p200 -mregexp -t'Wykorzystujac dogodny moment (.*) wyprowadza celne (ciecie|pchniecie|uderzenie) (.*) w (.*), lecz [^ ]+ zbija cios (.*)\.' _gp_spec_zbity = \
  /return (_specuj("GP",{_spec_kolor_gp}, {P1}, {P4}, "0", "6", "bron"))
/def -p200 -mregexp -t'Wykorzystujac dogodny moment (.*) wyprowadza celne (ciecie|pchniecie|uderzenie) (.*) w (.*), lecz [^ ]+ oslania sie w pore (.*)\.' _gp_spec_tarcza = \
  /return (_specuj("GP",{_spec_kolor_gp}, {P1}, {P4}, "0", "6", "tarcza"))
/def -p200 -mregexp -t'Wykorzystujac dogodny moment (.*) wyprowadza celne (ciecie|pchniecie|uderzenie) (.*) w (.*), ledwo muskajac [^ ]+ w (.*)\.' _gp_spec_1 = \
  /return (_specuj("GP",{_spec_kolor_gp}, {P1}, {P4}, "1", "6",{P5}))
/def -p200 -mregexp -t'Wykorzystujac dogodny moment (.*) wyprowadza celne (ciecie|pchniecie|uderzenie) (.*) w (.*), lekko raniac [^ ]+ w (.*)\.' _gp_spec_2 = \
  /return (_specuj("GP",{_spec_kolor_gp}, {P1}, {P4}, "2", "6",{P5}))
/def -p200 -mregexp -t'Wykorzystujac dogodny moment (.*) wyprowadza celne (ciecie|pchniecie|uderzenie) (.*) w (.*), raniac [^ ]+ w (.*)\.' _gp_spec_3 = \
  /return (_specuj("GP",{_spec_kolor_gp}, {P1}, {P4}, "3", "6",{P5}))
/def -p200 -mregexp -t'Wykorzystujac dogodny moment (.*) wyprowadza celne (ciecie|pchniecie|uderzenie) (.*) w (.*), powaznie raniac [^ ]+ w (.*)\.' _gp_spec_4 = \
  /return (_specuj("GP",{_spec_kolor_gp}, {P1}, {P4}, "4", "6",{P5}))
/def -p200 -mregexp -t'Wykorzystujac dogodny moment (.*) wyprowadza celne (ciecie|pchniecie|uderzenie) (.*) w (.*), bardzo ciezko raniac [^ ]+ w (.*)\.' _gp_spec_5 = \
  /return (_specuj("GP",{_spec_kolor_gp}, {P1}, {P4}, "5", "6",{P5}))
/def -p200 -mregexp -t'Wykorzystujac dogodny moment (.*) wyprowadza celne (ciecie|pchniecie|uderzenie) (.*) w (.*), masakrujac [^ ]+ w (.*)\.' _gp_spec_6 = \
  /return (_specuj("GP",{_spec_kolor_gp}, {P1}, {P4}, "6", "6",{P5}))
  
; Aktualzacja: 27.03.12
; Ja kogoś
/def -p200 -mregexp -t'Wykorzystujac dogodny moment probujesz wyprowadzic celne (ciecie|pchniecie|uderzenie) (.*) w (.*), lecz pudlujesz przy tym haniebnie\.' _gp_spec_ja_pudlo = /substitute -p @{BCwhite}----> @{Cmagenta}[GP 0/6] @{BCwhite}probuje specowac @{Cblue}%{P3} @{Cwhite}(pudlo).
/def -p200 -mregexp -t'Wykorzystujac dogodny moment probujesz wyprowadzic celne (ciecie|pchniecie|uderzenie) (.*) w (.*), lecz [^ ]+ zwinnie unika ciosu\.' _gp_spec_ja_unik = /substitute -p @{BCwhite}----> @{Cmagenta}[GP 0/6] @{BCwhite}probuje specowac @{Cblue}%{P3} @{Cwhite}(unik).
/def -p200 -mregexp -t'Wykorzystujac dogodny moment wyprowadzasz celne (ciecie|pchniecie|uderzenie) (.*) w (.*), lecz [^ ]+ zbija cios (.*)\.' _gp_spec_ja_zbity = /substitute -p @{BCwhite}----> @{Cmagenta}[GP 0/6] @{BCwhite}probuje specowac @{Cblue}%{P3} @{Cwhite}(bron).
/def -p200 -mregexp -t'Wykorzystujac dogodny moment wyprowadzasz celne (ciecie|pchniecie|uderzenie) (.*) w (.*), lecz [^ ]+ oslania sie w pore (.*)\.' _gp_spec_ja_tarcza = /substitute -p @{BCwhite}----> @{Cmagenta}[GP 0/6] @{BCwhite}probuje specowac @{Cblue}%{P3} @{Cwhite}(tarcza).
/def -p200 -mregexp -t'Wykorzystujac dogodny moment wyprowadzasz celne (ciecie|pchniecie|uderzenie) (.*) w (.*), ledwo muskajac [^ ]+ w (.*)\.' _gp_spec_ja_1 = /substitute -p @{BCwhite}----> @{Cmagenta}[GP 1/6] @{BCwhite}specuje @{Cblue}%{P3} @{Cwhite}(%{P4}).
/def -p200 -mregexp -t'Wykorzystujac dogodny moment wyprowadzasz celne (ciecie|pchniecie|uderzenie) (.*) w (.*), lekko raniac [^ ]+ w (.*)\.' _gp_spec_ja_2 = /substitute -p @{BCwhite}----> @{Cmagenta}[GP 2/6] @{BCwhite}specuje @{Cblue}%{P3} @{Cwhite}(%{P4}).
/def -p200 -mregexp -t'Wykorzystujac dogodny moment wyprowadzasz celne (ciecie|pchniecie|uderzenie) (.*) w (.*), raniac [^ ]+ w (.*)\.' _gp_spec_ja_3 = /substitute -p @{BCwhite}----> @{Cmagenta}[GP 3/6] @{BCwhite}specuje @{Cblue}%{P3} @{Cwhite}(%{P4}).
/def -p200 -mregexp -t'Wykorzystujac dogodny moment wyprowadzasz celne (ciecie|pchniecie|uderzenie) (.*) w (.*), powaznie raniac [^ ]+ w (.*)\.' _gp_spec_ja_4 = /substitute -p @{BCwhite}----> @{Cmagenta}[GP 4/6] @{BCwhite}specuje @{Cblue}%{P3} @{Cwhite}(%{P4}).
/def -p200 -mregexp -t'Wykorzystujac dogodny moment wyprowadzasz celne (ciecie|pchniecie|uderzenie) (.*) w (.*), bardzo ciezko raniac [^ ]+ w (.*)\.' _gp_spec_ja_5 = /substitute -p @{BCwhite}----> @{Cmagenta}[GP 5/6] @{BCwhite}specuje @{Cblue}%{P3} @{Cwhite}(%{P4}).
/def -p200 -mregexp -t'Wykorzystujac dogodny moment wyprowadzasz celne (ciecie|pchniecie|uderzenie) (.*) w (.*), masakrujac [^ ]+ w (.*)\.' _gp_spec_ja_6 = /substitute -p @{BCwhite}----> @{Cmagenta}[GP 6/6] @{BCwhite}specuje @{Cblue}%{P3} @{Cwhite}(%{P4}).

#######################################################################################################################################################

; Moje GladoSpece - 'mierzony cios'
; Aktualizacja: 01.03.11
; Ja kogoś (gdy mam topór jednoręczny i tarczę)
/def -Fp100 -mregexp -t'Parujesz cios (.*) [^ ]+ [^ ]+ tarcza i uderzasz [^ ]+ (.*) lecz nie trafiasz.' moj_glspec_0 = /substitute -p @{BCwhite}----> @{Cblue}[GL 0/11] @{Cwhite}probuje specowac @{Cblue}%{P1}@{CWhite}.
/def -Fp100 -mregexp -t'Parujesz cios (.*) [^ ]+ [^ ]+ tarcza i odpowiadasz nan szybkim ciosem (.*) w (.*), zadajac nieznaczne obrazenia.' moj_glspec_1 = /substitute -p @{BCwhite}----> @{Cblue}[GL 1/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P3}).
/def -Fp100 -mregexp -t'Odpychasz (.*) [^ ]+ [^ ]+ tarcza i lekko kaleczysz [^ ]+ ciosem (.*) w (.*).' moj_glspec_2 = /substitute -p @{BCwhite}----> @{Cblue}[GL 2/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P3}).
/def -Fp100 -mregexp -t'Ciosem (.*) w (.*) zadajesz (.*) (nieduza rane|nieduze obrazenia) i uderzeniem (.*) odpychasz w tyl.' moj_glspec_3 = /substitute -p @{BCwhite}----> @{Cblue}[GL 3/11] @{Cwhite}specuje @{Cblue}%{P3}@{CWhite} (%{P2}).
/def -Fp100 -mregexp -t'Sprawnie parujesz atak (.*) [^ ]+ [^ ]+ tarcza i ranisz [^ ]+ celna kontra ciosu (.*) w (.*).' moj_glspec_4 = /substitute -p @{BCwhite}----> @{Cblue}[GL 4/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P3}).
/def -Fp100 -mregexp -t'Mocnym uderzeniem [^ ]+ [^ ]+ tarczy oszalamiasz (.*) i ciosem (.*) zadajesz [^ ]+ (krwista rane|znaczne obrazenia)(, raniac (.*)| w (.*)).' moj_glspec_5 = /substitute -p @{BCwhite}----> @{Cblue}[GL 5/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P5}%{P6}).
/def -Fp100 -mregexp -t'Nurkujac pod atakiem (.*) mocno ranisz [^ ]+ ciosem [^ ]+ [^ ]+ tarczy i zaraz po tym kaleczysz uderzeniem (.*) w (.*).' moj_glspec_6 = /substitute -p @{BCwhite}----> @{Cblue}[GL 6/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P3}).
/def -Fp100 -mregexp -t'Zatrzymujesz atak (.*) pewnym blokiem [^ ]+ [^ ]+ tarczy i poteznym ciosem (.*) powaznie ranisz [^ ]+ (.*).' moj_glspec_7 = /substitute -p @{BCwhite}----> @{Cblue}[GL 7/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P3}).
/eval /def -Fp100 -mregexp -t'Kilkakrotnie tluczesz w %{hitlocs} (.*) poteznymi ciosami [^ ]+ [^ ]+ tarczy i (krwawo ranisz|ciezko ranisz) [^ ]+ (.*).' moj_glspec_8 = \
  /substitute -p @{BCwhite}----> @{Cblue}[GL 8/11] @{Cwhite}specuje @{Cblue}%%{P2}@{CWhite} (%%{P1}).
/def -Fp100 -mregexp -t'Blokujesz atak (.*) [^ ]+ [^ ]+ tarcza i zadanym z pelnego sily obrotu ciosem (.*) (ciezko ranisz|bardzo ciezko ranisz) [^ ]+ w ((.*), rozpylajac deszcz krwi\.|(.*)\.)' moj_glspec_9 = /substitute -p @{BCwhite}----> @{Cblue}[GL 9/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P5}%{P6}).
/def -Fp100 -mregexp -t'Z wyrywajacym sie z twej piersi bojowym okrzykiem dopadasz do (.*) i blokujac pole [^ ]+ manewru (.*) kilkakrotnie, paskudnie masakrujesz [^ ]+ (.*) ciosami (.*), niemalze zakanczajac potyczke.' moj_glspec_10 = /substitute -p @{BCwhite}----> @{Cblue}[GL 10/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P3}).
/eval /def -Fp100 -mregexp -t'(Z pelnym wscieklosci rykiem blokujesz (zaslone|[^ ]+ [^ ]+ [^ ]+) (.*) i zadanym z rozmachu uderzeniem (.*) masakrujesz [^ ]+ (.*), blyskawicznie konczac walke.|Zgrabnym unikiem omijasz desperacki atak (.*) i zadanym jednoczesnie ciosem (.*) i (.*) masakrujesz [^ ]+ (.*), konczac walke.|Twardym ciosem (.*) masakrujesz %{hitlocs} (.*) i druzgoczacym ciosem (.*) rzucasz [^ ]+ na ziemie.|Twardym ciosem (.*) zamieniasz twarz (.*) w krwawa miazge i druzgoczacym ciosem (.*) rzucasz [^ ]+ na ziemie.)' moj_glspec_11 = \
  /substitute -p @{BCwhite}----> @{Cblue}[GL 11/11] @{Cwhite}specuje @{Cblue}%%{P3}%%{P6}%%{P12}%%{P15}@{CWhite} (%%{P5}%%{P9}%%{P11}).

; Ja kogoś (gdy mam topór jednoręczny, ale nie mam tarczy)
/def -Fp100 -mregexp -t'Blyskawicznym ciosem (.*) mijasz (.*) o wlos.' moj_glspec_bezt_0 = /substitute -p @{BCwhite}----> @{Cblue}[GL 0/11] @{Cwhite}probuje specowac @{Cblue}%{P2}@{CWhite}.
/def -Fp100 -mregexp -t'Wyprowadzonym z zaskoczenia ciosem (.*) starasz sie trafic (.*) w (.*), lecz zadajesz ledwie nieznaczne obrazenia.' moj_glspec_bezt_1 = /substitute -p @{BCwhite}----> @{Cblue}[GL 1/11] @{Cwhite}specuje @{Cblue}%{P2}@{CWhite} (%{P3}).
/def -Fp100 -mregexp -t'Sprawnie nacierasz na (.*), w pedzie uderzajac [^ ]+ ciosem (.*) w (.*), zadajac (niewielka rane|niewielkie obrazenia).' moj_glspec_bezt_2 = /substitute -p @{BCwhite}----> @{Cblue}[GL 2/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P3}).
/def -Fp100 -mregexp -t'Wykorzystujac luke w obronie (.*) celnym ciosem (.*) uderzasz [^ ]+ (rozcinajac (.*)|w (.*), zadajac nieduze obrazenia).' moj_glspec_bezt_3 = /substitute -p @{BCwhite}----> @{Cblue}[GL 3/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P4}%{P5}).
/def -Fp100 -mregexp -t'Nie czekajac na kolejny ruch (.*) szybkim atakiem przebijasz sie przez [^ ]+ obrone, raniac [^ ]+ ciosem (.*) w (.*).' moj_glspec_bezt_4 = /substitute -p @{BCwhite}----> @{Cblue}[GL 4/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P3}).
/eval /def -Fp100 -mregexp -t'Umiejetnie unikasz ciosu (.*) i silnie uderzasz [^ ]+ w %{hitlocs} (.*), (kaleczac cialo|zadajac spore obrazenia).' moj_glspec_bezt_5 = /substitute -p @{BCwhite}----> @{Cblue}[GL 5/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P2}).
/def -Fp100 -mregexp -t'Szalenczo nacierasz, zasypujac (.*) kilkoma ciosami (.*), z ktorych kazdy (pozostawia na [^ ]+ skorze krwawiacy slad, raniac (.*)|rani [^ ]+ (.*)).' moj_glspec_bezt_6 = /substitute -p @{BCwhite}----> @{Cblue}[GL 6/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P4}%{P5}).
/def -Fp100 -mregexp -t'Szybkim zwodem wprowadzasz (.*) w blad, po czym mocno ranisz [^ ]+ ciosem (.*) w (.*).' moj_glspec_bezt_7 = /substitute -p @{BCwhite}----> @{Cblue}[GL 7/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P3}).
/eval /def -Fp100 -mregexp -t'Blyskawicznym uderzeniem (.*) kaleczysz %{hitlocs} (.*) i natychmiast atakujesz ponownie, (pozostawiajac na [^ ]+ ciele paskudna rane|powaznie [^ ]+ raniac).' moj_glspec_bezt_8 = /substitute -p @{BCwhite}----> @{Cblue}[GL 8/11] @{Cwhite}specuje @{Cblue}%{P3}@{CWhite} (%{P2}).
/def -Fp100 -mregexp -t'Nie baczac na ryzyko, z szybkiego wypadu umiejetnie atakujesz (.*), dosiegajac [^ ]+ pelnym sily uderzeniem (.*) w (.*), ciezko [^ ]+ raniac.' moj_glspec_bezt_9 = /substitute -p @{BCwhite}----> @{Cblue}[GL 9/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P3}).
/def -Fp100 -mregexp -t'Eleganckim wypadem omijasz obrone (.*) i wyprowadzonym z poteznego zamachu ciosem masakrujesz [^ ]+ (.*).' moj_glspec_bezt_10 = /substitute -p @{BCwhite}----> @{Cblue}[GL 10/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite} (%{P2}).
/eval /def -Fp100 -mregexp -t'(Z gladiatorska wprawa uchylasz sie przed ostatnim atakiem (.*) i morderczo kontrujac ciosem (.*) zakanczasz walke, masakrujac mu (.*)|Z bojowym okrzykiem rzucasz sie do ostatecznego natarcia, by bezlitosnym ciosem (.*) zmasakrowac %{hitlocs} (.*), konczac walke|Niemalze instynktownym ruchem odbijasz (zaslone|[^ ]+ [^ ]+ [^ ]+) (.*) i z wsciekloscia masakrujesz [^ ]+ (.*) ciosem (.*), konczac boj).' moj_glspec_bezt_11 = /substitute -p @{BCwhite}----> @{Cblue}[GL 11/11] @{Cwhite}specuje @{Cblue}%{P2}%{P7}%{P9}@{CWhite} (%{P4}%{P6}%{P10}).

; Ja kogoś (gdy mam topór dwuręczny)
; Aktualizacja: 14.02.2012
/def -Fp100 -mregexp -t'Starasz sie trafic (.*) poteznym uderzeniem (.*), jednak nie udaje ci sie to.' moj_glspec_dwurek_0 = /substitute -p @{BCwhite}----> @{Cblue}[GL 0/11] @{Cwhite}probuje specowac @{Cblue}%{P1}@{CWhite}.
/def -Fp100 -mregexp -t'Z szerokiego zamachu zamierzasz sie (.*) na (.*), jednak zbyt wolny cios ledwie ociera sie o (jego|jej) (.*).' moj_glspec_dwurek_1 = /substitute -p @{BCwhite}----> @{Cblue}[GL 1/11] @{Cwhite}specuje @{Cblue}%{P2}@{CWhite}.
/def -Fp100 -mregexp -t'Wykorzystujac zasieg (.*) bez trudu dosiegasz (.*) mocnym uderzeniem w (.*) i sprawnie szykujesz sie do ponowienia ataku.' moj_glspec_dwurek_2 = /substitute -p @{BCwhite}----> @{Cblue}[GL 2/11] @{Cwhite}specuje @{Cblue}%{P2}@{CWhite}.
/def -Fp100 -mregexp -t'Naglym ruchem podrywasz (.*), zaskakujac (.*) ciosem w (.*), zadajac (krwawiaca rane|znaczne obrazenia).' moj_glspec_dwurek_3 = /substitute -p @{BCwhite}----> @{Cblue}[GL 3/11] @{Cwhite}specuje @{Cblue}%{P2}@{CWhite}.
/def -Fp100 -mregexp -t'Wykorzystujac jedna ze sztuczek areny, blyskawicznie unikasz ciosu (.*) i mordercza kontra (.*) powaznie ranisz [^ ]+ w (.*).' moj_glspec_dwurek_4 = /substitute -p @{BCwhite}----> @{Cblue}[GL 4/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite}.
/def -Fp100 -mregexp -t'Uzyskujac inicjatywe, mocnym zamachem (.*) zbijasz ([^ ]+ [^ ]+ [^ ]+) (.*) i rabiesz (go|je|je) w (.*), zadajac spore obrazenia.' moj_glspec_dwurek_5 = /substitute -p @{BCwhite}----> @{Cblue}[GL 5/11] @{Cwhite}specuje @{Cblue}%{P3}@{CWhite}.
/def -Fp100 -mregexp -t'Niezlomnie nacierajac, odbijasz (zaslone|[^ ]+ [^ ]+ [^ ]+) (.*) szybkim uderzeniem (.*) i zadanym z calej sily ciosem ciezko ranisz [^ ]+ w (.*).' moj_glspec_dwurek_6 = /substitute -p @{BCwhite}----> @{Cblue}[GL 6/11] @{Cwhite}specuje @{Cblue}%{P2}@{CWhite}.
/def -Fp100 -mregexp -t'Gardzac ryzykiem, rzucasz sie na (.*), by z karkolomnej szarzy dosiegnac [^ ]+ miazdzacym uderzeniem (.*) w (.*), zadajac (ciezka rane|bardzo ciezkie obrazenia).' moj_glspec_dwurek_7 = /substitute -p @{BCwhite}----> @{Cblue}[GL 7/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite}.
/def -Fp100 -mregexp -t'Odrzucajac finezje na rzecz skutecznosci, szarzujesz na (.*) w szalonym pedzie odbijajac (.*) (jego|jej) zaslone, by w koncu druzgoczacym uderzeniem poslac (go|ja|je) na ziemie, niemalze konczac walke.' moj_glspec_dwurek_8 = /substitute -p @{BCwhite}----> @{Cblue}[GL 9/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite}.
/def -Fp100 -mregexp -t'Sprawnie blokujesz atak (.*) i celnym ciosem (.*) odrzucasz [^ ]+ w tyl, bolesnie raniac w (.*).' moj_glspec_dwurek_iles = /substitute -p @{BCwhite}----> @{Cblue}[GL ?/11] @{Cwhite}specuje @{Cblue}%{P1}@{CWhite}.
/def -Fp100 -mregexp -t'(Wykorzystujac mase (.*) bez trudu odbijasz ostatni cios (.*) i skupiajac sily na poteznym ataku morderczo nacierasz, doszczetnie [^ ]+ masakrujac.|Poteznym ciosem (.*) rozbijasz resztki zaslony (.*), rzucajac [^ ]+ na ziemie, po czym brutalnie ponawiajac atak konczysz walke.|Szybkim zrywem rzucasz sie ku (.*), niemalze w jednej chwili uderzajac [^ ]+ oburacz (.*). Zmasakrowana ofiara osuwa sie na ziemie, zakanczajac walke.)' moj_glspec_dwurek_9 = /substitute -p @{BCwhite}----> @{Cblue}[GL 11/11] @{Cwhite}specuje @{Cblue}%{P3}%{P5}%{P6}@{CWhite}.



#######################################################################################################################################################

;     ---> GLADZI <---  
; Aktualizacja 01.09.12
; Ktoś kogoś (gdy atakujący ma broń jednoręczną i tarczę)
/set _spec_kolor_glada=@{Cblue}

/def -Fp100 -mregexp -t'( paruje cios (.*) [^ ]+ [^ ]+ tarcza i uderza [^ ]+ (.*) lecz nie trafia)' glspec_0 = \
  /return (_specuj("GL",{_spec_kolor_glada}, {PL}, {P2}, "0", "11"))
/def -Fp100 -mregexp -t'( paruje cios (.*) [^ ]+ [^ ]+ tarcza i odpowiada (.*) w (.*), zadajac nieznaczne obrazenia.)' glspec_1 = \
  /return (_specuj("GL",{_spec_kolor_glada}, {PL}, {P2}, "1", "11", {P4}))
/def -Fp100 -mregexp -t'( odpycha (.*) [^ ]+ [^ ]+ tarcza i lekko kaleczy (.*) w (.*).)' glspec_2 = \
  /return (_specuj("GL",{_spec_kolor_glada}, {PL}, {P2}, "2", "11", {P4}))
/eval /def -Fp100 -mregexp -t'(Ciosem (.*) w %{hitlocs} (.*) zadaje (.*) (nieduza rane|nieduze obrazenia))' glspec_3 = \
  /return (_specuj("GL",{_spec_kolor_glada}, {P4}, {P5}, "3", "11", {P3}))
/def -Fp100 -mregexp -t'( sprawnie paruje atak (.*) [^ ]+ [^ ]+ tarcza i rani (.*) w (.*).)' glspec_4 = \
  /return (_specuj("GL",{_spec_kolor_glada}, {PL}, {P2}, "4", "11", {P4}))
/def -Fp100 -mregexp -t'(Mocnym uderzeniem [^ ]+ [^ ]+ tarczy (.*) oszalamia (.*) i ciosem (.*) krwista rane, raniac (.*).)' glspec_5 = \
  /return (_specuj("GL",{_spec_kolor_glada}, {P2}, {P3}, "5", "11", {P5}))
/def -Fp100 -mregexp -t'( nurkujac pod atakiem (.*) mocno rani (.*) w (.*).)' glspec_6 = \
  /return (_specuj("GL",{_spec_kolor_glada}, {PL}, {P2}, "6", "11", {P4}))
/def -Fp100 -mregexp -t'( zatrzymuje atak (.*) pewnym blokiem (.*) i poteznym ciosem (.*) powaznie rani [^ ]+ (.*).)' glspec_7 = \
  /return (_specuj("GL",{_spec_kolor_glada}, {PL}, {P2}, "7", "11", {P5}))
/eval /def -Fp100 -mregexp -t'( kilkakrotnie tlucze w %{hitlocs} (.*) poteznymi ciosami (.*) i krwawo rani)' glspec_8 = \
  /return (_specuj("GL",{_spec_kolor_glada}, {PL}, {P3}, "8", "11", {P2}))
/def -Fp100 -mregexp -t'( blokuje atak (.*) [^ ]+ [^ ]+ tarcza i zadanym (.*) ciezko rani [^ ]+ w ((.*), rozpylajac deszcz krwi\.|(.*)\.))' glspec_9 = \
  /return (_specuj("GL",{_spec_kolor_glada}, {PL}, {P2}, "9", "11", strcat({P5},{P6})))
/def -Fp100 -mregexp -t'( piersi bojowym okrzykiem (.*) dopada do (.*) i blokujac (.*) paskudnie masakruje [^ ]+ (nogi|korpus|glowe|lewe ramie|prawe ramie).)' glspec_10 = \
  /return (_specuj("GL",{_spec_kolor_glada}, {P2}, {P3}, "10", "11", {P5}))
/def -Fp100 -mregexp -t'Zgrabnym unikiem (.*) omija desperacki atak (.*) i zadanym jednoczesnie ciosem (.*) masakruje [^ ]+ (.*), konczac walke.|Z pelnym wscieklosci rykiem (.*) blokuje (zaslone|[^ ]+ [^ ]+ [^ ]+) (.*) i zadanym z rozmachu uderzeniem (.*) masakruje [^ ]+ (.*), blyskawicznie konczac walke.|Twardym ciosem [^ ]+ [^ ]+ tarczy (.*) zamienia twarz (.*) w krwawa miazge.' glspec_11 = \
  /return (_specuj("GL",{_spec_kolor_glada}, strcat({P1},{P5},{P10}), strcat({P2},{P7},{P11}), "11", "11", strcat({P4},{P9})))

; Aktualizacja 01.09.12
; Ktoś mnie (gdy atakujący ma broń jednoręczną i tarczę)
/def -Fp100 -mregexp -t' paruje twoj cios (.*) i uderza (.*) lecz nie trafia cie\.' glspec_0_we_mnie = \
  /return (_specuj("GL",{_spec_kolor_glada}, {PL}, "cie", "0", "11"))
/def -Fp100 -mregexp -t' paruje twoj cios (.*) i odpowiada nan szybkim ciosem (.*) w (.*), zadajac nieznaczne obrazenia.' glspec_1_we_mnie = \
  /return (_specuj("GL",{_spec_kolor_glada}, {PL}, "cie", "1", "11", {P3}))
/def -Fp100 -mregexp -t' sprawnie paruje twoj atak (.*) i rani cie celna kontra ciosu (.*) w (.*)\.' glspec_4_we_mnie = \
  /return (_specuj("GL",{_spec_kolor_glada}, {PL}, "cie", "4", "11", {P3}))
/def -Fp100 -mregexp -t' oszlamia cie mocnym uderzeniem (.*) i ciosem (.*) zadaje ci krwista rane, raniac (.*).' glspec_5_we_mnie = \
  /return (_specuj("GL",{_spec_kolor_glada}, {PL}, "cie", "5", "11", {P3}))
/def -Fp100 -mregexp -t'Nurkujac pod twym atakiem (.*) mocno rani cie ciosem (.*) i zaraz po tym kaleczy uderzeniem (.*) w (.*)\.' glspec_6_we_mnie = \
  /return (_specuj("GL",{_spec_kolor_glada}, {P1}, "cie", "6", "11", {P4}))
/def -Fp100 -mregexp -t' zatrzymuje twoj atak pewnym blokiem (.*) i poteznym ciosem (.*) powaznie rani ci (.*)\.' glspec_7_we_mnie = \
  /return (_specuj("GL",{_spec_kolor_glada}, {PL}, "cie", "7", "11", {P3}))
/eval /def -Fp100 -mregexp -t' kilkakrotnie tlucze ci %{hitlocs} poteznymi ciosami (.*) i (krwawo|ciezko) rani cie (.*)\.' glspec_8_we_mnie = \
  /return (_specuj("GL",{_spec_kolor_glada}, {PL}, "cie", "8", "11", {P1}))
/def -Fp100 -mregexp -t' blokuje twoj atak (.*) i zadanym (.*) (bardzo ciezko|ciezko) rani cie w ((.*), rozpylajac deszcz krwi\.|(.*)\.)' glspec_9_we_mnie = \
  /return (_specuj("GL",{_spec_kolor_glada}, {PL}, "cie", "9", "11", strcat({P5},{P6})))
/def -Fp100 -mregexp -t'Z wyrywajacym sie z (jego|jej) piersi bojowym okrzykiem (.*) dopada do ciebie i blokujac (.*) paskudnie masakrujac ci (nogi|korpus|glowe|lewe ramie|prawe ramie) ciosami (.*)\.' glspec_10_we_mnie = \
  /return (_specuj("GL",{_spec_kolor_glada}, {P2}, "cie", "10", "11", {P4}))
/def -Fp100 -mregexp -t'Zgrabnym unikiem (.*) omija twoj desperacki atak i zadanym jednoczesnie ciosem (.*) masakruje ci (.*), konczac walke.|Z pelnym wscieklosci rykiem (.*) blokuje i zadanym z rozmachu uderzeniem (.*) masakruje ci (.*), blyskawicznie konczac walke.|Twardym ciosem [^ ]+ [^ ]+ tarczy (.*) zamienia twoja twarz w krwawa miazge' glspec_11_we_mnie = \
  /return (_specuj("GL",{_spec_kolor_glada}, {P1}{P4}{P7}, "cie", "11", "11", strcat({P3},{P6})))

#######################################################################################################################################################

; 'atak z zaskoczenia' (spec myśliwych) - aktualizacja 01.09.12
; niegrozne -> nieznaczne -> bardzo male -> male -> spore -> znaczne -> duze -> ogromne -> smiertelne
/set _spec_kolor_zaskoka=@{Cmagenta}

;;; Ktoś kogoś
/def -p200 -mregexp -t'(Nagle tuz na granicy widocznosci pojawia sie postac (.*) i z krotkiego doskoku dopada (.*) uderzajac .* swoja (.*) w (.*). Niespodziewany cios zadaje ofiarze niegroznie obrazenia.)' _zzaskokaspec1_1 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, {P3}, "1", "9", strcat({P5},{P4})))
/def -p200 -mregexp -t'(Nagle tuz na granicy widocznosci pojawia sie postac (.*) i z krotkiego doskoku dopada (.*) uderzajac .* swoja (.*) w (.*). Niespodziewany cios zadaje ofiarze nieznaczne obrazenia.)' _zzaskokaspec1_2 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, {P3}, "2", "9", strcat({P5},{P4})))
/def -p200 -mregexp -t'(Nagle tuz na granicy widocznosci pojawia sie postac (.*) i z krotkiego doskoku dopada (.*) uderzajac .* swoja (.*) w (.*). Niespodziewany cios zadaje ofiarze bardzo male obrazenia.)' _zzaskokaspec1_3 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, {P3}, "3", "9", strcat({P5},{P4})))
/def -p200 -mregexp -t'(Nagle tuz na granicy widocznosci pojawia sie postac (.*) i z krotkiego doskoku dopada (.*) uderzajac .* swoja (.*) w (.*). Niespodziewany cios zadaje ofiarze male obrazenia.)' _zzaskokaspec1_4 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, {P3}, "4", "9", strcat({P5},{P4})))
/def -p200 -mregexp -t'(Nagle tuz na granicy widocznosci pojawia sie postac (.*) i z krotkiego doskoku dopada (.*) uderzajac .* swoja (.*) w (.*). Niespodziewany cios zadaje ofiarze spore obrazenia.)' _zzaskokaspec1_5 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, {P3}, "5", "9", strcat({P5},{P4})))
/def -p200 -mregexp -t'(Nagle tuz na granicy widocznosci pojawia sie postac (.*) i z krotkiego doskoku dopada (.*) uderzajac .* swoja (.*) w (.*). Niespodziewany cios zadaje ofiarze znaczne obrazenia.)' _zzaskokaspec1_6 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, {P3}, "6", "9", strcat({P5},{P4})))
/def -p200 -mregexp -t'(Nagle tuz na granicy widocznosci pojawia sie postac (.*) i z krotkiego doskoku dopada (.*) uderzajac .* swoja (.*) w (.*). Niespodziewany cios zadaje ofiarze duze obrazenia.)' _zzaskokaspec1_7 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, {P3}, "7", "9", strcat({P5},{P4})))
/def -p200 -mregexp -t'(Nagle tuz na granicy widocznosci pojawia sie postac (.*) i z krotkiego doskoku dopada (.*) uderzajac .* swoja (.*) w (.*). Niespodziewany cios zadaje ofiarze ogromne obrazenia.)' _zzaskokaspec1_8 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, {P3}, "8", "9", strcat({P5},{P4})))
/def -p200 -mregexp -t'(Nagle tuz na granicy widocznosci pojawia sie postac (.*) i z krotkiego doskoku dopada (.*) uderzajac .* swoja (.*) w (.*). Niespodziewany cios zadaje ofiarze smiertelne obrazenia.)' _zzaskokaspec1_9 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, {P3}, "9", "9", strcat({P5},{P4})))

;;; Ktoś mnie (gdy go widzę ukrytego)
/def -p200 -mregexp -t'(Widzisz jak (.*) probuje cie zajsc od tylu. Nagle wypada .* z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci niegroznie obrazenia.)' _zzaskokaspec2_1 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "1", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Widzisz jak (.*) probuje cie zajsc od tylu. Nagle wypada .* z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci nieznaczne obrazenia.)' _zzaskokaspec2_2 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "2", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Widzisz jak (.*) probuje cie zajsc od tylu. Nagle wypada .* z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci bardzo male obrazenia.)' _zzaskokaspec2_3 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "3", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Widzisz jak (.*) probuje cie zajsc od tylu. Nagle wypada .* z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci male obrazenia.)' _zzaskokaspec2_4 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "4", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Widzisz jak (.*) probuje cie zajsc od tylu. Nagle wypada .* z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci spore obrazenia.)' _zzaskokaspec2_5 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "5", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Widzisz jak (.*) probuje cie zajsc od tylu. Nagle wypada .* z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci znaczne obrazenia.)' _zzaskokaspec2_6 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "6", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Widzisz jak (.*) probuje cie zajsc od tylu. Nagle wypada .* z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci duze obrazenia.)' _zzaskokaspec2_7 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "7", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Widzisz jak (.*) probuje cie zajsc od tylu. Nagle wypada .* z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci ogromne obrazenia.)' _zzaskokaspec2_8 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "8", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Widzisz jak (.*) probuje cie zajsc od tylu. Nagle wypada .* z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci smiertelne obrazenia.)' _zzaskokaspec2_9 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "9", "9", strcat({P4},{P3})))

;;; Ktoś mnie (gdy go nie widzę)
/def -p200 -mregexp -t'(Slyszysz jakis cichy szelest i czyjes kroki tuz za soba. Nagle (.*) wypada z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci niegroznie obrazenia.)' _zzaskokaspec3_1 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "1", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Slyszysz jakis cichy szelest i czyjes kroki tuz za soba. Nagle (.*) wypada z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci nieznaczne obrazenia.)' _zzaskokaspec3_2 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "2", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Slyszysz jakis cichy szelest i czyjes kroki tuz za soba. Nagle (.*) wypada z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci bardzo male obrazenia.)' _zzaskokaspec3_3 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "3", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Slyszysz jakis cichy szelest i czyjes kroki tuz za soba. Nagle (.*) wypada z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci male obrazenia.)' _zzaskokaspec3_4 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "4", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Slyszysz jakis cichy szelest i czyjes kroki tuz za soba. Nagle (.*) wypada z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci spore obrazenia.)' _zzaskokaspec3_5 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "5", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Slyszysz jakis cichy szelest i czyjes kroki tuz za soba. Nagle (.*) wypada z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci znaczne obrazenia.)' _zzaskokaspec3_6 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "6", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Slyszysz jakis cichy szelest i czyjes kroki tuz za soba. Nagle (.*) wypada z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci duze obrazenia.)' _zzaskokaspec3_7 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "7", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Slyszysz jakis cichy szelest i czyjes kroki tuz za soba. Nagle (.*) wypada z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci ogromne obrazenia.)' _zzaskokaspec3_8 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "8", "9", strcat({P4},{P3})))
/def -p200 -mregexp -t'(Slyszysz jakis cichy szelest i czyjes kroki tuz za soba. Nagle (.*) wypada z ukrycia i tej samej chwili czujesz uderzenie (.*) w (.*), ktore zadaje ci smiertelne obrazenia.)' _zzaskokaspec3_9 = \
  /return (_specuj("Zaskok",{_spec_kolor_zaskoka}, {P2}, "ciebie", "9", "9", strcat({P4},{P3})))

#######################################################################################################################################################

; Spec Strażnika
; Aktualizacja: 21.07.10
; ledwie zahaczajac, lekko raniac, mocno raniac, bardzo mocno raniac

/set _spec_kolor_straznika=@{Cmagenta}

; Wytrącanie. Też można przerobić
; Ktoś kogoś, Ktoś mnie
/def -Fp5 -P1xCgreen -t'slamazarnym wymachem .* (probuje wytracic)' _skn_spec_1 = /_psnr @{BCmagenta} SKN (0/1)
/def -Fp5 -P1xBCgreen -t'szybkim niczym mysl ruchem .* (wytraca)' _skn_spec_2 = /_psnr @{BCmagenta} SKN (1/1)

; Ktoś kogoś
/def -Fp100 -mregexp -t' wykorzystujac brak broni u przeciwnika,(| blyskawicznie| w mgnieniu oka| z wyuczona wprawa) wyprowadza cios (.*) mierzac w (.*) i prawie traci rownowage po [^ ]+ zrecznym uniku.' str_spec_0_unik = \
  /return (_specuj("STR",{_spec_kolor_straznika}, {PL}, {P3}, "0", "5", "unik"))
/def -Fp100 -mregexp -t' wykorzystujac brak broni u przeciwnika,(| blyskawicznie| w mgnieniu oka| z wyuczona wprawa) wyprowadza cios (.*) mierzac w (.*). Wypracowane uderzenie zostaje jednak sparowane przez [^ ]+ [^ ]+ [^ ]+ tarcza.' str_spec_0_tarcza = \
  /return (_specuj("STR",{_spec_kolor_straznika}, {PL}, {P3}, "0", "5", "tarcza"))
/def -Fp100 -mregexp -t' wykorzystujac brak broni u przeciwnika,(| blyskawicznie| w mgnieniu oka| z wyuczona wprawa) wyprowadza cios (.*) mierzac w (.*). Wypracowanym uderzeniem trafia [^ ]+ w (.*), (pozostawiajac ledwie sinca|ledwie zahaczajac).' str_spec_1 = \
  /return (_specuj("STR",{_spec_kolor_straznika}, {PL}, {P3}, "1", "5", {P4}))
/def -Fp100 -mregexp -t' wykorzystujac brak broni u przeciwnika,(| blyskawicznie| w mgnieniu oka| z wyuczona wprawa) wyprowadza cios (.*) mierzac w (.*). Wypracowanym uderzeniem trafia [^ ]+ w (.*), (pozostawiajac krwawiace zadrapanie|lekko raniac).' str_spec_2 = \
  /return (_specuj("STR",{_spec_kolor_straznika}, {PL}, {P3}, "2", "5", {P4}))
/def -Fp100 -mregexp -t' wykorzystujac brak broni u przeciwnika,(| blyskawicznie| w mgnieniu oka| z wyuczona wprawa) wyprowadza cios (.*) mierzac w (.*). Wypracowanym uderzeniem trafia [^ ]+ w (.*), (pozostawiajac dluga, poszarpana rane|mocno raniac).' str_spec_3 = \
  /return (_specuj("STR",{_spec_kolor_straznika}, {PL}, {P3}, "3", "5", {P4}))
/def -Fp100 -mregexp -t' wykorzystujac brak broni u przeciwnika,(| blyskawicznie| w mgnieniu oka| z wyuczona wprawa) wyprowadza cios (.*) mierzac w (.*). Wypracowanym uderzeniem trafia [^ ]+ w (.*), (pozostawiajac gleboka rane z wystajacymi na wierzchu tkankami|bardzo mocno raniac).' str_spec_4 = \
  /return (_specuj("STR",{_spec_kolor_straznika}, {PL}, {P3}, "4", "5", {P4}))
/def -Fp100 -mregexp -t' wykorzystujac brak broni u przeciwnika,(| blyskawicznie| w mgnieniu oka| z wyuczona wprawa) wyprowadza cios (.*) mierzac w (.*). Wypracowanym uderzeniem trafia [^ ]+ w (.*), zadajac smiertelne obrazenia.' str_spec_5 = \
  /return (_specuj("STR",{_spec_kolor_straznika}, {PL}, {P3}, "5", "5", {P4}))


#######################################################################################################################################################



;     ---> LEGIONIŚCI - OHM <--- Aktualizacja: 10.05.10
; Można by połączyć, żeby było 3 razy mniej triggerów

/set _spec_kolor_ohm=@{Cmagenta}

; Ja kogoś (jednoręk + tarcza)
; Aktualizacja: 16.09.12
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ zza krawedzi (.*) (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Niestety jednak cios schodzi po (.*), nie czyniac najmniejszej krzywdy.' _moj_ohm_spec_0_zbite =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 0/7] @{Cwhite}probuje specowac @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ zza krawedzi (.*) (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Niestety jednak cios nie siega celu, przecinajac tylko powietrze.' _moj_ohm_spec_0_pudlo =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 0/7] @{Cwhite}probuje specowac @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ zza krawedzi (.*) (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Slaby i niedokladny cios trafia przeciwnika w (.*), powodujac tylko ledwo zauwazalne obrazenia.' _moj_ohm_spec_1 =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 1/7] @{Cwhite}specuje @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ zza krawedzi (.*) (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Niezbyt precyzyjny cios trafia przeciwnika w (.*), powodujac tylko nieznaczne obrazenia.' _moj_ohm_spec_2 =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 2/7] @{Cwhite}specuje @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ zza krawedzi (.*) (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Silny cios trafia przeciwnika w (.*), powodujac niemale obrazenia.' _moj_ohm_spec_3 =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 3/7] @{Cwhite}specuje @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ zza krawedzi (.*) (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Mocny i precyzyjny cios trafia przeciwnika w (.*), powodujac rozlegle obrazenia.' _moj_ohm_spec_4 =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 4/7] @{Cwhite}specuje @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ zza krawedzi (.*) (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Potezny cios trafia przeciwnika w (.*), powodujac liczne i glebokie obrazenia.' _moj_ohm_spec_5 =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 5/7] @{Cwhite}specuje @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ zza krawedzi (.*) (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Morderczy cios trafia przeciwnika w (.*), powodujac (prawie ze|prawieze) smiertelne obrazenia.' _moj_ohm_spec_6 =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 6/7] @{Cwhite}specuje @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ zza krawedzi (.*) (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Bezlitosny cios obala przeciwnika, w jednym momencie konczac walke.' _moj_ohm_spec_7 =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 7/7] @{Cwhite}specuje @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.

; Ja kogoś (jednoręk)
; Aktualizacja: 16.09.12
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Niestety jednak cios schodzi po (.*), nie czyniac najmniejszej krzywdy.' _moj_ohm_spec_beztarczy_0_zbite =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 0/7] @{Cwhite}probuje specowac @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Niestety jednak cios nie siega celu, przecinajac tylko powietrze.' _moj_ohm_spec_beztarczy_0_pudlo =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 0/7] @{Cwhite}probuje specowac @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Slaby i niedokladny cios trafia przeciwnika w (.*), powodujac tylko ledwo zauwazalne obrazenia.' _moj_ohm_spec_beztarczy_1 =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 1/7] @{Cwhite}specuje @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Niezbyt precyzyjny cios trafia przeciwnika w (.*), powodujac tylko nieznaczne obrazenia.' _moj_ohm_spec_beztarczy_2 =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 2/7] @{Cwhite}specuje @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Silny cios trafia przeciwnika w (.*), powodujac niemale obrazenia.' _moj_ohm_spec_beztarczy_3 =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 3/7] @{Cwhite}specuje @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Mocny i precyzyjny cios trafia przeciwnika w (.*), powodujac rozlegle obrazenia.' _moj_ohm_spec_beztarczy_4 =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 4/7] @{Cwhite}specuje @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Potezny cios trafia przeciwnika w (.*), powodujac liczne i glebokie obrazenia.' _moj_ohm_spec_beztarczy_5 =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 5/7] @{Cwhite}specuje @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Morderczy cios trafia przeciwnika w (.*), powodujac (prawie ze|prawieze) smiertelne obrazenia.' _moj_ohm_spec_beztarczy_6 =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 6/7] @{Cwhite}specuje @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.
/def -Fp100 -mregexp -t'(Przesuwasz sie nieznacznie w bok, obchodzac powoli (.*)|Nie tracac dystansu do (.*), cofasz sie pol kroku|Napierasz zdecydowanie bokiem na (.*)), by w najdogodniejszym momencie wyprowadzic w [^ ]+ (blyskawiczne|krotkie|szybkie) (pchniecie|ciecie|uderzenie) (.*). Bezlitosny cios obala przeciwnika, w jednym momencie konczac walke.' _moj_ohm_spec_beztarczy_7 =  /substitute -p @{BCwhite}----> @{Cmagenta}[OHM 7/7] @{Cwhite}specuje @{Cblue}%{P2}%{P3}%{P4}@{CWhite}.






; Ktoś kogoś, Ktoś mnie
/def -Fp100 -mregexp -t'( zdecydowanie napiera bokiem na (.*), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) cios trafia (cie|przeciwnika) w (.*), powodujac tylko ledwo zauwazalne obrazenia.)' ohm_spec_1_3 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, {P2}, "1", "7"))
/def -Fp100 -mregexp -t'( przesuwa sie nieznacznie w bok, (obchodzac (.*) powoli|obchodzac powoli (.*)), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) cios trafia (cie|przeciwnika) w (.*), powodujac tylko ledwo zauwazalne obrazenia.)' ohm_spec_1_2 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, strcat({P3},{P4}), "1", "7"))
/def -Fp100 -mregexp -t'(Nie tracac (dystansu do (.*)|do (.*) dystansu), (.*) cofa sie pol kroku, by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) cios trafia (cie|przeciwnika) w (.*), powodujac tylko ledwo zauwazalne obrazenia.)' ohm_spec_1_1 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {P5}, strcat({P3},{P4}), "1", "7"))

/def -Fp100 -mregexp -t'( zdecydowanie napiera bokiem na (.*), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) cios trafia (cie|przeciwnika) w (.*), powodujac tylko nieznaczne obrazenia.)' ohm_spec_2_3 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, {P2}, "2", "7"))
/def -Fp100 -mregexp -t'( przesuwa sie nieznacznie w bok, (obchodzac (.*) powoli|obchodzac powoli (.*)), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) cios trafia (cie|przeciwnika) w (.*), powodujac tylko nieznaczne obrazenia.)' ohm_spec_2_2 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, strcat({P3},{P4}), "2", "7"))
/def -Fp100 -mregexp -t'(Nie tracac (dystansu do (.*)|do (.*) dystansu), (.*) cofa sie pol kroku, by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) cios trafia (cie|przeciwnika) w (.*), powodujac tylko nieznaczne obrazenia.)' ohm_spec_2_1 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {P5}, strcat({P3},{P4}), "2", "7"))
  
/def -Fp100 -mregexp -t'( zdecydowanie napiera bokiem na (.*), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) cios trafia (cie|przeciwnika) w (.*), powodujac niemale obrazenia.)' ohm_spec_3_3 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, {P2}, "3", "7"))
/def -Fp100 -mregexp -t'( przesuwa sie nieznacznie w bok, (obchodzac (.*) powoli|obchodzac powoli (.*)), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) cios trafia (cie|przeciwnika) w (.*), powodujac niemale obrazenia.)' ohm_spec_3_2 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, strcat({P3},{P4}), "3", "7"))
/def -Fp100 -mregexp -t'(Nie tracac (dystansu do (.*)|do (.*) dystansu), (.*) cofa sie pol kroku, by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) cios trafia (cie|przeciwnika) w (.*), powodujac niemale obrazenia.)' ohm_spec_3_1 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {P5}, strcat({P3},{P4}), "3", "7"))
        
/def -Fp100 -mregexp -t'( zdecydowanie napiera bokiem na (.*), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) rozlegle obrazenia.)' ohm_spec_4_3 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, {P2}, "4", "7"))
/def -Fp100 -mregexp -t'( przesuwa sie nieznacznie w bok, (obchodzac (.*) powoli|obchodzac powoli (.*)), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) rozlegle obrazenia.)' ohm_spec_4_2 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, strcat({P3},{P4}), "4", "7"))
/def -Fp100 -mregexp -t'(Nie tracac (dystansu do (.*)|do (.*) dystansu), (.*) cofa sie pol kroku, by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) rozlegle obrazenia.)' ohm_spec_4_1 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {P5}, strcat({P3},{P4}), "4", "7"))

/def -Fp100 -mregexp -t'( zdecydowanie napiera bokiem na (.*), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) liczne i glebokie obrazenia.)' ohm_spec_5_3 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, {P2}, "5", "7"))
/def -Fp100 -mregexp -t'( przesuwa sie nieznacznie w bok, (obchodzac (.*) powoli|obchodzac powoli (.*)), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) liczne i glebokie obrazenia.)' ohm_spec_5_2 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, strcat({P3},{P4}), "5", "7"))
/def -Fp100 -mregexp -t'(Nie tracac (dystansu do (.*)|do (.*) dystansu), (.*) cofa sie pol kroku, by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) liczne i glebokie obrazenia.)' ohm_spec_5_1 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {P5}, strcat({P3},{P4}), "5", "7"))
          
/def -Fp100 -mregexp -t'( zdecydowanie napiera bokiem na (.*), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) (prawie ze|prawieze) smiertelne obrazenia.)' ohm_spec_6_3 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, {P2}, "6", "7"))
/def -Fp100 -mregexp -t'( przesuwa sie nieznacznie w bok, (obchodzac (.*) powoli|obchodzac powoli (.*)), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) (prawie ze|prawieze) smiertelne obrazenia.)' ohm_spec_6_2 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, strcat({P3},{P4}), "6", "7"))
/def -Fp100 -mregexp -t'(Nie tracac (dystansu do (.*)|do (.*) dystansu), (.*) cofa sie pol kroku, by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) (prawie ze|prawieze) smiertelne obrazenia.)' ohm_spec_6_1 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {P5}, strcat({P3},{P4}), "6", "7"))

/def -Fp100 -mregexp -t'( zdecydowanie napiera bokiem na (.*), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) w jednym momencie konczac walke.)' ohm_spec_7_3 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, {P2}, "7", "7"))
/def -Fp100 -mregexp -t'( przesuwa sie nieznacznie w bok, (obchodzac (.*) powoli|obchodzac powoli (.*)), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) w jednym momencie konczac walke.)' ohm_spec_7_2 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, strcat({P3},{P4}), "7", "7"))
/def -Fp100 -mregexp -t'(Nie tracac (dystansu do (.*)|do (.*) dystansu), (.*) cofa sie pol kroku, by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) w jednym momencie konczac walke.)' ohm_spec_7_1 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {P5}, strcat({P3},{P4}), "7", "7"))
                    
/def -Fp100 -mregexp -t'( zdecydowanie napiera bokiem na (.*), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) przecinajac tylko powietrze.)' ohm_spec_0_pudlo3 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, {P2}, "0", "7", "pudlo"))
/def -Fp100 -mregexp -t'( przesuwa sie nieznacznie w bok, (obchodzac (.*) powoli|obchodzac powoli (.*)), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) przecinajac tylko powietrze.)' ohm_spec_0_pudlo2 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, strcat({P3},{P4}), "0", "7", "pudlo"))
/def -Fp100 -mregexp -t'(Nie tracac (dystansu do (.*)|do (.*) dystansu), (.*) cofa sie pol kroku, by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) przecinajac tylko powietrze.)' ohm_spec_0_pudlo1 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {P5}, strcat({P3},{P4}), "0", "7", "pudlo"))

/def -p101 -mregexp -t'( zdecydowanie napiera bokiem na (.*), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) (tarczy, nie czyniac najmniejszej krzywdy.|udaje ci sie na szczescie (.*) tarcza.))' ohm_spec_0_tarcza3 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, {P2}, "0", "7", "tarcza"))
/def -p101 -mregexp -t'( przesuwa sie nieznacznie w bok, (obchodzac (.*) powoli|obchodzac powoli (.*)), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) (tarczy, nie czyniac najmniejszej krzywdy.|udaje ci sie na szczescie (.*) tarcza.))' ohm_spec_0_tarcza2 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, strcat({P3},{P4}), "0", "7", "tarcza"))
/def -p101 -mregexp -t'(Nie tracac (dystansu do (.*)|do (.*) dystansu), (.*) cofa sie pol kroku, by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*) (tarczy, nie czyniac najmniejszej krzywdy.|udaje ci sie na szczescie (.*) tarcza.))' ohm_spec_0_tarcza1 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {P5}, strcat({P3},{P4}), "0", "7", "tarcza"))
        
/def -p100 -mregexp -t'( zdecydowanie napiera bokiem na (.*), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*), nie czyniac najmniejszej krzywdy.)' ohm_spec_0_bron3 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, {P2}, "0", "7", "bron"))
/def -p100 -mregexp -t'( przesuwa sie nieznacznie w bok, (obchodzac (.*) powoli|obchodzac powoli (.*)), by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*), nie czyniac najmniejszej krzywdy.)' ohm_spec_0_bron2 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {PL}, strcat({P3},{P4}), "0", "7", "bron"))
/def -p100 -mregexp -t'(Nie tracac (dystansu do (.*)|do (.*) dystansu), (.*) cofa sie pol kroku, by w (najmniej |)dogodnym momencie wyprowadzic (.*). (.*), nie czyniac najmniejszej krzywdy.)' ohm_spec_0_bron1 = \
  /return (_specuj("OHM",{_spec_kolor_ohm}, {P5}, strcat({P3},{P4}), "0", "7", "bron"))

#######################################################################################################################################################

;     ---> FANATYCY - MC <---
; Aktualizacja: 21.07.10

/set _spec_kolor_mc=@{Cred}

/def -p100 -mregexp -t' bierze potezny zamach i wyprowadza (.*) cios, ktory ma ((.*) zmasakrowac|zmasakrowac (.*)). (Ku twojej uldze .*|Jednak .*)' sub_mcuderz_czyjs0 = \
  /return (_specuj("MC",{_spec_kolor_mc}, {PL}, strcat({P3},{P4}), "0", "7"))
/def -p100 -mregexp -t'(([^ ]+ [^ ]+ [^ ]+|[^ ]+ [^ ]+|[^ ]+) (krzywi wargi|usmiecha sie|dostrzegajac) .* trafia )(.*)( w .* )(ledwo muskajac) (.*)' sub_mcuderz_czyjs1 = \
  /return (_specuj("MC",{_spec_kolor_mc}, {P2}, {P4}, "1", "7"))
/def -p100 -mregexp -t'(([^ ]+ [^ ]+ [^ ]+|[^ ]+ [^ ]+|[^ ]+) (krzywi wargi|usmiecha sie|dostrzegajac) .* trafia )(.*)( w .* )(lekko raniac) (.*)' sub_mcuderz_czyjs2 = \
  /return (_specuj("MC",{_spec_kolor_mc}, {P2}, {P4}, "2", "7"))
/def -p90  -mregexp -t'(([^ ]+ [^ ]+ [^ ]+|[^ ]+ [^ ]+|[^ ]+) (krzywi wargi|usmiecha sie|dostrzegajac) .* trafia )(.*)( w .* )(raniac) (.*)' sub_mcuderz_czyjs3 = \
  /return (_specuj("MC",{_spec_kolor_mc}, {P2}, {P4}, "3", "7"))
/def -p100 -mregexp -t'(([^ ]+ [^ ]+ [^ ]+|[^ ]+ [^ ]+|[^ ]+) (krzywi wargi|usmiecha sie|dostrzegajac) .* trafia )(.*)( w .* )(powaznie raniac) (.*)' sub_mcuderz_czyjs4 = \
  /return (_specuj("MC",{_spec_kolor_mc}, {P2}, {P4}, "4", "7"))
/def -p100 -mregexp -t'(([^ ]+ [^ ]+ [^ ]+|[^ ]+ [^ ]+|[^ ]+) (krzywi wargi|usmiecha sie|dostrzegajac) .* trafia )(.*)( w .* )(bardzo ciezko raniac) (.*)' sub_mcuderz_czyjs5 = \
  /return (_specuj("MC",{_spec_kolor_mc}, {P2}, {P4}, "5", "7"))
/def -p100 -mregexp -t'(([^ ]+ [^ ]+ [^ ]+|[^ ]+ [^ ]+|[^ ]+) (krzywi wargi|usmiecha sie|dostrzegajac) .* trafia )(.*)( w .* )(masakrujac) (.*)' sub_mcuderz_czyjs6 = \
  /return (_specuj("MC",{_spec_kolor_mc}, {P2}, {P4}, "6", "7"))
/def -p100 -mregexp -t' staje pewnie na szeroko rozstawionych nogach i wyprowadza potezne uderzenie (.*). Bezlitosny, okrutny cios trafia (.*) zaglebiajac bron w .* ciele. Widzisz, jak (.*) osuwa sie powoli na ziemie, ostatnimi silami starajac sie dosiegnac (.*), jednak przekracza to .* mozliwosci.' sub_mcuderz_czyjs7 = \
  /return (_specuj("MC",{_spec_kolor_mc}, {PL}, {P2}, "7", "7"))

#######################################################################################################################################################

; Nozownik
; Aktualizacja: 01.09.12

/set _spec_kolor_noz=@{Cmagenta}

/def -Fp100 -mregexp -t' zamierza sie na (.*), jednak .* z latwoscia (unika|uniknac)( jego| jej|) ciosu\.' ra_spec_0_1 = \
  /return (_specuj("RA",{_spec_kolor_noz}, {PL}, {P1}, "0", "8", "unik"))
/def -Fp100 -mregexp -t'Wykorzystujac dogodna sytuacje, (.*) rzuca sie na (.*), (jednak ty zrecznie unikasz ciosu|jednak (.*) nieskoordynowany ruch nie jest w stanie nikogo zaskoczyc)\.' ra_spec_0_2 = \
  /return (_specuj("RA",{_spec_kolor_noz}, {P1}, {P2}, "0", "8", "unik"))
/def -Fp100 -mregexp -t' spreza sie do skoku probujac ugodzic (.*) (swym|swa) (.*), lecz traci koncentracje i (jego|jej) niecelny cios mija (cel|cie) o wlos\.' ra_spec_0_3 = \
  /return (_specuj("RA",{_spec_kolor_noz}, {PL}, {P1}, "0", "8", "pudlo"))
/def -Fp100 -mregexp -t' wykonuje szybki wypad (i trafia|by trafic) (.*) (pozostawiajac nieznaczne drasniecie|i pozostawic na (jego|jej) ciele nieznaczne drasniecie)\.' ra_spec_1_1 = \
  /return (_specuj("RA",{_spec_kolor_noz}, {PL}, {P2}, "1", "8"))
/def -Fp100 -mregexp -t'( obracajac w reku swym(|i) (.*) wykonuje nagly zwod i trafia| odskakuje do tylu, a (.*) ktory trzyma w rece, zatacza szeroki luk by trafic) (.*)( pozostawiajac|, zadajac jednak| pozostawiajac jednak) tylko nieznaczne obrazenia\.' ra_spec_1_2 = \
  /return (_specuj("RA",{_spec_kolor_noz}, {PL}, {P5}, "1", "8"))
/def -Fp100 -mregexp -t' odskakuje do tylu, a (.*), ktory trzyma w rece zatacza szeroki luk by ugodzic w (.*), na szczescie zadajac tylko nieznaczne obrazenia\.' ra_spec_1_2_wemnie = \
  /return (_specuj("RA",{_spec_kolor_noz}, {PL}, {P2}, "1", "8"))
/def -Fp100 -mregexp -t'( korzystajac z nieuwagi|Wykorzystujac dogodna chwile (.*) doskakuje do| wykorzystujac chwilowa dekoncentracje) (.*)(, a (.*) zostawia po sobie| kluje [^ ]+ cialo (.*) zostawiajac|, a (.*) (atakujacego|atakujacej) pozostawia po sobie|, wbija (.*) w [^ ]+ cialo pozostawiajac) tylko lekkie drasniecie\.' ra_spec_2 = \
  /return (_specuj("RA",{_spec_kolor_noz}, strcat({PL},{P2}), {P3}, "2", "8"))
/def -Fp100 -mregexp -t'(Nagle|Niespodziewanie) (.*) (korzystajac z chwili twojej nieuwagi kluje cie|doskakuje do ciebie, a (jego|jej)|wykorzystujac chwile twojej dekoncentracji wbija ci) (.*) (zostawia po sobie|zostawiajac) tylko lekkie drasniecie\.' ra_spec_2_wemnie = \
  /return (_specuj("RA",{_spec_kolor_noz}, {P2}, "ciebie", "2", "8"))
/def -Fp100 -mregexp -t' uwaznie sledzi ruchy (.*) by trafiajac w (.*) (swym|swoja)  (.*) pozostawic bolesna rane\.' ra_spec_3_1 = \
  /return (_specuj("RA",{_spec_kolor_noz}, {PL}, {P1}, "3", "8", {P2}))
/def -Fp100 -mregexp -t' wykonuje pare oszczednych unikow starajac sie zmeczyc (.*) i gdy .* by zlapac oddech, wbija.*\.' ra_spec_3_2 = \
  /return (_specuj("RA",{_spec_kolor_noz}, {PL}, {P1}, "3", "8"))
/def -Fp100 -mregexp -t' poziomym cieciem swojego (.*) godzi w (.*), trafiajac w (.*) i wywolujac bolesny grymas na [^ ]+ twarzy\.' ra_spec_3_3 = \
  /return (_specuj("RA",{_spec_kolor_noz}, {PL}, {P2}, "3", "8", {P3}))
/def -Fp100 -mregexp -t' blyskawicznie wyrzuca przed siebie reke dzierzaca (.*) i trafiajac (.*) w (.*) pozostawia krwawiaca rane\.' ra_spec_4 = \
  /return (_specuj("RA",{_spec_kolor_noz}, {PL}, {P2}, "4", "8", {P3}))
/def -Fp100 -mregexp -t' zaciska mocniej palce na (.*) i paskudnie rani (.*), trafiajac [^ ]+ w (.*)\.' ra_spec_5 = \
  /return (_specuj("RA",{_spec_kolor_noz}, {PL}, {P2}, "5", "8", {P3}))
/eval /def -Fp100 -mregexp -t' wyprowadza (swym|swoja) (.*) pchniecie, celujac w %{hitlocs}(.*)\. Bron zaglebia sie az po rekojesc, a gdy (.*) wyciaga ja z rany, dostrzegasz, ze cala jest czerwona od krwi\.' ra_spec_6 = \
  /return (_specuj("RA",{_spec_kolor_noz}, {PL}, {P3}, "6", "8", {P2}))
/eval /def -Fp100 -mregexp -t' wyprowadza szybkie pchniecie (.*) i wbija go az po rekojesc w %{hitlocs} (.*)\. Gdy wyszarpuje swa bron, z potwornej rany momentalnie tryska krew\.' ra_spec_7_1 = \
  /return (_specuj("RA",{_spec_kolor_noz}, {PL}, {P3}, "7", "8", {P2}))
/def -Fp100 -mregexp -t' zwinnym, kocim ruchem przypada do ziemi, by nagle doskoczyc do (.*) i wyrzucajac blyskawicznie swa dlon dzierzaca (.*) wbic [^ ]+ w (.*) przeciwnika\. Nim cel zdazy sie otrzasnac z szoku, doprawia dziela silnym kopniakiem, odrzucajac [^ ]+ i wyciagajac swa bron z [^ ]+ ciala\. (.*) z trudem podnosi sie na nogi, a z potwornej rany natychmiast zaczyna plynac krew\.' ra_spec_7_2 = \
  /return (_specuj("RA",{_spec_kolor_noz}, {PL}, {P1}, "7", "8", {P3}))
/def -Fp100 -mregexp -t'( zrecznym ruchem paruje cios (.*), rownoczesnie zachodzac [^ ]+ od tylu. Starannie wymierzonym pchnieciem wbija (.*) w [^ ]+ plecy, tuz miedzy lopatkami. Oczy (.*) rozszeraja sie z bolu, gdy osuwa sie [^ ]+ z cichym jekiem na ziemie. Dla [^ ]+ to juz koniec walki\.|Unikajac uderzenia (.*), (.*) blyskawicznie doskakuje do [^ ]+ i wbija az po rekojesc swoj (.*) w [^ ]+ cialo. Na chwile zamiera w bezruchu, z satysfakcja obserwujac, jak z [^ ]+ ofiary uchodzi zycie. (.*) z cichym jekiem osuwa sie na ziemie, a (zabojca|zabojczyni) wyszarpuje swa bron z ciala i noga odsuwa zwloki na bok, rozgladajac sie za kolejnymi przeciwnikami\.|Wykorzystujac dekoncentracje i oslabienie (.*), (.*) silnym kopniakiem podcina [^ ]+, rownoczesnie wyrzucajac do przodu swa reke z (.*)\. Przeciwnik traci rownowage i osuwa sie na [^ ]+ bron, ta zas zaglebia sie w [^ ]+ cialo, odbierajac [^ ]+ ostatnie sily. (.*) z zimnym usmiechem wyciaga zakrwawiony (.*) z osuwajacego sie na ziemie ciala\.)' ra_spec_8 = \
  /return (_specuj("RA",{_spec_kolor_noz}, {PL}{P6}{P11}, {P2}{P5}{P10}, "8", "8"))
/def -Fp100 -mregexp -t' blyskawicznie skraca dystans dzielacy [^ ]+ od (.*) znaczac (swym|swoja)  (.*) (jego|jej) (.*) krwawa bruzda\.' ra_spec_4_2 = \
  /return (_specuj("RA",{_spec_kolor_noz}, {PL}, {P1}, "4", "8", {P4}))

#######################################################################################################################################################

; Miecznik 
; aktualizacja 20.07.10

/def -ag -p99 -mregexp -t'(Odpowiednio przenoszac ciezar ciala ciagnie cios dalej,|Przykleknawszy na jedno kolano prowadzi cios dalej,|Wykorzystujac dynamike ciosu przeciaga go jeszcze,|Korzystajac z dogodnego ustawienia przeciaga jeszcze cios,) muskajac (.*) samym sztychem broni.' miecznik+1 = \
  /echo -p @{n}%{PL}@{BCwhite}  -------> @{Cmagenta}[MIECZ+ 1/7]@{Cwhite} spec gratis w @{Cblue}%{P2}@{CWhite}.
/def -ag -p99 -mregexp -t'(Odpowiednio przenoszac ciezar ciala ciagnie cios dalej,|Przykleknawszy na jedno kolano prowadzi cios dalej,|Wykorzystujac dynamike ciosu przeciaga go jeszcze,|Korzystajac z dogodnego ustawienia przeciaga jeszcze cios,) lekko raniac (.*) samym sztychem broni.' miecznik+2 = \
  /echo -p @{n}%{PL}@{BCwhite}  -------> @{Cmagenta}[MIECZ+ 2/7]@{Cwhite} spec gratis w @{Cblue}%{P2}@{CWhite}.
/def -ag -p99 -mregexp -t'(Odpowiednio przenoszac ciezar ciala ciagnie cios dalej,|Przykleknawszy na jedno kolano prowadzi cios dalej,|Wykorzystujac dynamike ciosu przeciaga go jeszcze,|Korzystajac z dogodnego ustawienia przeciaga jeszcze cios,) raniac (.*) samym sztychem broni.' miecznik+3 = \
  /echo -p @{n}%{PL}@{BCwhite}  -------> @{Cmagenta}[MIECZ+ 3/7]@{Cwhite} spec gratis w @{Cblue}%{P2}@{CWhite}.

/def -ag -Fp100 -mregexp -t'( wyrzuca do przodu swoj| rusza do przodu,| poprawia chwyt na swym| niespodziewanie skreca tulow,|Nie zwazajac na nic (.*) rozpoczyna) .*, ktore tylko jakims cudem nie dosiega ([^.]*).' miecznik_0 = /echo -p @{BCwhite}-------> @{Cmagenta}[MIECZNIK 0/7] @{Cyellow}%{PL}%{P2} @{Cwhite}probuje specowac @{Cblue}%{P3}@{CWhite}.%; /substitute -p %{PR}
/def -ag -Fp100 -mregexp -t'( wyrzuca do przodu swoj| rusza do przodu,| poprawia chwyt na swym| niespodziewanie skreca tulow,|Nie zwazajac na nic (.*) rozpoczyna) .*, ktore tylko cudem nie dosiega twej twarzy.' miecznik_0_wemnie = /echo -p @{BCwhite}-------> @{Cmagenta}[MIECZNIK 0/7] @{Cyellow}%{PL}%{P2} @{Cwhite}probuje specowac @{Cblue}ciebie@{CWhite}.%; /substitute -p %{PR}

/def -ag -Fp100 -mregexp -t'( wyrzuca do przodu swoj| rusza do przodu,| poprawia chwyt na swym| niespodziewanie skreca tulow,|Nie zwazajac na nic (.*) rozpoczyna) .*, ktore szczesliwie zeslizguje sie po' miecznik_0_zbroja_wemnie = /echo -p @{BCwhite}-------> @{Cmagenta}[MIECZNIK 0/7] @{Cyellow}%{PL}%{P2} @{Cwhite}probuje specowac @{Cblue}ciebie@{CWhite} (zbroja).%; /substitute -p %{PR}
/def -ag -Fp100 -mregexp -t'( wyrzuca do przodu swoj| rusza do przodu,| poprawia chwyt na swym| niespodziewanie skreca tulow,|Nie zwazajac na nic (.*) rozpoczyna) .*, ktore jednak zeslizguje sie po [^ ]+ [^ ]+ [^ ]+ (.*)' miecznik_0_zbroja = /echo -p @{BCwhite}-------> @{Cmagenta}[MIECZNIK 0/7] @{Cyellow}%{PL}%{P2} @{Cwhite}probuje specowac @{Cblue}%{P3}@{CWhite} (zbroja).%; /substitute -p %{PR}

/def -ag -Fp100 -mregexp -t'( wyrzuca do przodu swoj| rusza do przodu,| poprawia chwyt na swym| niespodziewanie skreca tulow,|Nie zwazajac na nic (.*) rozpoczyna) .*, ktore ledwo zacina (.*) w ([^.]*).' miecznik_1 = /echo -p @{BCwhite}-------> @{Cmagenta}[MIECZNIK 1/7] @{Cyellow}%{PL}%{P2} @{Cwhite}specuje @{Cblue}%{P3} @{CWhite}(%{P4}).%; /substitute -p %{PR}
/def -ag -Fp100 -mregexp -t'( wyrzuca do przodu swoj| rusza do przodu,| poprawia chwyt na swym| niespodziewanie skreca tulow,|Nie zwazajac na nic (.*) rozpoczyna) .*, ktore bolesnie zacina (.*) w ([^.]*).' miecznik_2 = /echo -p @{BCwhite}-------> @{Cmagenta}[MIECZNIK 2/7] @{Cyellow}%{PL}%{P2} @{Cwhite}specuje @{Cblue}%{P3} @{CWhite}(%{P4}).%; /substitute -p %{PR}
/def -ag -Fp101 -mregexp -t'( wyrzuca do przodu swoj| rusza do przodu,| poprawia chwyt na swym| niespodziewanie skreca tulow,|Nie zwazajac na nic (.*) rozpoczyna) .*, ktore plytko tnie (.*) w ([^.]*).' miecznik_3 = /echo -p @{BCwhite}-------> @{Cmagenta}[MIECZNIK 3/7] @{Cyellow}%{PL}%{P2} @{Cwhite}specuje @{Cblue}%{P3} @{CWhite}(%{P4}).%; /substitute -p %{PR}
/def -ag -Fp100 -mregexp -t'( wyrzuca do przodu swoj| rusza do przodu,| poprawia chwyt na swym| niespodziewanie skreca tulow,|Nie zwazajac na nic (.*) rozpoczyna) .*, ktore tnie (.*) w ([^.]*).' miecznik_4 = /echo -p @{BCwhite}-------> @{Cmagenta}[MIECZNIK 4/7] @{Cyellow}%{PL}%{P2} @{Cwhite}specuje @{Cblue}%{P3} @{CWhite}(%{P4}).%; /substitute -p %{PR}
/def -ag -Fp100 -mregexp -t'( wyrzuca do przodu swoj| rusza do przodu,| poprawia chwyt na swym| niespodziewanie skreca tulow,|Nie zwazajac na nic (.*) rozpoczyna) .*, ktore gleboko tnie (.*) w ([^.]*).' miecznik_5 = /echo -p @{BCwhite}-------> @{Cmagenta}[MIECZNIK 5/7] @{Cyellow}%{PL}%{P2} @{Cwhite}specuje @{Cblue}%{P3} @{CWhite}(%{P4}).%; /substitute -p %{PR}
/def -ag -Fp100 -mregexp -t'( wyrzuca do przodu swoj| rusza do przodu,| poprawia chwyt na swym| niespodziewanie skreca tulow,|Nie zwazajac na nic (.*) rozpoczyna) .*, ktore niemalze rozcina (.*) (prawe ramie|lewe ramie|nogi|korpus|glowe).' miecznik_6 = /echo -p @{BCwhite}-------> @{Cmagenta}[MIECZNIK 6/7] @{Cyellow}%{PL}%{P2} @{Cwhite}specuje @{Cblue}%{P3} @{CWhite}(%{P4}).%; /substitute -p %{PR}
/def -ag -Fp100 -mregexp -t'( wyrzuca do przodu swoj| rusza do przodu,| poprawia chwyt na swym| niespodziewanie skreca tulow,|Nie zwazajac na nic (.*) rozpoczyna) .*, ktore z potworna moca tnie (.*) doslownie w pol.' miecznik_7 = /echo -p @{BCwhite}-------> @{Cmagenta}[MIECZNIK 7/7] @{Cyellow}%{PL}%{P2} @{Cwhite}specuje @{Cblue}%{P3}@{CWhite}.%; /substitute -p %{PR}

#######################################################################################################################################################

; Spec korsarzy
; Aktualizacja 05.05.11

/set _spec_kolor_bs=@{Cred}
;Niezgrabnym ruchem Ghardrima unika ciosu groznego kobolda, a jego rycerski poreczny toporek, wyrzucony w bok bardziej dla utrzymania rownowagi niz zadania ciosu, przecina tylko powietrze.

/def -Fp100 -mregexp -t'Niezgrabnym ruchem (.*) unika (twego ciosu|ciosu (.*)), a [^ ]+ ((.*) wyrzucony w bok|wyrzucony w bok (.*),) bardziej dla utrzymania rownowagi niz zadania ciosu, przecina tylko powietrze.' _korek_spec_0 = \
  /return (_specuj("BS",{_spec_kolor_bs}, {P1}, {P3-ciebie}, "0", "5", "pudlo"))
/def -Fp100 -mregexp -t' niezgrabnym ruchem probuje zaskoczyc (.*), ale [^ ]+ wyrzucony przed siebie (.*) dzga tylko powietrze\.' _korek_spec_0_v2 = \
  /return (_specuj("BS",{_spec_kolor_bs}, {PL}, {P1}, "0", "5", "pudlo"))
/def -Fp100 -mregexp -t' powolnym ruchem unika (twego ciosu|ciosu (.*)), jednoczesnie uderzajac ((cie)|[^ ]+) (swym|swoja) (.*), lecz niedogodna pozycja nie pozwala [^ ]+ na zbyt silny cios i zadaje (ci |)tylko nieznaczne obrazenia.' _korek_spec_1 = \
  /return (_specuj("BS",{_spec_kolor_bs}, {PL}, strcat({P2},{P4}), "1", "5"))
/def -Fp100 -mregexp -t' powolnym wypadem do przodu atakuje (.*) dzgajac [^ ]+ (swym|swoja) (.*), lecz niedogodna pozycja nie pozwala [^ ]+ na zbyt silny cios i zadaje tylko nieznaczne obrazenia.' _korek_spec_1_v2 = \
  /return (_specuj("BS",{_spec_kolor_bs}, {PL}, {P1}, "1", "5"))
  
;  Ghardrim oszczednym ruchem unika ciosu okrutnego kobolda, rabiac go rownoczesnie swym zdobionym bitewnym toporkiem, a uderzenie to otwiera szeroka rane na ciele jego przeciwnika.

  
/def -Fp100 -mregexp -t' oszczednym ruchem unika (twego ciosu|ciosu (.*)), rabiac ((cie)|[^ ]+) rownoczesnie (swym|swoja) (.*), a uderzenie to otwiera szeroka rane na (ciele jego przeciwnika|twoim ciele).' _korek_spec_2 = \
  /return (_specuj("BS",{_spec_kolor_bs}, {PL}, strcat({P2},{P4}), "2", "5"))
/def -Fp100 -mregexp -t' oszczednym wypadem do przodu atakuje (.*), dzgajac [^ ]+ (swym|swoja) (.*), a uderzenie to pozostawia gleboka rane w ciele [^ ]+ przeciwnika\.' _korek_spec_2_v2 = \
  /return (_specuj("BS",{_spec_kolor_bs}, {PL}, {P1}, "2", "5"))
/def -Fp100 -mregexp -t' zgrabnym ruchem unika (twego ciosu|ciosu (.*)) i korzystajac z dogodnej pozycji rabie ((cie)|[^ ]+) na odlew (swym|swoja) (.*), gleboko rozrywajac [^ ]+ cialo.' _korek_spec_3 = \
  /return (_specuj("BS",{_spec_kolor_bs}, {PL}, strcat({P2},{P4}), "3", "5"))
/def -Fp100 -mregexp -t' zgrabnym wypadem do przodu atakuje (.*) i korzystajac z zaskoczenia dzga [^ ]+ mocno (swym|swoja) (.*), gleboko wbijajac sie w [^ ]+ cialo.' _korek_spec_3_v2 = \
  /return (_specuj("BS",{_spec_kolor_bs}, {PL}, {P1}, "3", "5"))
/def -Fp100 -mregexp -t' plynnym ruchem unika (twego ciosu|ciosu (.*)) i uderzejac ze wszystkich sil tnie ((cie)|[^ ]+) (swym|swoja) (.*), (ktory|ktora) gleboko rozrywa [^ ]+ cialo, powodujac ogromne obrazenia.' _korek_spec_4 = \
  /return (_specuj("BS",{_spec_kolor_bs}, {PL}, strcat({P2},{P4}), "4", "5"))
/def -Fp100 -mregexp -t' plynnym wypadem do przodu atakuje (.*) i napierajac calym cialem dzga [^ ]+ (swym|swoja) (.*), (ktory|ktora) przechodzi prawie na wylot przez [^ ]+ cialo, powodujac ogromne obrazenia.' _korek_spec_4_v2 = \
  /return (_specuj("BS",{_spec_kolor_bs}, {PL}, {P1}, "4", "5"))
/def -Fp100 -mregexp -t' blyskawicznym polobrotem unika (twego ciosu|ciosu (.*)), a [^ ]+ (.*), dzierzon[y|a] w wyciagnietej rece, zatoczywszy szeroki luk uderza w ((cie)|[^ ]+) cialo i niemal kompletnie je rozdzierajac, wynurza sie z drugiej strony ciagnac za soba krwawy warkocz smierci.' _korek_spec_5 = \
  /return (_specuj("BS",{_spec_kolor_bs}, {PL}, strcat({P2},{P5}), "5", "5"))
/def -Fp100 -mregexp -t' blyskawicznym wypadem do przodu atakuje (.*), a [^ ]+ (.*), dzierzon[y|a] w wyciagnietej rece, trafia w [^ ]+ cialo przebijajac je na wylot. Gwaltownie wyszarpniety orez z glosnym mlasnieciem wychodzi z ciala ciagnac za soba krwawy warkocz smierci.' _korek_spec_5_v2 = \
  /return (_specuj("BS",{_spec_kolor_bs}, {PL}, {P1}, "5", "5"))


#######################################################################################################################################################

;     ---> PARTYZANCI - Komando Scoia'tael <---

/set _spec_kolor_sc=@{Cgreen}

; Atak z doskoku
/def -p200 -mregexp -t' probuje dosiegnac (.*) [^ ]+ [^ ]+ [^ ]+, jednak [^ ]+ bron nieznacznie chybia celu.' _sc_spec_0_pudlo = \
  /return (_specuj("SC",{_spec_kolor_sc}, {PL}, {P1}, "0", "7", "pudlo"))
/def -p200 -mregexp -t' (bez wysilku|bez zastanowienia|korzystajac z zamieszania|niezbyt celnie|niezbyt dokladnie|oszczednym ruchem|robiac oszczedny zamach|w pospiechu|w zamieszaniu|zbierajac sie w sobie|z doskoku|z lekkiego wymachu|z szybkiego doskoku) uderza (.*) [^ ]+ [^ ]+ [^ ]+, nieznacznie raniac [^ ]+ w (.*).' _sc_spec_1 = \
  /return (_specuj("SC",{_spec_kolor_sc}, {PL}, {P2}, "1", "7", {P3}))
/def -p200 -mregexp -t' (bez wysilku|bez zastanowienia|korzystajac z zamieszania|niezbyt celnie|niezbyt dokladnie|oszczednym ruchem|robiac oszczedny zamach|w pospiechu|w zamieszaniu|zbierajac sie w sobie|z doskoku|z lekkiego wymachu|z szybkiego doskoku) uderza (.*) [^ ]+ [^ ]+ [^ ]+, lekko raniac [^ ]+ w (.*).' _sc_spec_2 = \
  /return (_specuj("SC",{_spec_kolor_sc}, {PL}, {P2}, "2", "7", {P3}))
/def -p200 -mregexp -t' (bez wysilku|bez zastanowienia|korzystajac z zamieszania|niezbyt celnie|niezbyt dokladnie|oszczednym ruchem|robiac oszczedny zamach|w pospiechu|w zamieszaniu|zbierajac sie w sobie|z doskoku|z lekkiego wymachu|z szybkiego doskoku) uderza (.*) [^ ]+ [^ ]+ [^ ]+, bolesnie raniac [^ ]+ w (.*).' _sc_spec_3 = \
  /return (_specuj("SC",{_spec_kolor_sc}, {PL}, {P2}, "3", "7", {P3}))
/def -p200 -mregexp -t' (bez chwili namyslu|blyskawicznie skladajac sie do ciosu|blyskawicznie|dziko hallakujac|pewnym ruchem|plynnym ruchem|robiac szeroki zamach|szybko skladajac sie do ciosu|wrzeszczac na cale gardlo|w szalenczym porywie|zaciskajac z wysilku zeby|zbierajac sie w sobie|z grymasem wysilku|z szybkiego doskoku) uderza (.*) [^ ]+ [^ ]+ [^ ]+, powaznie raniac [^ ]+ w (.*).' _sc_spec_4 = \
  /return (_specuj("SC",{_spec_kolor_sc}, {PL}, {P2}, "4", "7", {P3}))
/def -p200 -mregexp -t' (bez chwili namyslu|blyskawicznie skladajac sie do ciosu|blyskawicznie|dziko hallakujac|pewnym ruchem|plynnym ruchem|robiac szeroki zamach|szybko skladajac sie do ciosu|wrzeszczac na cale gardlo|w szalenczym porywie|zaciskajac z wysilku zeby|zbierajac sie w sobie|z grymasem wysilku|z szybkiego doskoku) uderza (.*) [^ ]+ [^ ]+ [^ ]+, bardzo ciezko raniac [^ ]+ w (.*).' _sc_spec_5 = \
  /return (_specuj("SC",{_spec_kolor_sc}, {PL}, {P2}, "5", "7", {P3}))
/def -p200 -mregexp -t' (bez chwili namyslu|blyskawicznie skladajac sie do ciosu|blyskawicznie|dziko hallakujac|pewnym ruchem|plynnym ruchem|robiac szeroki zamach|szybko skladajac sie do ciosu|wrzeszczac na cale gardlo|w szalenczym porywie|zaciskajac z wysilku zeby|zbierajac sie w sobie|z grymasem wysilku|z szybkiego doskoku) uderza (.*) [^ ]+ [^ ]+ [^ ]+, potwornie raniac [^ ]+ w (.*).' _sc_spec_6 = \
  /return (_specuj("SC",{_spec_kolor_sc}, {PL}, {P2}, "6", "7", {P3}))
/def -p200 -mregexp -t' blyskawicznie doskakuje do (ledwie zywego|ledwo stojacego na nogach) (.*), bezlitosnie masakrujac [^ ]+ (.*)' _sc_spec_7 = \
  /return (_specuj("SC",{_spec_kolor_sc}, {PL}, {P2}, "7", "7", {P3}))

; Atak z zaskoczenia
; Aktualizacja 05.05.11
/def -p200 -mregexp -t' ubiegajac (twoja reakcje|reakcje (.*)) probuje zaskoczyc ((cie)|[^ ]+) blyskawicznym atakiem. Nieprecyzyjny cios (.*) minimalnie chybia jednak celu\.' _sc_zaskok_0_pudlo = \
  /return (_specuj("SC ZASKOK",{_spec_kolor_sc}, {PL}, strcat({P2},{P4}), "0", "2", "pudlo"))
/def -p200 -mregexp -t' raptownie rzuca sie na (.*), probujac zaskoczyc [^ ]+ blyskawicznym atakiem. Nieprecyzyjny cios (.*) chybia jednak celu, ocierajac sie tylko o (cialo ofiary|twoje cialo)\.' _sc_zaskok_0_pudlo_v2 = \
  /return (_specuj("SC ZASKOK",{_spec_kolor_sc}, {PL}, {P1}, "0", "6", "pudlo"))
/def -p200 -mregexp -t' uprzedzajac (twoja reakcje|reakcje (.*)) z wielkim pospiechem stara sie trafic ((cie)|[^ ]+) (.*), zaledwie muskajac [^ ]+ (w |)(.*)\.' _sc_zaskok_1 = \
  /return (_specuj("SC ZASKOK",{_spec_kolor_sc}, {PL}, strcat({P2},{P4}), "1", "2", {P7}))
/def -p201 -mregexp -t' uprzedzajac (twoja reakcje|reakcje (.*)) z wielkim pospiechem stara sie trafic ((cie)|[^ ]+) (.*), zaledwie muskajac [^ ]+ (w |)(.*)\. Rownie szybko' _sc_zaskok_2 = \
  /return (_specuj("SC ZASKOK",{_spec_kolor_sc}, {PL}, strcat({P2},{P4}), "2", "2", {P7}))
/eval /def -p200 -mregexp -t' (dopada (cie) blyskawicznym susem|blyskawicznym susem dopada zaskoczonego (.*)), ledwie (muskajac cie w|zahaczajac jego) %{hitlocs} (.*)\.' _sc_zaskok_1_v2 = \
  /return (_specuj("SC ZASKOK",{_spec_kolor_sc}, {PL}, strcat({P2},{P3}), "1", "6", {P5}))
/eval /def -p201 -mregexp -t' (dopada (cie) blyskawicznym susem|blyskawicznym susem dopada zaskoczonego (.*)), ledwie (muskajac cie w|zahaczajac jego) %{hitlocs} (.*)\. Niemal natychmiast uderza' _sc_zaskok_2_v2 = \
  /return (_specuj("SC ZASKOK",{_spec_kolor_sc}, {PL}, strcat({P2},{P3}), "2", "6", {P5}))
/def -p200 -mregexp -t' (wykorzystujac twoje zdezorientowanie momentalnie doskakuje do (ciebie),|momentalnie doskakuje do [^ ]+ (.*)) w biegu skladajac sie (do|co) ciosu. (Zawija|Zawijajac) z furkotem (.*)(, prowadzac| prowadzi) bron do (szybkiego uderzenia|dwoch szybkich uderzen), ktore (rania|rani) (cie|[^ ]+ przeciwnika) w (.*)\.' _sc_zaskok_4 = \
  /return (_specuj("SC ZASKOK",{_spec_kolor_sc}, {PL}, strcat({P2},{P3}), "3", "6", {P11}))
/def -p200 -mregexp -t' dziko hallakujac w ulamku sekundy zabiega ((cie) od tylu|od tylu calkowicie zaskoczonego (.*)) i z rozmachem (dzga|kluje|siecze|uderza) [^ ]+ (.*) w (.*)\. Prowadzon' _sc_zaskok_5 = \
  /return (_specuj("SC ZASKOK",{_spec_kolor_sc}, {PL}, strcat({P2},{P3}), "4", "6", {P6}))
/def -p200 -mregexp -t' z furia drapieznika rusza (to|do) ataku na ((ciebie)|zupelnie [^ ]+ (.*))\. (Katem oka widzisz jak tanczac|Tanczac) za [^ ]+ z (wyciagnieta|wyciagnietym|wyciagnietymi) ku gorze (.*) blyskawicznie wyprowadza (potezny cios, ktory wstrzasa|dwa potezne cio(s|)y, ktore wstrzasaja) calym (twoim cialem|cialem [^ ]+ przeciwnika)\.' _sc_zaskok_6 = \
  /return (_specuj("SC ZASKOK",{_spec_kolor_sc}, {PL}, strcat({P3},{P4}), "5", "6"))



#######################################################################################################################################################


; ZAKON

/def -Fp5 -P1xBCwhite -t'bierze potezny zamach .* (cios przeszywa powietrze)\\.$$' _zakon_spec_0 = /_psnr @{BCblue} ZS (0/5)
/def -Fp5 -P1xBCwhite -t'bierze potezny zamach .* (pozostawiajac na .* krwawiaca rane)\\.$$' _zakon_spec_1 = /_psnr @{BCblue} ZS (1/5)
/def -Fp5 -P1xBCwhite -t'bierze mocny zamach .* (pozostawiajac na .* krwawiaca rane)\\.$$' _zakon_spec_2 = /_psnr @{BCblue} ZS (2/5)
/def -Fp5 -P1xBCwhite -t'bierze potezny zamach .* (twarz .* zalewa strumien krwi)\\.$$' _zakon_spec_3 = /_psnr @{BCblue} ZS (3/5)
/def -Fp5 -P1xBCwhite -t'bierze potezny zamach .* (chwieje sie jeszcze przez chwile, probujac sie otrzasnac)\\.$$' \
			_zakon_spec_4 = /_psnr @{BCblue} ZS (4/5)
/def -Fp5 -P1xBCwhite -t'bierze potezny zamach .* (pada martw. na ziemie)\\.$$' _zakon_spec_5 = /_psnr @{BCblue} ZS (5/5)

#######################################################################################################################################################






