import 'dart:io';

//!this function probably work only in mac and linux

Future<void> removeGit() async {
  if (await isGitDirectory()) {
    await Process.run("rm", ['-fr', '.git']);
  }
}

// verify git

Future<bool> isGitDirectory() async {
  final gitDirectory = Directory('.git');
  final exists = await gitDirectory.exists();
  return exists;
}

//git commands

Future<bool> createGit() async {
  final process = await Process.start("git", ['init']);
  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);
  return checkProcessCode(await process.exitCode);
}

Future<bool> createBranch({required String branchName}) async {
  final process = await Process.start("git", ['branch', branchName]);
  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);
  return checkProcessCode(await process.exitCode);
}

Future<bool> createBranchAndMove({required String branchName}) async {
  final process = await Process.start("git", ['checkout', '-b', branchName]);
  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);
  return checkProcessCode(await process.exitCode);
}

Future<bool> stagedCommit() async {
  final process = await Process.start("git", ['add', "."]);
  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);
  await process.exitCode;
  return checkProcessCode(await process.exitCode);
}

Future<bool> headCommit({required String commitMessage}) async {
  final process = await Process.start("git", ['commit', '-m', commitMessage]);
  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);
  await process.exitCode;
  return checkProcessCode(await process.exitCode);
}

Future<bool> renameBranch({required String branchName}) async {
  final process = await Process.start("git", ['branch', '-M', branchName]);
  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);
  await process.exitCode;
  return checkProcessCode(await process.exitCode);
}

Future<bool> addRemoteRemote({required String url}) async {
  final process = await Process.start("git", ['remote', 'add', 'origin', url]);
  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);
  await process.exitCode;
  return checkProcessCode(await process.exitCode);
}

Future<bool> pushRemote() async {
  final branchName = await getCurrentBranchName();
  final process =
      await Process.start("git", ['push', '-u', 'origin', branchName]);
  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);
  await process.exitCode;
  return checkProcessCode(await process.exitCode);
}

Future<bool> pullRemote() async {
  final process = await Process.start("git", ['pull']);
  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);
  await process.exitCode;
  return checkProcessCode(await process.exitCode);
}

Future<String> getCurrentBranchName() async {
  final result = await Process.run("git", ['branch', '--show-current']);
  return result.stdout.trim().toString();
}

bool checkProcessCode(int processCode) {
  if (processCode == 0) {
    return true;
  } else {
    return false;
  }
}
