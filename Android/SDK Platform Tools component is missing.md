parent nodes: [Error handling](Error%20handling.html)\
\

SDK Platform Tools component is missing {.heading-level2}
---------------------------------------

Yes I think installing the 2.3 SDK will fix your problem... you can
install older SDKs at the same time. The important thing is that the
structure of the SDK changed in 2.3 with some tools (such as ADB) moving
from sdkroottools to sdkrootplatform-tools. Quite possibly the very
latest ADT plugin isn't massively backwards-compatible re that change.
