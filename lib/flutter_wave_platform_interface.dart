import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_wave_method_channel.dart';

abstract class FlutterWavePlatform extends PlatformInterface {
  /// Constructs a FlutterWavePlatform.
  FlutterWavePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterWavePlatform _instance = MethodChannelFlutterWave();

  /// The default instance of [FlutterWavePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterWave].
  static FlutterWavePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterWavePlatform] when
  /// they register themselves.
  static set instance(FlutterWavePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
