;-----------------------------------------------
;           MAC NUM PAD
;-----------------------------------------------
/def key_nkp0 = /_bind_kb_key_nkp0
/def key_nkp. = /_bind_kb_key_nkpDot
/def key_nkpEnt = /_bind_kb_key_nkpEnt
/def key_nkp+ = /_bind_kb_key_nkpPlus
/def key_nkp- = /_bind_kb_key_nkpMinus

/def key_nkp1 = /_bind_kb_key_nkp1
/def key_nkp2 = /_bind_kb_key_nkp2
/def key_nkp3 = /_bind_kb_key_nkp3
/def key_nkp4 = /_bind_kb_key_nkp4
/def key_nkp5 = /_bind_kb_key_nkp5
/def key_nkp6 = /_bind_kb_key_nkp6

/def key_nkp7 = /_bind_kb_key_nkp7
/def key_nkp8 = /_bind_kb_key_nkp8
/def key_nkp9 = /_bind_kb_key_nkp9

/def key_nkp/ = /_bind_kb_key_nkpDivide

/def key_nkp* = /_bind_kb_key_nkpTimes

/~keyseq nkpEq		^[OX

/def key_nkpEq = /_bind_kb_key_nkpEquals

/def _bind_kb_key_nkpEnt = /dokey NEWLINE

; custom bindings for ctrl+numeric
/def -i -b'^[[101~' = /key_ctrl_nkp1
/def -i -b'^[[102~' = /key_ctrl_nkp2
/def -i -b'^[[103~' = /key_ctrl_nkp3
/def -i -b'^[[104~' = /key_ctrl_nkp4
/def -i -b'^[[105~' = /key_ctrl_nkp5
/def -i -b'^[[106~' = /key_ctrl_nkp6
/def -i -b'^[[107~' = /key_ctrl_nkp7
/def -i -b'^[[108~' = /key_ctrl_nkp8
/def -i -b'^[[109~' = /key_ctrl_nkp9

/def -i -b'^[[201~' = /key_shift_nkp1
/def -i -b'^[[202~' = /key_shift_nkp2
/def -i -b'^[[203~' = /key_shift_nkp3
/def -i -b'^[[204~' = /key_shift_nkp4
/def -i -b'^[[205~' = /key_shift_nkp5
/def -i -b'^[[206~' = /key_shift_nkp6
/def -i -b'^[[207~' = /key_shift_nkp7
/def -i -b'^[[208~' = /key_shift_nkp8
/def -i -b'^[[209~' = /key_shift_nkp9