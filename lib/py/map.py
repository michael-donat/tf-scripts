__author__ = 'donatm'

import tf
from util import debug
import imp, os, sys

vendorPath = "%s/%s/%s" % (os.getcwd(), '../vendor', 'dhogrin/src/python')

sys.path.append(vendorPath)

telepyrts = {
    'Imperium.67x38': "fabf6a40-d13f-11e2-8f8a-60c5470ae646"
}

from teleports import telepyrts

def roomInfo(json):

    try:
        name = json['map']['name']
        x = json['map']['x']
        y = json['map']['y']

        location = "%s.%sx%s" % (name, x, y)
        tf.eval("/set _map_gmcp_location=%s" % location)

        if location in set(telepyrts):
            eval = '/_map_teleport %s' % telepyrts.get(location)
            debug(eval)
            tf.eval(eval)

    except (AttributeError, KeyError) as e:
        debug('roomInfo error: %s not found' % e.message)
        return

def exitInfo(json):

    try:
        exits = json['exits']

        tf.eval('/_statusbar_update_compass %s' % ' '.join(exits))

        exits = ', '.join(exits)

        tf.eval('/set __movement_exits=%s' % exits)

        debug('exitinfo -> %s' % exits)

    except:
        return