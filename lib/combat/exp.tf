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
    /def rzezba = obroc rzezbe
    /test _exp_set("kosciotrupa", "zombiego", "wichta", "demona", "szalenca", "szczurolaka")%;\
    /_exp_prompt RUINY

/def lorenzo = \
    /test _exp_set("pierwszego karla", "pierwszego zboja", "lorenza")%;\
    /_exp_prompt LORENZO

/def orson = \
    /test _exp_set("pierwszego straznika", "pierwszego kaplana", "charyzmatycznego mezczyzne")%;\
    /_exp_prompt ORSON

/def grzyby = \
    /test _exp_set("mocarnego grzyboczleka", "silnego grzyboczleka", "krzepkiego grzyboczleka", "grzyboczleka", "borowika")%;\
    /def nn = przeplyn na polnoc
    /def ss = przeplyn na poludnie
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

/def -p9999 -t'*Mustafa Ali IV*' = _exp_location_mustafa = /mustafa
/def -p9999 -t'Przechodzisz przez nie majac wrazenie, ze opuszczasz bezpieczne tereny i to nie wiadomo czy nie na zawsze...' _exp_location_mahakam = /mahak
