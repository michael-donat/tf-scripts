/def -p20 -q -h'PROMPT *Podaj swoje imie*' login_hook0 = \
	/purge login_hook* %;\
	/def -mregexp -1 -F -h'SEND ([^ ]*)' login_hook1 = \
		/send %%{P0} %%;\
		/set obecnie_expujacy=$$[tolower({P0})] %%;\
		/set obecnie_swiat=$${world_name} %%;\
		/eval /cd %%{main_dir}/common %%;\
		/_login_sprawdz %%;\
		/load sets.tf %%;\
		/load start.tf %%;\
		/load init.tf %%;\
		/eval /cd %%{main_dir}/$${world_name} %%;\
		/load sets.tf %%;\
		/load start.tf %%;\
		/reload

/def _login_sprawdz = \
	/quote -S -dexec !\
	if [ ! -d %{priv_dir}/%{obecnie_swiat}/players/%{obecnie_expujacy} ]; then \
		mkdir -p %{priv_dir}/%{obecnie_swiat}/players/%{obecnie_expujacy}; \
		cp ../common/stdplayer.tf %{priv_dir}/%{obecnie_swiat}/players/%{obecnie_expujacy}/%{obecnie_expujacy}.tf; \
		touch %{priv_dir}/%{obecnie_swiat}/players/%{obecnie_expujacy}/imiona.tf; \
		touch %{priv_dir}/%{obecnie_swiat}/players/%{obecnie_expujacy}/lista.tf; \
	fi

/def -mregexp -Fp2 -t'Aby zalogowac sie na istniejaca postac - podaj jej imie.' autoimie = /send
