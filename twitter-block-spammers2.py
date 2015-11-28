#!/usr/bin/env python

# Import TwitterAPI
# you can install this library via the commandline:
# $ pip install --user TwitterAPI
from TwitterAPI import TwitterAPI

# setup TwitterAPI
api = TwitterAPI( \
        consumer_key='***redacted***', \
        consumer_secret='***redacted***', \
        access_token_key='***redacted***', \
        access_token_secret='***redacted***' \
        )

# get a list of already blocked users.
blockedUsers = list(set(user['screen_name'] for user in api.request('blocks/list', {'include_entities': 'false', 'skip_status':'true'})))

# perform our search for iphone spam and get the list of users.
for user in list(set(post['user']['screen_name'] for post in api.request('search/tweets', {'q': 'iPh0ne 6 AND bi0', 'count':'100', 'include_entities':'false'}))):
    # check if our current user is already in our block list
    # if they are let us know about it.
    if user in blockedUsers:
        print "User '%s' already blocked." % user
        continue
    # if they aren't, block them.
    else:
        blocked = api.request('blocks/create', {'screen_name': user})
        if blocked:
            print "Blocked user: [ @%s ]." % user
