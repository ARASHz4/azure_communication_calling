# ---------- Azure Communication Calling Core ----------
-keep class com.azure.android.communication.calling.** { *; }
-keep class com.azure.android.communication.ui.calling.** { *; }

# ---------- Microsoft Media / DL Native SDK ----------
-keep class com.microsoft.dl.** { *; }
-keep class com.microsoft.media.** { *; }

# ---------- Skype / Related dependencies ----------
-keep class com.skype.** { *; }

# ---------- Prevent stripping CallClient ----------
-keep class com.azure.android.communication.calling.CallClient { public *; }