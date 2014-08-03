__author__ = 'thornag'

import tf
import json

ECHO = False

def toggle(dummy):
    tf.eval("/def -hGMCP _gmcp_received = /python_call py.gmcp.handle \%{*}")

def echo(dummy):
    global ECHO
    ECHO = True

"""Received room.info {"exits":["polnoc","poludnie","wschod","zachod"],"map":{"name":"Twierdza pod Gora Carbon","y":"26","domain":"
    Ishtar","x":"19"}}"""

def handle(input):
    global ECHO
    if ECHO:
        tf.eval('/echo GMCP @{Cblue}%s' % input)
    command, args = input.split(' ', 1)
    args = json.loads(args)

    if(command is 'room.info'):
        roomInfo(args)




VAR = 1;