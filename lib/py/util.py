__author__ = 'donatm'

import tf

ECHO = False

def echoOn(flag):
    global ECHO
    ECHO = True

def echoOff(flag):
    global ECHO
    ECHO = False

def debug(str):
    global ECHO
    if ECHO:
        tf.out("::::: DEBUG ::::: %s" % str)