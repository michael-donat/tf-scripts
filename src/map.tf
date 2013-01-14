; TinyCartographer TF interface

;SET THIS PATH TO POINT TO THE NAMED PIPE
/set map_io=../maps/io.stream

/def map_command = \
    /set map_handler=$[tfopen(%{map_io}, "w")]%;\
    /test $[tfwrite(map_handler, strcat({1},": ",{2}))]%;\
    /test $[tfclose(map_handler)]

/def map_translate = \
    /let tmp_return=%{1}%;\
    /if ({1} =~ "n") \
        /let tmp_return=polnoc%;\
    /elseif ({1} =~ "ne") \
        /let tmp_return=polnocny-wschod%;\
    /elseif ({1} =~ "e") \
        /let tmp_return=wschod%;\
    /elseif ({1} =~ "se") \
        /let tmp_return=poludniowy-wschod%;\
    /elseif ({1} =~ "s") \
        /let tmp_return=poludnie%;\
    /elseif ({1} =~ "sw") \
        /let tmp_return=poludniowy-zachod%;\
    /elseif ({1} =~ "w") \
        /let tmp_return=zachod%;\
    /elseif ({1} =~ "nw") \
        /let tmp_return=polnocny-zachod%;\
    /endif%;\
    /return {tmp_return}

/def mmap_command = \
    /echo /eval $[strcat({1},": ",{2})]

/def map_go = \
    /test map_command("GO", {*})

/def map_add_room = \
    /test map_command("ADD", {*})

/def map_remove_exit = \
    /test map_command("RMEXIT", {*})

/def map_undo = \
    /test map_command("REV")

/def map_describe_room = \
    /test map_command("DESCRIPT", {*})

/def map_move = \
    /test map_command("MOVEALL", {*})

; makes a link between last and actual room.
; first argument is the name of exit leading from last to actual
; second (optional) is the name of exit leading back to last room
; example: /ln polnoc, wyjscie or /ln drzwi [coma IS important]
/def map_link = \
    /test map_command("LINK", {*})

; these work exactly as they're named
/def map_save = /test map_command("SAVE", {*})
/def map_load = /test map_command("LOAD", {*})
/def map_clean = /test map_command("CLEAN")
/def map_quit = /test map_command("FINISH")

