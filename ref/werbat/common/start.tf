/def -ag -h'Redef' hide_redef
/def -ag -h'Load' hide_load
/def -ag -h'Log' hide_log
/def key_tab = /complete

/def -Fp2 -mregexp -t"^(> )+" _unprompty = /substitute %{PR}

/def log_on = \
	/eval /log -w%{obecnie_swiat} %{logpath}/%{obecnie_swiat}/%{obecnie_expujacy}_$[ftime("%Y-%m-%d", time())].log

/def -mglob -Fp2 -t'* z hosta:*' _logged = \
	/reload %;\
	/repeat -5 1 /start %;\
	/repeat -6 1 /set ingame=1

/sub on
/def c = /for i 1 100 /_echo
/def fk = /test $[fake_recv({*})]

/require tick.tf
/require textutil.tf
/require alias.tf
/set alias new

/load array.tf
/load binds.tf
/load combat.tf
/load counter.tf
/load equipment.tf
/load hunt.tf
/load lists.tf
/load mail.tf
/load misc.tf
/load movement.tf
/load odmiana.tf
/load people.tf
/load substitute.tf
/load team.tf
/load testuj.tf
/load warn.tf

/def reload = \
	/purge %;\
	/purge -i alias_body_* %;\
	/purge -i alias_call_* %;\
	/def -ag -h'Load' hide_load %;\
	/eval /cd %{main_dir}/common %;\
	/load start.tf %;\
	/eval /cd %{main_dir}/%{obecnie_swiat} %;\
	/load start.tf %;\
	/load %{priv_dir}/%{obecnie_swiat}/players/%{obecnie_expujacy}/%{obecnie_expujacy}.tf %;\
	/load %{priv_dir}/%{obecnie_swiat}/players/%{obecnie_expujacy}/imiona.tf %;\
	/if ( {poczta_show} =~ "NOWA" )\
		/status_edit -r1 poczta_show:4:BC%{kolor_alarm} %;\
	/endif %;\
	/if ( {sneak} =~ "off" ) \
		/set sneak %sneak %;\
		/status_edit -r1 sneak:4:BC%{kolor_main} %;\
	/elseif ( {sneak} =~ "ON" ) \
		/set sneak %sneak %;\
		/status_edit -r1 sneak:4:BC%{kolor_alarm} %;\
	/elseif ( {sneak} =~ "TEAM" ) \
		/set sneak %sneak %;\
		/status_edit -r1 sneak:4:BC%{kolor_alarm} %;\
	/endif %;\
	/if ( {bindings} !~ NULL ) \
		/def -b'`' tempbind = /dobind %{bindings} %;\
		/if ( {ktype} =~ "mac" ) \
			/def key_nkp- = /dobind %{*} %;\
		/endif %;\
	/endif %;\
	/hide %hide %;\
	/f1 %f1 %;\
	/f2 %f2 %;\
	/f3 %f3 %;\
	/f4 %f4 %;\
	/f5 %f5 %;\
	/f6 %f6 %;\
	/f7 %f7 %;\
	/f8 %f8 %;\
	/am %attackmode %;\
	/if ( {ingame} =~ "1" )\
		/druzyna -q %;\
	/endif%;\
	/echo Reloaded.
