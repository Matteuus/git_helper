import 'dart:io';

import 'package:git_helper/datasource.dart';
import 'package:git_helper/handler.dart';
import 'package:git_helper/src/options.dart';

const String program = 'gh';
void main(List<String> arguments) async {
  Options options;
  try {
    options = parseOptions(arguments);
  } on FormatException catch (e) {
    stderr.writeln(e.message);
    print(usage);
    exitCode = 64;
    return;
  }

  if (options.commit) {
    if (await isGitDirectory()) {
      commitFlow();
    } else {
      newGitCommitFlow();
    }
    return;
  }

  if (options.help) {
    print(usage);
    return;
  }
}

Future<void> commitFlow() async {
  final List<GitStep> steps = [
    StageFilesStep(),
    CommitStep(),
    PushRemoteStep(),
    PullRemoteStep(),
  ];

  for (final step in steps) {
    final result = await step.execute();
    if (!result) {
      print('Error trying to execute ${step.runtimeType}');
      exit(1);
    }
  }
  print("Flow executed successfully");
}

Future<void> newGitCommitFlow() async {
  final List<GitStep> steps = [
    CreateGitRepositoryStep(),
    StageFilesStep(),
    CommitStep(),
    RenameBranchStep(),
    AddRemoteStep(),
    PushRemoteStep(),
    PullRemoteStep(),
  ];

  for (final step in steps) {
    final result = await step.execute();
    if (!result) {
      print('Error trying to execute ${step.runtimeType}');
      await removeGit();
      print('Rollback git');
      exit(1);
    }
  }
  print("Flow executed successfully");
}

//listar arquiivos dentro do workspace

//comando para criar, mudar branch ex: move to developer
