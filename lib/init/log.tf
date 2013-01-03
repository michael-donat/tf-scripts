/quote -S /set log_file !date +%Y%m%d
/eval /set log_file=$[strcat("data/logs/",%{log_file},".log")]
/eval /log %{log_file}
