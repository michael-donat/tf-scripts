; ## Linie dodane automagicznie   : tf_ver=1.1.6
; ## 
; ## Wersja pliku                 : 1.1.6
; ## Ostatnia zmiana pliku        : 2005-08-10 01:54:44
; ## Plik pobrany                 : 2005-08-10 01:54:52
; ## Wersja Tfupdate              : 2.0.0 alfa 3
; ##
; ##
/set html_color_black=DarkSlateGray
/set html_color_red=red
/set html_color_green=green
/set html_color_yellow=orange
/set html_color_blue=blue
/set html_color_magenta=magenta
/set html_color_cyan=cyan
/set html_color_normal=silver
/set html_color_white=silver
/set html_color_=silver
;/set html_color_=#C0C0C0

/set html_color_bblack=DarkSlateGray
/set html_color_bred=orangered
/set html_color_bgreen=lime
/set html_color_byellow=yellow
/set html_color_bblue=royalblue
/set html_color_bmagenta=#FF66FF
;/set html_color_bmagenta=fuchsia
;/set html_color_bmagenta=PaleTurquoise
/set html_color_bcyan=cyan
/set html_color_bnormal=white
/set html_color_bwhite=white
/set html_color_b=white

/set html_color_bgblack=DarkSlateGray
/set html_color_bgred=red
/set html_color_bggreen=green
/set html_color_bgyellow=orange
/set html_color_bgblue=blue
/set html_color_bgmagenta=magenta
/set html_color_bgcyan=cyan
/set html_color_bgnormal=black
/set html_color_bg=black

/def -ag -h'SEND *' _send_gag = /test

/def rename = /def %2 = $%1%; /def %1

/def -E({color_log_on}) -ag -mregexp -p0 -t'^' _loguj_color = \
    /test ++_color_line %;\
    /if (mod(_color_line, 50) == 0) \
        /test tfwrite("o", strcat(pad(_color_line, -5), ":", strrep("x", mod(_color_line, 3000) / 50))) %;\
    /endif %;\
    /let _line=$[encode_attr({PR})] %;\
    /let _line=$[replace(">", "&gt;", replace("<", "&lt;",_line))] %;\
    /let _out= %;\
;    /echo Line: %_line %;\
    /while /let i=$[strstr(_line, "{")]%; /@test i > 0%; /do \
        /let _out=$[strcat(_out, substr({_line}, 0, i - 1))] %;\
    	/let _line=$[substr({_line}, i + 1)] %;\
        /let i=$[strstr(_line, "}")] %;\
        /let _color=$[substr(_line, 0, i)] %;\
    	/let _line=$[substr({_line}, i + 1)] %;\
;        /echo Kolor %{_color} %;\
        /let _bgcolor= %;\
        /if (substr(_color, 0, 1) =~ 'u') \
            /let _underline= text-decoration: underline; %;\
            /let _color=$[substr(_color, 1)] %;\
            /set is_underline=1 %;\
        /endif %;\
        /if (substr(_color, 0, 1) =~ 'r') \
            /let _reverse=1 %;\
            /let _color=$[substr(_color, 1)] %;\
        /endif %;\
        /if (substr(_color, 0, 1) =~ 'B') \
            /let _bold=b %;\
            /let _color=$[substr(_color, 1)] %;\
        /endif %;\
        /if (substr(_color, 0, 1) =~ 'n') \
            /let _bold= %;\
            /if (is_underline) \
                /let _underline= text-decoration: none; %;\
                /unset is_underline %;\
            /endif %;\
            /let _reverse= %;\
            /let _color=$[substr(_color, 1)] %;\
        /endif %;\
        /let i=$[strstr(_color, ",")] %;\
        /if (i > 0) \
            /let _bgcolor=$[substr(_color, i + 3)] %;\
            /let _color=$[substr(_color, 0, i)] %;\
        /elseif (substr(_color, 0, 2) =~ 'bg') \
            /let _bgcolor=$[substr(_color, 2)] %;\
            /let _color= %;\
        /endif %;\
        /if ({_reverse}) \
            /let _reverse=%{_bgcolor} %;\
            /let _bgcolor=%{_color} %;\
            /let _color=%{_reverse} %;\
        /endif %;\
        /let _color=$[replace("C", "", _color)] %;\
        /let _font=$(/listvar -v html_color_%{_bold}%{_color}) %;\
        /let _bgfont=$(/listvar -v html_color_bg%{_bgcolor}) %;\
