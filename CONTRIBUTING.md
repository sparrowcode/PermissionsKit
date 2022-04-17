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
- // MARK: - Public
- // MARK: - Private
- // MARK: - Internal
- // MARK: - Models
- // MARK: - Ovveride

If you can't find valid, add new to codestyle agreements please. Other can be use if class is large and need struct it even without adding to codestyle agreements.


## Active Compilation Conditions

List of using for permissions:

- PERMISSIONKIT_CAMERA
- PERMISSIONKIT_CONTACTS
- PERMISSIONKIT_CALENDAR
- PERMISSIONKIT_PHOTOLIBRARY
- PERMISSIONKIT_NOTIFICATION
- PERMISSIONKIT_MICROPHONE
- PERMISSIONKIT_REMINDERS
- PERMISSIONKIT_SPEECHRECOGNIZER
- PERMISSIONKIT_LOCATION_WHENINUSE
- PERMISSIONKIT_LOCATION_ALWAYS
- PERMISSIONKIT_MOTION
- PERMISSIONKIT_MEDIA_LIBRARY
- PERMISSIONKIT_BLUETOOTH
- PERMISSIONKIT_TRACKING
- PERMISSIONKIT_SIRI

List of using for code manage: 

- PERMISSIONKIT_SPM
- PERMISSIONKIT_COCOAPODS

