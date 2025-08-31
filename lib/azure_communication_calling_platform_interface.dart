import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'azure_communication_calling_method_channel.dart';

abstract class AzureCommunicationCallingPlatform extends PlatformInterface {
  /// Constructs a AzureCommunicationCallingPlatform.
  AzureCommunicationCallingPlatform() : super(token: _token);

  static final Object _token = Object();

  static AzureCommunicationCallingPlatform _instance = MethodChannelAzureCommunicationCalling();

  /// The default instance of [AzureCommunicationCallingPlatform] to use.
  ///
  /// Defaults to [MethodChannelAzureCommunicationCalling].
  static AzureCommunicationCallingPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AzureCommunicationCallingPlatform] when
  /// they register themselves.
  static set instance(AzureCommunicationCallingPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> startCall({required String chatToken, required String roomId, String? displayName}) async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
