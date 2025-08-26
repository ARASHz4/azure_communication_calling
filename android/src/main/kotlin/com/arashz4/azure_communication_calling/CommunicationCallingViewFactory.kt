//package com.arashz4.azure_communication_calling
//
//class CommunicationCallingViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
//    override fun create(context: Context, id: Int, args: Any?): PlatformView {
//        return CommunicationCallingView(context, id, args)
//    }
//}
//
//class CommunicationCallingView(context: Context, id: Int, args: Any?) : PlatformView {
//    private val textView: TextView = TextView(context).apply {
//        text = "Hello from Android Native View"
//    }
//
//    override fun getView(): View {
//        return textView
//    }
//
//    override fun dispose() {}
//}