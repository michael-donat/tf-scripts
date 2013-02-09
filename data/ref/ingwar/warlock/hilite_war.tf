; Automagicly added line: tf_ver=1.0.0

/def -aBCred -p0 -t'*: *'         	_mowi_inne

/def -Fp15 -P2hCblue 	-t'(Wyprowadzasz|Wykonujesz) .* ((zacina|nacina|kroi|nakluwa|kluje|tlucze|obija)[^ ]*)'						_walka_war_lmuskasz
/def -Fp15 -P2BCblue 	-t'(Wyprowadzasz|Wykonujesz) .* ((tnie|rabie|rozplatuje|punktuje|dziurawi|przebija|gruchocze|kruszy|miazdzy)[^ ]*)' 		_walka_war_ranisz 
/def -Fp15 -P2xhCred 	-t'(wyprowadza|wykonuje) .* ((zacina|nacina|kroi|nakluwa|kluje|tlucze|obija)[^ ]*) (ci|cie)' 					_walka_war_cie_lmuska 
/def -Fp15 -P2xBCred 	-t'(wyprowadza|wykonuje) .* ((tnie|rabie|rozplatuje|punktuje|dziurawi|przebija|gruchocze|kruszy|miazdzy)[^ ]*) (ci|cie)' 	_walka_war_cie_rani 
/def -Fp16 -P2hCmagenta -t'(wyprowadza|wykonuje) .* ((zacina|nacina|kroi|nakluwa|kluje|tlucze|obija)[^ ]*)'						_walka_war_ktos_lmuska
/def -Fp16 -P2BCmagenta -t'(wyprowadza|wykonuje) .* ((tnie|rabie|rozplatuje|punktuje|dziurawi|przebija|gruchocze|kruszy|miazdzy)[^ ]*)'	 		_walka_war_ktos_rani

/def -p4 -P0B -F -t'(parujesz je|paruje je)'         		_cosik_parujy_war_1
/def -p4 -P0B -F -t' zaslonic '         			_cosik_parujy_war_2
/def -p4 -P0B -F -t' unikiem '         				_cosik_parujy_war_3
/def -p4 -P0B -F -t'nie udaje (mu|jej|mu|ci) sie trafic'        _cosik_parujy_war_4
/def -p4 -P1B -F -t'(zniwelowany) przez'         		_cosik_parujy_war_5


