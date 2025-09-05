package com.arashz4.azure_communication_calling

import android.content.Context
import com.azure.android.communication.common.CommunicationTokenCredential
import com.azure.android.communication.ui.calling.CallComposite
import com.azure.android.communication.ui.calling.CallCompositeBuilder
import com.azure.android.communication.ui.calling.models.CallCompositeRoomLocator

class AzureCall {
    fun startCallComposite(context: Context, token: String, roomId: String, displayName: String?) : String? {
        try {
            val credential = CommunicationTokenCredential(token);

            val callComposite: CallComposite = CallCompositeBuilder()
                .applicationContext(context)
                .credential(credential)
                .displayName(displayName).build()

            val locator = CallCompositeRoomLocator(roomId)

            callComposite.launch(context, locator)
        } catch (e: Exception) {
            return e.message;
        }

        return null;
    }
}
