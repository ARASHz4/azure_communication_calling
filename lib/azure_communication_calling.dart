
import 'azure_communication_calling_platform_interface.dart';

class AzureCommunicationCalling {
  Future<String?> startCall({required String token, required String roomId, String? displayName}) async {
    return await  AzureCommunicationCallingPlatform.instance.startCall(token: token, roomId: roomId, displayName: displayName);
  }
}
