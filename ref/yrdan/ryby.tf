/echo -aBCgreen ========================================================
/echo -aBCgreen 	Mala pomoc przy lowieniu ryb by Amras ;)	
/echo -aBCgreen ========================================================

/f1 KotwiczkaNaWedke
/f2 HaczykNaWedke
/f3 Przyneta
/f4 ZarzucSiec




/def -P0bCbgwhite,Cred -F -t'Bierzesz prosta leszczynowa wedka zamach i zarzucasz ja daleko w wode.' ryby_lowienie=\
    /echo -aBCgreen ============================================================= %;\
    /f1 WyciagnijWedke%;\
    /echo -aBCgreen ============================================================= %;\


/def -P0bCbgwhite,Cred -F -t'Sznurek prostej leszczynowej wedki opada swobodnie na wode, zapewne zlapanej nan rybie udalo sie zerwac.' ryby1_lowienie=\
    /echo -aBCgreen ============================================================= %;\
    /f1 KotwiczkaNaWedke%;\
    /f2 HaczykNaWedke%;\
    /f3 WyciagnijWedke%;\
    /echo -aBCgreen ============================================================= %;\

/def -P0bCbgwhite,Cred -F -t'Chwytasz za prosta leszczynowa wedke i wyciagasz ja z wody.' ryby2_lowienie=\
    /echo -aBCgreen ============================================================= %;\
    /f1 ZarzucWedkePonownie%;\
    /echo -aBCgreen ============================================================= %;\

/def -P0bCbgwhite,Cred -F -t'Wyciagasz zlapana rybe na powierzchnie.' ryby3_lowienie=\
    /echo -aBCgreen ============================================================= %;\
    /f1 ZalozPrzyneteRybka%;\
    /f2 ZalozPrzyneteRobak%;\
    /echo -aBCgreen ============================================================= %;\

/def -P0bCbgwhite,Cred -F -t'Zawieszasz niewielka rybke na kotwiczce u prostej leszczynowej wedki.' ryby4_lowienie=\
    /echo -aBCgreen ============================================================= %;\
    /f1 ZarzucWedkePonownie %;\
    /echo -aBCgreen ============================================================= %;\

/def -P0bCbgwhite,Cred -F -t'Zawieszasz oslizglego robaka na haczyku u prostej leszczynowej wedki.' ryby7_lowienie=\
    /echo -aBCgreen ============================================================= %;\
    /f1 ZarzucWedkePonownie %;\
    /echo -aBCgreen ============================================================= %;\


/def -P0bCbgyellow,Cred -F -t'Nagle dostrzegasz, ze zanurzony w wodzie sznurek prostej leszczynowej wedki napina sie!' ryby5_lowienie=\
    /echo -aBCgreen ============================================================= %;\
    /f1 ZatnijRybe %;\
    /echo -aBCgreen ============================================================= %;\
    /beep

/def -P0bCbgwhite,Cred -F -t'A na czym chcesz powiesic przynete?' ryby6_lowienie=\
    /echo -aBCgreen ============================================================= %;\
    /f1 KotwiczkaNaWedke%;\
    /echo -aBCgreen ============================================================= %;\

/alias KotwiczkaNaWedke zaloz kotwiczke na wedke%;zaloz rybke na wedke%;zarzuc wedke
/alias WyciagnijWedke wyciagnij wedke
/alias ZatnijRybe zatnij rybe na wedce
/alias ZarzucWedkePonownie zarzuc wedke
/alias ZalozPrzyneteRybka zaloz rybke na wedke
/alias ZalozPrzyneteRobak wez robaka z pudelka%;zaloz robaka na wedke
/alias Przyneta wyciagnij siec%;zarzuc siec
/alias ZrzucSiec zarzuc siec
/alias HaczykNaWedke zawies haczyk na wedce
