/def -mregexp -Fp2 -t'przekazuje ci prowadzenie' warn_lead = \
	/beep 1 %;\
	/echo %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- PROWADZISZ ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- PROWADZISZ ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- PROWADZISZ ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo

/def -mregexp -Fp2 -t'( wytraca ci | zakleszczajac lewakiem twoj.*)' warn_disarm = \
	/beep 1 %;\
	/echo %;\
	/echo -p @{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- WYTRACENIE ---@{n}@{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- WYTRACENIE ---@{n}@{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- WYTRACENIE ---@{n}@{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo

/def -mregexp -Fp2 -t'Zakrztusiles sie' warn_poison = \
	/beep 1 %;\
	/echo %;\
	/echo -p @{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- TRUJE ---@{n}@{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- TRUJE ---@{n}@{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- TRUJE ---@{n}@{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo

/def -mregexp -Fp2 -t'przymierza sie do odciecia ci drogi ucieczki' warn_blok_attempt = \
	/beep 3 %;\
	/echo %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- PRZYMIERZA SIE DO BLOKU ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- PRZYMIERZA SIE DO BLOKU ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- PRZYMIERZA SIE DO BLOKU ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXX %;\
	/echo

/def -mregexp -Fp2 -t'zajmuje pozycje umozliwiajaca odciecie ci drogi ucieczki' warn_blok_done = \
	/beep 3 %;\
	/echo %;\
	/echo -p @{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- ZABLOKOWANY ---@{n}@{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- ZABLOKOWANY ---@{n}@{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- ZABLOKOWANY ---@{n}@{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo

/def -mregexp -Fp2 -t'(Powoli osuwasz sie na ziemie|Potem robi sie ciemno|Sila uderzania zamroczyla cie)' warn_stun = \
	/beep 1 %;\
	/echo %;\
	/echo -p @{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- OGLUSZENIE ---@{n}@{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- OGLUSZENIE ---@{n}@{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- OGLUSZENIE ---@{n}@{BC%kolor_crit}XXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo

/def -mregexp -Fp2 -t'Nadchodzi Czas Apokalipsy' warn_apsa = \
	/beep 3 %;\
	/echo %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- APOKA ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- APOKA ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- APOKA ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo

/def -mregexp -Fp2 -t'Przedmioty .* wypadaja przez duza dziure' warn_pojemnik = \
	/beep 3 %;\
	/echo %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- DZIURA ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- DZIURA ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo -p @{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXX@{n}@{BCwhite}--- DZIURA ---@{n}@{BC%kolor_alarm}XXXXXXXXXXXXXXXXXXXXXXXXXXX %;\
	/echo
