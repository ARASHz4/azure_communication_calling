import Flutter
import UIKit

public class AzureCommunicationCallingPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "azure_communication_calling", binaryMessenger: registrar.messenger())
        let instance = AzureCommunicationCallingPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case CallMethod.startCall.rawValue:
            if let arguments = call.arguments as? Dictionary<String, Any>,
               let chatToken = arguments["chat_token"] as? String,
               let roomId = arguments["room_id"] as? String,
               let displayName = arguments["eventName"] as? String? {
                let error = AzureCall().startCallComposite(chatToken: chatToken, roomId: roomId, displayName: displayName)
                
                if error != nil {
                    result(FlutterError(code: "start_call_composite_fail", message: error, details: nil))
                }
            }
            else {
                result(FlutterError(code: "arguments", message: "invalid arguments", details: nil))
            }
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

enum CallMethod : String {
    case startCall
}