;        /echo Set font %{_font} for %{_color} %;\
        /let _c= %;\
        /if (_last_span == 1) \
            /let _c=$['</span>'] %;\
        /endif %;\
        /if (_font !~ html_color_ | _bgfont !~ html_color_bg & _underline) \
            /let _c=$[strcat(_c, '<span style="color: ', _font, '; background-color: ', _bgfont, ';' , _underline, '">')] %;\
            /set _last_span=1 %;\
        /else \
            /set _last_span=0 %;\
        /endif %;\
        /if (!strlen({_font}) | !strlen({_bgfont})) \
            /echo Color: %_color BgColor: %_bgcolor Bold: %_bold font: %_font bgfont %_bgfont%;\
        /endif %;\
        /let _out=$[strcat(_out, _c)] %;\
    /done %;\
    /let _out=$[strcat('<b>', _rec_time, ' # </b>', _out, _line)] %;\
;    /test tfwrite({_ch}, strcat({_out}))
    /test tfwrite({_ch}, strcat(replace("  ", " &nbsp;", {_out}), "<br />"))
;    /substitute 
    

/def -mregexp -Fp1002 -t'^(\\d{2}:\\d{2}:\\d{2}(\\.\\d{6}|)) #( |)' _rem_time = /set _rec_time=%{P1} %; /return substitute({PR})
/def -mregexp -Fp1001 -t'^(\\[.{3}\\]\\[.{14}\\] |>> .* SPEC (\\(.*?\\) |)<< )' _rem_kond = /return substitute({PR})
/def -mregexp -Fp1000 -t'\\s*\\([^\\d]*?\\)' _rem_names = /return substitute(strcat({PL}, {PR}))
/def -mregexp -Fp1000 -t'\\s*\\([^\\d]*?\\)' _rem_names_1 = /return substitute(strcat({PL}, {PR}))
;/def -mregexp -Fp1000 -t'\\s*\\[\\d*?\\/\\d*?\\]' _rem_cyferki = /return substitute(strcat({PL}, {PR}))
;/def -mregexp -Fp1000 -t'\\s*\\(.*?\\)' _rem_cyferki2 = /return substitute(strcat({PL}, {PR}))
;/def -mregexp -Fp1000 -t'\\s*\\(.*?\\)' _rem_cyferki2_1 = /return substitute(strcat({PL}, {PR}))
/def -mregexp -p1000 -t' <--- MC MUTACJA ---<' _rem_mc_mutacje = /return substitute({PL})

/undef _pnr
/def _pnr

/def _slog = \
    /set _a=%{*} %;\
    /test fake_recv(_a)

/def color_log = \
    /quote -S /edit -F `/quote -S  /last `/list -s -t'*' %;\
    /set _rem_echo=$echo %;\
    /edit echo = /test %;\
    /set _rem__echo=$_echo %;\
    /edit _echo = /test %;\
    /purge _przedstawia_sie %;\
    /unset obecnie_expujacy %;\
    /unset obecnie_swiat %;\
    /set ogolne_literki_na_cyferki=1 %;\
    /imiona on %;\
    /set max_trig=10000000 %;\
    /visual off %;\
    /rstop a %;\
;    /mecho on %;\
    /set _last_span=0 %;\
    /set _color_line=0 %;\
    /set color_log_on=1 %;\
    /let _data=$[ftime("%d.%m.%Y",time())] %;\
    /test (_ch := tfopen("%{1}.html", "w")) %;\
    /test tfflush(_ch, 0) %;\
    /test tfwrite({_ch}, '<?xml version="1.0" encoding="iso-8859-1"?>') %;\
    /test tfwrite({_ch}, '<!DOCTYPE html PUBLIC "-\/\/W3C\/\/DTD XHTML 1.1\/\/EN" "http:\/\/www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">') %;\
