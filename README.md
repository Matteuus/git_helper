[![package publisher](https://img.shields.io/pub/publisher/git_helper.svg)](https://pub.dev/packages/git_helper/publisher)
[![codecov](https://codecov.io/gh/Matteuus/git_helper/branch/main/graph/badge.svg?token=ABVZICGHR0)](https://codecov.io/gh/Matteuus/git_helper)

A simple command line interdace to help you out with some github commands

## Install

Use the `dart pub global` command to install this into your system.

```console
$ dart pub global activate git_helper
```

## Use

If you have [modified your PATH][path], you can run this server from any
local directory.

```console
$ git_helper
```

Otherwise you can use the `dart pub global` command.

```console
$ dart pub global run git_helper
```

Here's an example of starts a commit workflow:

```console
$ dart create my_project
$ cd my_project
$ dart pub get
$ git_helper --commit # Here the commit flow starts
```

## Configure

```console
$ git_helper --help
-c, --commit    Starts the commit flow
-h, --help      Displays the help.
```

[path]: https://dart.dev/tools/pub/cmd/pub-global#running-a-script-from-your-path