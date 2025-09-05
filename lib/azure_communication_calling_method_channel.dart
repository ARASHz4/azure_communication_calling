import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'azure_communication_calling_platform_interface.dart';

/// An implementation of [AzureCommunicationCallingPlatform] that uses method channels.
class MethodChannelAzureCommunicationCalling extends AzureCommunicationCallingPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('azure_communication_calling');

  @override
  Future<String?> startCall({required String token, required String roomId, String? displayName}) async {
    try {
      await methodChannel.invokeMethod('startCall', {
        'token': token,
        'room_id': roomId,
        'display_name': displayName,
      });
    } on PlatformException catch (ex) {
      return ex.message;
    }

    return null;
  }
}
