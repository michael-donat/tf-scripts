__author__ = 'donatm'

import tf
from util import debug

telepyrts = {
    'Imperium.67x38': "fabf6a40-d13f-11e2-8f8a-60c5470ae646"
}

def roomInfo(json):

    try:
        domain = json['map']['domain']
        x = json['map']['x']
        y = json['map']['y']

        location = "%s.%sx%s" % (domain, x, y)

        if location in set(telepyrts):
            eval = '/_map_teleport %s' % telepyrts.get(location)
            debug(eval)
            tf.eval(eval)

    except (AttributeError, KeyError) as e:
        debug('roomInfo error: %s not found' % e.message)
        return
