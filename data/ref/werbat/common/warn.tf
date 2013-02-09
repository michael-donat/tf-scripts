/def -mregexp -Fp2 -t' daje ci (?!sie we znaki)' warn_give = \
	/echo %;\
	/echo -p @{BC%kolor_main} <<< podanie >>> %;\
	/echo

/def -mregexp -Fp2 -t'porzuca twoja druzyne' warn_sygnal = \
	/echo %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- SYGNAL ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- SYGNAL ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- SYGNAL ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo

/def _lampa_warn = \
	/echo %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- LAMPA ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- LAMPA ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- LAMPA ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo %;\
	/tbind lampa_on_cmd
