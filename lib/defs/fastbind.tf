/def _fast_bind_set = \
    /set _fast_bind_label=%{1}%;\
    /if ({3}==1) \
        /def key_f1 = %{2}%%;/_fast_bind_clear%;\
    /else \
        /def key_f1 = %{2}%;\
    /endif

/def _fast_bind_clear = \
    /set _fast_bind_label=%;\
    /purge key_f1

/def key_esc_f1 = /_fast_bind_clear

; ------------------------------------------------------------------------------
; fastbind triggers
; ------------------------------------------------------------------------------

/def -ab -t'Probujesz otworzyc *, ale nie udaje ci sie to.' _fast_bind_trigger_1 = \
    /let label=$[strcat(decode_attr(" OTWORZ BRAME -- F1  ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "uww", 1)

/def -ab -t'Nie jestes zbyt pewny swojej umiejetnosci latania...' _fast_bind_trigger_2 = \
    /let label=$[strcat(decode_attr("  WYSUN MOST  -- F1  ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "pociagnij linke%%;uderz w dzwon", 1)

/def -ab -t'* przybija do brzegu.' _fast_bind_trigger_3 = \
    /let label=$[strcat(decode_attr("     STATEK   -- F1  ", "BCbgblue"), "  ")]%;\
    /test _fast_bind_set({label}, "mm%%;wns", 1)

/def -ab -t'* schodzi z * na brzeg.' _fast_bind_trigger_4 = \
    /let label=$[strcat(decode_attr("     ZEJDZ    -- F1  ", "BCbgblue"), "  ")]%;\
        /test _fast_bind_set({label}, "mm%%;zzs", 1)
