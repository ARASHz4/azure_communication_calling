# azure_communication_calling

Azure Communication Calling for Flutter

## Getting Started

You can see Microsoft documentation [here](https://learn.microsoft.com/en-us/azure/communication-services/quickstarts/ui-library/get-started-composites)

## Platform Support

| Android | iOS | macOS | Web | Windows | Linux |
|:-------:|:---:|:-----:|:---:|:-------:|:-----:|
|    ✅️   |  ✅ |  ❌  |  ❌ |    ❌   |   ❌  |

### Add dependency

```yaml
dependencies:
  azure_communication_calling: ^1.0.4 #latest version
```

### Android Setup

Add Maven repositories in `android/build.gradle.kts`

```kts
allprojects {
    repositories {
        google()
        mavenCentral()
        // add this:
        maven {
            url = uri("https://pkgs.dev.azure.com/MicrosoftDeviceSDK/DuoSDK-Public/_packaging/Duo-SDK-Feed/maven/v1")
        }
    }
}
```

- Add proguard rules for release mode in android
- Create a new file in your android project: android/app/proguard-rules.pro
- Add the following lines to the proguard-rules.pro
```
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
```

### iOS Setup

To access the device's hardware, including the microphone, and camera, update your app's information property list. Set the associated value to a string that's included in the dialog the system uses to request access from the user.

Open `ios/Runner/Info.plist` Add the following lines to the top level <dict> section.
```xml
<key>NSCameraUsageDescription</key>
<string></string>
<key>NSMicrophoneUsageDescription</key>
<string></string>
```
## Usage

```dart
final String? error = await AzureCommunicationCalling().startCall(
  token: 'yourToken',
  roomId: 'yourRoomId',
  displayName: 'yourDisplayName',
);

if (error != null) {
  print(error);
}
```