;    /test tfwrite({_ch}, '<!ATTLIST body xml:space (default|preserve) 'preserve'>') %;\
    /test tfwrite({_ch}, '<html xmlns="http:\/\/www.w3.org/1999/xhtml" xml:lang="pl" >') %;\
    /test tfwrite({_ch}, '<head>') %;\
    /test tfwrite({_ch}, '  <title>%{-1} (%{_data})</title>') %;\
    /test tfwrite({_ch}, '  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />') %;\
    /test tfwrite({_ch}, '  <meta http-equiv="Autor" content="Ingwar Swenson" />') %;\
    /test tfwrite({_ch}, strcat('  <meta http-equiv="Generator" content="TinyFugue version ', ver(), ' - color_log.tf" />')) %;\
    /_print_styles %;\
    /test tfwrite({_ch}, '</head>') %;\
;    /test tfwrite({_ch}, '<body style="background-color: %{html_color_bg}; font-family: monospace;">') %;\
    /test tfwrite({_ch}, '<body>') %;\
;    /test tfwrite({_ch}, '<code>') %;\
;    /test tfwrite({_ch}, '<table width='500' bgcolor='green'><tr><td width='100%'>') %;\
;    /test tfwrite({_ch}, '<pre xml:space='preserve'>') %;\
    /test tfwrite({_ch}, '<div onclick="document.styleSheets[0].cssRules[1].style[\\'display\\'] = \\'inline\\'; }">Pokaz czas</div>') %;\
;    /test tfwrite({_ch}, '<div onclick="document.styleSheets[1].disable = true; }">Pokaz czas</div>') %;\
;    /test tfwrite({_ch}, '<div onclick="var e = document.getElementsByTagName(\\'b\\'); for(var i = 0; i &lt; e.length; i++) { e.item(i).style.display = \\'inline\\'; }">Pokaz czas</div>') %;\
    /test tfwrite({_ch}, '<div>') %;\
;    /test tfwrite({_ch}, '<span style="color: %{html_color_}; background-color: %{html_color_bg}">') %;\
    /quote -S /_slog '%{1} %;\
    /itrigger COLOR_LOG_END

/def -p1 -t'COLOR_LOG_END' _loguj_color_off = \
;    /test tfwrite({_ch}, '</span>') %;\
    /test tfwrite({_ch}, '</div>') %;\
    /test tfwrite({_ch}, '<div style="text-align:center">') %;\
    /test tfwrite({_ch}, '<a href="http:\/\/validator.w3.org/check?uri=referer"><img src="http:\/\/www.w3.org/Icons/valid-xhtml11" alt="Valid XHTML 1.1!" height="31" width="88" style="border: 0" /></a>') %;\
    /test tfwrite({_ch}, '</div>') %;\
    /test tfwrite({_ch}, '</body>') %;\
    /test tfwrite({_ch}, '</html>') %;\
    /test tfflush(_ch) %;\
    /test tfclose(_ch) %;\
    /visual on %;\
    /edit -i echo = %{_rem_echo} %;\
    /edit -i _echo = %{_rem__echo} %;\
    /unset color_log_on


/def _print_styles = \
    /test tfwrite({_ch}, '  <style type="text/css">') %;\
    /test tfwrite({_ch}, '      body {') %;\
    /test tfwrite({_ch}, '          background-color: %{html_color_bg};') %;\
    /test tfwrite({_ch}, '          color: %{html_color_};') %;\
    /test tfwrite({_ch}, '          font-family: monospace;') %;\
    /test tfwrite({_ch}, '      }') %;\
;    /test tfwrite({_ch}, '  </style>') %;\
;    /test tfwrite({_ch}, '  <style type="text/css">') %;\
    /test tfwrite({_ch}, '      b {') %;\
    /test tfwrite({_ch}, '          display: none;') %;\
    /test tfwrite({_ch}, '          font-weight: normal;;') %;\
    /test tfwrite({_ch}, '      }') %;\
    /test tfwrite({_ch}, '  </style>') %;\
    



