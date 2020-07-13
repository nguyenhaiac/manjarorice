#!/usr/bin/env python

'''
A more sophisticated example of config for Promnesia
'''

from promnesia import Source


# now, let's import some indexers
# NOTE: you might need extra dependencies before using some of the indexers
# see https://github.com/karlicoss/HPI/blob/master/doc/SOURCES.org

# 'auto' indexer tries its best at indexing plaintext stuff
# - plaintext like org-mode/markdown/HTML
# - structured formats like JSON and CSV
from promnesia.sources import auto

# 'guess' indexer can do even more in addition:
# - HTTP links (to index the contents of a website)
# - Github links (to index the contents of a git repository
from promnesia.sources import guess
# TODO there is a very thin link between 'auto' and 'guess'... I might merge them in the future?


# this is an incomplete list, just the (perhaps) most interesting ones
from promnesia.sources import telegram
from promnesia.sources import takeout, instapaper, pocket, fbmessenger, twitter, roamresearch, hypothesis
from promnesia.sources import website, guess


# now we can specify the sources
# this is a required setting
SOURCES = [
    # handle my knowledge base: extract links from Org-mode and Markdown files
    Source(
        website.index,
        # NOTE: you'd need to specify your own filesystem path here
        'https://braindump.notsoboring.tech',

        # you can specify optional name, so you can see where the URL is coming from within the extension
        name='Brain',
    ),
    Source(
        auto.index,
        '~/Dropbox/brain',
        name="Brain-org"
    ),
    Source(
        hypothesis.index
    ),
]



'''
Optional setting.
A directory to keep intemediate caches in order to speed up indexing.
If not specified, caching isn't used.
'''
CACHE_DIR = '/tmp/promnesia_cache/'


'''
Optional setting.
Yu can specify the URLs you don't want to be indexed.
You might want it because there are too many of them, or for security/privacy reasons.
'''
FILTERS = [
    'mail.google.com',
    'web.telegram.org/#/im',
    'vk.com/im',
    '192.168.0.',
    # you can use regexes too!
    'redditmedia.com.*.(jpg|png|gif)',

]

