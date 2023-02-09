import 'package:interact/interact.dart';

enum ChoiceOptions {
  yes("yes"),
  no("no");

  final String option;

  const ChoiceOptions(this.option);
}

enum CommitType {
  feat("feature"),
  hotfix("hotfix"),
  bugfix("bugfix"),
  none("none"),
  chore("chore"),
  refactor("refactor"),
  doc("doc"),
  style("style"),
  test("test");

  final String name;

  const CommitType(this.name);
}

// iterate with selection

ChoiceOptions getChoiceOption(String message) {
  final selection = Select(
          prompt: message,
          options: ChoiceOptions.values.map((option) => option.option).toList())
      .interact();
  return ChoiceOptions.values[selection];
}

CommitType getCommitType() {
  final selection = Select(
          prompt: "Select the commit type (none will ignore it)",
          options: CommitType.values.map((type) => type.name).toList())
      .interact();
  return CommitType.values[selection];
}
