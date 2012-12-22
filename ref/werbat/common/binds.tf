/def key_nkpEnt = kondycja wszystkich
/def key_nkp0 = stan

/def dobind = \
	%{*} %;\
	/unset bindings %;\
	/set bindings= %;\
	/undef tempbind

/def tbind = \
	/if ( {bindings} =~ {*} ) \
		/true %;\
	/else \
		/set bindings %{*} %;\
		/def -b'`' tempbind = /dobind %{*} %;\
		/if ( {ktype} =~ "mac" ) \
			/def key_nkp- = /dobind %{*} %;\
		/endif %;\
		/echo -p @{BC%kolor_info}>>>@{n} %;\
		/beep 1 %;\
	/endif

/def f1 = \
	/if ( {1} =~ "" ) \
		/echo -p #@{BC%kolor_info}#@{n}# f1  -  @{BC%kolor_info}%{f1} %;\
	/elseif ( {1} =~ "empty" ) \
		/def key_f1 = /echo -p #@{BC%kolor_info}#@{n}# Not set. %;\
		/set f1 empty %;\
	/else \
		/def key_f1 = %{*} %;\
		/set f1 %{*} %;\
	/endif

/def f2 = \
	/if ( {1} =~ "" ) \
		/echo -p #@{BC%kolor_info}#@{n}# f2  -  @{BC%kolor_info}%{f2} %;\
	/elseif ( {1} =~ "empty" ) \
		/def key_f2 = /echo -p #@{BC%kolor_info}#@{n}# Not set. %;\
		/set f2 empty %;\
	/else \
		/def key_f2 = %{*} %;\
		/set f2 %{*} %;\
	/endif

/def f3 = \
	/if ( {1} =~ "" ) \
		/echo -p #@{BC%kolor_info}#@{n}# f3  -  @{BC%kolor_info}%{f3} %;\
	/elseif ( {1} =~ "empty" ) \
		/def key_f3 = /echo -p #@{BC%kolor_info}#@{n}# Not set. %;\
		/set f3 empty %;\
	/else \
		/def key_f3 = %{*} %;\
		/set f3 %{*} %;\
	/endif

/def f4 = \
	/if ( {1} =~ "" ) \
		/echo -p #@{BC%kolor_info}#@{n}# f4  -  @{BC%kolor_info}%{f4} %;\
	/elseif ( {1} =~ "empty" ) \
		/def key_f4 = /echo -p #@{BC%kolor_info}#@{n}# Not hunting anyone. %;\
		/set f4 empty %;\
	/else \
		/def key_f4 = %{*} %;\
		/set f4 %{*} %;\
	/endif

/def f5 = \
	/if ( {1} =~ "" ) \
		/echo -p #@{BC%kolor_info}#@{n}# f5  -  @{BC%kolor_info}%{f5} %;\
	/elseif ( {1} =~ "empty" ) \
		/def key_f5 = /echo -p #@{BC%kolor_info}#@{n}# Not set. %;\
		/set f5 empty %;\
	/else \
		/def key_f5 = %{*} %;\
		/set f5 %{*} %;\
	/endif

/def f6 = \
	/if ( {1} =~ "" ) \
		/echo -p #@{BC%kolor_info}#@{n}# f6  -  @{BC%kolor_info}%{f6} %;\
	/elseif ( {1} =~ "empty" ) \
		/def key_f6 = /echo -p #@{BC%kolor_info}#@{n}# Not set. %;\
		/set f6 empty %;\
	/else \
		/def key_f6 = %{*} %;\
		/set f6 %{*} %;\
	/endif

/def f7 = \
	/if ( {1} =~ "" ) \
		/echo -p #@{BC%kolor_info}#@{n}# f7  -  @{BC%kolor_info}%{f7} %;\
	/elseif ( {1} =~ "empty" ) \
		/def key_f7 = /echo -p #@{BC%kolor_info}#@{n}# Not set. %;\
		/set f7 empty %;\
	/else \
		/def key_f7 = %{*} %;\
		/set f7 %{*} %;\
	/endif

/def f8 = \
	/if ( {1} =~ "" ) \
		/echo -p #@{BC%kolor_info}#@{n}# f8  -  @{BC%kolor_info}%{f8} %;\
	/elseif ( {1} =~ "empty" ) \
		/def key_f8 = /echo -p #@{BC%kolor_info}#@{n}# Not set. %;\
		/set f8 empty %;\
	/else \
		/def key_f8 = %{*} %;\
		/set f8 %{*} %;\
	/endif

/def bs = \
	/echo -p #@{BC%kolor_info}#@{n}# ------------ %;\
	/echo -p #@{BC%kolor_info}#@{n}# f2  -  @{BC%kolor_info}%{f2}@{n} %;\
	/echo -p #@{BC%kolor_info}#@{n}# f3  -  @{BC%kolor_info}%{f3}@{n} %;\
	/echo -p #@{BC%kolor_info}#@{n}# f4  -  @{BC%kolor_info}%{f4}@{n} %;\
	/echo -p #@{BC%kolor_info}#@{n}# ------------ %;\
	/echo -p #@{BC%kolor_info}#@{n}# f5  -  @{BC%kolor_info}%{f5} %;\
	/echo -p #@{BC%kolor_info}#@{n}# f6  -  @{BC%kolor_info}%{f6} %;\
	/echo -p #@{BC%kolor_info}#@{n}# f7  -  @{BC%kolor_info}%{f7} %;\
	/echo -p #@{BC%kolor_info}#@{n}# f8  -  @{BC%kolor_info}%{f8}
