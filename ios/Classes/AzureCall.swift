import AzureCommunicationCalling
import AzureCommunicationUICalling

class AzureCall {
    func startCallComposite(chatToken: String, roomId: String, displayName: String?) -> String? {
        do {
            let callCompositeOptions = CallCompositeOptions(displayName: displayName)
            let communicationTokenCredential = try CommunicationTokenCredential(token: chatToken)
            
            let callComposite = CallComposite(credential: communicationTokenCredential, withOptions: callCompositeOptions)
            
            let locator = JoinLocator.roomCall(roomId: roomId)
            
            callComposite.launch(locator: locator)
        } catch {
            return "\(error)";
        }
        
        return nil
    }
}
