import PermissionsKit

#if (os(iOS) || os(macOS))
import Foundation
import Speech

public extension Permission {

    static var speech: SpeechPermission {
        return SpeechPermission()
    }
}

public class SpeechPermission: Permission {
    
    open override var kind: Permission.Kind { .speech }
    open var usageDescriptionKey: String? { "NSSpeechRecognitionUsageDescription" }
    
    public override var status: Permission.Status {
        switch SFSpeechRecognizer.authorizationStatus() {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping @MainActor () -> Void) {
        SFSpeechRecognizer.requestAuthorization { status in
            Task { @MainActor in
                completion()
            }
        }
    }
}
#endif
