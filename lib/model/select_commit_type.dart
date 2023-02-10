import 'package:git_helper/constants.dart';

class SelectedCommitType {
  static CommitType _selectedCommitType = CommitType.none;

  static CommitType get selectedCommitType => _selectedCommitType;

  static set selectedCommitType(CommitType value) {
    _selectedCommitType = value;
  }
}
