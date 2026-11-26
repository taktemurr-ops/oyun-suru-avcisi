import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_suru_avcisi/oyun_suru_avcisi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(suruAvcisiConfig.title.length, 33);
    expect(suruAvcisiConfig.tagline.length, 33);
    for (final s in suruAvcisiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(suruAvcisiConfig.gameId, suruAvcisiId);
    expect(suruAvcisiRules.gameId, suruAvcisiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(suruAvcisiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: suruAvcisiId, optionalMechanics: suruAvcisiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(suruAvcisiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
