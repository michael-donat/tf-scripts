;------------------------------------------------------------------------
;			    P O S T E P Y    				|
;------------------------------------------------------------------------
/def -Fp400 -mregexp -t'(Poczyniles minimalne postepy, od momentu kiedy wszedles do gry\.)' post_1 = /substitute -p @{BxCwhite}%P1 [0/15]
/def -Fp400 -mregexp -t'(Poczyniles nieznaczne postepy, od momentu kiedy wszedles do gry\.)' post_2 = /substitute -p @{BxCwhite}%P1 [1/15]
/def -Fp400 -mregexp -t'(Poczyniles bardzo male postepy, od momentu kiedy wszedles do gry\.)' post_3 = /substitute -p @{BxCwhite}%P1 [2/15]
/def -Fp400 -mregexp -t'(Poczyniles male postepy, od momentu kiedy wszedles do gry\.)' post_4 = /substitute -p @{BxCwhite}%P1 [3/15]
/def -Fp400 -mregexp -t'(Poczyniles nieduze postepy, od momentu kiedy wszedles do gry\.)' post_5 = /substitute -p @{BxCwhite}%P1 [4/15]
/def -Fp400 -mregexp -t'(Poczyniles zadowalajace postepy, od momentu kiedy wszedles do gry\.)' post_6 = /substitute -p @{BxCwhite}%P1 [5/15]
/def -Fp400 -mregexp -t'(Poczyniles spore postepy, od momentu kiedy wszedles do gry\.)' post_7 = /substitute -p @{BxCwhite}%P1 [6/15]
/def -Fp400 -mregexp -t'(Poczyniles dosc duze postepy, od momentu kiedy wszedles do gry\.)' post_8 = /substitute -p @{BxCwhite}%P1 [7/15]
/def -Fp400 -mregexp -t'(Poczyniles znaczne postepy, od momentu kiedy wszedles do gry\.)' post_9 = /substitute -p @{BxCwhite}%P1 [8/15]
/def -Fp400 -mregexp -t'(Poczyniles duze postepy, od momentu kiedy wszedles do gry\.)' post_10 = /substitute -p @{BxCwhite}%P1 [9/15]
/def -Fp400 -mregexp -t'(Poczyniles bardzo duze postepy, od momentu kiedy wszedles do gry\.)' post_11 = /substitute -p @{BxCwhite}%P1 [10/15]
/def -Fp400 -mregexp -t'(Poczyniles ogromne postepy, od momentu kiedy wszedles do gry\.)' post_12 = /substitute -p @{BxCwhite}%P1 [11/15]
/def -Fp400 -mregexp -t'(Poczyniles imponujace postepy, od momentu kiedy wszedles do gry\.)' post_13 = /substitute -p @{BxCwhite}%P1 [12/15]
/def -Fp400 -mregexp -t'(Poczyniles wspaniale postepy, od momentu kiedy wszedles do gry\.)' post_14 = /substitute -p @{BxCwhite}%P1 [13/15]
/def -Fp400 -mregexp -t'(Poczyniles gigantyczne postepy, od momentu kiedy wszedles do gry\.)' post_15 = /substitute -p @{BxCwhite}%P1 [14/15]
/def -Fp400 -mregexp -t'(Poczyniles niebotyczne postepy, od momentu kiedy wszedles do gry\.)' post_16 = /substitute -p @{BxCwhite}%P1 [15/15]