__author__ = 'donatm'

import tf
from util import debug


"""
{"soaked":"2","intox":"0","improve":"0","fatigue":"
    0","mana":"5","panic":"0","headache":"0","hp":"6","stuffed":"3","encumberance":"1"}

"""

def charInfo(json):

    debug('charInfo, received %s' % json)

    try:

        hp = int(json['hp']) + 1

        color, bg = hpColor(hp)

        tf.eval('/_statusbar_update_hp %s %s %s' % (hp, color, bg))
        debug('charInfo -> hp to %s' % hp)


    except Exception as e:
        pass

    try:
        stamina = 10 - int(json['fatigue'])

        tf.eval('/_statusbar_update_stamina %s' % stamina)
        debug('charInfo -> stamina to  %s' % stamina)
    except Exception as e:
        pass

    try:
        mana = int(json['mana'])

        tf.eval('/_statusbar_update_mana %s' % mana)
        debug('charInfo -> mana to  %s' % mana)

    except Exception as e:
        pass

def hpColor(hp):
    if hp == 7:
        return ('Cbgrgb040', 'Crgb040')
    if hp == 6:
        return ('Cbgrgb350', 'Crgb350')
    if hp == 5:
        return ('Cbgrgb550', 'Crgb550')
    if hp == 4:
        return ('Cbgrgb530', 'Crgb530')
    if hp == 3:
        return ('Cbgrgb510', 'Crgb510')
    if hp == 2:
        return ('Cbgrgb500', 'Crgb500')
    if hp == 1:
        return ('Cbgred', 'Cbgred')

