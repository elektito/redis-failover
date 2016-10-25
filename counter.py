#!/usr/bin/env python3

import sys
from redis.sentinel import Sentinel, MasterNotFoundError
from redis.exceptions import ConnectionError
from time import sleep

print('Connecting to Sentinel...')
sentinel = Sentinel([('localhost', '16379')], socket_timeout=10)

print('Connecting to master...')
master = sentinel.master_for('redis-cluster', socket_timeout=10)

while True:
    try:
        master.incr('counter')
    except (MasterNotFoundError, ConnectionError):
        print('Connection error. Connecting to master...')
        master = sentinel.master_for('redis-cluster', socket_timeout=10)
    print('Incremented by 1.')
    sys.stdout.flush()
    sleep(1)
