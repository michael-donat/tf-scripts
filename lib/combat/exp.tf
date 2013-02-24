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
    /test _exp_set("oficera", "kobolda", "goblina", "pukacza", "trolla", "echinopsa", "barbegazi", "poteznego dostojnego goblina")%;\
    /alias szcz wejdz w szczeline%;\
    /_exp_prompt MAHAKAM

/def -p9999 -t'Przechodzisz przez nie majac wrazenie, ze opuszczasz bezpieczne tereny i to nie wiadomo czy nie na zawsze...' _exp_location_mahakam = \
    /mahak

/def exp_redcapy = \
    /test _exp_set("pierwszego redcapa", "drugiego redcapa", "trzeciego redcapa", "czwartego redcapa")%;\
    /_exp_prompt REDCAPY

/def ruiny = \
    /def studia = wejdz do studni%%;przecisnij sie przez otwor%;\
    /def podest = wejdz na podest%%;wejdz do grobowca%;\
    /def otwor = przecisnij sie przez otwor%;\
    /def sciana = wejdz w sciane%;\
    /def glaz = zeskocz na glaz%%;wskocz do wody%%;zanurkuj pod wode%;\
    /def wespnij = wespnij sie do gory%%;wespnij sie na gore%;\
    /def rzezba = obroc rzezbe
