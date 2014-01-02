/set ansi_log=on

/if ({logdir}=/"") \
    /set logdir=data/logs/%;\
/endif

/quote -S /set log_file !date +%Y%m%d
/eval /set log_file=$[strcat({logdir},{log_file},".log")]
/eval /log %{log_file}
;/eval /log -i %{log_file}
