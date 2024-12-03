import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_wave/flutter_wave.dart';
import 'package:flutter_wave/flutter_wave_platform_interface.dart';
import 'package:flutter_wave/flutter_wave_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterWavePlatform
    with MockPlatformInterfaceMixin
    implements FlutterWavePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterWavePlatform initialPlatform = FlutterWavePlatform.instance;

  test('$MethodChannelFlutterWave is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterWave>());
  });

  test('getPlatformVersion', () async {
    FlutterWave flutterWavePlugin = FlutterWave();
    MockFlutterWavePlatform fakePlatform = MockFlutterWavePlatform();
    FlutterWavePlatform.instance = fakePlatform;

    expect(await flutterWavePlugin.getPlatformVersion(), '42');
  });
}
