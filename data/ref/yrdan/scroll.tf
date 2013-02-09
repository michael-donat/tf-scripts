; ## Linie dodane automagicznie   : tf_ver=1.0.4
; ## 
; ## Wersja pliku                 : 1.0.4
; ## Ostatnia zmiana pliku        : 2004-05-22 12:46:50
; ## Plik pobrany                 : 2004-05-22 14:52:29
; ## 
; ##


;Scroll back history tool
;PgUp brings you into the scroll back; places the world in the background;
;     also it pages up thru the scroll back one page at a time.
;PgDn Does the same as above except it doesn't activate scroll back.

/purge -msimple -ib'^[[5~'
/purge -msimple -ib'^[[6~'

/def -b'^[[5~' _PgUp = /_scroll_up
/def -b'^[[6~' _PgDn = /_scroll_down

;NOTES:
;Make sure scroll_history_size is set to the what ever /histsize is set
;to, if not the scroll_back will be flakey :)
;the /FG and /BG may cause problems for people using mulitple worlds.
;till I find a way to supress output but have it buffered this is the
;only way I know how.
;If anyone knows of a better way to turn off activity messages or trigger
;messages from other worlds let me know.
;thanks.  The code may be a little buggy but am using it regulary now.

;the size of your scroll back buffer
/eval /set scroll_history_size=%{histsize-30000}

;scroll back is on or off flag
/set scroll_back_on 0

;hit top of scroll back buffer flag
/set scroll_back_stop 0

;the current size of the scroll back buffer when in scroll back mode
/set scroll_total_lines 0

;the current position in the scroll back buffer when in scroll back mode
/set scroll_back_p 0
/set scroll_back_p1 0

/set scroll_back_screen 0

;get the current size of the history buffer
/def _total_lines = \
  /let total_lines_st 0 %;\
  /test total_lines_st := $$(/recall -ag -q #1)%;\
  /return substr(total_lines_st, 0, strstr(total_lines_st, ":"))%;\

;find top of scroll buffer, value passed must begin before top
;value returned will equal the line number at the start of the top

;define scrollback keybindings
/def _def_scroll_back = \
  /set scroll_back_on 1%;\
  /def -1 -ag -h'WORLD' _swiat_ing%;\
  /BG %;\
  /test scroll_back_stop := 0%;\
  /test scroll_back_screen := (lines() - (visual ? isize+1 : 0)) - 4%;\
  /test scroll_total_lines := _total_lines()%;\
  /test scroll_back_p := scroll_total_lines - scroll_back_screen%;\
  /def -ib'^M'   hist_quit_line_d = /_undef_scroll_back

;reset keybindings
/def _undef_scroll_back = \
  /def -1 -ag -h'WORLD' _swiat_ing%;\
  /set scroll_back_on 0%;\
  /purge -i hist_*_line_d%;\
  /FG %;\

;Draw the scroll back
/def _draw_scrollback = \
  /recall -q %{1}-%{2}%;\

 
/def _scroll_up =\
  /if (!scroll_back_on) \
    /_def_scroll_back%;\
  /endif%;\
  /if (scroll_back_stop) \
   /beep 1%;\
  /else \
     /test scroll_back_p := scroll_back_p - scroll_back_screen - 1%;\
     /if (scroll_back_p <= 1) \
       /test scroll_back_p := 1%;\
       /test scroll_back_stop := 1%;\
     /endif%;\
     /if (scroll_back_p < (scroll_total_lines - scroll_history_size) ) \
       /test scroll_back_stop := 1%;\
       /test scroll_back_p := scroll_total_lines - scroll_history_size%;\
     /endif%;\
     /test scroll_back_p1 := scroll_back_p + scroll_back_screen%;\
     /test _draw_scrollback(scroll_back_p,scroll_back_p1)%;\
  /endif

/def _scroll_down =\
  /if (scroll_back_on) \
    /if (scroll_back_p + scroll_back_screen == scroll_total_lines) \
      /_undef_scroll_back%;\
    /else \
      /test scroll_back_stop := 0%;\
      /test scroll_back_p := scroll_back_p + scroll_back_screen + 1%;\
      /if (scroll_back_p > scroll_total_lines) \
        /test scroll_back_p := scroll_total_lines - scroll_back_screen%;\
      /endif%;\
      /test scroll_back_p1 := scroll_back_p + scroll_back_screen%;\
      /test _draw_scrollback(scroll_back_p,scroll_back_p1)%;\
    /endif%;\
  /endif

