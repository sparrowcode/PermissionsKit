import PermissionsKit

#if !os(watchOS)
import Photos

public extension Permission {
    
    static var photoLibrary: PhotoLibraryPermission {
        return PhotoLibraryPermission()
    }
}

public class PhotoLibraryPermission: Permission {
    
    open override var kind: Permission.Kind { .photoLibrary }
    
    open var fullAccessUsageDescriptionKey: String? {
        "NSPhotoLibraryUsageDescription"
    }
    
    open var addingOnlyUsageDescriptionKey: String? {
        "NSPhotoLibraryAddUsageDescription"
    }
    
    public override var status: Permission.Status {
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        case .limited: return .authorized
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping @MainActor () -> Void) {
        PHPhotoLibrary.requestAuthorization({
            finished in
            Task { @MainActor in
                completion()
            }
        })
    }
}
#endif

