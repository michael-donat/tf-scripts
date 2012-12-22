/def tbind_kon = \
	/def key_f4 = %{*} %;\
	/beep 1 %;\
	/echo -p #@{BC%kolor_info}#@{n}# F4 - @{BC%kolor_info}%{*}@{n}

/def -mregexp -p2 -t'Odbierasz (.*).' konik0 = /tbind_kon zlap konia za uzde
/def -mregexp -p2 -t'Nie jestes w stanie chwycic' konik1 = /tbind_kon zlap konia za uzde
/def -mregexp -pt -t'Lapiesz za uzde' konik2 = /tbind_kon dosiadz swojego konia
/def -mregexp -p2 -t'Gdy probujesz dosiasc (.*), (.*) wierzga na wszystkie strony, uniemozliwiajac ci dosiadanie.' konik3 = /tbind_kon zlap %{P1} za uzde
/def -mregexp -p2 -t'Odwiazujesz' konik4 = /tbind_kon dosiadz swojego konia
/def -mregexp -p2 -t'Nie jestes w stanie dosiasc' konik5 = /tbind_kon dosiadz swojego konia
/def -mregexp -pt -t'nie moze tam podazyc' konik6 = /tbind_kon zsiadz z konia
/def -mregexp -pt -t'Zsiadasz z' konik7 = /tbind_kon przywiaz swojego konia 
