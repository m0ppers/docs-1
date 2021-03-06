---
layout: default
description: Migrating from pre-2.8
---
Migrating from pre-2.8
======================

When migrating from a version older than ArangoDB 2.8 please note that starting with ArangoDB 2.8 the behaviour of the `require` function more closely mimics the behaviour observed in Node.js and module bundlers for browsers, e.g.:

In a file `/routes/examples.js` (relative to the root folder of the service):

* `require('./my-module')` will be attempted to be resolved in the following order:

  1. `/routes/my-module` (relative to service root)
  2. `/routes/my-module.js` (relative to service root)
  3. `/routes/my-module.json` (relative to service root)
  4. `/routes/my-module/index.js` (relative to service root)
  5. `/routes/my-module/index.json` (relative to service root)

* `require('lodash')` will be attempted to be resolved in the following order:

  1. `/routes/node_modules/lodash` (relative to service root)
  2. `/node_modules/lodash` (relative to service root)
  3. ArangoDB module `lodash`
  4. Node compatibility module `lodash`
  5. Bundled NPM module `lodash`

* `require('/abs/path')` will be attempted to be resolved in the following order:

  1. `/abs/path` (relative to file system root)
  2. `/abs/path.js` (relative to file system root)
  3. `/abs/path.json` (relative to file system root)
  4. `/abs/path/index.js` (relative to file system root)
  5. `/abs/path/index.json` (relative to file system root)

This behaviour is incompatible with the source code generated by the Foxx generator in the web interface before ArangoDB 2.8.

**Note:** The `org/arangodb` module is aliased to the new name `@arangodb` in ArangoDB 3.0.0 and the `@arangodb` module was aliased to the old name `org/arangodb` in ArangoDB 2.8.0. Either one will work in 2.8 and 3.0 but outside of legacy services you should use `@arangodb` going forward.

Foxx queue
----------

In ArangoDB 2.6 Foxx introduced a new way to define queued jobs using Foxx scripts to replace the function-based job type definitions which were causing problems when restarting the server. The function-based jobs have been removed in 2.7 and are no longer supported at all.

CoffeeScript
------------

ArangoDB 3.0 no longer provides built-in support for CoffeeScript source files, even in legacy compatibility mode. If you want to use an alternative language like CoffeeScript, make sure to pre-compile the raw source files to JavaScript and use the compiled JavaScript files in the service.

The request module
------------------

The `@arangodb/request` module when used with the `json` option previously overwrote the string in the `body` property of the response object of the response with the parsed JSON body. In 2.8 this was changed so the parsed JSON body is added as the `json` property of the response object in addition to overwriting the `body` property. In 3.0 and later (including legacy compatibility mode) the `body` property is no longer overwritten and must use the `json` property instead. Note that this only affects code using the `json` option when making the request.

Bundled NPM modules
-------------------

The bundled NPM modules have been upgraded and may include backwards-incompatible changes, especially the API of `joi` has changed several times. If in doubt you should bundle your own versions of these modules to ensure specific versions will be used.

The utility module `lodash` is now available and should be used instead of `underscore`, but both modules will continue to be provided.
