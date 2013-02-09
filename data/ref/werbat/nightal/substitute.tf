/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na zagubion.* ml.*'                      _poziomy_doswiadczenia_1 = /_sub 1/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na niedorajde stawiajac.* pierwsze.*'    _poziomy_doswiadczenia_2 = /_sub 2/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na nieobeznan.* z drogami .*'            _poziomy_doswiadczenia_3 = /_sub 3/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na ciekaw.* przygod wedro.*'             _poziomy_doswiadczenia_4 = /_sub 4/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na podrozn.* przebywajac.*'              _poziomy_doswiadczenia_5 = /_sub 5/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na chwat.* badajac.* kazdy.*'            _poziomy_doswiadczenia_6 = /_sub 6/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na znan.* w gospodach .*'                _poziomy_doswiadczenia_7 = /_sub 7/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na obeznan.* ze swiatem wedrow.*'        _poziomy_doswiadczenia_8 = /_sub 8/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na podrozni.* o swiatowej slawie.*'      _poziomy_doswiadczenia_9 = /_sub 9/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na weteran.* przemierzajac.* swiat.*'    _poziomy_doswiadczenia_10 = /_sub 10/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na bohater.* zdobywajac.*'               _poziomy_doswiadczenia_11 = /_sub 11/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na niedoceni.* w swiecie bohat.*'        _poziomy_doswiadczenia_12 = /_sub 12/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na wielce doswiadczon.* bohater.*'       _poziomy_doswiadczenia_13 = /_sub 13/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na chwalon.* w swiecie bohater.*'        _poziomy_doswiadczenia_14 = /_sub 14/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na oslawion.* w piesniach bohater.*'     _poziomy_doswiadczenia_15 = /_sub 15/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na znajac.* niemalze kazda tajemnice.*'  _poziomy_doswiadczenia_16 = /_sub 16/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na bohater.* dla ktor.* swiat nie.*'     _poziomy_doswiadczenia_17 = /_sub 17/18
/eval /def -mregexp -Fp2 -t'^Wyglada(|sz) na tak.* co w pojedynke .*'              _poziomy_doswiadczenia_18 = /_sub 18/18

/def -mregexp -Fp2 -t'( dzga | powaznie tnie | lekko nakluwa | bardzo gleboko przebija | przebija niemal na wylot | siniaczy | tylko nacina | lekko tnie | gleboko tnie | bardzo mocno tnie | smiercionosnie tnie | powaznie kluje | gleboko kluje | ledwie zadrapuje | brutalnie tlucze | lekko obija | powaznie obija | mocno uderza )' _cios_tank = \
	/set klew=%PL %;\
	/set kpra=%PR %;\
	/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
	/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
	/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({kpra}, 0, strstr({kpra}, " ")))]

/def -mregexp -Fp2 -t'(?<!lekko|gleboko|bardzo mocno|smiercionosnie) tnie ' _cios_tank_wyjatek0 = \
	/set klew=%PL %;\
	/set kpra=%PR %;\
	/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
	/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
	/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({kpra}, 0, strstr({kpra}, " ")))]

/def -mregexp -Fp2 -t'(?<!powaznie|gleboko) kluje ' _cios_tank_wyjatek1 = \
	/set klew=%PL %;\
	/set kpra=%PR %;\
	/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
	/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
	/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({kpra}, 0, strstr({kpra}, " ")))]

/def -mregexp -Fp2 -t'(?<!ledwie) zadrapuje ' _cios_tank_wyjatek2 = \
	/set klew=%PL %;\
	/set kpra=%PR %;\
	/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
	/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
	/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({kpra}, 0, strstr({kpra}, " ")))]

/def -mregexp -Fp2 -t'(?<!brutalnie) tlucze ' _cios_tank_wyjatek3 = \
	/set klew=%PL %;\
	/set kpra=%PR %;\
	/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
	/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
	/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({kpra}, 0, strstr({kpra}, " ")))]

/def -mregexp -Fp2 -t'(?<!powaznie|lekko) obija ' _cios_tank_wyjatek4 = \
	/set klew=%PL %;\
	/set kpra=%PR %;\
	/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
	/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
	/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({kpra}, 0, strstr({kpra}, " ")))]

/def -mregexp -Fp2 -t'(?<!mocno|sila) uderza ' _cios_tank_wyjatek5 = \
	/set klew=%PL %;\
	/set kpra=%PR %;\
	/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
	/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
	/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({kpra}, 0, strstr({kpra}, " ")))]

/def -mregexp -Fp2 -t'(?<!ledwo) muska ' _cios_tank_wyjatek6 = \
	/set klew=%PL %;\
	/set kpra=%PR %;\
	/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
	/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
	/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({kpra}, 0, strstr({kpra}, " ")))]

/def -mregexp -Fp2 -t'(?<!tylko) nacina ' _cios_tank_wyjatek6 = \
	/set klew=%PL %;\
	/set kpra=%PR %;\
	/set ktobijelewa=$[replace(" ", "_", {klew})] %;\
	/eval /set %{ktobijelewa}_kto_bije=%{klew} %;\
	/eval /set %{ktobijelewa}_kogo_bije=$[strcat(substr({kpra}, 0, strstr({kpra}, " ")))]

/def -mregexp -Fp2 -t'Impet .* ciosu sprawia ze pada .* na ziemie' sub_ogluszenie = \
	/echo -p @{BC%kolor_alarm}>>>>>>****** OGLUSZENIE ******<<<<<<@{n} %;\

/def -mregexp -Fp2 -t'Nagle z rur umieszczonych pod sufitem zaczyna tryskac zielona substancja' sub_kwas = \
	/echo %;\
	/echo -p @{B}>>>>>>****** KWAS ******<<<<<<@{n} %;\
	/echo
