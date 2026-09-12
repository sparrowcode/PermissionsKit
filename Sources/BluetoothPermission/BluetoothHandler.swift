import Foundation
import CoreBluetooth

final class BluetoothHandler: NSObject, CBCentralManagerDelegate {
    
    var completion: @MainActor () -> Void = {}
    
    // MARK: - Init
    
    nonisolated(unsafe) static let shared: BluetoothHandler = .init()
    
    override init() {
        super.init()
    }
    
    // MARK: - Manager
    
    var manager: CBCentralManager?
    
    func requestUpdate() {
        if manager == nil {
            self.manager = CBCentralManager(delegate: self, queue: nil, options: [:])
        } else {
            notifyCompletion()
        }
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch CBCentralManager.authorization {
        case .notDetermined:
            break
        default:
            notifyCompletion()
        }
    }
    
    /*
     PermissionsKit: System callbacks arrive off the main actor, so the closure
     is copied into a local first — capturing it directly would send the handler
     itself, which is not Sendable.
     */
    private func notifyCompletion() {
        let completion = completion
        Task { @MainActor in completion() }
    }
}
