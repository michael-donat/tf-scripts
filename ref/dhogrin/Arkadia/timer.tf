/set zdylizansNulnCzas=0
/set zdylizansOdliczamy=0
;/def -mregexp -t'Woznica oznajmia gromkim glosem: Postoj, placyk w polnocnej czesci miasta.' _dylizansPrzyjechal = /set dylizansNulnCzas=0%; /if (_zdylizansOdliczamy==0) /_dylizansCzasStart%; /set _dylizansOdliczamy=1%; /endif

/def -mregexp -t'Woznica oznajmia gromkim glosem: Postoj, placyk w polnocnej czesci miasta.' _dylizansPrzyjechal = \
;/def -mregexp -t'Ulica Mostowa.' _dylizansPrzyjechal = \
    /set zdylizansNulnCzas=3%;\
    /if (%{zdylizansOdliczamy}==0) \
	/set zdylizansOdliczamy=1%; \
	/_dylizansCzasStart%; \
    /endif

/def _dylizansCzasStart= \
    /if (%{zdylizansOdliczamy}==1) \
	/if (%{zdylizansNulnCzas}==286) \
	    /set zdylizansNulnCzas=3%; \
	/endif%; \
	/set zdylizansNulnCzas=$[zdylizansNulnCzas + 1]%; \
	/repeat -1 1 /_dylizansCzasStart%; \
    /endif
    
/def key_f3 = /echo -p @{BxCyellow}    *  Dylizans podjedzie do Nuln za $[283-zdylizansNulnCzas] sekund  *%;

/def -mregexp -t'Swiat istnieje      : ((.*) (dzien|dni))? ((.*) godzin(|y|e))? ((.*) minut(|y))? ((.*) sekund(|y))?' _pobierz_czas = /set zCzas=$[24*3600*{P2}+3600*{P5}+60*{P8}+{P11}]%; /if ({zCzasOdliczamy}==0) /set zCzasOdliczamy=1%; /zCzasStart%; /endif

/def zCzasStart = \
  /set zCzas $[{zCzas}+1]%; \
  /repeat -1 1 /zCzasStart
  
/def zStatki = \
  /echo -p @{BxCyellow}    *  Statek Novigrad -> Skellige podplynie za $[(7*60+40)-mod({zCzas}+90,7*60+40)] sekund *
