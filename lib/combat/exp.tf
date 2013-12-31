/def _exp_set = \
    /purge [0-9]%;\
    /let i=0%; \
    /while ({#}) \
        /let i=$[i+1]%;\
        /let target=%1%; \
        /def %{i} = /zabij %{target}%;\
        /shift %;\
    /done

/def _exp_prompt = \
    /echo%;\
    /echo ustawiono expowisko na %{*}%;\
    /list [0-9]%;\
    /echo

/def mahak = \
    /test _exp_set("oficera", "kobolda", "goblina", "pukacza", "trolla", "echinopsa", "barbegazi", "poteznego dostojnego goblina", "siodmego goblina")%;\
    /alias szcz wejdz w szczeline%;\
    /def check = wyjscie%%;s%%;ob poteznego dostojnego goblina%%;n%%;swiatynia%;\
    /def lec = wejdz w szczeline%%;e%%;e%%;ob poteznego dostojnego goblina%%;w%%;w%%;s%;\
    /def top = otworz skrzynie kluczem%%;otworz skrzynie%%;wez topor z skrzyni%%;wloz klucz do skrzyni%;\
    /_exp_prompt MAHAKAM

/def redcapy = \
    /test _exp_set("pierwszego redcapa", "drugiego redcapa", "trzeciego redcapa", "czwartego redcapa")%;\
    /_exp_prompt REDCAPY

/def lorenzo = \
    /test _exp_set("pierwszego karla", "pierwszego zboja", "lorenza")%;\
    /_exp_prompt LORENZO

/def orson = \
    /test _exp_set("pierwszego straznika", "pierwszego kaplana", "charyzmatycznego mezczyzne")%;\
    /_exp_prompt ORSON

/def profesor = \
    /test _exp_set("yaxe", "heima", "ralfa")%;\
    /_exp_prompt PROFESOR

/def grzyby = \
    /test _exp_set("mocarnego grzyboczleka", "silnego grzyboczleka", "krzepkiego grzyboczleka", "grzyboczleka", "borowika")%;\
    /def nn = przeplyn na polnoc%;\
    /def ss = przeplyn na poludnie%;\
    /_exp_prompt GRZYBY

/def kurhan = \
    /test _exp_set("kosciotrupa", "zombiego", "ozywienca")%;\
    /_exp_prompt KURHAN

/def mustafa = \
    /test _exp_set("pierwszego zboja", "mustafe")%;\
    /_exp_prompt MUSTAFA

/def karawana = \
    /test _exp_set("pierwszego nomada", "wielblada", "drugiego wielblada", "poteznego wielblada")%;\
    /_exp_prompt KARAWANA

/def piraci = \
    /test _exp_set("pierwszego korsarza", "drugiego korsarza", "kapitana")%;\
    /_exp_prompt PIRACI%;\
    /def fusta = wejdz na fuste%%;wejdz na fuste

/def vrany = \
    /test _exp_set("pierwszego vrana", "drugiego vrana", "trzeciego vrana", "bobolaka")%;\
    /def kasa = zajrzyj do szkatulki%;\
    /_exp_prompt VRANY

/def potepy = \
    /test _exp_set("pierwszego potepienca", "drugiego potepienca", "trzeciego potepienca", "czwartego potepienca")%;\
    /_exp_prompt POTEPY

/def talwar = \
    /test _exp_set("pierwsza wojowniczke", "druga wojowniczke", "trzecia wojowniczke", "czwarta wojowniczke")%;\
    /def pret = przeszukaj zaglebienie%;\
    /def prett = umiesc pret w mechanizmie%;\
    /def skok = przeskocz nad zaglebieniem%;\
    /def pret = przeszukaj wgblebienie%;\
    /def prett = umiesc pret w mechanizmie%;\
    /_exp_prompt TALWAR

/def korredy = \
    /test _exp_set("pierwsza kreature", "druga kreature", "potwora")%;\
    /_exp_prompt KORREDY

/def fort = \
    /test _exp_set("pierwszego zboja", "xamusa", "maxusa")%;\
    /_exp_prompt FORT

/def krwiak = \
    /def prycza = odsun prycze%;\
    /test _exp_set("ochroniarza", "szpiega")%;\
    /_exp_prompt SZPIEDZY

/def szpiedzy = /krwiak

/def blavi = \
    /test _exp_set("pierwsza zjawe", "druga zjawe", "trzecia zjawe", "czwarta zjawe", "piata zjawe", "urokliwa zjawe", "majestatyczna zjawe")%;\
    /def key_f6 = ob wglebienia%%;ob mozaike%%; wcisnij kafelek%%;przekrec rubin%%;ob oltarz%%;ob sarkofag%;\
    /def klucz = zloz pierwsza polkule z druga polkula%;\
    /def brama = otworz brame kula%;\
    /_exp_prompt BLAVIKEN

/def zywki = \
    /test _exp_set("zywiolaka", "drugiego zywiolaka", "trzeciego zywiolaka")%;\
    /_exp_prompt ZYWKI

/def skavy = \
    /test _exp_set("skavena", "drugiego skavena", "trzeciego skavena", "czwartego skavena")%;\
    /_exp_prompt SKAVENY

/def ryby = \
    /test _exp_set("pierwszego ryboczleka", "drugiego ryboczleka", "trzeciego ryboczleka", "czwartego ryboczleka")%;\
    /_exp_prompt RYBOCZLEKI

/def zboje = \
    /test _exp_set("pierwszego zboja", "drugiego zboja", "trzeciego zboja", "czwartego zboja")%;\
    /_exp_prompt ZBOJE

/def golemy = \
    /test _exp_set("pierwszego golema", "drugiego golema", "trzeciego golema", "czwartego golema")%;\
    /_exp_prompt GOLEMY

/def rivanon = \
    /test _exp_set("rivanona", "markada", "ildefonso")%;\
    /_exp_prompt RIVANON

/def ruiny = \
    /test _exp_set("wichta", "zombiego", "szkielet", "demona", "szalenca", "szczurolaka")%;\
    /load combat/exp/rinde.tf%;\
    /_exp_prompt RUINY

/def rinde = /ruiny

/def kiki = \
    /test _exp_set("pierwszego pajeczaka", "drugiego pajeczaka", "trzeciego pajeczaka", "czwartego pajeczaka", "piatego pajeczaka", "szostego pajeczaka")%;\
    /def key_f6 = sprawdz polnoc


/def -t'*Oto Rivanon von Willgenstein, rycerz z mroznej polnocy.' _expo_location_rivanon = /rivanon
/def -t'*Mustafa Ali IV*' _exp_location_mustafa = /mustafa
/def -t'Przechodzisz przez nie majac wrazenie, ze opuszczasz bezpieczne tereny i to nie wiadomo czy nie na zawsze...' _exp_location_mahakam = /mahak
/def -t'Glowna sala Swiatyni Wiecznego Ognia.' _exp_location_orson = /orson
/def -t"'Profesor' vel Ralf Blunden, mezczyzna." _exp_location_profesor = /profesor
/def -t'* drewniana prycze, wraz z przymocowanym do niej fragmentem podlogi*' = /krwiak
