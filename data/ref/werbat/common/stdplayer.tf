;;  Linie zaczynające się od znaków ';;' stanowią komentarz i nie są przetwarzane przez TF-a.
;;

;;  Włącza logowanie; należy usunąć tę linię, żeby je wyłączyć
;;  (ścieżkę do katalogu z logami ustawia się w ~/.tfrc):
/log_on

;; Komenda do dobywania broni. W standardzie jest do zwykłe 'dobadz', ale można użyć komendy
;; gildiowej albo z zawodu:

/set dobadzcmd=dobadz

;;  Tutaj należy ustawić główną broń, którą posługuje się postać:
;;
/set bron=bron

;; ... oraz jej nazwę w dopełniaczu
;;
/set broni=broni


;;  Jeśli postać nosi broń w pochwie, należy ustawić na 'on':
;;
/set pochwa=off

;;  .. oraz ustawić jej nazwę, w dopełniaczu:
;;
/set pochwa1=bardzo ladnej pochwy

;;  Jeśli postać walczy dwiema brońmi, należy ustawić przestawić na 'on':
;;
/set dual=off

;;  ...oraz analogicznie do pierwszej broni ustawić poniższe zmienne:
;;
/set bron2=drugi paskudny miecz
/set broni2=drugiego paskudnego miecza
/set pochwa2=jeszcze ladniejszej pochwy

/def start = \
;;
;;  Poniżej należy ustawić wszystkie komendy, które mają się wykonać po zalogowaniu usuwając
;;  znaki komentarza (';;') i wpisując je pomiędzy komendą /send a ciągiem '%;\', wg. przykładu:
;;
;;  /send zaloz ubrania %;\
;;  /send zaloz plecak %;\
;;  /send wloz monety do plecaka %;\
;;  /send kto %;\
;;
;;  Poniższe linie powinny zostać:
;;
	/echo -p #@{BC%kolor_info}#@{n}# Loaded settings for: @{BC%kolor_info}%{obecnie_expujacy}@{n}.

;;  Tworzenie własnych aliasów:
;;  /alias <skrot> <komenda> [%; <komenda2> %; <komenda3>]
;;
;;  Przykłady:
;;  /alias pod podskocz
;;  /alias ojej powiedz Ojej! %; rozejrzyj sie strachliwie
