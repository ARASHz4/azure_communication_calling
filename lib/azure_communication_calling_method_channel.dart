import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'azure_communication_calling_platform_interface.dart';

/// An implementation of [AzureCommunicationCallingPlatform] that uses method channels.
class MethodChannelAzureCommunicationCalling extends AzureCommunicationCallingPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('azure_communication_calling');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
