# PermissionsKit

Universal API for requesting permissions and reading their status — `.authorized`, `.denied` & `.notDetermined`. Each permission ships as a separate product, so the app compiles only the ones it actually uses.

## Installation

In Xcode: File → Add Package Dependencies → paste URL:

```
https://github.com/sparrowcode/PermissionsKit
```

Then pick the products you need. Add only those — every permission API you link is visible to App Review, and unused ones invite questions about why the app needs them.

## Permissions

| Permission | Product | Key for `Info.plist` |
| :--------- | :------ | :------------------- |
| Bluetooth | `BluetoothPermission` | NSBluetoothAlwaysUsageDescription, NSBluetoothPeripheralUsageDescription |
| Calendar | `CalendarPermission` | NSCalendarsUsageDescription, NSCalendarsFullAccessUsageDescription, NSCalendarsWriteOnlyAccessUsageDescription |
| Camera | `CameraPermission` | NSCameraUsageDescription |
| Contacts | `ContactsPermission` | NSContactsUsageDescription |
| FaceID | `FaceIDPermission` | NSFaceIDUsageDescription |
| Health | `HealthPermission` | NSHealthUpdateUsageDescription, NSHealthShareUsageDescription |
| Location | `LocationPermission` | NSLocationAlwaysAndWhenInUseUsageDescription, NSLocationWhenInUseUsageDescription |
| Media Library | `MediaLibraryPermission` | NSAppleMusicUsageDescription |
| Microphone | `MicrophonePermission` | NSMicrophoneUsageDescription |
| Motion | `MotionPermission` | NSMotionUsageDescription |
| Notification | `NotificationPermission` | — |
| Photo Library | `PhotoLibraryPermission` | NSPhotoLibraryUsageDescription, NSPhotoLibraryAddUsageDescription |
| Reminders | `RemindersPermission` | NSRemindersUsageDescription, NSRemindersFullAccessUsageDescription |
| Siri | `SiriPermission` | NSSiriUsageDescription |
| Speech Recognizer | `SpeechRecognizerPermission` | NSSpeechRecognitionUsageDescription |
| Tracking | `TrackingPermission` | NSUserTrackingUsageDescription |

## Usage

Request a permission:

```swift
import PermissionsKit
import NotificationPermission

Permission.notification([.alert, .badge, .sound]).request {
    // Called once the user answers the system dialog.
}
```

Read its status:

```swift
import PermissionsKit
import CameraPermission

let authorized = Permission.camera.authorized
```

> [!WARNING]
> FaceID can't tell `.authorized` from `.notDetermined` — both come back as `.notDetermined`. Only `.denied` is reliable.

## Keys in `Info.plist`

Apple requires a usage description for most permissions. Get the key for a permission:

```swift
let key = Permission.bluetooth.usageDescriptionKey
```

> [!NOTE]
> Use the key itself, not the description text — Xcode won't build otherwise.

### Localisation

An xliff export creates the keys for you. Doing it by hand means adding an `InfoPlist.strings` file, selecting the languages in the inspector, and writing the keys there:

```
"NSCameraUsageDescription" = "Here description of usage camera";
```
