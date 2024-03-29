import 'package:flutter_test/flutter_test.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:analog_clock/analog_clock_platform_interface.dart';
import 'package:analog_clock/analog_clock_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAnalogClockPlatform
    with MockPlatformInterfaceMixin
    implements AnalogClockPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AnalogClockPlatform initialPlatform = AnalogClockPlatform.instance;

  test('$MethodChannelAnalogClock is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAnalogClock>());
  });

  test('getPlatformVersion', () async {
    AnalogClock analogClockPlugin = AnalogClock();
    MockAnalogClockPlatform fakePlatform = MockAnalogClockPlatform();
    AnalogClockPlatform.instance = fakePlatform;

    expect(await analogClockPlugin.getPlatformVersion(), '42');
  });
}
