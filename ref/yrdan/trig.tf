; ## Linie dodane automagicznie   : tf_ver=2.3.5
; ## 
; ## Wersja pliku                 : 2.3.5
; ## Ostatnia zmiana pliku        : 2009-01-06 21:07:40
; ## Plik pobrany                 : 2009-01-06 21:07:57
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
/require -q textutil.tf

/def -Fp1000 -mregexp -t"^(> )+" _wyrzuc_prompty_1 = /return substitute({PR})
;/def -Fp250 -mregexp -t"^([0-9]+\\])+" _wyrzuc_prompty_2 = /return substitute({PR})

;-------------------------------------------------------------------------------
;|                                WSPIERANIE                                   |
;-------------------------------------------------------------------------------

;wspieranie imienne - narazie lipa 
/def wes = \
    /set wspieranyM=%{1} %;\
    /set wspieranyB=%{2} %;\
    /set ogolne_wspieranie=1 %;\
    /wspieram %;\
    /_wsparcie_base

;to tez
/def niewes = \
    /unset wspieranyM %;\
    /unset wspieranyB %;\
    /set ogolne_wspieranie=0 %;\
    /wspieram %;\
    /_wsparcie_base


/def niewsp=/niews
/def niewspieraj=/niews
/def niews = \
    /set ogolne_wspieranie=0 %;\
    /wspieram %;\
    /_wsparcie_base


;    /let _wspierani_=$[strcat("(",substr({wspierany},0,strlen({wspierany})-1),"|",\
;                              substr({wspieranya},0,strlen({wspieranya})-1),"|",\
;			      substr({wspieranyb},0,strlen({wspieranyb})-1),"|",\
;			      substr({wspieranyc},0,strlen({wspieranyc})-1),")")] %;\


/def _wsparcie_base =\
    /purge _wspieranie_* %;\
    /if ({ogolne_wspieranie}==1 & _have_druzyna()) \
      /let _wspierani_=$[strcat({ogolne_leader-LEADER},"|",{ogolne_druzyna-DRUZYNA})] %;\
      /let _wspierani_b=$[strcat({ogolne_leader_bie-LEADER},"|",{ogolne_druzyna_bie-DRUZYNA})] %;\
      /let _wspierani_n=$[strcat({ogolne_leader_nar-LEADER},"|",{ogolne_druzyna_nar-DRUZYNA})] %;\
      /def -c95 -aB -mregexp -p8 -t'^(%{_wspierani_}) atakuje ' \
        _wspieranie_1 = /_wesprzyj 0 %;\
      /def -c95 -aB -mregexp -p8 -t'^(%{_wspierani_}) wspiera ' \
        _wspieranie_2 = /_wesprzyj 0 %;\
      /def -c95 -aB -mregexp -p8 -t'^(%{_wspierani_}) koncentruj(e|a) sie ' \
        _wspieranie_3 = /_wesprzyj 2 %;\
      /def -c95 -aB -mregexp -p8 -t'^(%{_wspierani_}) zabil' \
        _wspieranie_4 = /_wesprzyj 2 %;\
      /def -c95 -aB -mregexp -p8 -t' atakuje (%{_wspierani_b})' \
        _wspieranie_5 = /_wesprzyj 0 %;\
      /def -c95 -aB -mregexp -p8 -t' koncentruj(e|a) sie na walce z (%{_wspierani_n})' \
        _wspieranie_6 = /_wesprzyj 0 %;\
      /def -c95 -aB -p8 -t'Zabil?s *' \
        _wspieranie_7 = /_wesprzyj 2 %;\
      /def -c95 -aB -mregexp -p8 -t'^(%{_wspierani_}) bez zastanowienia rzuca sie w wir walki wspierajac' \
        _wspieranie_8 = /_wesprzyj 0 %;\
      /def -c95 -aB -mregexp -p8 -t'^(%{_wspierani_}) z okrzykiem ".*" na ustach, krecac ogromne mlynce swoim' \
        _wspieranie_9 = /_wesprzyj 0 %;\
      /def -c95 -aB -mregexp -p8 -t'^(%{_wspierani_}) wspiera cie w boju, rozpetujac zywiol' \
        _wspieranie_10 = /_wesprzyj 0 %;\
      /def -c95 -aB -mregexp -p8 -t'zachodza woalem rytualnego transu, gdy jak blyskawica rzuca sie on' \
        _wspieranie_11 = /_wesprzyj 0 %;\
      /def -c95 -aB -mregexp -p8 -t'^(%{_wspierani_}) z determinacja rzuca sie do walki, gotow za wszelka cene powstrzymac' \
        _wspieranie_12 = /_wesprzyj 0 %;\
      /def -c95 -aB -mregexp -p8 -t'^(%{_wspierani_}) wydaje z siebie dziki ryk i zapominajac o wlasnym bezpieczenstwie rzuca sie na' \
        _wspieranie_13 = /_wesprzyj 0 %;\
      /def -c95 -aB -mregexp -p8 -t'^(%{_wspierani_}) z imieniem .* na ustach atakuje' \
        _wspieranie_14 = /_wesprzyj 0 %;\
      /def -c95 -aB -mregexp -p8 -t'^(%{_wspierani_}) z bojowym okrzykiem na ustach rzuca sie na ' \
        _wspieranie_15 = /_wesprzyj 0 %;\
      /def -c95 -aB -mregexp -p8 -t'^(%{_wspierani_}) z determinacja i pewnoscia siebie unosi swoja bron i naciera na' \
        _wspieranie_16 = /_wesprzyj 0 %;\
      /def -c95 -aB -mregexp -p8 -t'^(%{_wspierani_}) wywijajac bronia na wszystkie strony rusza na' \
        _wspieranie_17 = /_wesprzyj 0 %;\
      /def -c95 -aB -mregexp -p8 -t'^(%{_wspierani_}) zaciska uchwyt na swej broni i rozpoczyna walke z' \
        _wspieranie_18 = /_wesprzyj 0 %;\
      /def -c95 -aB -mregexp -p8 -t'^(%{_wspierani_}) jednym susem pokonuje odleglosc dzielaca ' \
        _wspieranie_19 = /_wesprzyj 0 %;\
      /def -c95 -aB -p8 -t'* uciekl ci.' \
        _wspieranie_20 = /_wesprzyj 0 %;\
      /def -aB -p8 -t'Nikt z twojej druzyny nie jest zaangazowany w walke.' \
        _wspieranie_21 = /set nie_za_czesto=0 %;\
    /endif

/_wsparcie_base

/def _wesprzyj = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /if ({1}=~NULL) \
        wesprzyj %;\
    /else \
	/let _opoznienie_std=$[rand(({ogolne_opoznienie-3} + {1}) * 1000)/1000.0] %;\
        /repeat -%{_opoznienie_std} 1 wesprzyj %;\
    /endif

;/def wspieram =/wspierasz
;/def wspierasz = \
;    /_echo ### Wspierasz %{wspierany}, %{wspierany_leader}, %{wspierany_druzyna} ... ####

;------------------------------------------------------------------------------
;                                DRUZYNA I TAKIE TAM
;------------------------------------------------------------------------------
/def -Fp10 -mregexp -t' zaprasza cie do swojej druzyny\\.$$' _druzyna_zaprasza = \
    /fast_bind /d $(/_odmien_M_D %{PL})

/def -Fp10 -mregexp -t'((?<!na chwile )dolacza|dolaczasz|(?<!w boju, )dolaczajac) do ' _druzyna_trig_1 = \
    /druzyna

/def -Fp10 -mglob -t'*porzuca* druzyne*' _druzyna_trig_2 = \
    /druzyna

/def -Fp10 -mglob -t'*{rozwiazuje|rozwiazujesz} druzyne.' _druzyna_trig_3 = \
    /druzyna

/def -Fp10 -mglob -t'*zmusza* do opuszczenia druzyny.' _druzyna_trig_4 = \
    /druzyna

/def -Fp10 -mglob -t'* oddaje* sie pod rozkazy * zajmujac miejsce w szyku.' _druzyna_trig_5 = \
    /druzyna

/def -Fp10 -mglob -t'*przekazuje* prowadzenie druzyny*' _druzyna_trig_6 = \
    /druzyna

/def druzyna = \
    /_send_safe druzyna %;\
    /set ogolne_druzyna=DRUZYNA %;\
    /set ogolne_leader=LEADER %;\
    /purge __druzyna_tmp_* %;\
    /def -FaBg -p5 -t'Nie jestes w zadnej druzynie.' __druzyna_tmp_1= \
      /_ustaw_druzyne %;\
    /def -FaBg -p5 -mregexp -t'^Przewodzisz druzynie, w ktorej oprocz ciebie jest jeszcze ([^.]*)\\\\.$$' __druzyna_tmp_2a= \
      /set ogolne_druzyna=$$[tolower({P1})] %%;\
        /_ustaw_druzyne %;\
    /def -FaBg -p5 -mregexp -t'^Druzyne prowadzi (.*)( i oprocz ciebie (sa|jest) w niej jeszcze(: | )([^.]*)|, zas ty jestes jej jedynym czlonkiem)\\\\.$$' __druzyna_tmp_3a= \
      /set ogolne_leader=$$[tolower({P1})] %%;\
      /set ogolne_leader=$$[replace("[", "", ogolne_leader)] %%;\
      /set ogolne_leader=$$[replace("]", "", ogolne_leader)] %%;\
      /set ogolne_leader=$$[escape("\\\\",escape("()+*",{ogolne_leader}))] %%;\
      /set ogolne_leader_dop=$$(/_l_odmien D %%{ogolne_leader}) %%;\
      /set ogolne_leader_bie=$$(/_l_odmien B %%{ogolne_leader}) %%;\
      /set ogolne_leader_nar=$$(/_l_odmien N %%{ogolne_leader}) %%;\
      /set ogolne_druzyna=$$[tolower({P5-DRUZYNA})] %%;\
      /_ustaw_druzyne

/def _ustaw_druzyne = \
    /purge __druzyna_tmp_* %;\
