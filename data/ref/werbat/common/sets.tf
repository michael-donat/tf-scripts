; ------------------------------------
; Ustawienia do edycji według potrzeb:
; (mogą być nadpisane w pliku postaci)
; ------------------------------------

; typ klawiatury (standard/mac):
/set ktype=standard

; domyślny czas zmiany lokacji przez autołazika:
/set delay=0

; prefix przed wpisywanymi komendami (przy włączonym ich pokazywaniu - /set kecho on):
/set kprefix=> 

; kolor komend wpisywanych przez gracza (edytować nazwę koloru _po_ znaku 'C'):
/set kecho_attr=Cgreen

; kolory:

; kolor główny:
/set kolor_main green

; kolor różnych warningów:
/set kolor_alarm yellow

; kolor sytuacji krytycznych:
/set kolor_crit red

; kolor ataków:
/set kolor_atak red

; kolor informacji wyświetlanych przez skrypty:
/set kolor_info magenta

; kolor walki
/set kolor_fight red

; kolor ciosów własnych
/set kolor_fight_me rgb530

; kolor speców:
/set kolor_spec magenta

; kolor znaków gildiowych:
/set kolor_guild white

; kolor podświetleń chwilowych (/glow):
/set kolor_glow magenta

; kolor mówienia:
/set kolor_speak cyan

; defaultowy tryb ataku:
/set attackmode=1

; ------------------------------------------------------------------------------------------
; Poniższych opcji radzę nie edytować. Może to prowadzić do problemów z działaniem skryptów.
; ------------------------------------------------------------------------------------------
/set ingame=0

/set hiliteattr=BCmagenta
/set wrapspace=2
/set isize=1
/set warn_status=off
/set status_pad= 
/set status_height=4

/set pack=off
/set sneak=off
/set hide=off
/set auto=off
/set unnormal=none

/set zar_godzina=?
/set am_czy_pm=?
/set ownkills=0
/set allkills=0
/set poczta_show=none
/set dobadzcmd=dobadz
/eval /set tank=$[decode_attr("nie", "BCgreen")]
/eval /set alarm=$[decode_attr("none", "BCgreen")]
/eval /set nxt_zaslona=$[decode_attr("rdy", "BCgreen")]
/eval /set nxt_order=$[decode_attr("rdy", "BCgreen")]
/eval /set kondycja=$[strcat("[", decode_attr("                     ", "Cbggreen"), "] ")]
/eval /set zmeczenie=$[strcat("[", decode_attr("                    ", "Cbggreen"), "] ")]
/eval /set blokowanko=$[strcat("[", decode_attr("                     ", "Cgreen"), "] ")]
/eval /set warningstat=$[strcat("[", decode_attr("                    ", "Cgreen"), "] ")]
