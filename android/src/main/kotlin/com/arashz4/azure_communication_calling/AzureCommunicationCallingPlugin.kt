package com.arashz4.azure_communication_calling

import android.app.Activity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** AzureCommunicationCallingPlugin */
class AzureCommunicationCallingPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private var activity: Activity? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "azure_communication_calling")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            CallMethod.StartCall.value -> {
                val arguments = call.arguments as Map<*, *>

                val token = arguments["token"] as? String
                val roomId = arguments["room_id"] as? String
                val displayName = arguments["display_name"] as? String

                if (token != null && roomId != null) {
                    activity?.let {
                        val error =  AzureCall().startCallComposite(it, token, roomId, displayName)
                        if (error != null) {
                            result.error("start_call_composite_fail", error, null)
                        }
                    } ?: run {
                        result.error("no_activity", "Activity is not attached", null)
                    }
                }
                else {
                    result.error("arguments", "invalid arguments", null)
                }
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }
}

enum class CallMethod(val value: String) {
    StartCall("startCall"),
}
