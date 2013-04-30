/def key_f13 = /1
/def key_f14 = /2
/def key_f15 = /3

/def key_esc_f13 = /1%;rozkaz druzynie zabic cel ataku
/def key_esc_f14 = /2%;rozkaz druzynie zabic cel ataku
/def key_esc_f15 = /3%;rozkaz druzynie zabic cel ataku

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
    /_exp_prompt MAHAKAM

/def redcapy = \
    /test _exp_set("pierwszego redcapa", "drugiego redcapa", "trzeciego redcapa", "czwartego redcapa")%;\
    /_exp_prompt REDCAPY

/def ruiny = \
    /def studnia = wejdz do studni%%;przecisnij sie przez otwor%;\
    /def podest = wejdz na podest%%;wejdz do grobowca%;\
    /def otwor = przecisnij sie przez otwor%;\
    /def sciana = wejdz w sciane%;\
    /def glaz = zeskocz na glaz%%;wskocz do wody%%;zanurkuj pod wode%;\
    /def wespnij = wespnij sie do gory%%;wespnij sie na gore%;\
    /def rzezba = obroc rzezbe%;\
    /def wcisnij = wcisnij plaskorzezbe%;\
    /test _exp_set("kosciotrupa", "zombiego", "wichta", "demona", "szalenca", "szczurolaka")%;\
    /_exp_prompt RUINY

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
    /test _exp_set("pierwszego nomada", "wielblada")%;\
    /_exp_prompt KARAWANA

/def piraci = \
    /test _exp_set("pierwszego korsarza", "drugiego korsarza", "kapitana")%;\
    /_exp_prompt PIRACI%;\
    /def fusta = wejdz na fuste%%;wejdz na fuste

/def vrany = \
    /_exp_prompt VRANY%;\
    /test _exp_set("pierwszego vrana", "drugiego vrana", "trzeciego vrana", "bobolaka")%;\
    /def kasa = zajrzyj do szkatulki

/def potepy = \
    /_exp_prompt POTEPY%;\
    /test _exp_set("pierwszego potepienca", "drugiego potepienca", "trzeciego potepienca", "czwartego potepienca")

/def talwar = \
    /_exp_prompt TALWAR%;\
    /test _exp_set("pierwsza wojowniczke", "druga wojowniczke", "trzecia wojowniczke", "czwarta wojowniczke")%;\
    /def skok = przeskocz nad zaglebieniem

/def -p9999 -t'*Mustafa Ali IV*' _exp_location_mustafa = /mustafa
/def -p9999 -t'Przechodzisz przez nie majac wrazenie, ze opuszczasz bezpieczne tereny i to nie wiadomo czy nie na zawsze...' _exp_location_mahakam = /mahak
/def -p9999 -t'Glowna sala Swiatyni Wiecznego Ognia.' _exp_location_orson = /orson
/def -p9999 -t"'Profesor' vel Ralf Blunden, mezczyzna." _exp_location_profesor = /profesor