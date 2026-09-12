import PermissionsKit

#if os(iOS)
import Foundation
import MediaPlayer

public extension Permission {
    
    static var mediaLibrary: MediaLibraryPermission {
        return MediaLibraryPermission()
    }
}

public class MediaLibraryPermission: Permission {
    
    open override var kind: Permission.Kind { .mediaLibrary }
    open var usageDescriptionKey: String? { "NSAppleMusicUsageDescription" }
    
    public override var status: Permission.Status {
        switch MPMediaLibrary.authorizationStatus() {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping @MainActor () -> Void) {
        MPMediaLibrary.requestAuthorization() { status in
            Task { @MainActor in
                completion()
            }
        }
    }
}
#endif
