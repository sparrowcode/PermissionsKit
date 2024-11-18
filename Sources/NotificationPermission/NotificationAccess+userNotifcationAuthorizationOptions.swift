//
//  NotificationAccess+userNotifcationAuthorizationOptions.swift
//
//
//  Created by Jonas Richard Richter on 18.06.24.
//

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
        case .announcement:
            if #available(iOS 13.0, watchOS 6.0, *) {
                .announcement
            } else {
                .alert
            }
        case .timeSensitive:
            if #available(iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
                .timeSensitive
            } else {
                .alert
            }
        }
    }
}
