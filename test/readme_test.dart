import 'dart:async';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:test/test.dart';
import 'package:test_process/test_process.dart';

void main() {
  test('--help', () => _readmeCheck(['--help']));
}

Future<void> _readmeCheck(List<String> args) async {
  final process = await _runApp(args);
  final output = (await process.stdoutStream().join('\n')).trim();
  await process.shouldExit(0);

  final readme = File('README.md');

  final command = ['git_helper', ...args].join(' ');
  final expected = '```console\n\$ $command\n$output\n```';

  printOnFailure(expected);

  expect(expected, r'''```console
$ git_helper --help
-c, --commit    Starts the commit flow
-h, --help      Displays the help.
```''');

  expect(readme.readAsStringSync(), contains(expected));
}

Future<TestProcess> _runApp(List<String> args, {String? workingDirectory}) {
  final fullArgs = ['bin/git_helper.dart', ...args];
  return TestProcess.start(_dartPath, fullArgs,
      workingDirectory: workingDirectory);
}

final String _sdkDir = (() {
  final aboveExecutable = p.dirname(p.dirname(Platform.resolvedExecutable));
  assert(FileSystemEntity.isFileSync(p.join(aboveExecutable, 'version')));
  return aboveExecutable;
})();

final String _dartPath =
    p.join(_sdkDir, 'bin', Platform.isWindows ? 'dart.exe' : 'dart');