import 'package:get_it/get_it.dart';
import 'package:git_helper/model/select_commit_type.dart';

final getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton<SelectedCommitType>(SelectedCommitType());
}
