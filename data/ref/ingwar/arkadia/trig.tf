; Automagicly added line: tf_ver=1.0.8
/require -q textutil.tf

/def _czesto = \
    /if (nie_za_czesto != 0) \
        /result 1 %;\
    /else \
        /set nie_za_czesto=1 %; /rstart -%{1-5} 1 /set nie_za_czesto=0 %;\
        /result 0 %;\
    /endif

;/def ala=/czesto%;/%{?}%;/echo Poszlo

/def -Fp250 -mregexp -t"^(> )+" _wyrzuc_prompty_1 = /return substitute({PR})
;/def -Fp250 -mregexp -t"^([0-9]+\\])+" _wyrzuc_prompty_2 = /return substitute({PR})

;-------------------------------------------------------------------------------
;|                                WSPIERANIE                                   |
;-------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;                                DRUZYNA I TAKIE TAM
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;|                             AUTOMATY                                       |
;------------------------------------------------------------------------------


;-------------------------------------------------------------------------------
;|                              ZATRUCIA                                       |
;-------------------------------------------------------------------------------
/def -FaB -t'*zostal[eao]s zatrut*' _zatrucia_plus = \
    /set trucizna=$[{trucizna}+1] %;\
    /zatrucia juz

/def -FaB -t'*Czujesz fale zimna*' _zatrucia_plus_ghoule = \
    /_zatrucia_plus %;\
    /repeat -600 1 /_zatrucia_minus


/def -FaB -t'*{*Czujesz, ze do twego ciala dostala sie jakas trucizna*|*Czujesz, ze do twego ciala dostala sie kolejna dawka tej piekielnej trucizny*}*' _zatrucia_plus_vyverna = \
    /_zatrucia_plus

/def -FaB -t'*Czujesz sie znacznie lepiej*' _zatrucia_minus = \
    /if ({trucizna}>0) \
      /test --trucizna %;\
    /endif %;\
    /zatrucia jeszcze

/def -FaB -t'*Twoj oddech wraca powoli do normy, swiat znow nabiera zwyczajnych barw, zas *' _zatrucia_minus_vyverna = \
    /_zatrucia_minus

/def tru=/zatrucia 
/def zatrucia = \
    /echo -p -aCgreen Jestes zatruty %{1-dokladnie} "@{B}%{trucizna-0}@{n}" razy!!!!

;-------------------------------------------------------------------------------
;|                          WYJSCIA Z LOKACJI                                  |
;-------------------------------------------------------------------------------

/def -q -h'SEND {n|s|w|e|se|sw|nw|ne|gora|dol|g|d|u}' _wyjscia_poszedl=/set poszedl=1
/def -P0BCgreen -t'(Jest|Sa) tutaj ([^ ]*) widoczn(e|ych) wyjsc(|ie|ia):' _wyjscia_trig_1 = \
    /_wyjscia_licz %{PR}

/def -P0BCgreen -t'W mroku nocy dostrzegasz ([^ ]*) widoczn(e|ych) wyjsc(|ie|ia):' _wyjscia_trig_2 = \
    /_wyjscia_licz %{PR}

/def -P0BCgreen -t'(Szlak|Sciezka) prowadzi tutaj w ([^ ]*) kierunk(ach|u):' _wyjscia_trig_3 = \
    /_wyjscia_licz %{PR}

/def -P0BCgreen -t'Wydeptane w kukurydzy sciezki prowadza na' _wyjscia_trig_4 = \
    /_wyjscia_licz %{PR}

/def -P1BCgreen -t'^(Trakt wiedzie na|W gestych ciemnosciach dostrzegasz trakt wiodacy na|Trakt rozgalezia sie na|W gestych ciemnosciach dostrzegasz, ze trakt rozgalezia sie na) ([^.]*).( Mozna jednak z niego zejsc i udac sie na |)([^.]*.|)' _wyjscia_trig_5 = \
    /_wyjscia_licz %{P2} %{P4}


/def -aBCgreen -t'*Zamglone bagno.*' _wyjscia_bagno = \
    /set poszedl=0 %;\
    /set wyjscia_z_lokacji=Bagno na cacy!!

/def -aBCgreen -t'*Ciemne miejsce*' _wyjscia_ciemnosc = \
    /set poszedl=0 %;\
    /set wyjscia_z_lokacji=Widze ciemnosc!

/purge -i _wyjscia_licz

/def -i _wyjscia_licz = \
    /set poszedl=0


;-------------------------------------------------------------------------------
;|                          DYLIZANS I STATEK                                  |
;-------------------------------------------------------------------------------


; ------------------------------------------------------------------------------
;|                             GONIENIE					      |
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;|			   PICIE I JEDZENIE				      |
;------------------------------------------------------------------------------

