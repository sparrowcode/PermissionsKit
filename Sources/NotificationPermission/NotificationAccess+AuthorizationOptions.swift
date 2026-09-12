import PermissionsKit
import UserNotifications

extension Permission.NotificationAccess {
    
    var userNotifcationAuthorizationOptions: UNAuthorizationOptions {
        switch self {
        case .badge:
                .badge
        case .sound:
                .sound
        case .alert:
                .alert
        case .carPlay:
                .carPlay
        case .criticalAlert:
                .criticalAlert
        case .providesAppNotificationSettings:
                .providesAppNotificationSettings
        case .provisional:
                .provisional
        #if !os(macOS) && !os(tvOS)
        case .announcement:
                .announcement
        #endif
        case .timeSensitive:
                .timeSensitive
        }
    }
}
