// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options.dart';

// **************************************************************************
// CliGenerator
// **************************************************************************

Options _$parseOptionsResult(ArgResults result) => Options(
      commit: result['commit'] as bool,
      help: result['help'] as bool,
    );

ArgParser _$populateOptionsParser(ArgParser parser) => parser
  ..addFlag(
    'commit',
    abbr: 'c',
    help: 'Starts the commit flow',
    negatable: false,
  )
  ..addFlag(
    'help',
    abbr: 'h',
    help: 'Displays the help.',
    negatable: false,
  );

final _$parserForOptions = _$populateOptionsParser(ArgParser());

Options parseOptions(List<String> args) {
  final result = _$parserForOptions.parse(args);
  return _$parseOptionsResult(result);
}
