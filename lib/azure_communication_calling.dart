
import 'azure_communication_calling_platform_interface.dart';

class AzureCommunicationCalling {
  Future<String?> startCall({required String chatToken, required String roomId, String? displayName}) async {
    return await  AzureCommunicationCallingPlatform.instance.startCall(chatToken: chatToken, roomId: roomId, displayName: displayName);
  }
}
