import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_wave_platform_interface.dart';

/// An implementation of [FlutterWavePlatform] that uses method channels.
class MethodChannelFlutterWave extends FlutterWavePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_wave');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
