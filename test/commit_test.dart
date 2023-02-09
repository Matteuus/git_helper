import 'package:git_helper/handler.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class StageFilesStepMock extends Mock implements StageFilesStep {}

void main() {
  group("Git Helper CLI", () {
    test("verify is is a git directory (true)", () async {
      final stageFilesStepMock = StageFilesStepMock();
      when(() => stageFilesStepMock.execute()).thenAnswer((_) async => true);
      final result = await stageFilesStepMock.execute();
      expect(result, true);
    });

    test("verify is is a git directory (false)", () async {
      final stageFilesStepMock = StageFilesStepMock();
      when(() => stageFilesStepMock.execute()).thenAnswer((_) async => false);
      final result = await stageFilesStepMock.execute();
      expect(result, false);
    });
  });
}
