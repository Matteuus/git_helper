import 'package:build_cli_annotations/build_cli_annotations.dart';

part 'options.g.dart';

String get usage => _$parserForOptions.usage;

@CliOptions()
class Options {
  @CliOption(abbr: 'c', negatable: false, help: 'Starts the commit flow')
  final bool commit;

  @CliOption(abbr: 'h', negatable: false, help: 'Displays the help.')
  final bool help;

  Options({
    required this.commit,
    required this.help,
  });
}
