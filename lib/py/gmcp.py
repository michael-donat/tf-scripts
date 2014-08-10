__author__ = 'thornag'

import tf
import json
import sys

from map import roomInfo
from character import charInfo

from util import debug

def toggle(dummy):
    tf.eval("/def -hGMCP _gmcp_received = /python_call gmcp.handle \%{*}")



def handle(input):
    debug("Input: %s" % input)
    command, args = input.split(' ', 1)
    args = json.loads(args)

    if(command == 'room.info'):
        roomInfo(args)
    elif(command == 'char.state'):
        charInfo(args)
    else:
        debug('Unknown command: %s ' % command)

toggle(True)