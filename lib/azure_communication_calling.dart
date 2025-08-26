
import 'azure_communication_calling_platform_interface.dart';

class AzureCommunicationCalling {
  Future<String?> getPlatformVersion() {
    return AzureCommunicationCallingPlatform.instance.getPlatformVersion();
  }
}
