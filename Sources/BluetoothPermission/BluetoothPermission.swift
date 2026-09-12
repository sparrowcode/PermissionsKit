import PermissionsKit
import Foundation
import CoreBluetooth
import CloudKit

public extension Permission {
    
    static var bluetooth: BluetoothPermission {
        return BluetoothPermission()
    }
}

public class BluetoothPermission: Permission {
    
    open override var kind: Permission.Kind { .bluetooth }
    open var usageDescriptionKey: String? { "NSBluetoothAlwaysUsageDescription" }
    
    public override var status: Permission.Status {
        switch CBCentralManager.authorization {
        case .allowedAlways: return .authorized
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        case .denied: return .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping @MainActor () -> Void) {
        BluetoothHandler.shared.completion = completion
        BluetoothHandler.shared.requestUpdate()
    }
}
