Redis Failover
==============

This is an example of how redis failover can be achieved using redis
sentinel and a master/slave setup.

Run `vagrant up` to get things started. This will provision two
virtual machines each running a simple, redis-dependent service called
"counter". This service increases the value of a key in redis every
second. The redis instances on the two machines are kept in sync. If
one machine goes down, the other redis instance takes over. When the
failed machine is up again, it will automatically sync itself.
