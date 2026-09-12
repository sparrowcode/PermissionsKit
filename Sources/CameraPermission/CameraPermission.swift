import PermissionsKit

#if os(iOS)
import Foundation
import AVFoundation

public extension Permission {
    
    static var camera: CameraPermission {
        return CameraPermission()
    }
}

public class CameraPermission: Permission {
    
    open override var kind: Permission.Kind { .camera }
    open var usageDescriptionKey: String? { "NSCameraUsageDescription" }
    
    public override var status: Permission.Status {
        switch AVCaptureDevice.authorizationStatus(for: AVMediaType.video) {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping @MainActor () -> Void) {
        AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: {
            finished in
            Task { @MainActor in
                completion()
            }
        })
    }
}
#endif
