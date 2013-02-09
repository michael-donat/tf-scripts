/alias lampa_on_cmd napelnij lampe olejem
/alias lampa_off_cmd odloz butelke%; /zp butelke%; napelnij lampe olejem
/set lampatick=270

/def op = zajrzyj do %packitem1

/def -mglob -p2 -t'*nerwowym ruchem gasi*' light_on_special0 = \
	/tbind zapal lampe

/def bz = \
	/if ( {pochwa} =~ "on" ) \
		/send powyjmij %bron z %pochwa1 %;\
		%dobadzcmd broni %;\
		/if ( {dual} =~ "on" ) \
			/send powyjmij %bron2 z %pochwa2 %;\
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
		/send powsun %bron do %pochwa1 %;\
		/if ( {dual} =~ "on" ) \
			/send powsun %bron2 do %pochwa2 %;\
		/endif %;\
	/elseif ( {pack} =~ "on" ) \
		/send wloz %bron do %packitem1 %;\
		/if ( {dual} =~ "on" ) \
			/send wloz %bron2 do %packitem1 %;\
		/endif %;\
	/endif

/def -mglob -p2 -t'*Zakladasz*otwarty*plecak*' pon_pl0 = \
	/set pack=on %;\
	/set packitem0=swoj plecak %;\
	/set packitem1=swojego plecaka

/def -mglob -p2 -t'*Zakladasz*zamkniety*plecak*' pon_pl1 = \
	/set pack=on %;\
	/set packitem0=swoj plecak %;\
	/set packitem1=swojego plecaka %;\
	/tbind otworz %packitem0

/def -mglob -p2 -t'*Zakladasz*otwarty*worek*' pon_wrk0 = \
	/set pack=on %;\
	/set packitem0=swoj worek %;\
	/set packitem1=swojego worka

/def -mglob -p2 -t'*Zakladasz*zamkniety*worek*' pon_wrk1 = \
	/set pack=on %;\
	/set packitem0=swoj worek %;\
	/set packitem1=swojego worka %;\
	/tbind otworz %packitem0

/def -mglob -p2 -t'*Przewieszasz*otwarta*torbe*' pon_trb0 = \
	/set pack=on %;\
	/set packitem0=swoja torbe %;\
	/set packitem1=swojej torby

/def -mglob -p2 -t'*Przewieszasz*zamknieta*torbe*' pon_trb1 = \
	/set pack=on %;\
	/set packitem0=swoja torbe %;\
	/set packitem1=swojej torby %;\
	/tbind otworz %packitem0