;    /set ogolne_druzyna=$[strcat(toupper(substr({ogolne_druzyna},0,1)),substr({ogolne_druzyna},1))] %;\
    /set ogolne_druzyna=$[replace(" kleczacy na ziemi", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" kleczaca na ziemi", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" piszacy list", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" piszaca list", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" wygodnie siedzacy na lawie", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" wygodnie siedzaca na lawie", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" siedzacy na lawie", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" siedzaca na lawie", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" siedzacy na fotelu", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" siedzaca na fotelu", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace("[", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace("]", "", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(" i ", "|", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[replace(", ", "|", ogolne_druzyna)] %;\
    /set ogolne_druzyna=$[escape("\\",escape("()+*",{ogolne_druzyna}))] %;\
    /set ogolne_druzyna_dop=$(/_l_odmien D %{ogolne_druzyna}) %;\
    /set ogolne_druzyna_bie=$(/_l_odmien B %{ogolne_druzyna}) %;\
    /set ogolne_druzyna_nar=$(/_l_odmien N %{ogolne_druzyna}) %;\
    /status

/def _druzyna_base = \
    /_druzyna_follow %;\
    /_wsparcie_base %;\
    /_druzyna_licz %;\
    /_zaslona_trigs %;\
    /_zaslona_binds
;    /if (_have_druzyna()) \
;       /rstart -5 1 /_repeat_hkw %;\
;    /else \
;        /rstop /_repeat_hkw %;\
;    /endif

;/def _druzyna_kolorki =\
;    /purge _druzyna_hilite_* %;\
;    /def -p10 -FaCgreen -mregexp -t'^(?i)(%{ogolne_druzyna-DRUZYNA}) jest ' _druzyna_hilite_1 %;\
;    /def -p20 -FaBCgreen -mregexp -t'^(?i)(%{ogolne_leader-LEADER}) jest ' _druzyna_hilite_2 %;\
;    /def -p40 -FP2%{druzyna_kolorki1} -mregexp -t'(?i)(%{ogolne_druzyna-DRUZYNA}|%{ogolne_leader-LEADER}) (ledwo muska|lekko rani|rani|powaznie rani|masakruje)' _druzyna_hilite_3 %;\
;    /def -p40 -FP1%{druzyna_kolorki2} -mregexp -t'(?i)(ledwo muska|lekko rani|rani|powaznie rani|masakruje) (%{ogolne_druzyna-DRUZYNA}|%{ogolne_leader-LEADER})' _druzyna_hilite_4

;/_druzyna_kolorki

/def _druzyna_add_follow = \
    /def -p10 -a%{ogolne_color_info_fleader-B} -mregexp \
        -t'^(?i)%{1}\\\\[?%{ogolne_leader}]? %{2}' _druzyna_follow_%{_dr_last_id} = \
;        -t'^(?i)\\\\[?%{ogolne_leader}]? %{1}' _druzyna_follow_%{_dr_last_id} = \
            /_trig_do %{3} %;\
    /test ++_dr_last_id

/def _druzyna_follow = \
    /purge _druzyna_follow_* %;\
    /if ({ogolne_druzyna_sledzenie}==1 & _have_leader()) \
        /set _dr_last_id=0 %;\
        /test _druzyna_add_follow("", "zsiada ze statku\\\\\\\\.$$", "zsiadz ze statku") %;\
        /test _druzyna_add_follow("", "wsiada na statek\\\\\\\\.$$", "/v") %;\
        /test _druzyna_add_follow("", "majstruje cos przy sciane\\\\\\\\.$$", "/pc") %;\
        /test _druzyna_add_follow("", "poklonil sie statui\\\\\\\\.$$", "/ocs") %;\
        /test _druzyna_add_follow("", "podaza przeskakujac przez mur\\\\\\\\.$$", "wespnij sie na mur") %;\
        /test _druzyna_add_follow("", ".*wsiada do.*stojacego dylizansu\\\\\\\\.$$", "/dyl") %;\
        /test _druzyna_add_follow("", "podaza w kierunku wodospadu\\\\\\\\.$$", "/wod") %;\
        /test _druzyna_add_follow("", "kieruje sie w strone krzakow i po chwili daje w nie nura, niknac ci z oczu.*", "wejdz w krzaki") %;\
        /test _druzyna_add_follow("", "podaza do kurhanu\\\\\\\\.$$", "wejdz do kurhanu") %;\
        /test _druzyna_add_follow("", "wspina sie na gore\\\\\\\\.", "wespnij sie na gore") %;\
        /test _druzyna_add_follow("", "rusza w strone kurhanu, przedzierajac sie przez lapiace go cierniami krzaki. N", "wejdz w krzaki") %;\
        /test _druzyna_add_follow("", "kleka przy wale(,|) i odgarniajac reka suche trawy(,|) odnajduje otwor prowadzacy w dol", "wejdz w otwor") %;\
        /test _druzyna_add_follow("", "staje niepewnie na kamiennej plycie, i nagle zapada sie w dol! Po chwili", "wejdz na plyte") %;\
        /test _druzyna_add_follow("", "podaza do wyjscia\\\\\\\\.$$", "wyjscie") %;\
        /test _druzyna_add_follow("", "podaza przeciskajac sie pomiedzy beczkami do otworu", "przeslizgnij sie miedzy beczkami") %;\
        /test _druzyna_add_follow("", "wchodzi na drzewo\\\\\\\\.$$", "wejdz na dzewo") %;\
        /test _druzyna_add_follow("", "podaza przez lustro wodospadu na zewnatrz\\\\\\\\.$$", "przejdz przez wodospad") %;\
        /test _druzyna_add_follow("", "podaza do pieczary szefa\\\\\\\\.$$", "wejdz do pieczary") %;\
        /test _druzyna_add_follow("", "podaza w szczeline\\\\\\\\.$$", "wejdz w szczeline") %;\
        /test _druzyna_add_follow("", "podaza w otworze\\\\\\\\.$$", "zejdz na dol") %;\
        /test _druzyna_add_follow("", "przywiera plasko do posadzki i ryjac nosem w pokrywajacym ja piachu, posuwa sie na poludnie", "przeczolgaj sie na poludnie") %;\
        /test _druzyna_add_follow("", "przywiera plasko do posadzki i ryjac nosem w pokrywajacym ja piachu, posuwa sie na polnoc", "przeczolgaj sie na polnoc") %;\
        /test _druzyna_add_follow("", "podchodzi do szczeliny w skale i znika w jej wnetrzu\\\\\\\\.$$", "zsun sie na dol") %;\
        /test _druzyna_add_follow("", "napina sie i probuje podwazyc jeden z glazow, ktory po chwili ustepuje ujawniajac spora", "podwaz czarny glaz") %;\
        /test _druzyna_add_follow("", "wskazuje na czarny (glaz|kamien)\\\\\\\\.$$", "podwaz czarny glaz") %;\
        /test _druzyna_add_follow("", "pewnie lapie za zwisajace liny i zaczyna wspinac sie do gory. Po chwili", "wespnij sie po linach") %;\
        /test _druzyna_add_follow("", "podchodzi do szybu i pewnie lapie za zwisajace liny, by po chwili zsunac sie", "zsun sie po linie") %;\
        /test _druzyna_add_follow("", "zaczyna szybko wdrapywac sie po scianie. Po chwili znika za zalomem", "wdrap sie na sciezke") %;\
        /test _druzyna_add_follow("", "wchodzi do szczeliny miedzy glazami i znika w jej mroku\\\\\\\\.$$", " przecisnij sie przez szczeline") %;\
        /test _druzyna_add_follow("", "zmierza w kierunku otworu, by po chwile zniknac w jego czelusciach\\\\\\\\.$$", "wejdz w otwor") %;\
;        /test _druzyna_add_follow("", "stuka w skale", "zapukaj w skale") %;\
        /test _druzyna_add_follow("", "znika w kepie krzakow\\\\\\\\.$$", "wejdz w krzaki") %;\
        /test _druzyna_add_follow("", "wskoczyl(|a|o) na tratwe\\\\\\\\.$$", "wejdz na tratwe") %;\
        /test _druzyna_add_follow("", "lapie za korzen i szybko wspina sie po skale. Po chwili wciaga sie na", "wdrap sie po korzeniu") %;\
        /test _druzyna_add_follow("", "wspina sie po scianie jaru", "wespnij sie po scianie") %;\
        /test _druzyna_add_follow("", "wchodzi po trapie na poklad galeonu", "/v") %;\
        /test _druzyna_add_follow("", "przywiera plasko do ziemi i wczolguje sie w szczeline", "przecisnij sie przez szczeline") %;\
        /test _druzyna_add_follow("", "wskakuje na poklad promu\\\\\\\\.$$", "wejdz na prom") %;\
        /test _druzyna_add_follow("", "schodzi na brzeg\\\\\\\\.$$", "zejdz na brzeg") %;\
        /test _druzyna_add_follow("", "podaza do krypty\\\\\\\\.$$", "wejdz do grobowca") %;\
        /test _druzyna_add_follow("", "podaza do grobowca\\\\\\\\.$$", "wejdz do grobowca") %;\
        /test _druzyna_add_follow("", "podaza do mauzoleum\\\\\\\\.$$", "wejdz do grobowca") %;\
        /test _druzyna_add_follow("", "zaczyna wspinac sie na gore\\\\\\\\.$$", "wespnij sie na gore") %;\
        /test _druzyna_add_follow("", "zaczyna schodzic na dol\\\\\\\\.$$", "zejdz na dol") %;\
        /test _druzyna_add_follow("", "schodzi z pokladu tratwy\\\\\\\\.$$", "zejdz z tratwy") %;\
        /test _druzyna_add_follow("", "zeskoczyl z tratwy\\\\\\\\.$$", "zejdz z tratwy") %;\
        /test _druzyna_add_follow("", "wskakuje na (poklad tratwy|tratwe)\\\\\\\\.$$", "wejdz na tratwe") %;\
        /test _druzyna_add_follow("", "bierze rozped i z latwoscia przeskakuje nad zaglebieniem podazajac na p(olnoc|oludnie)\\\\\\\\.$$", "przeskocz nad zaglebieniem") %;\
        /test _druzyna_add_follow("", "znika w otworze\\\\\\\\.$$", "wejdz do otworu") %;\
        /test _druzyna_add_follow("", "podaza przez iluzoryczna sciane\\\\\\\\.$$", "wejdz w sciane") %;\
        /test _druzyna_add_follow("", "bierze rozbieg i przeskakuje wyrwe\\\\\\\\.$$", "przeskocz wyrwe") %;\
        /test _druzyna_add_follow("", "ostroznie wchodzi na most i powoli podaza w kierunku jego srodka\\\\\\\\.$$", "wejdz na most") %;\
        /test _druzyna_add_follow("", "zsuwa sie po skarpie\\\\\\\\.$$", "zejdz na dol") %;\
        /test _druzyna_add_follow("", "ostroznie schodzi na dol lapiac sie kolejnych szczebli drabiny\\\\\\\\.$$", "/op %%%; zejdz po drabinie %%%; /db") %;\
        /test _druzyna_add_follow("", "ostroznie wchodzi do gory lapiac sie kolejnych (palikow|szczebli drabiny)\\\\\\\\.$$", "/op %%%; wejdz po drabinie %%%; /db") %;\
        /test _druzyna_add_follow("", "niespodziewanie znika z twoich oczu\\\\\\\\.$$", "wcisnij zapadke") %;\
        /test _druzyna_add_follow("", "znika w wyrwie\\\\\\\\.$$", "wejdz do wyrwy") %;\
        /test _druzyna_add_follow("", "nurkuje i przeplywa na poludnie\\\\\\\\.$$", "przeplyn na poludnie") %;\
        /test _druzyna_add_follow("", "nurkuje i przeplywa na polnoc\\\\\\\\.$$", "przeplyn na polnoc") %;\
        /test _druzyna_add_follow("", "znika w porastajacych krawedz traktu krzakach\\\\\\\\.$$", "wejdz w krzaki") %;\
        /test _druzyna_add_follow("", "przechodzi przez iluzje sciany\\\\\\\\.$$", "przejdz przez wneke") %;\
        /test _druzyna_add_follow("", "przechodzi przez wneke\\\\\\\\.$$", "przejdz przez wneke") %;\
        /test _druzyna_add_follow("", "podaza na pien\\\\\\\\.$$", "wejdz na pien") %;\
        /test _druzyna_add_follow("", "pokonujac zarastajace droge zarosla wchodzi do wnetrza spalonej chaty\\\\\\\\.$$", "wejdz do chaty") %;\
        /test _druzyna_add_follow("", "wdrapuje sie na skalna polke.", "wdrap sie na polke") %;\
        /test _druzyna_add_follow("", "smialo zaczyna schodzic w dol i po chwili znika ci z oczu\\\\\\\\.$$", "zejdz na dol") %;\
        /test _druzyna_add_follow("", "zrecznie wspina sie na znajdujaca sie powyzej polke skalna.", "wdrap sie na glaz %%%; wespnij sie na skarpe") %;\
        /test _druzyna_add_follow("", "schodzi po trapie na lad\\\\\\\\.$$", "zejdz na brzeg") %;\
        /test _druzyna_add_follow("", "schodzi po drabince na dol\\\\\\\\.$$", "zejdz po drabince") %;\
        /test _druzyna_add_follow("", "wspina sie w gore po stalowej drabince wiodacej na szczyt...$$", "wejdz po drabince") %;\
        /test _druzyna_add_follow("", "przeciska sie przez szczeline\\\\\\\\.$$", "przecisnij sie przez szczeline") %;\
        /test _druzyna_add_follow("", "wchodzi do jaskini\\\\\\\\.$$", "wejdz do jaskini") %;\
        /test _druzyna_add_follow("", "przeskakuje przez wyrwe\\\\\\\\.$$", "przeskocz wyrwe") %;\
        /test _druzyna_add_follow("", "spoglada na dol i ostroznie zsuwa sie tam\\\\\\\\.$$", "zejdz na dol") %;\
        /test _druzyna_add_follow("", "wchodzi po schodach na gore i niknie ci z oczu\\\\\\\\.$$", "wejdz po schodach") %;\
        /test _druzyna_add_follow("", "uklada sie w sarkofagu. Po chwili wieko zasuwa sie\\\\\\\\.$$", "otworz sarkofag %%%; wejdz do sarkofagu") %;\
        /test _druzyna_add_follow("", "przeskakuje przez krawedz studni i znika z twych oczu\\\\\\\\.$$", "wejdz do studni %%%; przecisnij sie przez otwor") %;\
        /test _druzyna_add_follow("", "pochyla sie i czolgajac probuje przecisnac sie przez otwor w murze... po chwili znika ci z oczu\\\\\\\\.$$", "przecisnij sie przez otwor") %;\
        /test _druzyna_add_follow("", "wsuwa sie do grobowca\\\\\\\\.$$", "wejdz do grobowca") %;\
        /test _druzyna_add_follow("", "znika nagle w jednej ze scian\\\\\\\\.$$", "wejdz w sciane") %;\
        /test _druzyna_add_follow("", "znika nagle\\\\\\\\.$$", "wcisnij plaskorzezbe") %;\
        /test _druzyna_add_follow("", "przesuwa plyte i wydostaje sie przez otwor w suficie na gore. Kamien zatrzaskuje sie za nim z cichym zgrzytem\\\\\\\\.$$", "przesun plyte") %;\
        /test _druzyna_add_follow("", "otwiera klape i wydostaje sie przez otwor w suficie na gore. Przejscie zatrzaskuje sie za nia z hukiem\\\\\\\\.$$", "otworz klape") %;\
        /test _druzyna_add_follow("", "wciskajac sie pod sciane wawozu\\\\\\\\.$$", "przejdz za glazy") %;\
        /test _druzyna_add_follow("", "przez strumien na drugi brzeg koryta\\\\\\\\.$$", "przejdz przez strumien") %;\
        /test _druzyna_add_follow("", "chwyta za jeden z konarow i zaczyna przesuwac pien\\\\\\\\.$$", "przesun pien") %;\
        /test _druzyna_add_follow("", "(?:z pewnymi obawami )?wchodzi na przewieszony nad przepascia most linowy\\\\\\\\.$$", "wejdz na most") %;\
        /test _druzyna_add_follow("", "chwyta mocno line i powoli zsuwa sie w dol\\\\\\\\.$$", "zejdz po linie") %;\
        /test _druzyna_add_follow("", "chwyta mocno line i zaczyna sie powoli wspinac w gore\\\\\\\\.$$", "wespnij sie po linie") %;\
        /test _druzyna_add_follow("", "wchodzi do czerwonego wozu\\\\\\\\.$$", "wejdz do czerwonego wozu") %;\
        /test _druzyna_add_follow("", "powoli wspina sie do gory\\\\\\\\.$$", "wespnij sie po glazach %%%; wespnij sie po scianie") %;\
        /test _druzyna_add_follow("", "pewnym krokiem i bez obaw wchodzi na przewieszony nad przepascia most linowy\\\\\\\\.$$", "wejdz na most") %;\
        /test _druzyna_add_follow("", "ostroznie zsuwa sie w dol\\\\\\\\.$$", "zsun sie na dol") %;\
        /test _druzyna_add_follow("", "przeciska sie przez znajdujaca sie w .* sciane szczeline\\\\\\\\.$$", "przecisnij sie przez szczeline") %;\
        /test _druzyna_add_follow("", "biorac krotki rozbieg wskakuje na kamienny most\\\\\\\\.$$", "wskocz na most") %;\
        /test _druzyna_add_follow("", "lapiac sie wystajacych odlamkow skalnych schodzi w dol\\\\\\\\.$$", "zejdz na dol") %;\
        /test _druzyna_add_follow("", "bierze rozbieg i przeskakuje szczeline\\\\\\\\.$$", "przeskocz szczeline") %;\
        /test _druzyna_add_follow("", "podaza na poklad dwumasztowego nilfgaardzkiego statku\\\\\\\\.$$", "/vnilf") %;\
        /test _druzyna_add_follow("", "z widocznym wysilkiem wspina sie na widniejaca w gorze polke skalna\\\\\\\\.$$", "wespnij sie na polke") %;\
        /test _druzyna_add_follow("", "zeskakuje z mostu ladujac na waskiej polce skalnej\\\\\\\\.$$", "wskocz na polke") %;\
        /test _druzyna_add_follow("", "rusza w kierunku przegradzajacych droge glazow i znika za jednym z nich, wciskajac sie pod sciane wawozu\\\\\\\\.$$", "przejdz za glazy") %;\
        /test _druzyna_add_follow("", "spycha jedno z czolen na wode i przeplywa w nim na drugi brzeg rzeki\\\\\\\\.$$", "przepraw sie przez rzeke") %;\
        /test _druzyna_add_follow("", "zaczyna wspinac sie na szczyt\\\\\\\\.$$", "wespnij sie na szczyt") %;\
        /test _druzyna_add_follow("", "zaczyna schodzic na polke\\\\\\\\.$$", "zejdz na polke") %;\
        /test _druzyna_add_follow("", "chwyta mocno lancuch i powoli zsuwa sie w dol\\\\\\\\.$$", "zejdz po lancuchu") %;\
        /test _druzyna_add_follow("", "chwyta mocno line i powoli zsuwa sie w dol\\\\\\\\.$$", "zejdz po linie") %;\
        /test _druzyna_add_follow("", "chwyta mocno lancuch i zaczyna powoli wspinac sie w gore\\\\\\\\.$$", "wespnij sie po lancuchu") %;\
        /test _druzyna_add_follow("", "chwyta mocno line i zaczyna powoli wspinac sie w gore\\\\\\\\.$$", "wespnij sie po linie") %;\
        /test _druzyna_add_follow("", "na kleczkach wchodzi do jamy\\\\\\\\.$$", "wejdz do jamy") %;\
        /test _druzyna_add_follow("", "podchodzi do szczeliny we wschodniej scianie i szamotajac sie przez moment znika w jej wnetrzu\\\\\\\\.$$", "przecisnij sie przez szczeline") %;\
        /test _druzyna_add_follow("", "chwyta ukrytych za miniaturowym wodospadem wystepow skalnych po czym wspina sie na sama gore niknac w znajdujacym sie tam tunelu\\\\\\\\.$$", "wespnij sie po scianie") %;\
        /test _druzyna_add_follow("", "chwytajac sie skalnych ostepow ostroznie schodzi w dol\\\\\\\\.$$", "zejdz po scianie") %;\
        /test _druzyna_add_follow("", "z widocznym na twarzy trudem przeciska sie przez szczeline\\\\\\\\.$$", "przecisnij sie przez szczeline") %;\
        /test _druzyna_add_follow("", "przeskakuje przez przepasc\\\\\\\\.$$", "przeskocz przez przepasc") %;\
        /test _druzyna_add_follow("", "wchodzi do szczeliny by po chwili zniknac w jej wnetrzu\\\\\\\\.$$", "przecinij sie przez szczeline") %;\
        /test _druzyna_add_follow("", "kladac sie na ziemi przeciska sie przez waski otwor\\\\\\\\.$$", "wejdz do tunelu") %;\
        /test _druzyna_add_follow("", "ostronie zsuwa sie w dol\\\\\\\\.$$", "zejdz na dol") %;\
        /test _druzyna_add_follow("", "chwytajac sie wystajacych glazow nie bez wysilku wspina sie na skarpe\\\\\\\\.$$", "wespnij sie po scianie") %;\
        /test _druzyna_add_follow("", "wchodzi do baszty\\\\\\\\.$$", "wejdz do baszty") %;\
        /test _druzyna_add_follow("", "ostroznie wspina sie do gory\\\\\\\\.$$", "wespnij sie po skale") %;\
        /test _druzyna_add_follow("", "zaczyna powoli schodzic w dol\\\\\\\\.$$", "zejdz po glazach") %;\
        /test _druzyna_add_follow("", "otwiera klape i wydostaje sie przez otwor w suficie na gore. Przejscie zatrzaskuje sie za nim z hukiem\\\\\\\\.$$", "otworz klape") %;\
        /test _druzyna_add_follow("", "spuszczajac nogi w szczeline siada na ziemi, by po chwili zniknac w otworze\\\\\\\\.$$", "przecisnij sie przez szczeline") %;\
;Nie zwazajac na wzbudzona przez niego lawine kamieni, Grrid wspina sie na sama gore.
        /test _druzyna_add_follow("Nie zwazajac na wzbudzona przez niego lawine kamieni, ", "wspina sie na sama gore\\\\\\\\.$$", "wespnij sie na gore") %;\
;Pociagajac za soba lawine niewielkich kamieni Grrid zsuwa sie na dol, by po chwili stanac u stop gory. zsun sie na dol
        /test _druzyna_add_follow("Pociagajac za soba lawine niewielkich kamieni ", "zsuwa sie na dol, by po chwili stanac u stop gory\\\\\\\\.$$", "zsun sie na dol") %;\
        /test _druzyna_add_follow("", "podchodzi do szczeliny i zaczyna schodzic w dol\\\\\\\\.$$", "wejdz do szczeliny") %;\
        /test _druzyna_add_follow("", "podchodzi do sciany i zaczyna powoli sie wspinac\\\\\\\\.$$", "wespnij sie na gore") %;\
        /test _druzyna_add_follow("", "bez trudu wchodzi na podest... traci rownowage z niewiadomego powodu... i znika w akompaniamencie gluchych trzaskow\\\\\\\\.$$", "wejdz na podest") %;\
;        /test _druzyna_add_follow("", "\\\\\\\\.$$", "") %;\
;        /test _druzyna_add_follow("", "\\\\\\\\.$$", "") %;\
;        /test _druzyna_add_follow("", "\\\\\\\\.$$", "") %;\
;        /test _druzyna_add_follow("", "\\\\\\\\.$$", "") %;\
;        /test _druzyna_add_follow("", "\\\\\\\\.$$", "") %;\
;        /test _druzyna_add_follow("", "\\\\\\\\.$$", "") %;\
;        /test _druzyna_add_follow("", "\\\\\\\\.$$", "") %;\
;        /test _druzyna_add_follow("", "\\\\\\\\.$$", "") %;\
        /unset _dr_last_id %;\
;        /_druzyna_edycja %;\
    /endif



; macro chwilowo nieuzywane.. zostalo for skoleniowe purposes only :)
/def _druzyna_edycja = \
    /let _i_=0 %;\
    /while \
      /test ++_i_ %;\
      /ismacro _druzyna_follow_%{_i_} %;\
      ( {?} > 0 ) \
      /_edytuj _druzyna_follow_%{_i_} /repeat -$$(/rand 2 5) 1 %;\
    /done
   
/def _edytuj = \
    /edit %{1} = %{-1} ${%{1}}

/_druzyna_follow

/def _make_move = \
    /set last_move=$[_kier_l_to_s({*})] %;\
    /set last_move_rev=$[_kier_przeciwny({last_move})]

/def _przybywa_licz = \
    /if (ogolne_druzyna_sprawdzaj_stan) \
        /return substitute(strcat("@{nCblue}[ @{nBCwhite}", {1}, "@{nCblue} ] @{n}", {PL}, {P0}, {PR}), "x", 1) %;\
    /endif

;Wraz z Gozerem, Yanna, Vaspasem, Szarelem, Kilim, Hunvertem, Vixa, Hastamerem, Yagraalem, Camarisem, Mauroisem, Gumgrinem, Broarem, Garimem i Jona podazasz za Zandarem na poludnie.
;Podazasz za Bargianem na zachod.
;Loreandel i Yerhilliaeh przybywaja za toba ze wschodu.

/def _druzyna_licz = \
    /purge _druzyna_licz_* %;\
    /if (_have_druzyna()) \
        /if (!_have_leader()) \
            /def -p10 -F -mregexp -t' przybywa(?:ja|) za toba ze? (.*)\\\\.$$' _druzyna_licz_1 = \
                /_druzyna_podlicz_szef %;\
        /else \
            /def -p10 -F -mregexp -t'^(?:wraz z (.*) |)podazasz (?:skradajac sie |)za .* na (.*)\\\\.$$' _druzyna_licz_2 = \
                /_druzyna_podlicz_dr %;\
        /endif %;\
    /endif

/_druzyna_licz

/def _druzyna_podlicz_szef = \
    /_zaslona_unset_all %;\
    /let _doszlo=%{PL} %;\
;    /echo Doszlo %{_doszlo} %;\
;    /let _doszlo=$[strcat(replace(" i ", ", ", {doszlo}), ", ")] %;\
    /let _tmp=%{ogolne_druzyna}| %;\
;    /echo TMP %{_tmp} %;\
    /let _sum=0 %;\
    /while /let i=$[strstr({_tmp},"|")] %;/@test i>-1 %;/do \
        /let _name=$[substr({_tmp},0,i)] %;\
        /let _tmp=$[substr({_tmp},i+1)] %;\
;        /echo Imie %{_name} %;\
        /if ({_doszlo} !/ strcat("*", {_name}, "*")) \
            /let _brak=%{_brak} %{_name}%;\
        /else \
            /let _sum=$[_sum + 1] %;\
        /endif %;\
    /done %;\
    /if (ogolne_druzyna_sprawdzaj_stan & _brak !~ NULL) \
        /_echo %;\
        /echo -p -aCgreen Uwaga!! Nie przyszedl za toba@{BCblue}%{_brak}@{nCgreen}!! %;\
        /_echo %;\
    /endif %;\
    /_przybywa_licz $[_sum + 1]

/def _druzyna_podlicz_dr = \
    /let _doszlo=%{P1} %;\
    /_make_move %{P2} %;\
    /_zaslona_unset_all %;\
    /if (_doszlo =~ NULL) \
        /_przybywa_licz 2 %;\
        /return %;\
    /endif %;\
;    /echo Doszlo %{_doszlo} %;\
;    /let _doszlo=$[strcat(replace(" i ", ", ", {doszlo}), ", ")] %;\
    /let _tmp=%{ogolne_druzyna_nar}| %;\
;    /echo TMP %{_tmp} %;\
    /let _sum=0 %;\
    /while /let i=$[strstr({_tmp},"|")] %;/@test i>-1 %;/do \
        /let _name=$[substr({_tmp},0,i)] %;\
        /let _tmp=$[substr({_tmp},i+1)] %;\
;        /echo Imie %{_name} %;\
        /if ({_doszlo} !/ strcat("*", {_name}, "*")) \
            /let _brak=%{_brak} %{_name}%;\
        /else \
            /let _sum=$[_sum + 1] %;\
        /endif %;\
    /done %;\
    /if (ogolne_druzyna_sprawdzaj_stan == 2 & {_brak} !~ NULL) \
        /echo %;\
        /echo -p -aCgreen Uwaga!! Nie przyszedl z toba@{BCblue}%{_brak}@{nCgreen}!! %;\
        /echo %;\
    /endif %;\
    /_przybywa_licz $[_sum + 2]

/def status = \
    /if ({*}=/"on") \
        /set ogolne_druzyna_sledzenie=1 %;\
        /set ogolne_wspieranie=1 %;\
        /set ogolne_druzyna_sprawdzaj_stan=1 %;\
        /set ogolne_zaslona=1 %;\
    /elseif ({*}=/"off") \
        /set ogolne_druzyna_sledzenie=0 %;\
        /set ogolne_wspieranie=0 %;\
        /set ogolne_druzyna_sprawdzaj_stan=0 %;\
        /set ogolne_zaslona=0 %;\
    /endif %;\
    /_druzyna_base %;\
    /if ({ogolne_wspieranie}==1) \
        /let _dru_wspieram=@{BCyellow}on@{nCgreen} %;\
    /else \
        /let _dru_wspieram=@{BCred}off@{nCgreen} %;\
    /endif %;\
    /if ({ogolne_druzyna_sledzenie}==1) \
        /let _dru_follow=@{BCyellow}on@{nCgreen} %;\
    /else \
        /let _dru_follow=@{BCred}off@{nCgreen} %;\
    /endif %;\
    /if ({ogolne_druzyna_sprawdzaj_stan}==1) \
        /let _dru_stan=@{BCyellow}on@{nCgreen} %;\
    /else \
        /let _dru_stan=@{BCred}off@{nCgreen} %;\
    /endif %;\
    /if ({ogolne_zaslona}==1) \
        /let _dru_zaslona=@{BCyellow}on '@{BCblue}%{ogolne_zaslona_level-2}@{BCyellow}#@{BCblue}%{ogolne_zaslona_time-0}@{BCyellow}'@{nCgreen} %;\
    /else \
        /let _dru_zaslona=@{BCred}off@{nCgreen} %;\
    /endif %;\
    /let _dru_state=wspieranie "%{_dru_wspieram}", sledzenie "%{_dru_follow}", liczenie "%{_dru_stan}", zaslanianie "%{_dru_zaslona}" %;\
    /if (!_have_druzyna()) \
        /echo -p -aCgreen Nie jestes w zadnej druzynie, %{_dru_state}. %;\
    /elseif (!_have_leader()) \
        /echo -p -aCgreen Druzyne prowadzisz @{BCwhite}Ty@{nCgreen}, %{_dru_state}. %;\
    /else \
        /echo -p -aCgreen Druzyne prowadzi "@{BCwhite}%{ogolne_leader}@{nCgreen}", %{_dru_state}. %;\
    /endif

/def kolorki =\
    /if ({*}=~"off") \
      /set ogolne_druzyna_kolory1=n %;\
      /set ogolne_druzyna_kolory2=n %;\
    /elseif ({*}=~"on") \
      /set ogolne_druzyna_kolory1=Cbgblue %;\
      /set ogolne_druzyna_kolory2=Cbgred %;\
    /elseif ({*}=~"all") \
      /set ogolne_druzyna_kolory1=xCyellow %;\
      /set ogolne_druzyna_kolory2=xCgreen %;\
    /else \
      /echo Uzycie: /kolorki [on|off|all] - Not implemented yet..%;\
    /endif %;\
    /_druzyna_kolorki

/def wsparcie = /wspieranie %{*}
/def wspieranie=\
    /if ({*}=~"off") \
      /set ogolne_wspieranie=0 %;\
      /status %;\
    /elseif ({*}=~"on") \
      /set ogolne_wspieranie=1 %;\
      /status %;\
    /elseif ({*}=~NULL) \
      /if ({ogolne_wspieranie}==1) \
        /set ogolne_wspieranie=0 %;\
      /else \
        /set ogolne_wspieranie=1 %;\
      /endif %;\
      /status %;\
    /else \
      /echo Uzycie: /wspieranie [on|off] %;\
    /endif %;\
    /_wsparcie_base

/def sledz = /follow %{*}
/def sledzenie = /follow %{*}
/def follow= \
    /if ({*}=~"off") \
      /set ogolne_druzyna_sledzenie=0 %;\
      /status %;\
    /elseif ({*}=~"on") \
      /set ogolne_druzyna_sledzenie=1 %;\
      /status %;\
    /elseif ({*}=~NULL) \
      /if ({ogolne_druzyna_sledzenie}==0) \
        /set ogolne_druzyna_sledzenie=1 %;\
      /else \
        /set ogolne_druzyna_sledzenie=0 %;\
      /endif %;\
      /status %;\
    /else \
      /echo Uzycie: /follow [on|off] %;\
    /endif %;\
    /_druzyna_follow

/def liczenie = \
    /if ({*}=~"off") \
      /set ogolne_druzyna_sprawdzaj_stan=0 %;\
      /status %;\
    /elseif ({*}=~"on") \
      /set ogolne_druzyna_sprawdzaj_stan=1 %;\
      /status %;\
    /elseif ({*}=~NULL) \
      /if ({ogolne_druzyna_sprawdzaj_stan}==0) \
        /set ogolne_druzyna_sprawdzaj_stan=1 %;\
      /else \
        /set ogolne_druzyna_sprawdzaj_stan=0 %;\
      /endif %;\
      /status %;\
    /else \
      /echo Uzycie: /liczenie [on|off] %;\
    /endif %;\
    /_druzyna_licz

/def zaslanianie = \
    /zaslona %{*}

/def zaslona = \
    /if (!getopts("l#t#", "")) /return 0 %; /endif %;\
    /if ({opt_l}) \
        /set ogolne_zaslona_level=%{opt_l} %;\
        /set ogolne_zaslona_time=%{opt_t} %;\
    /endif %;\
    /if ({*} =~ NULL) \
        /if ({ogolne_zaslona}) \
            /zaslona off %;\
        /else \
            /zaslona on %;\
        /endif %;\
    /elseif ($(/_is_on %{*})) \
        /set ogolne_zaslona=1 %;\
        /status %;\
    /elseif ($(/_is_off %{*})) \
        /unset ogolne_zaslona %;\
        /status %;\
    /else \
        /msg Automatyczna zaslone wlaczyc czy wylaczyc? %;\
    /endif

;------------------------------------------------------------------------------
;|                             AUTOMATY                                       |
;------------------------------------------------------------------------------

/def _autolootswitch = \
    /if ({ogolne_autoloot} =~ 0) \
      /bierz automagicznie %;\
    /elseif ({ogolne_autoloot} =~ 'automagicznie') \
      /bierz monety %;\
    /elseif ({ogolne_autoloot} =~ 'monety') \
      /bierz %;\
    /else \
      /niebierz %;\
    /endif

/def lootzciala = \
    /if ({ogolne_autoloot} !~ 0) \
        /if ({ogolne_autoloot} =~ "automagicznie") \
            /if (regmatch("trolla|ghoula|krasnozwierza|potepienienca|grzyboczleka|wyverne", {*})) \
                /let _do_wziecia=kamienie %;\
            /elseif (regmatch("zboja|vrana|bobolaka|barbegaz", {*})) \
                /let _do_wziecia=monety %;\
            /endif %;\
        /else \
            /let _do_wziecia=%{ogolne_autoloot} %;\
        /endif %;\
        /if ({_do_wziecia} !~ NULL) \
            /_trig_do wez %{_do_wziecia} z ciala %;\
        /endif %;\
    /endif

/def zloto = \
    /bierz monety

/def bierz = \
    /set ogolne_autoloot=%{*-wszystko} %;\
    /msg Bierzemy "@{B}%{ogolne_autoloot}@{n}" z cial.

/def niebierz = \
    /set ogolne_autoloot=0 %;\
    /msg Pladrowanie cial wylaczone

/def zabiles = \
    /set ogolne_co_jak_zabiles=%{*} %;\
    /msg Jak cos polegnie wykonuje "@{B}%{ogolne_co_jak_zabiles}@{n}".

/def -p10 -F -aB -mregexp -t' (umarl|polegl)(a|o|)\\.$$' _komusik_siy_poleglo = \
    /let _wrog=$[_string_to_varname({PL})] %;\
    /_zaslona_unset_one _zaslona_wrog_%{_wrog} %;\
    /eval %{ogolne_co_jak_zabiles} %;\
    /_echo >>>>>>****** UWAGA! KTOS WLASNIE POLEGL!!!!! ******<<<<<< 

/def -aB -F -mregexp -t'^(Potezny opanowany mezczyzna|Damaris) wykonuje pare zwodow, po czym zdecydowanym, szybkim' _wytronca_komus

/def -aB -F -t'*ruchem wytraca ci *' _wytroncil_ci = \
    /_trig_do wez bron %;\
    /db

/def -aB -F -t'*lecac lagodnym lukiem, laduje na ziemi obok ciebie*' _wytroncil_ci2 = \
    /_trig_do wez bron %;\
    /db

/def -aB -F -t'*gremlin wskakuje znienacka na twoja glowe i z upiornym*' _gremlin_na_glowie = \
    /_trig_do zrzuc gremlina

/def -aB -F -t'*Pomimo twoich wysilkow, cos nadal zaslania ci oczy kurczowo trzymajac*' _gremlin_na_glowie2 = \
    /_trig_do zrzuc gremlina

/def -aB -F -t'*Nagle tracisz rownowage i czujesz jak zeslizgujesz sie z mostu. W o*' _spadasz_z_mostu_1 =\
    /_trig_do wespnij sie na most %;\
    /def -1 -aB -F -t'*Wytezajac wszystkie sily udaje ci sie podciagnac i po chwili ostroznie staj*' _spadasz_z_mostu_2 = \
	/echo -p -aBCyellow ******* Uf.. Udalo ci sie podciagnac !! ****** 

/def -aB -F -t'*Niestety wyglada na to, ze juz sie nie zmiescisz.*' _trig_dylizans_ = \
    /repeat -2 1 /dyl %;\
    /_echo #### Brak miejsca w dylizansie probuje wsiasc za 2 sekundy ####

/def -aB -F -t'*Kierujesz sie w strone krzakow porastajacych polnocno-wchodnia czesc kotliny, lec*' _trig_krzaki_1 = \
    /_trig_do wejdz w krzaki

/def -aB -F -t'*Kierujesz sie w strone krzakow wyrastajacych na zachodzie*' _trig_krzaki_2 = \
    /_trig_do zachod

/def -aB -F -t'*Stalowa klatka nadjezdza na linie!*' _trig_klatka_1 = \
    /_trig_do s

/def -aB -F -t'*Otworzyly sie drzwi klatki.*' _trig_klatka_2 = \
    /_trig_do n

;/def -q -mregexp -h'PROMPT (Podaj tytul notki|Adresat:)' _send_safe_start_1 = \
;    /set ogolne_send_safe=1 

;/def -mregexp -t'(Napisz swoja wiadomosc|Wpisz .* (aby przerwac edycje|zeby uzyskac pomoc))' _send_safe_start_2 = \
;    /set ogolne_send_safe=1 

/set ogolne_send_safe=0
/def -E(!{ogolne_send_safe}) -mregexp -q -h'PROMPT ^[^>]' _send_safe_mode_1 = \
    /set ogolne_send_safe=1 %;\
    /def -1 -mregexp -q -h'PROMPT ^>' _send_safe_mode_0 = \
        /set ogolne_send_safe=0

/def -E({ogolne_send_safe_now}) -p10 -F -h'SEND *' _send_safe_send_1 = \
    /let _fch=$[substr({*}, 0, 1)] %;\
    /if ({_fch} !~ "!" & {_fch} !~ "$" & {_fch} !~ "~") \
        /test _debug(strcat("Wysylam bezpiecznie !", {*})) %;\
        /test send(strcat("!", {*})) %;\
    /else \
        /test _debug(strcat("Wysylam NIE bezpiecznie ", {*})) %;\
        /test send({*}) %;\
    /endif

;-------------------------------------------------------------------------------
;|                              ZATRUCIA                                       |
;-------------------------------------------------------------------------------
/def -FaB -t'*zostal[eao]s zatrut*' _zatrucia_plus = \
    /set trucizna=$[{trucizna}+1] %;\
    /zatrucia juz

/def -FaB -t'Czujesz fale zimna*' _zatrucia_plus_ghoule = \
    /_zatrucia_plus %;\
    /repeat -600 1 /_zatrucia_minus


/def -FaB -mregexp -t'^(Czujesz, ze do twego ciala dostala sie jakas trucizna|Czujesz, ze do twego ciala dostala sie kolejna dawka tej piekielnej trucizny)' _zatrucia_plus_vyverna = \
    /_zatrucia_plus

/def -FaB -t'Czujesz sie znacznie lepiej*' _zatrucia_minus = \
    /if ({trucizna}>0) \
      /test --trucizna %;\
    /endif %;\
    /zatrucia jeszcze

/def -FaB -t'Twoj oddech wraca powoli do normy, swiat znow nabiera zwyczajnych barw, zas *' _zatrucia_minus_vyverna = \
    /unset trucizna %;\
    /zatrucia jeszcze

/def -FaB -t'Powoli sie uspokajasz, cialo przestaje drzec, oddech sie wyrownuje, serce zaczyna bic normalnym rytmem.*' _zatrucia_minus_amfisbena = \
    /_zatrucia_minus

/def tru=/zatrucia 
/def zatrucia = \
    /echo -p -aCgreen Jestes zatruty %{1-dokladnie} "@{B}%{trucizna-0}@{n}" razy!!!!

;-------------------------------------------------------------------------------
;|                          WYJSCIA Z LOKACJI                                  |
;-------------------------------------------------------------------------------

/def -q -h'SEND {n|s|w|e|se|sw|nw|ne|gora|dol|g|d|u}' _wyjscia_poszedl = \
    /set poszedl=1 %;\
    /set last_move=%{1}

/def -P0BCgreen -t'^(Jest|Sa) tutaj ([^ ]*) widoczn(e|ych) wyjsc(|ie|ia):' _wyjscia_trig_1 = \
    /_wyjscia_licz %{PR}

/def -P0BCgreen -t'^W mroku nocy dostrzegasz ([^ ]*) widoczn(e|ych) wyjsc(|ie|ia):' _wyjscia_trig_2 = \
    /_wyjscia_licz %{PR}

/def -P0BCgreen -t'^(Szlak|Sciezka|Wyjscia) prowadz. tutaj w ([^ ]*) kierunk(ach|u):' _wyjscia_trig_3 = \
    /_wyjscia_licz %{PR}

/def -P0BCgreen -t'^Wydeptane w kukurydzy sciezki prowadza na' _wyjscia_trig_4 = \
    /_wyjscia_licz %{PR}

/def -P1BCgreen -t'^(Trakt wiedzie na|W gestych ciemnosciach dostrzegasz trakt wiodacy na|Trakt rozgalezia sie na|W gestych ciemnosciach dostrzegasz, ze trakt rozgalezia sie na) ([^.]*)\\.(?: Mozna jednak z niego zejsc i udac sie na (.*)\\.|)' _wyjscia_trig_5 = \
    /_wyjscia_licz %{P2} %{P3}

/def -P0BCgreen -t'^Mozesz sie stad udac na' _wyjscia_trig_6 = \
    /_wyjscia_licz %{PR}

/def -P0BCgreen -t'^Mozesz stad wyruszyc w dowolnie wybranym kierunku.' _wyjscia_trig_7= \
    /_wyjscia_licz polnocny-zachod polnocny-wschod polnoc wschod zachod poludniowy-wschod poludniowy-zachod poludnie

/def -P0BCgreen -t'^Wedrowke przez rozlegle laki mozesz kontynuowac udajac sie na' _wyjscia_trig_8 = \
    /_wyjscia_licz %{PR}

/def -P0BCgreen -t'^Wedrowke przez rozlegle laki mozesz kontynuowac w dowolnie wybranym kierunku.' _wyjscia_trig_9 = \
    /_wyjscia_licz polnocny-zachod polnocny-wschod polnoc wschod zachod poludniowy-wschod poludniowy-zachod poludnie

/def -P0BCgreen -t'^W gestych ciemnosciach dostrzegasz tunel wiodacy na' _wyjscia_trig_10 = \
    /_wyjscia_licz %{PR}

/def -P1BCgreen -t'^(Mozesz podazac traktem na) ([^.]*)(?:\\. Natomiast (?:aby|jesli chcesz) zejsc z wytyczonej drogi (?:musisz|mozesz) udac sie na (.*)\\.|\\.)' _wyjscia_trig_11 = \
    /_wyjscia_licz %{P2} %{P3}

/def -P0BCgreen -t'^Tunel(e|) ciagn(ie|a) sie na' _wyjscia_trig_12 = \
    /_wyjscia_licz %{PR}

;Wyjscia prowadza tutaj w trzech kierunkach: polnoc, poludniowy-wschod i zachod.
;Dostrzegasz tu jedno wyjscie: polnocny-zachod.


;Gorska sciezka konczy sie slepo, wiec mozesz jedynie cofnac sie na poludniowy-zachod.
;Gorska sciezka rozwidla sie tutaj, umozliwiajac podroz na polnocny-wschod, poludniowy-wschod oraz polnocny-zachod.


/def -aBCgreen -t'Zamglone bagno.' _wyjscia_bagno = \
    /set poszedl=0 %;\
    /set wyjscia_z_lokacji=Bagno na cacy!!

/def -aBCgreen -mregexp -t'^(Ciemne miejsce\\.|Ciemna jaskinia\\.)$$' _wyjscia_ciemnosc = \
    /set poszedl=0 %;\
    /set wyjscia_z_lokacji=Widze ciemnosc!

/purge -i _wyjscia_licz
/def -i _wyjscia_licz = \
    /unset nietypowe_wyjscie %;\
    /_zaslona_unset_all %;\
    /_wyjscia_czysc %;\
    /while ({#}) \
        /if (strchr({1},",.")>=0) \
            /let _wyjscie=$[substr({1},0,strlen({1})-1)]%;\
        /else \
            /let _wyjscie=%{1}%;\
        /endif %;\
        /if     ({_wyjscie}=~"polnoc")              /let _wyjscie2=n %; /_wyjscia_set_one n 0 5 | %;\
        /elseif ({_wyjscie}=~"poludnie")            /let _wyjscie2=s %; /_wyjscia_set_one s 2 5 | %;\
        /elseif ({_wyjscie}=~"wschod")              /let _wyjscie2=e %; /_wyjscia_set_one e 1 6 - %;\
        /elseif ({_wyjscie}=~"zachod")              /let _wyjscie2=w %; /_wyjscia_set_one w 1 4 - %;\
        /elseif ({_wyjscie}=~"polnocny-wschod")     /let _wyjscie2=ne %; /_wyjscia_set_one ne 0 6 \/ %;\
        /elseif ({_wyjscie}=~"polnocny-zachod")     /let _wyjscie2=nw %; /_wyjscia_set_one nw 0 4 \\\\ %;\
        /elseif ({_wyjscie}=~"poludniowy-wschod")   /let _wyjscie2=se %; /_wyjscia_set_one se 2 6 \\\\ %;\
        /elseif ({_wyjscie}=~"poludniowy-zachod")   /let _wyjscie2=sw %; /_wyjscia_set_one sw 2 4 \/ %;\
        /elseif ({_wyjscie}=~"gora")                /let _wyjscie2=u %; /_wyjscia_set_one u 0 2 ^ %; /_wyjscia_set_one u 1 2 | %;\
        /elseif ({_wyjscie}=~"dol")               /let _wyjscie2=d %; /_wyjscia_set_one d 1 2 | %; /_wyjscia_set_one d 2 2 v %;\
        /elseif ({_wyjscie}=~"i")                 /let _wyjscie2=%;\
        /elseif ({_wyjscie}=~"lub")               /let _wyjscie2=%;\
        /elseif ({_wyjscie}=~"albo")               /let _wyjscie2=%;\
        /else                                     /let _wyjscie2=? %; /_wyjscia_set_one ? 1 9 ? %;\
            /if ({nietypowe_wyjscie} =~ NULL) \
                /set nietypowe_wyjscie=%{_wyjscie}%;\
            /endif %;\
        /endif %;\
        /let _wyjscia_all=$[strcat({_wyjscia_all}, strlen({_wyjscie2}) ? " " : "", {_wyjscie2})] %;\
        /shift %;\
    /done %;\
    /set wyjscia_z_lokacji %{_wyjscia_all} %;\
    /if ({ORIGTERM} =~ "zmuda") \
        /echo Wyjscia:%{wyjscia_z_lokacji} %;\
    /endif %;\
    /if ({move_time} !~ NULL & {poszedl}) \
	    /_idz_wyjscia %;\
    /endif %;\
    /set poszedl=0

/purge -i _wyjscia_set_one
/def -i _wyjscia_set_one = \
    /if ({1} =~ last_move_rev) \
        /eval /set kier_%{2}_%{3}=$$[decode_attr(strcat("@{Cred}", {4}))] %;\
    /else \
        /eval /set kier_%{2}_%{3}=%{4} %;\
    /endif
    
/purge -i _wyjscia_czysc
/def -i _wyjscia_czysc = \
    /let _sh=10 %;\
    /let _i=0 %;\
    /while ({_i} < {_sh}) \
        /test ++{_i} %;\
        /set kier_0_%{_i}=$[' '] %;\
        /set kier_1_%{_i}=$[' '] %;\
        /set kier_2_%{_i}=$[' '] %;\
    /done %;\
    /set kier_1_5=o

/def sciezka = \
    /echo Sciezka =%{sciezka}

/def stoj = \
    /msg Dobra nigdzie nie ide... %;\
    /_idz_stop

/def idz = \
    /if (!getopts("s:", "") | {*} =~ NULL) \
        /msg Uzycie: /idz -s"" czas kierunki %;\
        /msg Czas ustawia sie teraz zamiast -x opcja x %;\
        /msg np. /idz -s"szukaj ziol" 6 n w n e %;\
        /return 0 %;\
    /endif %;\
    /if ({opt_s} !~ NULL) \
        /set move_action=%{opt_s} %;\
        /msg Co lokacje wykonuje "@{B}%{opt_s}@{n}". %;\
    /endif %;\
    /if (regmatch("[0-9]+", {1})) \
        /if ({move_time} !~ NULL & {-1} =~ NULL) \
            /msg Juz ide zmieniam szybkosc chodu na "@{BCred}%{1}@{nCgreen}". %;\
            /set move_time=-%{1} %;\
            /rstop /_idz_main %;\
            /repeat %{move_time} 1 /_idz_main %{next_move} %;\
            /return %;\
        /endif %;\
        /set move_time=-%{1} %;\
        /shift %;\
    /else \
        /set move_time=-2 %;\
    /endif %;\
    /set sciezka=%;\
    /set all_moves=$[strcat({-1}, " ")] %;\
    /rstop /_idz_main %;\
    /_idz_main %{1}

/def _idz_main = \
    /if ({1}=/"{n|s|e|w|ne|sw|nw|se|u|d}") \
        /set sciezka=%{sciezka} %{1} %;\
        /_echo %;\
        /__kier_state %{1} 1 %;\
        /_echo %;\
    /else \
        /msg Gdzie mam isc na "@{BCred}%{1}@{nCgreen}" ?? %;\
    /endif

/def _idz_wyjscia = \
    /let jest_przeciwny=$(/_idz_jest_przeciwny %{wyjscia_z_lokacji})%;\
    /if ({jest_przeciwny}=~"1") \
        /repeat %{move_time} 1 /_idz_main %{next_move} %;\
        /eval %{move_action} %;\
    /elseif (strlen(all_moves) > 1) \
        /echo -p -aCmagenta %{jest_przeciwny} ale ide dalej!! %;\
        /_echo %;\
        /let i=$[strstr(all_moves, " ")] %;\
        /set next_move=$[substr(all_moves, 0, i)]%;\
        /set all_moves=$[substr(all_moves, i + 1)] %;\
        /repeat %{move_time} 1 /_idz_main %{next_move} %;\
        /eval %{move_action} %;\
    /else \
        /_echo %;\
        /msg %{jest_przeciwny} nie wiem co zrobic!! %;\
        /_echo %;\
        /_idz_stop %;\
    /endif

/def _idz_jest_przeciwny= \
    /let last_move_back=$(/_idz_znajdz_przeciwny n s w e se nw sw ne u d)%;\
    /if ({#}>2) \
        /echo Za duzo wyjsc %;\
    /elseif ({#}<2) \
        /echo Slepy zaulek %;\
    /elseif ({last_move_back}=~{1}) \
        /echo 1 %;\
        /set next_move=%{2} %;\
    /elseif ({last_move_back}=~{2}) \
        /echo 1 %;\
        /set next_move=%{1} %;\
    /else \
        /echo Nie ma TU przeciwnego wyjscia %;\
    /endif

/def _idz_znajdz_przeciwny= \
    /if ({#}==0) \
        /echo Nie ma przeciwnego. %;\
    /elseif ({last_move}=~{1})  \
        /echo %2 %;\
    /elseif ({last_move}=~{2})  \
        /echo %1 %;\
    /else \
        /_idz_znajdz_przeciwny %{-2} %;\
    /endif

/def _kier_l_to_s = \
   /return _kier_znajdz_l_to_s("polnoc", "n", "poludnie", "s", "zachod", "w", "wschod", "e", "poludniowy-zachod", "sw", "poludniowy-wschod", "se", "polnocny-zachod", "nw", "polnocny-wschod", "ne", "dol", "d", "gora", "u", "gore", "u", {1})

/def _kier_znajdz_l_to_s = \
    /while ({#} > 1) \
        /if ({L} =~ {1}) \
            /return {2} %;\
        /else \
            /shift 2 %;\
        /endif %;\
    /done %;\
    /return 
    

/def _kier_przeciwny = \
   /return _kier_znajdz_przeciwny("n", "s", "w", "e", "se", "nw", "sw", "ne", "u", "d", {1})
   
/def _kier_znajdz_przeciwny = \
    /while ({#} > 1) \
        /if ({L} =~ {1}) \
            /return {2} %;\
        /elseif ({L} =~ {2}) \
            /return {1} %;\
        /else \
            /shift 2 %;\
        /endif %;\
    /done %;\
    /return 
    

/def _idz_stop = \
    /unset move_time %;\
    /unset next_move %;\
    /unset move_action %;\
    /unset all_moves %;\
    /rstop /_idz_main

/def _idz_next = \
    /let jest_przeciwny=$(/_idz_jest_przeciwny %{wyjscia_z_lokacji})%;\
    /if ({jest_przeciwny}=~"1") \
        /__kier_state %{next_move} %;\
    /else \
        /_echo %;\
        /msg %{jest_przeciwny} nie wiem co zrobic!! %;\
	    /_echo %;\
    /endif

/def -E({poszedl}) -FaB -t'Przeciez brama jest zamknieta! Nie przejdziesz*' _brama_kardin = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do uderz we wrota 

/def -E({poszedl}) -FaB -t'Probujesz otworzyc kamienne wrot*' _brama_mahakam1 = \
    /if ($(/_czesto 7)) \
    	/return %;\
    /endif %;\
    /_trig_do /bra

/def -E({poszedl}) -FaB -t'Chcesz wejsc w lita, kamienna sciane*' _brama_mahakam2 = \
    /if ($(/_czesto 7)) \
    	/return %;\
    /endif %;\
    /_trig_do /bra

/def -E({poszedl}) -FaB -t'Ta brama jest tylko kamienna rzezba...*' _brama_mahakam3 = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do /bra

/def -E({poszedl}) -FaB -t'*napis nie uklada sie w zadna, zrozumiala*' _brama_mahakam4 = \
    /_trig_do przeczytaj napis

/def -E({poszedl}) -FaB -t'*klapa jest zamknieta*' _klapa_losiu_1 = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do otworz klape %%; dol

/def -E({poszedl}) -FaB -t'Wejscie do krypty zablokowane jest przez kamienna plyte.*' _krypta_losiu_1 = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do odsun kamienna plyte

/def -E({poszedl}) -FaB -t'Wyjscie z krypty zablokowane jest przez kamienna plyte.*' _krypta_losiu_2 = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    przestan walczyc %;\
    odsun kamienna plyte

/def -E({poszedl}) -FaB -t'Nie mozesz przejsc przez zamkniete wrota.' _brama_losiu_1 = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do zapukaj we wrota 

/def -E({poszedl}) -FaB -t'Forsowanie zamknietej bramy nie jest najlepszym pomyslem*' _brama_losiu_2 = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do zapukaj we wrota %%;\
        wrzasnij w okienko %%;\
        pociagnij sznur 
    


/def -E({poszedl}) -FaB -t'Forsowanie zamknietych wrot nie jest najlepszym pomyslem.*' _brama_losiu_3 = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do zapukaj we wrota %%;\
        pociagnij sznur 

/def -E({poszedl}) -FaB -t'Probujesz otworzyc drewniane wrota ale nie udaje ci sie to.' _brama_losiu_4= \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do zastukaj we wrota

/def -E({poszedl}) -FaB -t'Przechodzenie przez zamkniete wrota nie nalezy chyba do najlepszych pomyslow*'  _brama_nuln = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do zadzwon %%;\
        zapukaj we wrota

/def -E({poszedl}) -FaB -t'Forsowanie zamknietej bramy nie jest dobrym pomyslem.' _furtka_losiu = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do zapukaj do furtki %%; /repeat -2 1 furtka 

/def -E({poszedl}) -FaB -t'Przechodzic przez zamknieta brame? To przeciez fizycznie niewykonalne w ty*' _brama_rinde = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do zastukaj kolatka

/def -E({poszedl}) -mregexp -FaB -t'^(Probujesz otworzyc brame, ale jest zamknieta od wewnatrz\\.|Probujesz otworzyc brame, ale jest zamknieta!)$$' _brama_rinde_2 = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do zastukaj kolatka

/def -E({poszedl}) -FaB -t'Probujesz otworzyc zelazne wrota ale nie udaje ci sie to.' _brama_quelenes = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do uderz we wrota

/def -E({poszedl}) -FaB -t'Probujesz otworzyc wysoka brame ale nie udaje ci sie to.' _brama_zywiolaki = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do uderz w brame

/def -E({poszedl}) -FaB -t'Probujesz otworzyc debowe wrota ale nie udaje ci sie to.' _brama_novigradu = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do zastukaj w brame

/def -E({poszedl}) -FaB -t'Nie przejdziesz przez zamknieta brame.' _brama_straznica_1 = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do uderz w brame %%;\
	dotknij symbolu %;\
    /def -FaB -t'Wprawiony w ruch mechanizm, przesuwa kamienny blok, zastawiajac nim otwarte niedawno wejscie.' _do_straznicy = \
	/fast_bind uruchom mechanizm %;\
    /purge _do_straznicy

/def -E({poszedl}) -FaB -t'Przeciez nie przejdziesz przez zamknieta brame.' _brama_straznica_2 = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do uderz w brame

/def -E({poszedl}) -FaB -t'Nie jestes zbyt pewn*' _przezprzepasc = \
    /if ($(/_czesto 13)) \
    	/return %;\
    /endif %;\
    /_trig_do pociagnij linke %%;\
        uderz w dzwon %;\
    /purge _przez_przepasc* %;\
    /def -FaB -t'Szarpiesz ostro koniec dlugiej linki.' _przez_przepasc1 = \
	/def _przez_przepasc = e %;\
    /def -FaB -t'Uderzasz w dzwon.' _przez_przepasc2 = \
	/def _przez_przepasc = w %;\
    /def -FaB -t'Mozna teraz bezpiecznie przejsc na druga strone.' _przez_przepasc3 = \
	/_przez_przepasc %%;\
	/purge _przez_przepasc*

/def -E({poszedl}) -FaB -t'Nie jestes pewn* swojej umiejetnosci plywan*' _przezrzeczke = \
    /if ($(/_czesto 13)) \
    	/return %;\
    /endif %;\
    /_trig_do pociagnij sznurek %%;\
        uderz w gong %;\
    /purge _przez_przepasc* %;\
    /def -FaB -t'Krawedz mostu dotarla do pomostu!' _przez_przepasc1 = \
	e %;\
    /def -FaB -t'Krawedz mostku dotarla do pomostu!' _przez_przepasc2 = \
	w

;-------------------------------------------------------------------------------
;|                          DYLIZANS I STATEK                                  |
;-------------------------------------------------------------------------------

/def dylizans = \
    /purge _dylizans_auto %;\
    /def -1 -aB -p5 -mregexp -t'(pedzacy dylizans powoli zatrzymuje sie|stojacy dylizans)' _dylizans_auto = \
        /_trig_do /dyl %;\
    /echo #### Wsiadam do najblizszego dylizansu. #### %;\
    /if ({*}!~NULL) \
        /wysiadz %{*} %;\
    /endif
  
/def dylizans- = \
    /purge _dylizans_auto %;\
    /echo #### Nie wsiadam do dylizansu. ####

/def wysiadz = \
    /if ({*}=~NULL) \
	/_dylizans_pomoc %;\
    /elseif ($(/list -s _dylizans_%{*})=~NULL) \
	/_dylizans_pomoc %;\
    /else \
        /purge _dylizans_dojechal %;\
        /_dylizans_%{*} %;\
    /endif

/def dyl = \
    /wem %;\
    wsiadz do dylizansu %;\
    /wlm

/def ?dylizans = /_dylizans_pomoc
/def _dylizans_pomoc = \
    /echo -p -aCgreen  Azeby wysiasc na jakiejs stacji wpisz /wysiadz (gdzie) !!!%;\
    /echo -p -aCgreen Linia Nuln - Kraina stacje: "@{B}nuln, biss[ingen], kraina@{n}". %;\
    /echo -p -aCgreen Linia Nuln - Bretonia stacje: "@{B}nuln, kreutz[hofen], loren, bret[onia]@{n}". %;\
    /echo -p -aCgreen Linia Campogrotto - Varieno stacje: "@{B}campo[grotto], mira[gliano], var[ieno]@{n}".

/def _dylizans_kraina = \
    /def -1 -aB -p5 -t'*Z zewnatrz dochodzi stlumiony glos woznicy: Postoj, dziedziniec frontowy*' _dylizans_dojechal = \
        /_trig_do wyjscie %;\
    /echo #### Wysiadam w Krainie Zgromadzenia. ####

/def _dylizans_zajazd = \
    /def -1 -aB -p5 -t'*Z zewnatrz dochodzi stlumiony glos woznicy: Postoj, droga do zajazdu.*' _dylizans_dojechal = \
        /_trig_do wyjscie %;\
    /echo #### Wysiadam na Drodze do Zajazdu. ####

/def _dylizans_biss = /_dylizans_bissingen
/def _dylizans_bissingen = \
    /def -1 -aB -p5 -t'*Z zewnatrz dochodzi stlumiony glos woznicy: Postoj, maly Rynek w Bissingen*' _dylizans_dolechal = \
        /_trig_do wyjscie %;\
    /echo #### Wysiadam w Bissingen. ####

/def _dylizans_nuln = \
    /def -1 -aB -p5 -mregexp -t'Z zewnatrz dochodzi stlumiony glos woznicy: Postoj, (placyk w polnocnej|niewielki plac w)' _dylizans_dojechal = \
        /_trig_do wyjscie %;\
    /echo #### Wysiadam w Nuln. ####

/def _dylizans_kreutz = /_dylizans_kreutzhofen
/def _dylizans_kreutzhofen = \
    /def -1 -aB -p5 -t'*Z zewnatrz dochodzi stlumiony glos woznicy: Postoj, placyk w centrum*' _dylizans_dojechal = \
        /_trig_do wyjscie %;\
    /echo #### Wysiadam w Kreutzhofen. ####

/def _dylizans_loren = \
    /def -1 -aB -p5 -t'*Z zewnatrz dochodzi stlumiony glos woznicy: Postoj, dziedziniec przed zaj*' _dylizans_dojechal = \
        /_trig_do wyjscie %;\
    /echo #### Wysiadam w Loren. ####

/def _dylizans_bret = /_dylizans_bretonia
/def _dylizans_bretonia = \
    /def -1 -aB -p5 -t'*Z zewnatrz dochodzi stlumiony glos woznicy: Postoj, rynek miejski Salignac*' _dylizans_dojechal = \
        /_trig_do wyjscie %;\
    /echo #### Wysiadam w Bretoni. ####

/def _dylizans_campo = /_dylizans_campogrotto
/def _dylizans_campogrotto = \
    /def -1 -aB -p5 -t'*Z zewnatrz slyszysz glos woznicy: Fermata - Campogrotta!*' _dylizans_dojechal = \
        /_trig_do wyjscie %;\
    /echo #### Wysiadam w Campogrotto. ####

/def _dylizans_mira = /_dylizans_miragliano
/def _dylizans_miragliano = \
    /def -1 -aB -p5 -t'*Z zewnatrz slyszysz glos woznicy: Fermata - incrocio alla Miragliano!*' _dylizans_dojechal = \
        /_trig_do wyjscie %;\
    /echo #### Wysiadam w Miragliano. ####

/def _dylizans_var = /_dylizans_varieno
/def _dylizans_varieno = \
    /def -1 -aB -p5 -t'*Z zewnatrz slyszysz glos woznicy: Fermata - Varieno!*' _dylizans_dojechal = \
        /_trig_do wyjscie %;\
    /echo #### Wysiadam w Varieno. ####

/def -aB -t'*Oplacasz podroz u woznicy i wsiadasz do * stojacego dylizansu*' _dylizans_wsiadles= \
    /if ($(/list -s _dylizans_dojechal)=~NULL)\
	/_dylizans_pomoc %;\
    /endif 

/def statek = \
    /msg Wsiadamy na Statek!!!! %;\
    /purge _statek_auto_* %;\
    /def -aB -F -p600 -1 -mregexp -t'(: Wszyscy na poklad|: Za kilkanascie sekund|przystani przybija wielki trojmasztowy galeon)' _statek_auto_1 = \
	/purge _statek_auto_* %%;\
	/_trig_do /v %;\
    /def -FaB -t'Do pomostu przybija tratwa z * na pokladzie.*' _statek_auto_2 = \
	/purge _statek_auto_* %%;\
	/_trig_do prom %;\
    /def -FaB -t'Do brzegu przybija tratwa.*' _statek_auto_3 = \
	/purge _statek_auto_* %%;\
	/_trig_do wejdz na tratwe %;\
    /def -FaB -t'Widzisz jak przy wtorze gluchych uderzen i pluskow do przystani dobija*' _statek_auto_4 = \
	/purge _statek_auto_* %%;\
	/_trig_do prom %;\
    /def -FaB -t'Nagle ze strony przystani rozleglo sie ciche uderzenie a po nim kilka plu*' _statek_auto_5 = \
	/purge _statek_auto_* %%;\
	/_trig_do prom %;\
    /def -FaB -t'Rzeczny prom przybija do brzegu.' _statek_auto_6 = \
	/purge _statek_auto_* %%;\
	/_trig_do wejdz na prom %;\
    /def -FaB -t'Rzeczna tratwa przybija do brzegu.' _statek_auto_7 = \
	/purge _statek_auto_* %%;\
	/_trig_do wejdz na tratwe

/def statek- = \
    /msg Nie wsiadamy na siadamy na Statek!!!! %;\
    /purge _statek_auto_*

/def -aB -t'*zatrzymuje cie przed wejsciem na statek*' _statek_nie_masz_kasy = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /wem %;\
    otworz plecak %;\
    wez monety z plecaka %;\
    otworz drugi plecak %;\
    wez monety z drugiego plecaka %;\
    kup bilet %;\
    wsiadz na statek
    
/def zsiadaj = \
    /unset ogolne_statek_nie_zsiadanie %;\
    /_zsiadaj %;\
    /msg Dobra od teraz zsiadam ze statkow!!!

/def _zsiadaj = \
    /_niezsiadaj %;\
    /if (!ogolne_statek_nie_zsiadanie) \
        /def -aB -mregexp -t'^(Zaloga sprawnie wyrzuca kotwice|Drzenie przebiega poklad, gdy okret przybija do b)' _statek_zsiadanie_1 = \
            /_trig_do zejdz ze statku %;\
        /def -FaB -p600 -t'*: Wysiadajcie!*' _statek_zsiadanie_2 = \
            /_trig_do brzeg %;\
        /def -FaB -t'Tratwa powoli do brzegu przystani.' _statek_zsiadanie_3 = \
            /_trig_do zeskocz z tratwy %;\
        /def -FaB -t'Tratwa powoli przybija do brzegu*.' _statek_zsiadanie_4 = \
            /_trig_do zeskocz z tratwy %;\
        /def -FaB -t'Prom powoli przybija do brzegu.' _statek_zsiadanie_5 = \
            /_trig_do zejdz %;\
    /endif
    
/def niezsiadaj = \
    /set ogolne_statek_nie_zsiadanie=1 %;\
    /_niezsiadaj %;\
    /msg Dobra od teraz NIE zsiadam ze statkow!!!

/def _niezsiadaj = \
    /purge _statek_zsiadanie_*

/_zsiadaj

;------------------------------------------------------------------------------
;|                             GONIENIE                                       |
;------------------------------------------------------------------------------

/def strzalki = \
    /if ({*} =~ NULL) \
        /if (!{ogolne_strzalki_show}) \
            /strzalki on %;\
        /else \
            /strzalki off %;\
        /endif %;\
    /elseif ($(/_is_on %{*})) \
        /set ogolne_strzalki_show=1 %;\
        /msg Pokazywanie strzalek za uciekinierami wlaczone. %;\
    /elseif ($(/_is_off %{*})) \
        /unset ogolne_strzalki_show %;\
        /msg Pokazywanie strzalek za uciekinierami wylaczone. %;\
    /else \
        /msg Pokazywanie strzalek za uciekinierami wlaczyc czy wylaczyc? %;\
    /endif %;\
    /_gon

/def gon = \
    /if (!getopts("af#", "")) /return 0 %; /endif %;\
    /if ({#}) \
        /set gon_targ=%{*} %;\
    /endif %;\
    /if (strlen({gon_targ}) > 2) \
        /let g_t=@{BCyellow}%{gon_targ}@{nCgreen} %;\
    /else \
        /let g_t=@{BCgreen}nikogo nie gonie@{nCgreen} %;\
    /endif %;\
    /if ({opt_a}) \
        /set ogolne_gon_auto=1 %;\
        /let g_a=@{BCyellow}on@{nCgreen} %;\
    /else \
        /unset ogolne_gon_auto %;\
        /let g_a=@{BCred}off@{nCgreen} %;\
    /endif %;\
    /if ({opt_f}) \
        /set ogolne_gon_bind=%{opt_f} %;\
        /let g_f=@{BCyellow}F%{opt_f}@{nCgreen} %;\
    /else \
        /unset ogolne_gon_bind %;\
        /let g_f=@{BCred}auto@{nCgreen} %;\
    /endif %;\
    /test echo(strcat("Automatyczna pogon '", {g_a}, "' bind '", {g_f}, "' w tym momencie gonie '", {g_t}, "'."), "Cgreen", 1) %;\
    /_gon

/def _gon = \
    /purge _gon_func %;\
    /purge _strzalki_func %;\
    /if ({ogolne_gon_auto} == 1 | {ogolne_strzalki_show} == 1 ) \
        /def -Fp10 -mregexp -t'^([^()]*)(?: \\\\(.*\\\\)|) uciekl(|a|o) ci\\\\.$$' _gon_uciekl = \
            /if (strstr({gon_targ}, {P1}) == -1) \
                /set gon_targ=$$[replace("NIC|", "", strcat({gon_targ-NIC}, "|", {P1}))] %%;\
                /if ({ogolne_gon_auto} == 1) \
                    /test echo(strcat("Wlaczam pogon za @{B}", {P1}, "@{n}."), "Cgreen", 1) %%;\
                /endif %%;\
                /_gonimy %%;\
            /endif %%;\
            /rstop /niegon %%;\
            /rstart -60 1 /niegon %;\
;        /def -mregexp -t' przybywa' _gon_przybyl = \
;            /let _wszedl=$[tolower({PL})] %%;\
;            /if (strlen({gon_targ})>=2) \
;                /if (strstr({gon_targ},{_wszedl}) >= 0) \
;                    /msg . %%;\
;                    /msg .          @{BCred}STOP@{BCgreen} ZWOLNIJ BO WYMIJASZ ! ! ! @{BCred}STOP@{n} %%;\
;                    /msg . %%;\
;                /endif %%;\
;            /endif %;\
    /endif %;\
        /if ({ogolne_gon_bind}) \
            /def _gon_func = \
                /if ({ogolne_gon_auto} != 1) \
                    /return %%;\
                /endif %%;\
                /set ogolne_bindy_f%{ogolne_gon_bind}=$$[replace("gore", "gora", {P2})] %%%;\
                /set ogolne_bindy_f%{ogolne_gon_bind}= %%;\
                /echo -aCgreen Ucieczka!! Wcisnij F%{ogolne_gon_bind} azeby pogonic!! %;\
        /else \
            /def _gon_func = \
                /if ({ogolne_gon_auto} != 1) \
                    /return %%;\
                /endif %%;\
                $$[replace("gore", "gora", {P2})] %;\
        /endif %;\
        /def _strzalki_func = \
            /if ({ogolne_strzalki_show} != 1 ) \
                /return %%;\
            /endif %%;\
            /let _uciekl=$$[toupper({P1})] %%;\
            /let _kierunek=$$[replace(".", "", {P2})] %%;\
            /if (_kierunek =~ 'polnoc') \
                /msg .                #         %%;\
                /msg .               ###        %%;\
                /msg .              # # #       %%;\
                /msg .                #         %%;\
                /msg .                #         @{B}%%{_uciekl}@{n}  %%;\
            /elseif (_kierunek =~ 'polnocny-wschod') \
                /msg .                  #       %%;\
                /msg .                ###       %%;\
                /msg .              # # #       %%;\
                /msg .               #          %%;\
                /msg .              #           @{B}%%{_uciekl}@{n}  %%;\
            /elseif (_kierunek =~ 'wschod') \
                /msg .                #         %%;\
                /msg .                 #        %%;\
                /msg .            #######       %%;\
                /msg .                 #        %%;\
                /msg .                #         @{B}%%{_uciekl}@{n}  %%;\
            /elseif (_kierunek =~ 'poludniowy-wschod') \
                /msg .             #            %%;\
                /msg .              #           %%;\
                /msg .             # # #        %%;\
                /msg .               ###        %%;\
                /msg .                 #        @{B}%%{_uciekl}@{n}  %%;\
            /elseif (_kierunek =~ 'poludnie') \
                /msg .               #          %%;\
                /msg .               #          %%;\
                /msg .             # # #        %%;\
                /msg .              ###         %%;\
                /msg .               #          @{B}%%{_uciekl}@{n}  %%;\
            /elseif (_kierunek =~ 'poludniowy-zachod') \
                /msg .                 #        %%;\
                /msg .                #         %%;\
                /msg .             # # #        %%;\
                /msg .             ###          %%;\
                /msg .             #            @{B}%%{_uciekl}@{n}  %%;\
            /elseif (_kierunek =~ 'zachod') \
                /msg .              #           %%;\
                /msg .             #            %%;\
                /msg .            #######       %%;\
                /msg .             #            %%;\
                /msg .              #           @{B}%%{_uciekl}@{n}  %%;\
            /elseif (_kierunek =~ 'polnocny-zachod') \
                /msg .              #           %%;\
                /msg .              ###         %%;\
                /msg .              # # #       %%;\
                /msg .                 #        %%;\
                /msg .                  #       @{B}%%{_uciekl}@{n}  %%;\
            /elseif (_kierunek =~ 'gore') \
                /msg .               ###        %%;\
                /msg .              #   #       %%;\
                /msg .             #  #  #      GORA%%;\
                /msg .              #   #       %%;\
                /msg .               ###        @{B}%%{_uciekl}@{n}  %%;\
            /elseif (_kierunek =~ 'dol') \
                /msg .              #   #       %%;\
                /msg .               # #        %%;\
                /msg .                #         DOL%%;\
                /msg .               # #        %%;\
                /msg .              #   #       @{B}%%{_uciekl}@{n}  %%;\
           /else \
                /msg .                                      %%;\
                /msg .                                      %%;\
                /msg .      $$[toupper({_kierunek})]        %%;\
                /msg .                                      %%;\
                /msg .                          @{B}%%{_uciekl}@{n}  %%;\
            /endif

/def _gonimy = \
    /purge _gonimy_* %;\
    /if (strlen({gon_targ}) > 2) \
        /def -Fp3 -mregexp -t"^(?i)(?:\\\\[ \\\\d+ \\\\] )?(%{gon_targ})(?: \\\\(.*\\\\)|) podaza na ([^ ]*)\\\\.$$" _gonimy_1 = /_gon_func %%; /_strzalki_func %;\
        /def -Fp3 -mregexp -t"^(?i)(%{gon_targ})(?: \\\\(.*\\\\)|) w panice wybiega na ([^ ]*)\\\\.$$" _gonimy_2 = /_gon_func %%; /_strzalki_func %;\
        /def -Fp3 -mregexp -t"^\\\\[(?i)(%{gon_targ})](?: \\\\(.*\\\\)|) przemyka sie na ([^ ]*)\\\\.$$" _gonimy_3 = /_gon_func %%; /_strzalki_func %;\
        /def -Fp3 -mregexp -t"^(?i)(%{gon_targ})(?: \\\\(.*\\\\)|) w panice umyka na ([^ ]*)\\\\.$$" _gonimy_4  = /_gon_func %%; /_strzalki_func %;\
        /def -Fp3 -mregexp -t"(?i)(%{gon_targ})(?: \\\\(.*\\\\)|)(?: i .* |, .* | )podazaja na ([^ ]*)\\\\.$$" _gonimy_5  = /_gon_func %%; /_strzalki_func %;\
    /endif

/def niegon = \
    /unset ogolne_gon_bind %;\
    /unset ogolne_gon_auto %;\
    /set gon_targ=NIC %;\
    /purge _gonimy_*

/_gon

/def ?gon = \
   /echo Uzycie /gon -af1  

;/def fz = /def -mregexp -t"%{*} podaza na (.*)." gon = /if (%%P1=~'gore') gora %%; /else %%P1 %%; /endif %; /def -mregexp -t"%{*} uciekl ci na (.*)." gon = /if (%%P1=~'gore') gora %%; /else %%P1 %%; /endif 
;/def kil = /k %{1} %; /set targ=%2 %; /gongo %; /tpolegl 
;/def ex = /def -t"%* podaza na (.*)." gonimy = /if (%%P1=~'gore') gora %%; /else %%P1 %%; /endif %; /echo **Follow**
;/def exx = /def -mregexp -t"*%{targ} podaza na (.*)." gonimy  = /if (%%P1=~'gore') gora %%; /else %%P1 %%; /endif %; /echo **Follow2**
;/def fol = /def -t'%* podaza na (.*)." gonimy  = /if (%%P1=~'gore') gora %%; /else %%P1 %%; /endif
;/def ubieraj = /def -aB -p35 -1 -F -t"*{muska cie|rani cie} *" al =/uu%;/y%;/echo *********** Ubieram sie jak ktos mnie zrani!! ***************
;/def nieubieraj=/undef al
;/def tpolegl = /def  -1 -F -p2 -t"*%{targ} polegl*." usun_gon = /undef gon /%; krzyknij %; popatrz z obrzydzeniem na cialo


;------------------------------------------------------------------------------
;|			   PICIE I JEDZENIE				      |
;------------------------------------------------------------------------------

/purge -i _ustaw_zarcie_i_picie
/def -i _ustaw_zarcie_i_picie = \
    /if ({*} =/ 'Karczma w wiosce Czarny Staw.') \
	/set spirytusik wino%;/set jedzonko placek %;\
    /elseif ({*} =/ "Karczma 'Pod Grabem' w Grabowej Buchcie.") \
	/set spirytusik wisniowka%;/set jedzonko zupe %;\
    /elseif ({*} =/ 'Karczma pod Zlamana Strzala.') \
	/set spirytusik wisniowke%;/set jedzonko zupe%;/set soczek sok %;\
    /elseif ({*} =/ 'Karczma Trzy Dzwoneczki.') \
	/set spirytusik grzane piwo %;/set jedzonko jajecznice %;/set soczek herbate%;\
    /elseif ({*} =/ 'Portowa tawerna o milej nazwie Zeza.') \
	/set spirytusik rum %;/set jedzonko rybe %;\
    /elseif ({*} =/ 'Karczma Mlynskie Kolo.') \
	/set spirytusik wodke %;/set jedzonko baranine %;/set soczek mleko%;\
    /elseif ({*} =/ "Karczma: 'Kamienny Bar'.") \
	/set spirytusik wodke %;/set jedzonko pieczen %;\
    /elseif ({*} =/ "Gospoda 'Zacisze'.") \
	/set spirytusik miod %; /set jedzonko indyka %;\
    /elseif ({*} =/ "Gospoda 'Pod Scieta Glowa'.") \
	/set spirytusik piwo %; /set jedzonko pasztet %;/set soczek wode%;\
    /elseif ({*} =/ 'Piekarnia w Mariborze.') \
	/set jedzonko chleb %;\
    /elseif ({*} =/ "Karczma 'Pod Kucykiem'.") \
	/set spirytusik piwo %; /set jedzonko kasze %;/set soczek sok%;\
    /elseif ({*} =/ "Karczma Pod Pegazem.") \
	/set spirytusik wodke %; /set jedzonko udko %;\
    /elseif ({*} =/ "Zadymiona karczma.") \
	/set spirytusik gorzalke %; /set jedzonko kielbase %;\
    /elseif ({*} =/ "Karczma 'U Hiraca'.") \
	/set spirytusik nalewke %; /set jedzonko golabka %;/set soczek sok %;\
    /elseif ({*} =/ "Karczma 'U Dobrej Gospodyni'.") \
	/set spirytusik koniak %; /set jedzonko wegorza %;\
    /elseif ({*} =/ "Tawerna u Grubego Mario.") \
	/set spirytusik wino %; /set jedzonko nalesnika %;\
    /elseif ({*} =/ "Gospoda pod Ucietym Palcem.") \
        /set siedzonko przy stole %;\
	    /set spirytusik piwo %;\
        /set jedzonko rosol %;\
    /elseif ({*} =/ "Restauracja Smak Madrosci.") \
	/set spirytusik wermuta %; /set jedzonko insalata%;\
    /elseif ({*} =/ "Karczma 'Pelen kielich'.") \
	/set spirytusik piwo %; /set jedzonko watrobki%;\
    /elseif ({*} =/ "Miejscowa karczma.") \
	/set spirytusik gorzalke %; /set jedzonko zupe%;\
    /elseif ({*} =/ "Niewielka restauracja.") \
	/set spirytusik wino %; /set jedzonko pieczonego pstraga%;\
    /elseif ({*} =/ "Krasnoludzka karczma 'Pod Bezzebnym Smokiem'.") \
	/set spirytusik przepalanke %;\
    /elseif ({*} =/ "Gospoda:'Pod pijanym trollem'.") \
	/set spirytusik spirytus%;/set jedzonko gulasz %;\
    /elseif ({*} =/ "*Jadalnia zajazdu 'Pod Wrzesniowym Piwem'.*") \
        /set siedzonko przy stole %;\
        /set spirytusik wino %;\
        /set jedzonko nalesnika %;\
        /set soczek herbate %;\
    /elseif ({*} =/ '*Browar Saufera*') \
	/set spirytusik ciemne piwo %;\
    /elseif ({*} =/ '*Karczma w Kreutzhofen*') \
	/set spirytusik piwo %;/set jedzonko wegorza %;\
    /elseif ({*} =/ '*Sala biesiadna*') \
	/set spirytusik wodke%;/set jedzonko befsztyk %;\
    /elseif ({*} =/ '*Karczma w Athel Loren*') \
	/set spirytusik wino%;/set jedzonko ziemniaki %;\
    /elseif ({*} =/ '*Piekarnia w Athel-Loren*') \
	/set jedzonko chleb %;\
    /elseif ({*} =/ '*Jadlodajnia w Athel-Loren*') \
	/set spirytusik wino%;/set jedzonko owoce %;/set soczek sok%;\
    /elseif ({*} =/ '*Karczma *Pod wesolym studentem*') \
	/set spirytusik nalewke %;/set jedzonko golonke %;\
    /elseif ({*} =/ '*Winiarnia Biala Dama*') \
	/set spirytusik wisniowke %;\
    /elseif ({*} =/ '*Obskurna karczma*') \
	/set spirytusik piwo %; /set jedzonko stek %;\
    /elseif ({*} =/ '*Karczma *U Rudolfa*') \
	/set spirytusik koniak %; /set jedzonko pasztet %;\
    /elseif ({*} =/ '*Gospoda *Bialy Kiel*') \
	/set spirytusik wino %; /set jedzonko pieczen %;\
    /elseif ({*} =/ '*Plackarnia.') \
	/set jedzonko placek z kurczakiem %; /set spirytusik herbate z rumem %;\
    /elseif ({*} =/ 'Piekarnia.') \
        /set siedzonko=- %;\
        /set jedzonko bulke %;\
    /elseif ({*} =/ '*Glowna izba Karczmy Rzeznickiej.') \
	/set spirytusik wodke %; /set jedzonko befsztyk %;\
    /elseif ({*} =/ '*Gospoda kupiecka pod Zlotym Kielichem.') \
	/set spirytusik orzechowke %; /set jedzonko flaczki %;\
    /elseif ({*} =/ '*Tawerna pod Grotem Wloczni.') \
	/set spirytusik wino %;\
    /elseif ({*} =/ 'Gospoda.') \
	/set spirytusik gorzalke %; /set jedzonko baranine %;\
    /elseif ({*} =/ 'Karczma.') \
	/set spirytusik piwo%;/set jedzonko udziec %;\
    /elseif ({*} =/ 'Karczma \'Pod Kotwica\'.') \
        /set siedzonko przy stoliku%;\
        /set spirytusik miod%;\
        /set jedzonko zupe %;\
        /set soczek sok %;\
    /elseif ({*} =/ 'Szynk.') \
        /set siedzonko przy stole %;\
        /set spirytusik powo %;\
        /set jedzonko kasze %;\
        /set soczek herbate %;\
    /elseif ({*} =/ 'Glowna sala zajazdu.') \
        /set siedzonko przy stole %;\
        /set spirytusik piwo %;\
        /set jedzonko udziec %;\
        /set soczek mleko %;\
    /elseif ({*} =/ 'Karczma \'Przy Garnizonie\'.') \
        /set siedzonko przy stole %;\
        /set spirytusik spirytus %;\
        /set jedzonko chleb %;\
    /elseif ({*} =/ 'Karczma \'Stary Narakort\'.') \
        /set jedzonko polewke %;\
    /elseif ({*} =/ 'Stolowka.') \
        /set siedzonko przy stole %;\
        /set jedzonko grochowke %;\
    /elseif ({*} =/ 'Karczma \'Pod peknietym kuflem\'.') \
        /set siedzonko przy stole%;\
        /set spirytusik wodke%;\
        /set jedzonko zupe%;\
;    /elseif ({*} =/ '**') \
;        /set siedzonko %;\
;        /set spirytusik %;\
;        /set jedzonko %;\
;        /set soczek %;\
    /endif

/def -p600 -aB -t'*do ciebie: A moze najpierw gdzies usiadziesz*' _siadaj_ciolku = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do usiadz przy stole

/def -aB -t'A moze najpierw gdzies usiadziesz*' _siadaj_ciolku_2 = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do usiadz przy stole

/def -aB -t'Nie mozesz sie tam udac, gdyz siedzisz*' _wstawaj_ciolku = \
    /if ($(/_czesto)) \
    	/return %;\
    /endif %;\
    /_trig_do wstan

/def _zarcie_i_picie = \
    /quote -S /_ustaw_zarcie_i_picie #200 %;\
    /if ({*} =~ "sok") \
	/if ({soczek} !~ NULL) \
	    /let _zarcie=%{soczek} %;\
	/else \
	    /echo W tej karczmie nie ma soczku!! %;\
	    /return %;\
	/endif %;\
    /elseif ({*} =~ "jedz") \
	/if ({jedzonko} !~ NULL) \
	    /let _zarcie=%{jedzonko} %;\
	/else \
	    /echo W tej karczmie nie ma nic do jedzenia!! %;\
	    /return %;\
	/endif %;\
    /elseif ({*} =~ "bar") \
	/if ({spirytusik} !~ NULL) \
	    /let _zarcie=%{spirytusik} %;\
	/else \
	    /echo W tej karczmie nie ma zadnego alkoholu!! %;\
	    /return %;\
	/endif %;\
    /endif %;\
    /if ({siedzonko} =~ NULL) \
        usiadz przy stole %;\
        usiadz za lawa %;\
    /elseif ({siedzonko} !~ "-") \
        usiadz %{siedzonko} %;\
    /endif %;\
    /wem %;\
    /echo Zamawiam %{_zarcie}. %;\
    /for i 1 7 zamow %{_zarcie} %;\
    /wlm %;\
    /unset siedzonko %;\
    /unset jedzonko %;\
    /unset spirytusik %;\
    /unset soczek
    

/def bar = /_zarcie_i_picie bar

/def jedz = /_zarcie_i_picie jedz

/def sok = /_zarcie_i_picie sok

/def nap = \
    napij sie z buklaka

/def fff = \
    napelnij buklak woda z fontanny

/def nnn = \
    napelnij buklak woda z sadzawki

/def bee = \
    napij sie z beczki

/def be = \
    napij sie z beczulki

/def nisza = \
    napij sie duzo wody z niszy

/def kub = \
    napij sie z kubka

/def buk = \
    wez buklak z %{ogolne_plecaka-placaka} %;\
    /nap %;\
    pinapelnij z buklaka %;\
    wloz buklak do %{ogolne_plecaka-placaka}

/def bek = \
    wez beczulke z %{ogolne_plecaka-placaka} %;\
    /be %;\
    pinapelnij z beczulki %;\
    wloz beczulke do %{ogolne_plecaka-placaka}

/def pij = \
    napij sie z kranika %;\
    napij sie z niszy %;\
    napij sie z rurki %;\
    napij sie z fontanny %;\
    napij sie z jeziorka %;\
    napij sie z jeziora %;\
    napij sie ze strumienia %;\
    napij sie ze strumyka %;\
    napij sie z sadzawki %;\
    napij sie z rzeki %;\
    napij sie ze zrodelka %;\
    napij sie z koryta %;\
    napij sie z beczki %;\
    napij sie z bajorka %;\
    napij sie z urny %;\
    napij sie ze studni %;\
    napij sie z niecki %;\
    napij sie ze zrodla %;\
    napij sie z potoku %;\
	napij sie z tunelu %;\
    /_picie

/def _picie_add = \
    /def -p10 -a%{ogolne_color_info_fpicie-B} \
        -t'%{1}' _picie_trig_%{_pi_last_id} = %{2} %;\
    /test ++_pi_last_id

/def _picie = \
    /set _pi_last_id=4 %;\
    /purge _picie_trig_* %;\
    /rstart -40 1 /purge _picie_trig_* %;\
    /def -aB -t'*Wypil?s juz tak duzo, ze nie jestes w st*'	_picie_trig_0 = \
        /rstop _picie_trig %%;\
        /rstart -3 1 /purge _picie_trig_* %;\
    /def -ag -t'*Napij sie z czego*' 				_picie_trig_1 %;\
    /def -ag -t'*Napij sie \\\\[wody\\\\] skad*'		_picie_trig_2 %;\
    /def -aB -mregexp -t'Pijesz lyk wody (z(?:e|) (?:.*))\\\\.'	_picie_trig_3 = napij sie %%{P1} %;\
    /test _picie_add("*Podchodzisz do fontanny*", "napij sie z fontanny") %;\
    /test _picie_add("*zesciowo nasycasz swoje pragnienie*", "napij sie z fontanny") %;\
    /test _picie_add("*Podchodzisz do jeziorka*", "napij sie z jeziorka") %;\
    /test _picie_add("*Pijesz orzezwiajacy lyk wody prosto z je*", "napij sie z jeziorka") %;\
    /test _picie_add("*Smakuje naprawde cudnie*", "napij sie z jeziorka") %;\
    /test _picie_add("*Smakuje doprawdy wysmienicie*", "napij sie z jeziorka") %;\
    /test _picie_add("*Pochylasz sie nad fontanna i nabierajac w dlonie troche wody*", "napij sie z fontanny") %;\
    /test _picie_add("Podchodzisz do gorskiego strumienia, przyk*", "napij sie ze strumienia") %;\
    /test _picie_add("*Podchodzisz do samego brzegu rzeki,*", "napij sie z rzeki") %;\
    /test _picie_add("*Podchodzisz do brzegu rzeki i czerpiesz *", "napij sie z rzeki") %;\
    /test _picie_add("*Zachecon? widokiem krystalicznie czystej*", "napij sie z sadzawki") %;\
    /test _picie_add("*Czerpiesz w troche wody ze strumienia i wypijasz ja duszkiem.*", "napij sie ze strumienia") %;\
    /test _picie_add("*Podchodzisz do sciany, odkrecasz kranik *", "napij sie z kranika") %;\
    /test _picie_add("*Nadstawiasz rozwarta paszcze pod rurke*", "napij sie z rurki") %;\
    /test _picie_add("*Podchodzisz do niszy, nachylasz sie i pi*", "napij sie z niszy") %;\
    /test _picie_add("*Nabierasz w dlonie nieco krystalicznie czyst*", "napij sie z niszy") %;\
    /test _picie_add("*Pochylasz sie i nabierasz dlonia troche wody*", "napij sie ze zrodelka") %;\
    /test _picie_add("*Podchodzisz do strumienia, nachylasz sie i w*", "napij sie ze strumyka") %;\
    /test _picie_add("*Czerpiesz rekami troche wody ze strumienia b*", "napij sie ze strumienia") %;\
    /test _picie_add("*Czerpiesz w swe dlonie wode z fontanny i wyp*", "napij sie z fontanny") %;\
    /test _picie_add("*Klekasz nad brzegiem i nabierasz nieco wody *", "napij sie z bajorka") %;\
    /test _picie_add("*Nabierasz wody w dlonie i pijesz lyk. Jest p*", "napij sie ze strumienia") %;\
    /test _picie_add("*Przyklekasz przy korycie i pijesz lyk wody*", "napij sie z koryta") %;\
    /test _picie_add("*Wkraczasz w zimny nurt strumienia i broczac*", "napij sie ze strumyka") %;\
    /test _picie_add("*Przyklekasz nad jeziorkiem i pijesz lyk orz*", "napij sie z jeziorka") %;\
    /test _picie_add("*Nachylasz sie nad fontanna, nabierasz w dlo*", "napij sie z fontanny") %;\
    /test _picie_add("*Woda wlasciwie nie ma smaku, ale za to ma t*", "napij sie ze strumyka") %;\
    /test _picie_add("*Pochylasz sie nad korytem i z niejakim obrz*", "napij sie z koryta") %;\
    /test _picie_add("*Podchodzisz do srebrzystej tafli jeziorka i*", "napij sie z jeziorka") %;\
    /test _picie_add("*Podchodzisz do brzegu jeziora i nabierasz n*", "napij sie z jeziora") %;\
    /test _picie_add("*Nachylasz sie nad urna i nabierasz wody w z*", "napij sie z urny") %;\
    /test _picie_add("*Zanurzasz dlonie w chlodnym nurcie strumyka*", "napij sie ze strumyka") %;\
    /test _picie_add("*Nachylasz sie nad strumieniem i pijesz lyk*", "napij sie ze strumienia") %;\
    /test _picie_add("Zanurzasz dlonie i twarz w kamiennej niecce*", "napij sie z niecki") %;\
    /test _picie_add("Nabierasz wody znajdujacej sie w niecce i pijesz ja gaszac pragnienie.*", "napij sie z niecki") %;\
    /test _picie_add("Nachylasz sie nad tafla stawu i nabierasz wody w zlaczone dlonie.*", "napij sie ze stawu") %;\
    /test _picie_add("Pijesz duzymi lykami wode z fontanny.", "napij sie z fontanny") %;\
    /test _picie_add("Podchodzisz do brzegu strumienia, przyklekasz i czerpiesz z*", "napij sie ze strumienia") %;\
    /test _picie_add("Czerpiesz w troche wody ze strumienia i wypijasz ja duszkiem*", "napij sie ze strumienia") %;\
    /test _picie_add("Podchodzac do fontanny pochylasz sie lekko i nabierasz w zlaczone dlonie przyjemnie chlodnej, srebrzystej wody spijajac ja lapczywie.", "napij sie z fontanny") %;\
    /test _picie_add("Nabierasz wody z fontanny w dlonie i spijasz ja szybko.", "napij sie z fontanny") %;\
    /test _picie_add("Schodzac z goscinca zblizasz sie do pobliskiego jeziora i przyklekajac na jego brzegu nabierasz kwasnej wody w dlonie szybko ja spijajac.", "napij sie z jeziora") %;\
    /test _picie_add("Nachylasz sie nad tafla jeziorka, nabierasz w dlonie nieco lodowatej wody i gasisz nia pragnienie.", "napij sie z jeziorka") %;\
    /test _picie_add("Pochylasz sie nad powierzchnia jeziora, w zlozone dlonie nabierasz troche wody i wypijasz ja lapczywie.", "napij sie z jeziora") %;\
    /test _picie_add("Nachylasz sie nad stawem i nabierasz wody w zlozone dlonie. *", "napij sie ze stawu") %;\
    /test _picie_add("Podchodzisz do strumienia i nabierasz troche krystalicznie czystej wody w dlonie gaszac pragnienie.", "napij sie ze strumienia") %;\
    /test _picie_add("Pijesz rzeska wode wprost ze zrodla. Jest bardzo zimna i czysta, istne zbawienie w tym klimacie.", "napij sie ze zrodla") %;\
    /test _picie_add("Przyklekasz przy jeziorze i wypijasz lyk chlodnej wody. Jest nieco mulista, lecz orzezwiajaca.", "napij sie z jeziora") %;\
    /test _picie_add("Przyklekasz nad strumieniem, skladasz dlonie i nabierasz w nie nieco lodowatej wody, poczym spijasz ja chciwie. Twoje rece i usta kostnieja w tak niskiej temperaturze.", "napij sie ze strumienia") %;\
    /test _picie_add("Nachylasz sie nad strumykiem i nabierasz wody w zlozone dlonie. Cudownie*", "napij sie ze strumienia") %;\
    /test _picie_add("Nachylasz sie nad kamienna misa*", "napij sie z fontanny") %;\
    /test _picie_add("Przykucasz nad potokiem, nabierasz*", "napij sie ze strumienia") %;\
    /test _picie_add("Nabierasz wody z niszy w dlonie, po czym*", "napij sie z niszy") %;\
    /test _picie_add("Zanurzajac swe dlonie w potoku nabierasz w nie lodowatej, krystalicznie*", "napij sie z potoku") %;\
    /test _picie_add("Podchodzac do strumyka nabierasz w dlonie niewielka ilosc wody*", "napij sie ze strumyka") %;\
    /test _picie_add("Nabierasz wody w dlonie i pijesz lyk tej lodowatej cieczy. Nie jest ona zbyt czysta*", "napij sie z tunelu") %;\
;    /test _picie_add("", "") %;\
;    /test _picie_add("", "") %;\
;    /test _picie_add("", "") %;\
;    /test _picie_add("", "") %;\
    /unset _pi_last_id
    

