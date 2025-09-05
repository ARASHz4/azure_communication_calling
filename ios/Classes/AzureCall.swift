import AzureCommunicationCalling
import AzureCommunicationUICalling

class AzureCall {
    func startCallComposite(token: String, roomId: String, displayName: String?) -> String? {
        do {
            let callCompositeOptions = CallCompositeOptions(displayName: displayName)
            let communicationTokenCredential = try CommunicationTokenCredential(token: token)
            
            let callComposite = CallComposite(credential: communicationTokenCredential, withOptions: callCompositeOptions)
            
            let locator = JoinLocator.roomCall(roomId: roomId)
            
            callComposite.launch(locator: locator)
        } catch {
            return "\(error)";
        }
        
        return nil
    }
}
