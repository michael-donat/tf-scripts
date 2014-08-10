__author__ = 'donatm'

import tf
from util import debug

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

def hpColor(hp):
    if hp == 7:
        return ('Crgb040', 'Cbgrgb040')
    if hp == 6:
        return ('Crgb350', 'Cbgrgb350')
    if hp == 5:
        return ('Crgb550', 'Crgb550')
    if hp == 4:
        return ('Crgb530', 'Cbgrgb530')
    if hp == 3:
        return ('Crgb510', 'Cbgrgb510')
    if hp == 2:
        return ('Crgb500', 'Cbgrgb500')
    if hp == 1:
        return ('Cbgred', 'Cbgred')

