/def _atak = \
	/let n=$[strchr({*}, '|')]%;\
	/test param1 := substr({*}, 0, n)%;\
	/test param2 := substr({*}, n+1) %;\
	/if ( {attackmode} =~ "1" ) \
		zabij %{param1} %; zabij %{param1} %;\
	/elseif ( {attackmode} =~ "2" ) \
		zabij %{param1} %; zabij %{param1} %; wskaz %{param1} %;\
	/elseif ( {attackmode} =~ "3" ) \
		zabij %{param1} %; zabij %{param1} %; wskaz %{param1} %; rozkaz wszystkim zaatakowac %{param1} %;\
	/elseif ( {attackmode} =~ "4" ) \
		przelam obrone %{param2} %; zabij %{param1} %; zabij %{param1} %; wskaz %{param1} %; rozkaz wszystkim zaatakowac %{param1} %;\
	/elseif ( {attackmode} =~ "5" ) \
		zabij %{param1} %; zabij %{param1} %; przedstaw %{param1} %; wskaz %{param1} %; rozkaz wszystkim zaatakowac %{param1} %;\
	/elseif ( {attackmode} =~ "6" ) \
		przelam obrone %{param2} %; zabij %{param1} %; zabij %{param1} %; przedstaw %{param1} %; wskaz %{param1} %; rozkaz wszystkim zaatakowac %{param1} %;\
	/else \
		zabij %{param1} %; zabij %{param1} %;\
	/endif

/def -mregexp -Fp2 -t'.* wydajac z siebie .* rzuca sie na ' special_atak0 = /beep 2 %; /sneak off

/def -mregexp -Fp2 -t'.* uderza sie gwaltownie w tors .* ciebie .*' special_atak_mnie0 = /beep 2 %; /sneak off
/def -mregexp -Fp2 -t'.* rusza na ciebie wzywajac kogos do walki!' special_atak_mnie1 = /beep 2 %; /sneak off
/def -mregexp -Fp2 -t'.* rozdziawia szczeke i wpatruje sie w Ciebie przez pare chwil.*' special_atak_mnie2 = /beep 2 %; /sneak off
/def -mregexp -Fp2 -t'.* spina wierzchowca, a nastepnie rusza  z pelna predkoscia na ciebie!.*' special_atak_mnie3 = /beep 2 %; /sneak off

/alias wyc rozkaz %{*} wycofac sie za ciebie
/alias zas rozkaz %{*} zaslonic ciebie
/alias wes rozkaz %{*} zaatakowac %{cel}
/alias za rozkaz %{2} wycofac sie za %{1}
