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

def enterBoatWithCart(dummy):
    separatedList = tf.getvar('_team_members_list_separated')
    separatedList = separatedList.strip('|')
    count = len(separatedList.split('|'))
    tf.send('wez monety z plecaka')
    for x in range(1, count+1):
        tf.send('kup bilet')
        tf.send('daj bilet %s czlonkowi druzyny' % porzadkowyCelownikZNumerka(x))
    tf.send('kup bilet')
    cart = tf.getvar('_cart_type')
    tf.send('wjedz %s na statek' % 'bryczka' if cart is 'bryczke' else 'wozem')
    tf.send('wloz monety do plecaka')

def porzadkowyCelownikZNumerka(number):
    if number is 1:
        return 'pierwszemu'
    if number is 2:
        return 'drugiemu'
    if number is 3:
        return 'trzeciemu'
    if number is 4:
        return 'czwartemu'
    if number is 5:
        return 'piatemu'
    if number is 6:
        return 'szostemu'
    if number is 7:
        return 'siodmemu'
    if number is 8:
        return 'osmemu'
    if number is 9:
        return 'dziewiatemu'