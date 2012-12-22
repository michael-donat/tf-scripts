/def get = \
	/send wez %{*} %;\
	/send wez %{*} z ciala %;\
	/send wez %{*} z drugiego ciala %;\
	/send wez %{*} z trzeciego ciala %;\
	/send wez %{*} z czwartego ciala %;\
	/send wez %{*} z piatego ciala %;\
	/send wez %{*} z szostego ciala %;\
	/send wez %{*} z siodmego ciala %;\
	/send wez %{*} z osmego ciala

/def -Fp2 -ar -t'* rozpada sie!*' = /beep 1
/def -Fp2 -ar -t'* peka!*' = /beep 1

/def -mregexp -p2 -t'bierze twoj.' = /set moje on
/def -mregexp -p2 -t'konczy prace.$' = \
	/if ( {moje} =~ "on" )\
		/tbind do_kowal %;\
	/endif	

/def kowal = \
	/if ( {pack} =~ "on" )\
		/zp monety %;\
	/endif%;\
	/do_kowal

/def do_kowal = \
	/def -ag -p2 -t'*jest pochloniety*nie wypada*' _kowal_gag_0 %;\
	/def -ag -p2 -t'*Nie masz niczego takiego*' _kowal_gag_1 %;\
	/def -ag -p2 -t'*Juz dzierzysz*' _kowal_gag2 %;\
	/def -ag -p2 -t'*masz*na plecach*' _kowal_gag3 %;\
	/set moje off %;\
	/send naostrz bron %;\
	/if ( {dual} =~ "on" ) \
		/send naostrz druga bron %;\
	/endif %;\
	/send napraw zbroje %;\
	/send napraw druga zbroje %;\
	/send napraw trzecia zbroje %;\
	/send napraw czwarta zbroje %;\
	/send napraw piata zbroje %;\
	/send napraw szosta zbroje %;\
	/send napraw siodma zbroje %;\
	/send napraw osma zbroje %;\
	/send napraw dziewiata zbroje %;\
	/send napraw dziesiata zbroje %;\
	/purge _kowal_gag_* %;\
	/repeat -1 1 /_kowal_finish

/def _kowal_finish = \
	/if ({moje} =~ "off" ) \
		/send dobadz wszystkich broni %;\
		/send zaloz wszystkie zbroje %;\
		/if ( {sakiewka} =~ "on" )\
			/sad monety %;\
		/elseif ( {pack} =~ "on" )\
			/dp monety %;\
		/endif%;\
	/endif
		
/alias do_kowal /do_kowal

/def -mregexp -p2 -t'.* (pochodnia|luczywo) wypala sie i gasnie\.' light_off0 = \
	/tbind odloz wypalona pochodnie %%; zapal pochodnie
/def -mglob -p2 -t'*lampa wypala sie i gasnie*' light_off1 = \
	/tickoff %;\
	/tbind lampa_on_cmd
/def -mglob -p2 -t'*Probujesz zapalic* lampe, ale ci sie*' light_on0 = \
	/tickoff %;\
	/tbind lampa_on_cmd
/def -mglob -p2 -t'pelniasz .*lampe\\\.' light_on1_0 = \
	/tickoff %;\
	/def -i tick_warn = %;\
	/def -i tick_action = /_lampa_warn %;\
	/ticksize %lampatick %;\
	/tickon %;\
	/tbind zapal lampe
/def -mglob -p2 -t'*lampe, oprozniajac *' light_on1_1 = \
	/tickoff %;\
	/def -i tick_warn = %;\
	/def -i tick_action = /_lampa_warn %;\
	/ticksize %lampatick %;\
	/tickon %;\
	/tbind lampa_off_cmd
/def -mglob -p2 -t'*Zapalasz*lampe*' light_on2 = \
	/tickoff %;\
	/def -i tick_warn = %;\
	/def -i tick_action = /_lampa_warn %;\
	/ticksize %lampatick %;\
	/tickon
/def -mglob -p2 -t'*Gasisz*' light_off01 = \
	/tickoff
/def -mglob -p2 -t'*nie jest zapalona*' light_off02 = \
	/tickoff

/def manipuluj_plecakiem = \
	/if ( {pack} =~ "on" )\
		/send %{*} %;\
	/endif

/def dp = /manipuluj_plecakiem wloz %{*} do %packitem1
/def zp = /manipuluj_plecakiem wez %{*} z %packitem1
/def np = /manipuluj_plecakiem napelnij %packitem0

/def sd = \
	/dp wszystkie zbroje

/def sz = \
	/zp wszystkie zbroje %;\
	/send zaloz wszystkie zbroje

/def -mglob -p2 -t'*Nie jestes w stanie * zamknietego pojemnika*' open_pack = \
	/tbind otworz %packitem0

/def -mregexp -p2 -t'Zdejmujesz .* (plecak|worek|torbe|sakwe)' pof0 = \
	/set pack=off

/def zw = \
	otworz woreczek %;\
	wez %{*} z woreczka %;\
	zamknij woreczek

/def dw = \
	otworz woreczek %;\
	wloz %{*} do woreczka %;\
	zamknij woreczek

/def ow = otworz woreczek%; ob woreczek%; zamknij woreczek
/def o2w = zajrzyj do drugiego woreczka
/def o3w = zajrzyj do trzeciego woreczka
/def o4w = zajrzyj do czwartego woreczka
/def o5w = zajrzyj do piatego woreczka
/def o6w = zajrzyj do szostego woreczka
/def o7w = zajrzyj do siodmego woreczka
/def o8w = zajrzyj do osmego woreczka

/def z2w = \
	otworz drugi woreczek %;\
	wez %{*} z drugiego woreczka %;\
	zamknij drugi woreczek

/def d2w = \
	otworz drugi woreczek %;\
	wloz %{*} do drugiego woreczka %;\
	zamknij drugi woreczek

/def z3w = \
	otworz trzeci woreczek %;\
	wez %{*} z trzeciego woreczka %;\
	zamknij trzeci woreczek

/def d3w = \
	otworz trzeci woreczek %;\
	wloz %{*} do trzeciego woreczka %;\
	zamknij trzeci woreczek

/def z4w = \
	otworz czwarty woreczek %;\
	wez %{*} z czwartego woreczka %;\
	zamknij czwarty woreczek

/def d4w = \
	otworz czwarty woreczek %;\
	wloz %{*} do czwartego woreczka %;\
	zamknij czwarty woreczek

/def z5w = \
	otworz piaty woreczek %;\
	wez %{*} z piatego woreczka %;\
	zamknij piaty woreczek

/def d5w = \
	otworz piaty woreczek %;\
	wloz %{*} do piatego woreczka %;\
	zamknij piaty woreczek

/def z6w = \
	otworz szosty woreczek %;\
	wez %{*} z szostego woreczka %;\
	zamknij szosty woreczek

/def d6w = \
	otworz szosty woreczek %;\
	wloz %{*} do szostego woreczka %;\
	zamknij szosty woreczek

/def z7w = \
	otworz siodmy woreczek %;\
	wez %{*} z siodmego woreczka %;\
	zamknij siodmy woreczek

/def d7w = \
	otworz siodmy woreczek %;\
	wloz %{*} do siodmego woreczka %;\
	zamknij siodmy woreczek

/def z8w = \
	otworz osmy woreczek %;\
	wez %{*} z osmego woreczka %;\
	zamknij osmy woreczek

/def d8w = \
	otworz osmy woreczek %;\
	wloz %{*} do osmego woreczka %;\
	zamknij osmy woreczek
