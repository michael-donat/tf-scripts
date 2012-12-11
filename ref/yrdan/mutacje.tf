; ## Linie dodane automagicznie   : tf_ver=1.1.5
; ## 
; ## Wersja pliku                 : 1.1.5
; ## Ostatnia zmiana pliku        : 2006-11-23 01:49:35
; ## Plik pobrany                 : 2008-06-04 00:12:04
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
; spisane przez Evina
; 04 XII 2002  
; poprawka widzenia siebie zrobione przez Ingwara
; poprawki efektywnosci dzialania i dodatkowe opisy 2004.09.03

/def -P0BCred -t'^Bialka (je(go|j)|twoich) oczu sa jednolicie czer(wo|ow)ne, zas teczowki wydaja sie byc wypelnione czerwonym ogniem\\.$$' _mutacje-oczyibialka
/def -P0BCred -t'^Cechuje (go|ja|cie) demoniczna uroda\\.$$' _mutacje-uroda
/def -P0BCred -t'^(Je(go|j)|Twoje) cialo jest przezroczyste \\.$$' _mutacje-przezroczystecialo
/def -P0BCred -t'^(Je(go|j)|Twoje) cialo pokryte jest otwartymi ranami\\.$$' _mutacje-ranynaciele
/def -P0BCred -t'^(Je(go|j)|Twoje) glowa zapadnieta jest w glab ciala\\.$$' _mutacje-glowazapadnieta
/def -P0BCred -t'^(Je(go|j)|Twoj) jezyk wydaje sie byc nieco obrzmialy\\.$$' _mutacje-obrzmialy_jezyk
/def -P0BCred -t'^(Je(go|j)|Twoj) jezyk wyraznie rozdwaja sie na koncu\\.$$' _mutacje-rozdwojony_jezyk
/def -P0BCred -t'^(Je(go|j)|Twoje) konczyny maja za duzo stawow\\.$$' _mutacje-stawy
/def -P0BCred -t'^(Je(go|j)|Twoja) lewa dlon ma szesc palcow\\.$$' _mutacje-palcel
/def -P0BCred -t'^(Je(go|j)|Twoje) oczy maja calkowicie czerwone teczowki\\.$$' _mutacje-teczowki
/def -P0BCred -t'^(Je(go|j)|Twoje) oczy pokryte sa siecia czerwonych plamek\\.$$' _mutacje-oczy
/def -P0BCred -t'^(Je(go|j)|Twoje) oczy wypelnione sa czerwonym, demonicznym ogniem\\.$$' _mutacje-ogien
/def -P0BCred -t'^(Je(go|j)|Twoja) (prawa|lewa) dlon ma szesc palcow\\.$$' _mutacje-palce
/def -P0BCred -t'^(Je(go|j)|Twoja) skora jest trupioblada\\.$$' _mutacje-skoratrupioblada
/def -P0BCred -t'^(Je(go|j)|Twoja) skora lekko swieci\\.$$' _mutacje-skoraswiecaca
/def -P0BCred -t'^(Je(go|j)|Twoja) skora ma w niektorych miejscach dziwny, zielonkawy odcien\\.$$' _mutacje-skorazielonkawa
/def -P0BCred -t'^(Je(go|j)|Twoja) skora pokryta jest ropiejacymi wrzodami\\.$$' _mutacje-wrzody
/def -P0BCred -t'^(Je(go|j)|Twoja) skora pokryta jest barwnymi piorami\\.$$' _mutacje-papuga
/def -P0BCred -t'^(Je(go|j)|Twoja) twarz zostala znieksztalcona w potworny sposob\\.$$' _mutacje-twarz
/def -P0BCred -t'^(Je(go|j)|Twoja) cialo jest doskonale przezroczyste\\.$$' _mutacje-cialoprzezroczyste
/def -P0BCred -t'^Ma(|sz) cale cialo pokryte malymi kolcami\\.$$' _mutacje-kolce
/def -P0BCred -t'^Ma(|sz) dlugi luskowaty ogon\\.$$' _mutacje-ogonek
/def -P0BCred -t'^Ma(|sz) dlugie krecone rogi\\.$$' _mutacje-rogi
/def -P0BCred -t'^Ma(|sz) wielkie, jakby kocie oczy\\.$$' _mutacje-kocieoczka
/def -P0BCred -t'^Ma(|sz) zwierzeca glowe\\.$$' _mutacje-glowazwierzeca
/def -P0BCred -t'^Na czole ma(|sz) dwa niewielkie, twardawe guzy\\.$$' _mutacje-guzy
/def -P0BCred -t'^Na czole ma(|sz) dwa twarde, ciemnobrazowe wybrzuszenia\\.$$' _mutacje-guzy-wybrzuszenia
/def -P0BCred -t'^Na (je(go|j)|twoim) ciele zauwazasz liczne, dodatkowe usta\\.$$' _mutacje-usta
/def -P0BCred -t'^Na (je(go|j)|twoim) ramieniu wyrasta druga glowa\\.$$' _mutacje-glowa
/def -P0BCred -t'^Na plecach ma(|sz) czarne, bloniaste skrzydla\\.$$' _mutacje-skrzydla
/def -P0BCred -t'^Otacza (go|ja|cie) roj much\\.$$' _mutacje-muchy
/def -P0BCred -t'^Po (je(go|j)|twoim) ciele pelzaja biale larwy\\.$$' _mutacje-larwy
/def -P0BCred -t'^Pokryt(y|a) jest(|es) metaliczna skora\\.$$' _mutacje-metalicznaskora
/def -P0BCred -t'^W (je(go|j)|twoich) oczach plonie ogien\\.$$' _mutacje-ognienwoczach
/def -P0BCred -t'^Z (je(go|j)|twoich) ust wystaja kly\\.$$' _mutacje-zebym
/def -P0BCred -t'^Zamiast dloni ma(|sz) ptasie szpony\\.$$' _mutacje-szpony
/def -P0BCred -t'^Zamiast stop ma(|sz) ptasie szpony\\.$$' _mutacje-pazurki
/def -P0BCred -t'^Zamiast twarzy ma(|sz) naga czaszke\\.$$' _mutacje-czaszka
/def -P0BCred -t'^Zamiast ust ma(|sz) ptasi dziob\\.$$' _mutacje-dziobek
/def -P0BCred -t'^(Je(go|j)|Twoje) (prawe|lewe) ramie znajduje sie duzo wyzej niz (prawe|lewe)\\.$$' _mutacje-ramie-wyzej
/def -P0BCred -t'^(Je(go|j)|Twoje) cialo w calosci pokryte jest futrem\\.$$' _mutacje-futro
/def -P0BCred -t'^Na srodku czola ma(|sz) trzecie oko\\.$$' _mutacje-trzecieoko

/def __mutacje = \
    /return substitute(strcat({P0}, "@{BCblue} <--- @{nCred}MC @{BCgreen}MUTACJA @{BCblue}---<"), "", 1)

/def __mutacje_edit_one = \
    /edit %{L} = /__mutacje
    
/def __mutacje_edit = \
    /quote -S /__mutacje_edit_one `/list -s _mutacje-*

/__mutacje_edit

