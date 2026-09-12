import PermissionsKit

#if (os(iOS) || os(macOS))
import Foundation
import AVFoundation

public extension Permission {
    
    static var microphone: MicrophonePermission {
        return MicrophonePermission()
    }
}

public class MicrophonePermission: Permission {
    
    open override var kind: Permission.Kind { .microphone }
    open var usageDescriptionKey: String? { "NSMicrophoneUsageDescription" }
    
    public override var status: Permission.Status {
        #if os(iOS)
        switch  AVAudioSession.sharedInstance().recordPermission {
        case .granted: return .authorized
        case .denied: return .denied
        case .undetermined: return .notDetermined
        @unknown default: return .denied
        }
        #elseif os(macOS)
        switch AVCaptureDevice.authorizationStatus(for: .audio) {
            case .denied: return .denied
            case .notDetermined: return .notDetermined
            case .restricted: return .denied
            case .authorized: return .authorized
            @unknown default: return .denied
        }
        #endif
    }
    
    public override func request(completion: @escaping @MainActor () -> Void) {
        #if os(iOS)
        AVAudioSession.sharedInstance().requestRecordPermission {
            granted in
            Task { @MainActor in
                completion()
            }
        }
        #elseif os(macOS)
        AVCaptureDevice.requestAccess(for: .audio) { _ in
            Task { @MainActor in
                completion()
            }
        }
        #endif
    }
}
#endif
