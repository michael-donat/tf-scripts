/def SortujKamienie = \
  otworz plecak%; otworz sakiewke%; wez kamienie z plecaka%; wez kamienie z sakiewki%; \
  wloz cytryny do sakiewki%; wloz rubiny do sakiewki%; wloz iolit do sakiewki%; wloz diamenty do sakiewki%; wloz biale perly do sakiewki%; \
  /Kamyki
  
/def OcenKamienie = \
  otworz plecak%; \
  /set KoniecKamykow=0%; \
  /set WartoscKamieni=0%; \
  /def key_f4=/_start_ocena
  
/def _start_ocena = \
  ocen kamien%; \
  /def -Fp24 -mregexp -t' wazy (.*) gram' _sprawdzacz_wagi = /set WagaKamienia=$$[{P1}] %;\
  /def -Fp24 -mregexp -t' czyli jakies (.*) miedzi' _sprawdzacz_ceny = /set WartoscKamienia=$$[{P1}] %%; /WlozKamienDoPlecakaOIleJestJakis%; \
  /def -ag -Fp24 -mregexp -t'Umm, co chcesz ocenic' _sprawdzacz_konca = /set KoniecKamykow=1 %%; /WlozKamienDoPlecakaOIleJestJakis
  
/def Kamyki = \
  /set KoniecKamykow=0%; \
  /set WartoscKamieni=0%; \
  /def key_f4=/_start_sortowanie

/def _start_sortowanie = \
  ocen kamien%; \
  /def -Fp24 -mregexp -t' wazy (.*) gram' _sprawdzacz_wagi = /set WagaKamienia=$$[{P1}] %;\
  /def -Fp24 -mregexp -t' czyli jakies (.*) miedzi' _sprawdzacz_ceny = /set WartoscKamienia=$$[{P1}]%%; /ZrobCosZKamieniemOIleJestJakis%;  \
  /def -ag -Fp24 -mregexp -t'Umm, co chcesz ocenic' _sprawdzacz_konca = /set KoniecKamykow=1 %%; /ZrobCosZKamieniemOIleJestJakis%;

/def ZrobCosZKamieniemOIleJestJakis = \
  /if ({KoniecKamykow}==0) \
    /WlozKamien%; \
    /_start_sortowanie%; \
  /else \
    /echo -p @{BCred}Kamienie oceniam na: @{BCblue}$[WartoscKamieni/240.0] %;\
    /undef key_f4 _sprawdzacz_ceny _sprawdzacz_konca _sprawdzacz_wagi%; \
  /endif

/def WlozKamienDoPlecakaOIleJestJakis = \
  /if ({KoniecKamykow}==0) \
    wloz kamien do plecaka%; \
    /set WartoscKamieni=$[WartoscKamieni+WartoscKamienia]%; \
    /_start_ocena%; \
  /else \
    /echo -p @{BCred}Kamienie oceniam na: @{BCblue}$[WartoscKamieni/240.0] %;\
    /undef key_f4 _sprawdzacz_ceny _sprawdzacz_konca _sprawdzacz_wagi%; \
  /endif

/def WlozKamien = \
    /if ({WagaKamienia}<=8) \
      wloz kamien do sakiewki%; \
    /else \
      wloz kamien do plecaka%; \
      /set WartoscKamieni=$[WartoscKamieni+WartoscKamienia]%; \
    /endif

/def WycenKamienie = \
  /set WartoscWSklepie=0%; \
  /def -Fp240 -mregexp -t'( dam ci wiecej niz| jestem sklonny zaplacic co najwyzej|, moge ci z dobroci serca dac tylko| moge ci dac az| dac|, to moge ci dac co najwyzej| dostalbys) (([0-9]+) zlot.*, ([0-9]+) sreb.* i ([0-9]+) miedz|([0-9]+) sreb.* i ([0-9]+) miedz|([0-9]+) miedz|([0-9]+) mithryl.*, ([0-9]+) zlot.*, ([0-9]+) sreb.* i ([0-9]+) miedz)' testek4 = /set WartoscWSklepie=$$[WartoscWSklepie+{P9}*24000+{P10}*240+{P11}*12+{P12}+{P3}*240+{P4}*12+{P5}+{P6}*12+{P7}+{P8}] %; \
    wez kamienie z plecaka%; odbezpiecz wszystkie kamienie%; wycen kamienie %; \
  /repeat -0.5 1 /PokazStatyKamieni
  
/def PokazStatyKamieni = \
;    /echo -p @{BCred}Kamienie oceniam na : @{BCblue}$[WartoscKamieni/240.0] %;\
    /echo -p @{BCred}W sklepie dostalbym : @{BCblue}$[WartoscWSklepie/240.0] %;\
;    /echo -p @{BCred}Farandar dostalby   : @{BCblue}$[MnoznikFarandara*WartoscWSklepie/240.0] %;\
;    /echo -p @{BCred}Astrid dostalaby      : @{BCblue}$[MnoznikAstrid*WartoscWSklepie/240.0]%; \
    /echo -p @{BCred}Velhard dostalby    : @{BCblue}$[MnoznikVelharda*WartoscWSklepie/240.0]%; \
    /echo -p @{BCred}  my od Velharda    : @{BCblue}$[MnoznikVelhardaDlaNas*WartoscWSklepie/240.0]%; \
    /echo -p @{BCred}Jona dostalaby      : @{BCblue}$[MnoznikJony*WartoscWSklepie/240.0]
;   /echo -p @{BCred}Od Bromara wolac    : @{BCblue}$[MnoznikBromara*WartoscWSklepie/240.0] %;\
    
;/set MnoznikFarandara=4.98
;/set MnoznikBromara=4.73
/set MnoznikJony=3.64
/set MnoznikVelharda=4.70
/set MnoznikVelhardaDlaNas=4.47
;/set MnoznikAstrid=5.00

/def PokazKamienie = \
  /set KtoryKamienPokazuje=1%; /echo -p @{BCred}[%{KtoryKamienPokazuje}]%; pokaz pierwszy %{*}%; \
  /set KtoryKamienPokazuje=$[KtoryKamienPokazuje+1]%; /echo -p @{BCred}[%{KtoryKamienPokazuje}]%; pokaz drugi %{*}