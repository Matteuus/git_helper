import 'package:git_helper/constants.dart';
import 'package:git_helper/datasource.dart';
import 'package:interact/interact.dart';

abstract class GitStep {
  Future<bool> execute();
}

class CreateGitRepositoryStep extends GitStep {
  @override
  Future<bool> execute() async {
    final optionSelected = getChoiceOption(
        "There is not an initialized git repository in this workspace, do you want to create it?");
    if (optionSelected == ChoiceOptions.yes) {
      return await createGit();
    } else {
      return false;
    }
  }
}

class StageFilesStep extends GitStep {
  @override
  Future<bool> execute() async {
    return await stagedCommit();
  }
}

class CommitStep extends GitStep {
  @override
  Future<bool> execute() async {
    String commitMessage = "";
    final commitType = getCommitType();
    commitMessage += commitType.name;
    final task = Input(
            prompt:
                "There is a task to vinculate? [PRO-1]: (if you leave blank this field will be ignored) ")
        .interact()
        .trim();
    task.isNotEmpty ? commitMessage += "[$task]: " : commitMessage += ": ";
    final message =
        Input(prompt: "Commit message: ", validator: (value) => value.isEmpty)
            .interact()
            .trim();
    commitMessage += message;
    return await headCommit(commitMessage: commitMessage);
  }
}

class RenameBranchStep extends GitStep {
  @override
  Future<bool> execute() async {
    final branchName =
        Input(prompt: "Branch name: ", validator: (value) => value.isEmpty)
            .interact()
            .trim();

    return await renameBranch(branchName: branchName);
  }
}

class AddRemoteStep extends GitStep {
  @override
  Future<bool> execute() async {
    final url = Input(
        prompt: "Remote repository url: ",
        validator: (value) => value.isEmpty).interact().trim();
    return await addRemoteRemote(url: url);
  }
}

class PushRemoteStep extends GitStep {
  @override
  Future<bool> execute() async {
    return await pushRemote();
  }
}

class PullRemoteStep extends GitStep {
  @override
  Future<bool> execute() async {
    return await pullRemote();
  }
}
