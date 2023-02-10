import 'package:interact/interact.dart';

enum ChoiceOptions {
  yes("yes"),
  no("no");

  final String option;

  const ChoiceOptions(this.option);
}

enum CommitType {
  feat("featute", "A new feature"),
  hotfix("hotfix", "A bug fix"),
  bugfix("bugfix", "A bug fix"),
  none("none", "No commit type"),
  chore("chore", "Other changes that don't modify src or test files"),
  refactor(
      "refactor", "A code change that neither fixes a bug nor adds a feature"),
  doc("doc", "Documentation only changes"),
  style("style",
      "Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)"),
  test("test", "Adding missing tests or correcting existing tests"),
  ci("CI",
      "Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)");

  final String name;
  final String description;

  const CommitType(this.name, this.description);
}

// iterate with selection

ChoiceOptions getChoiceOption(String message) {
  final selection = Select(
          prompt: message,
          options: ChoiceOptions.values.map((option) => option.option).toList())
      .interact();
  return ChoiceOptions.values[selection];
}

CommitType getCommitType({required String message}) {
  final selection = Select(
          prompt: message,
          options: CommitType.values.map((type) => type.name).toList())
      .interact();
  return CommitType.values[selection];
}
