/def _atak = \
	/let n=$[strchr({*}, '|')]%;\
	/test param1 := substr({*}, 0, n)%;\
	/test param2 := substr({*}, n+1) %;\
	/if ( {attackmode} =~ "1" ) \
		zabij %{param1} %;\
	/elseif ( {attackmode} =~ "2" ) \
		zabij %{param1} %; wskaz %{param1} %;\
	/elseif ( {attackmode} =~ "3" ) \
		zabij %{param1} %; wskaz %{param1} %; rozkaz druzynie zaatakowac %{param1} %;\
	/elseif ( {attackmode} =~ "4" ) \
		przestan kryc sie za zaslona%; przelam obrone %{param2} %; zabij %{param1} %; wskaz %{param1} %; rozkaz druzynie zaatakowac %{param1} %;\
	/elseif ( {attackmode} =~ "5" ) \
		zabij %{param1} %; przedstaw %{param1} %; wskaz %{param1} %; rozkaz druzynie zaatakowac %{param1} %;\
	/elseif ( {attackmode} =~ "6" ) \
		przestan kryc sie za zaslona%; przelam obrone %{param2} %; zabij %{param1} %; przedstaw %{param1} %; wskaz %{param1} %; rozkaz druzynie zaatakowac %{param1} %;\
	/else \
		zabij %{param1} %;\
	/endif

/def -mregexp -Fp2 -t'.* miotajac najciezsze przeklenstwa naciera na ciebie!' ks_atak_mnie0 = /beep 2 %; /sneak off
/def -mregexp -Fp2 -t'.* z dzika furia rzuca sie na ciebie.*' ks_atak_mnie1 = /beep 2 %; /sneak off
/def -mregexp -Fp2 -t'.* opluwa cie .* wyprowadza .* atakujac.*' ks_atak_mnie2 = /beep 1 %; /sneak off
/def -mregexp -Fp2 -t'.* ostroznie obchodzi cie, jakby .* atakujac cie!' ks_atak_mnie3 = /beep 2 %; /sneak off
/def -mregexp -Fp2 -t'.* podstepnym i nieczystym .* zaczyna walke z toba.*' ks_atak_mnie4 = /beep 2 %; /sneak off

/def -mregexp -Fp2 -t'.* zaczepny cios, atakujac cie!' ks_atak_mnie5 = /beep 2 %; /sneak off
/def -mregexp -Fp2 -t'.* wykrzywiajac twarz w okrutnym grymasie rzuca sie na ciebie.' sc_atak_mnie0 = /beep 1 %; /sneak off
/def -mregexp -Fp2 -t'.* wbija wzrok w ciebie i raptownie zrywajac sie z miejsca atakuje cie.' sc_atak_mnie1 = /beep 1 %; /sneak off
/def -mregexp -Fp2 -t'.* sprezystym skokiem dopada ciebie i atakuje cie.' sc_atak_mnie2 = /beep 1 %; /sneak off
/def -mregexp -Fp2 -t'.* przyczaja sie chwile i z szybkiego doskoku atakuje cie.' sc_atak_mnie3 = /beep 1 %; /sneak off
/def -mregexp -Fp2 -t'.* mruzac drapieznie oczy rusza do ataku na ciebie.' sc_atak_mnie4 = /beep 1 %; /sneak off
/def -mregexp -Fp2 -t'.* w mgnieniu oka wykonuje drapiezny skok, dopadajac cie.' sc_atak_mnie5 = /beep 1 %; /sneak off
/def -mregexp -Fp2 -t'.* z determinacja rzuca sie do walki.* cie powstrzymac.' zh_atak_mnie = /beep 1 %; /sneak off

/def -mregexp -Fp2 -t'Nagle widok przeslania ci feeria wirujacych barw. Rzucasz sie przed siebie by je rozerwac, przegonic... zniszczyc!' klatwa0 = \
	/tbind przestan atakowac druzyne
/def -mregexp -Fp2 -t'Nagle .* z obledem w oczach rzuca sie w twoim kierunku rozpoczynajac szalenczy atak!' klatwa1 = \
	/tbind przestan atakowac druzyne
