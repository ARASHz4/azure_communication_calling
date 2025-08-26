import 'package:flutter_test/flutter_test.dart';
import 'package:azure_communication_calling/azure_communication_calling.dart';
import 'package:azure_communication_calling/azure_communication_calling_platform_interface.dart';
import 'package:azure_communication_calling/azure_communication_calling_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAzureCommunicationCallingPlatform
    with MockPlatformInterfaceMixin
    implements AzureCommunicationCallingPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AzureCommunicationCallingPlatform initialPlatform = AzureCommunicationCallingPlatform.instance;

  test('$MethodChannelAzureCommunicationCalling is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAzureCommunicationCalling>());
  });

  test('getPlatformVersion', () async {
    AzureCommunicationCalling azureCommunicationCallingPlugin = AzureCommunicationCalling();
    MockAzureCommunicationCallingPlatform fakePlatform = MockAzureCommunicationCallingPlatform();
    AzureCommunicationCallingPlatform.instance = fakePlatform;

    expect(await azureCommunicationCallingPlugin.getPlatformVersion(), '42');
  });
}
