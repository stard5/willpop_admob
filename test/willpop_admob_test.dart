import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:willpop_admob/will_pop_admob.dart';

void main() {
  const MethodChannel channel = MethodChannel('willpop_admob');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
  });
}
