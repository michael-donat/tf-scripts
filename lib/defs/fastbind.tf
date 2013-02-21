/def _fast_bind_set = \
    /set _fast_bind_label=%{1}%;\
    /if ({3}==1) \
        /def _bind_kb_key_nkpTimes = %{2}%%;/_fast_bind_clear%;\
    /else \
        /def _bind_kb_key_nkpTimes = %{2}%;\
    /endif

/def _fast_bind_clear = \
    /set _fast_bind_label=%;\
    /def _bind_kb_key_nkpTimes=

/def key_esc_nkp* = /_fast_bind_clear

/def _bind_kb_key_nkpTimes=

; ------------------------------------------------------------------------------
; fastbind triggers
; ------------------------------------------------------------------------------

/def -ab -t'Probujesz otworzyc *, ale nie udaje ci sie to.' _fast_bind_trigger_1 = \
    /let label=$[strcat(decode_attr(" -- OTWORZ BRAME --  ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "uww", 1)

/def -ab -t'Nie jestes zbyt pewny swojej umiejetnosci latania...' _fast_bind_trigger_2 = \
    /let label=$[strcat(decode_attr("  --  WYSUN MOST  -- ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "pociagnij linke%%;uderz w dzwon", 1)

/def -ab -t'* przybija do brzegu.' _fast_bind_trigger_3 = \
    /let label=$[strcat(decode_attr("  --   STATEK   --   ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "mm%%;wns", 1)

/def -ab -t'* schodzi z * na brzeg.' _fast_bind_trigger_4 = \
    /let label=$[strcat(decode_attr("  --   ZEJDZ    --   ", "BCbgblue"), "  ")]%;\
        /test _fast_bind_set({label}, "mm%%;zzs", 1)
