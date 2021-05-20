# Contributing

Here provided more info about project, contribution process and recomended changes.
Please, read it before pull request or create issue.

## Codestyle 

### Marks

For clean struct code good is using marks. 

```swift
class Example {

    // MARK: - Init
    
    init() {}
}
```

Here you find all which using in project:

- // MARK: - Init
- // MARK: - Lifecycle
- // MARK: - Layout
- // MARK: - Helpers

If you can't find valid, add new to codestyle agreements please. Other can be use if class is large and need struct it even without adding to codestyle agreements.

## Active Compilation Conditions

List of using for permissions:

- SPPERMISSIONS_CAMERA
- SPPERMISSIONS_CONTACTS
- SPPERMISSIONS_CALENDAR
- SPPERMISSIONS_PHOTOLIBRARY
- SPPERMISSIONS_NOTIFICATION
- SPPERMISSIONS_MICROPHONE
- SPPERMISSIONS_REMINDERS
- SPPERMISSIONS_SPEECHRECOGNIZER
- SPPERMISSIONS_LOCATION_WHENINUSE
- SPPERMISSIONS_LOCATION_ALWAYS
- SPPERMISSIONS_MOTION
- SPPERMISSIONS_MEDIALIBRARY
- SPPERMISSIONS_BLUETOOTH
- SPPERMISSIONS_TRACKING

List of using for code manage: 

- SPPERMISSIONS_SPM
- SPPERMISSIONS_COCOAPODS

