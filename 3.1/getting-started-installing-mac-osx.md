---
layout: default
description: The preferred method for installing ArangoDB under Mac OS X ishomebrew
---
Mac OS X
========

The preferred method for installing ArangoDB under Mac OS X is
[homebrew](#homebrew). However, in case you are not using homebrew, we
provide a [command-line app](#command-line-app) or [graphical
app](#graphical-app) which contains all the executables.

Homebrew
--------

If you are using [homebrew](http://brew.sh/){:target="_blank"},
then you can install the latest released stable version of ArangoDB using *brew* as follows:

    brew install arangodb

This will install the current stable version of ArangoDB and all
dependencies within your Homebrew tree. Note that the server will be
installed as:

    /usr/local/sbin/arangod

You can start the server by running the command `/usr/local/sbin/arangod &`.

Configuration file is located at

    /usr/local/etc/arangodb3/arangod.conf

The ArangoDB shell will be installed as:

    /usr/local/bin/arangosh

You can uninstall ArangoDB using:

    brew uninstall arangodb

However, in case you started ArangoDB using the launchctl, you
need to unload it before uninstalling the server:

    launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.arangodb.plist

Then remove the LaunchAgent:

    rm ~/Library/LaunchAgents/homebrew.mxcl.arangodb.plist

**Note**: If the latest ArangoDB Version is not shown in homebrew, you
also need to update homebrew:

    brew update

### Known issues

- Performance - the LLVM delivered as of Mac OS X El Capitan builds slow binaries. Use GCC instead,
  until this issue has been fixed by Apple.
- the Commandline argument parsing doesn't accept blanks in filenames; the CLI version below does.
- if you need to change server endpoint while starting homebrew version, you can edit arangod.conf 
  file and uncomment line with endpoint needed, e.g.:
      
      [server]
      endpoint = tcp://0.0.0.0:8529

Graphical App
-------------
In case you are not using homebrew, we also provide a graphical app. You can
download it from [here](https://www.arangodb.com/download){:target="_blank"}.

Choose *Mac OS X*. Download and install the application *ArangoDB* in
your application folder.

Command line App
----------------
In case you are not using homebrew, we also provide a command-line app. You can
download it from [here](https://www.arangodb.com/download){:target="_blank"}.

Choose *Mac OS X*. Download and install the application *ArangoDB-CLI*
in your application folder.

Starting the application will start the server and open a terminal window
showing you the log-file.

    ArangoDB server has been started

    The database directory is located at
       '/Applications/ArangoDB-CLI.app/Contents/MacOS/opt/arangodb/var/lib/arangodb'

    The log file is located at
       '/Applications/ArangoDB-CLI.app/Contents/MacOS/opt/arangodb/var/log/arangodb/arangod.log'

    You can access the server using a browser at 'http://127.0.0.1:8529/'
    or start the ArangoDB shell
       '/Applications/ArangoDB-CLI.app/Contents/MacOS/arangosh'

    Switching to log-file now, killing this windows will NOT stop the server.


    2013-10-27T19:42:04Z [23840] INFO ArangoDB (version 1.4.devel [darwin]) is ready for business. Have fun!

Note that it is possible to install both, the homebrew version and the command-line
app. You should, however, edit the configuration files of one version and change
the port used.
