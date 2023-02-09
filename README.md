A simple github helper

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