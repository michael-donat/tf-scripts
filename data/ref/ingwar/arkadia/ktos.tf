; Automagicly added line: tf_ver=1.0.0
;To jest przykladowy plik uzytkownika ktorego nazwe nalezy zmienic na "imie.tf"

;Definicja broni ktora dana postac najczesciej walczy. 
;Zmienic zamiast "topora" na np "miecza"
/if ($(/listvar -s ogolne_broni)=~NULL) \
    /set ogolne_broni=topora %;\
/endif 

;Defincja Temblaka,pochwy,etc.. 
;jezeli bron i temblak sa zdefiniowane przy opuszczaniu i dobywaniu broni
;bedzie ona automatycznie wkladana,wyciagana z temblaka
/if ($(/listvar -s ogolne_temblak)=~NULL) \
    /set ogolne_temblak=tembalka %;\
/endif 

;Definicja broni uzywanej i wkladanej do temblaka,pochwy,etc..
/if ($(/listvar -s ogolne_bron)=~NULL) \
    /set ogolne_bron=topor %;\
/endif 

;Komendy wykonywane po wejsciu postaci do swiata
/def start=zaloz pierscien

;przykladowy def i load :)
;/def ala=/echo ALA
;/load costam.tf

