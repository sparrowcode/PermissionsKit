import Foundation

enum Texts {
    
    static func permission_name(for kind: Permission.Kind) -> String {
        switch kind {
        case .camera:
            return NSLocalizedString("permission camera name", bundle: bundle, comment: "")
        case .photoLibrary:
            return NSLocalizedString("permission photoLibrary name", bundle: bundle, comment: "")
        case .microphone:
            return NSLocalizedString("permission microphone name", bundle: bundle, comment: "")
        case .calendar(access: .full), .calendar(access: .write):
            return NSLocalizedString("permission calendar name", bundle: bundle, comment: "")
        case .contacts:
            return NSLocalizedString("permission contacts name", bundle: bundle, comment: "")
        case .reminders:
            return NSLocalizedString("permission reminders name", bundle: bundle, comment: "")
        case .speech:
            return NSLocalizedString("permission speech name", bundle: bundle, comment: "")
        case .motion:
            return NSLocalizedString("permission motion name", bundle: bundle, comment: "")
        case .mediaLibrary:
            return NSLocalizedString("permission media library name", bundle: bundle, comment: "")
        case .bluetooth:
            return NSLocalizedString("permission bluetooth name", bundle: bundle, comment: "")
        case .notification:
            return NSLocalizedString("permission notification name", bundle: bundle, comment: "")
        case .location(access: .whenInUse):
            return NSLocalizedString("permission location when in use name", bundle: bundle, comment: "")
        case .location(access: .always):
            return NSLocalizedString("permission location always name", bundle: bundle, comment: "")
        case .tracking:
            return NSLocalizedString("permission tracking name", bundle: bundle, comment: "")
        case .faceID:
            return NSLocalizedString("permission faceid name", bundle: bundle, comment: "")
        case .siri:
            return NSLocalizedString("permission siri name", bundle: bundle, comment: "")
        case .health:
            return NSLocalizedString("permission health name", bundle: bundle, comment: "")
        }
    }
    
    // MARK: - Internal
    
    static var bundle: Bundle { .module }
}
