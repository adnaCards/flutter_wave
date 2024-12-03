
import 'flutter_wave_platform_interface.dart';

class FlutterWave {
  Future<String?> getPlatformVersion() {
    return FlutterWavePlatform.instance.getPlatformVersion();
  }
}
