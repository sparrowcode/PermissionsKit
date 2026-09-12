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
        if #available(iOS 17.0, *) {
            switch AVAudioApplication.shared.recordPermission {
            case .granted: return .authorized
            case .denied: return .denied
            case .undetermined: return .notDetermined
            @unknown default: return .denied
            }
        } else {
            switch AVAudioSession.sharedInstance().recordPermission {
            case .granted: return .authorized
            case .denied: return .denied
            case .undetermined: return .notDetermined
            @unknown default: return .denied
            }
        }
        #elseif os(macOS)
        switch AVCaptureDevice.authorizationStatus(for: .audio) {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        @unknown default: return .denied
        }
        #endif
    }
    
    public override func request(completion: @escaping @MainActor () -> Void) {
        #if os(iOS)
        if #available(iOS 17.0, *) {
            AVAudioApplication.requestRecordPermission { _ in
                Task { @MainActor in
                    completion()
                }
            }
        } else {
            AVAudioSession.sharedInstance().requestRecordPermission { _ in
                Task { @MainActor in
                    completion()
                }
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
