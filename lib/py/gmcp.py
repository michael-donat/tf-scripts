__author__ = 'thornag'

import tf
import json
import sys

ECHO = False

def toggle(dummy):
    tf.eval("/def -hGMCP _gmcp_received = /python_call gmcp.handle \%{*}")

def echo(flag):
    global ECHO
    ECHO = flag

"""Received room.info {"exits":["polnoc","poludnie","wschod","zachod"],"map":{"name":"Twierdza pod Gora Carbon","y":"26","domain":"
    Ishtar","x":"19"}}"""

def debug(str):
    global ECHO
    if ECHO:
        tf.out("::::: DEBUG ::::: %s" % str)

def handle(input):
    debug("Input: %s" % input)
    command, args = input.split(' ', 1)
    args = json.loads(args)

    if(command == 'room.info'):
        roomInfo(args)
    else:
        debug('Unknown command: %s ' % command)

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
        debug('roomInfo error: %s ' % e.message)
        return

echo(False)
toggle(True)