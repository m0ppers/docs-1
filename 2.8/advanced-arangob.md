---
layout: default
description: Arangob is ArangoDB's benchmark and test tool
---
Arangob
=======

Arangob is ArangoDB's benchmark and test tool. It can be used to issue test
requests to the database for performance and server function testing.
It supports parallel querying and batch requests.

Related blog posts:

- [Measuring ArangoDB insert performance](https://www.arangodb.com/2013/11/measuring-arangodb-insert-performance/){:target="_blank"}
- [Gain factor of 5 using batch requests](https://www.arangodb.com/2012/10/gain-factor-of-5-using-batch-updates/){:target="_blank"}

Startup options
---------------

- *--async*: Send asynchronous requests. The default value is *false*.

- *--batch-size*: Number of operations to send per batch. Use 0 to disable
  batching (this is the default).

- *--collection*: Name of collection to use in test (only relevant for tests
  that invoke collections).

- *--complexity*: Complexity value for test case (default: 1). Meaning depends
  on test case.

- *--concurrency*: Number of parallel threads that will issue requests
  (default: 1).

- *--configuration*: Read configuration from file.

- *--delay*: Use a startup delay. This is only necessary when run in series.
  The default value is *false*.

- *--keep-alive*: Use HTTP keep-alive (default: true).

- *--progress*: Show progress of benchmark, on every 20th request. Set to
  *false* to disable intermediate logging. The default value is *true*.

- *--requests*: Total number of requests to perform (default: 1000).

- *--server.endpoint*: Server endpoint to connect to, consisting of protocol, IP
  address and port. Defaults to *tcp://localhost:8529*.

- *--server.database*: Database name to use when connecting (default: "_system").

- *--server.username*: Username to use when connecting (default: "root").

- *--server.password*: Password to use when connecting. Don't specify this
  option to get a password prompt.

- *--server.disable-authentication*: Disable the password prompt and
  authentication when connecting to the server.

- *--test-case*: Name of test case to perform (default: "version").
  Possible values:
    - version
    - document
    - collection,
    - import-document
    - hash
    - skiplist
    - edge
    - shapes
    - shapes-append
    - random-shapes
    - crud
    - crud-append
    - crud-write-read
    - aqltrx
    - counttrx
    - multitrx
    - multi-collection
    - aqlinsert
    - aqlv8

- *--verbose*: Print out replies if the HTTP header indicates DB errors.
  (default: false).

### Examples

    arangob

Starts Arangob with the default user and server endpoint.

    --test-case version --requests 1000 --concurrency 1

Runs the 'version' test case with 1000 requests, without concurrency.

    --test-case document --requests 1000 --concurrency 2

Runs the 'document' test case with 2000 requests, with two concurrent threads.

    --test-case document --requests 1000 --concurrency 2 --async true

Runs the 'document' test case with 2000 requests, with concurrency 2,
with async requests.

    --test-case document --requests 1000 --concurrency 2 --batch-size 10

Runs the 'document' test case with 2000 requests, with concurrency 2,
using batch requests.
