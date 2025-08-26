import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:azure_communication_calling/azure_communication_calling_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAzureCommunicationCalling platform = MethodChannelAzureCommunicationCalling();
  const MethodChannel channel = MethodChannel('azure_communication_calling');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
