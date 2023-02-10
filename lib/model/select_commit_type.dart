import 'package:git_helper/constants.dart';

class SelectedCommitType {
  CommitType _commitType = CommitType.none;

  set commitType(CommitType value) {
    _commitType = value;
  }

  CommitType get commitType => _commitType;
}
