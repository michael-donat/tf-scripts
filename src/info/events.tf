/set _info_events_speech_type_list=(mowi|nuci|szepcze zlowieszczo)
/eval /def -mregexp -t'.* %{_info_events_speech_type_list} do ciebie:? .*' -aCrgb315 -Fp15 _info_events_speech_1
/eval /def -mregexp -t'.* %{_info_events_speech_type_list}:?(do |) .*' -aCrgb025 -Fp10 _info_events_speech_2
/def -mregexp -t'Mowisz:? .*' -aCrgb315 -p15 _info_events_speech_3

/def -aCgray11 -mregexp -t'(.*) przybywa(ja|) z (.*)' _info_events_location_change_1 = /substitute  .-- %{P0}
/def -aCgray11 -mregexp -t'(.*) podaza(ja|) na (.*)' _info_events_location_change_2 = /substitute  .-- %{P0}

/def -p0 -t'Masz przy sobie *' _info_inventory_line = /test echo('--------------------')