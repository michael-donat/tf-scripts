/alias lampa_on_cmd napelnij lampe olejem z butelki
/alias lampa_off_cmd rozbij butelke%; /zp butelke%; napelnij lampe olejem z butelki
/set lampatick=800

/def op = /manipuluj_plecakiem obejrzyj %packitem0

/def sd = \
	/dp wszystkie zbroje

/def sz = \
	/zp wszystkie zbroje %;\
	/send zaloz wszystkie zbroje

/def bz = \
	/if ( {pochwa} =~ "on" ) \
		/send wyjmij %bron z %pochwa1 %;\
		%dobadzcmd broni %;\
		/if ( {dual} =~ "on" ) \
			/send wyjmij %bron2 z %pochwa2 %;\
			%dobadzcmd broni %;\
		/endif %;\
	/elseif ( {pack} =~ "on" )\
		/send wez %bron z %packitem1 %;\
		%dobadzcmd broni %;\
		/if ( {dual} =~ "on" ) \
			/send wez %bron2 z %packitem1 %;\
			%dobadzcmd broni %;\
		/endif %;\
	/else \
		/send %dobadzcmd %broni %;\
		/if ( {dual} =~ "on" ) \
			/send %dobadzcmd %broni2 %;\
		/endif %;\
	/endif %;\
	/set alarm=$[decode_attr("none", "BCgreen")]

/def bd = \
	/send opusc wszystkie bronie %;\
	/if ( {pochwa} =~ "on" )\
		/send wloz %bron do %pochwa1 %;\
		/if ( {dual} =~ "on" ) \
			/send wloz %bron2 do %pochwa2 %;\
		/endif %;\
	/elseif ( {pack} =~ "on" ) \
		/send wloz %bron do %packitem1 %;\
		/if ( {dual} =~ "on" ) \
			/send wloz %bron2 do %packitem1 %;\
		/endif %;\
	/endif

/def -mglob -p2 -t'*Zakladasz*otwarty*plecak*' pon_pl0 = \
	/set pack=on %;\
	/set packitem0=plecak %;\
	/set packitem1=plecaka

/def -mglob -p2 -t'*Zakladasz*zamkniety*plecak*' pon_pl1 = \
	/set pack=on %;\
	/set packitem0=plecak %;\
	/set packitem1=plecaka %;\
	/tbind otworz %packitem0

/def -mglob -p2 -t'*Zakladasz*otwarty*worek*' pon_wrk0 = \
	/set pack=on %;\
	/set packitem0=worek %;\
	/set packitem1=worka

/def -mglob -p2 -t'*Zakladasz*zamkniety*worek*' pon_wrk1 = \
	/set pack=on %;\
	/set packitem0=worek %;\
	/set packitem1=worka %;\
	/tbind otworz %packitem0

/def -mglob -p2 -t'*Przewieszasz*otwarta*torbe*' pon_trb0 = \
	/set pack=on %;\
	/set packitem0=torbe %;\
	/set packitem1=torby

/def -mglob -p2 -t'*Przewieszasz*zamknieta*torbe*' pon_trb1 = \
	/set pack=on %;\
	/set packitem0=torbe %;\
	/set packitem1=torby %;\
	/tbind otworz %packitem0
