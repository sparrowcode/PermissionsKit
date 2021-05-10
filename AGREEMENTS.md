# Agreements

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

Here you find all which using in project.

- // MARK: - Init
- // MARK: - Lifecycle
- // MARK: - Layout
- // MARK: - Helpers

If you can't find valid, add new to codestyle agreements please. Other can be use if class is large and need struct it even without adding to codestyle agreements.

## Active Compilation Conditions

If you need manually use `SPPermissions`, you shoud set active compilation conditions. List of all is it:

- SPPERMISSIONS_CAMERA
- SPPERMISSIONS_CONTACTS
- SPPERMISSIONS_CALENDAR
- SPPERMISSIONS_PHOTOLIBRARY
- SPPERMISSIONS_NOTIFICATION
- SPPERMISSIONS_MICROPHONE
- SPPERMISSIONS_REMINDERS
- SPPERMISSIONS_SPEECHRECOGNIZER
- SPPERMISSIONS_LOCATION
- SPPERMISSIONS_MOTION
- SPPERMISSIONS_MEDIALIBRARY
- SPPERMISSIONS_BLUETOOTH
- SPPERMISSIONS_TRACKING

