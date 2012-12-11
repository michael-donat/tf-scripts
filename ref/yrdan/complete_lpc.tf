; ## Linie dodane automagicznie   : tf_ver=1.0.9
; ## 
; ## Wersja pliku                 : 1.0.9
; ## Ostatnia zmiana pliku        : 2006-01-02 11:01:52
; ## Plik pobrany                 : 2006-01-02 11:02:02
; ## Wersja Tfupdate              : 2.0.1
; ##
; ##
/require -q complete.tf

; If you want to bind it to tab just uncoment this line
;/def key_tab = /complete_all

/def complete_all = \
    /let _head=$[kbhead()] %;\
    /if (_head =/ "{ls|load|goto|tail|head|more|exec|cp|cat|clone|cd} {*}") \
        /complete_lpc $(/last $[kbhead()]) %;\
    /else \
        /complete %;\
    /endif

/def complete_lpc = \
    /let _word=%{1} %;\
    /if (lpc_file_list =~ NULL) \
        /send_lpc_exec %{_word} %;\
        /set lpc_file_list=WAITING %;\
    /elseif (lpc_file_list =~ "WAITING") \
        /test echo("Czekam na odpowiedz z muda.") %;\
        /rstart -1 1 /unset lpc_file_list %;\
    /endif

/def send_lpc_exec = \
    /let _word=%{*} %;\
    /let _file=%{_word} %;\
    /if (strrchr(_word, "/") > -1) \
        /let _dir=$[substr(_word, 0, strrchr(_word, "/") + 1)] %;\
        /let _file=$[substr(_word, strrchr(_word, "/") + 1)] %;\
    /endif %;\
    /send exec  \
                a = FTPATH(this_player()->query_path() + "/", "%{_dir}"); \
                if ("%{_dir}" != "/") \
                    a += "/"; \
                if (file_size(a + "%{_file}") == -2) \
                    d = 1; \
                b = get_dir(a + "%{_file}*"); \
                if (sizeof(b)) \
                    b -= ({".", ".."}); \
                for (i = 0; i < sizeof(b); i++) \
                    if (file_size(a + b[i]) == -2) \
                        b[i] += "/"; \
                return "LPC_COMPLETE: `" + d + "`\\"" + implode(b, "\\", \\"") + "\\"`";
    
/def -agBCred -mregexp -t'Result = "LPC_COMPLETE: `(.*)`(.*)`"' _comp_lpc_trig = \
    /let _dir=%{P1} %;\
    /set lpc_file_list=%{P2} %;\
    /let _word=$(/last $[kbhead()]) %;\
    /if (_dir) \
        /if (substr(_word, -1) !~ "/") \
            /input / %;\
        /endif %;\
        /let _word= %;\
    /elseif (strrchr(_word, "/") > -1) \
        /let _word=$[substr(_word, strrchr(_word, "/") + 1)] %;\
    /endif %;\
    /eval /test _complete_from_list({_word}, %{lpc_file_list}) %;\
    /unset lpc_file_list

