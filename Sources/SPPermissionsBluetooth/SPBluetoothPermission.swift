// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (hello@ivanvorobei.io)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#if SPPERMISSIONS_SPM
import SPPermissions
#endif

#if SPPERMISSIONS_BLUETOOTH

import Foundation
import CoreBluetooth

public extension SPPermissions.Permission {

    static var bluetooth: SPBluetoothPermission {
        return SPBluetoothPermission()
    }
}

public class SPBluetoothPermission: SPPermissions.Permission {
    
    open override var type: SPPermissions.PermissionType { .bluetooth }
    open var usageDescriptionKey: String? { "NSBluetoothAlwaysUsageDescription" }
    
    public override var status: SPPermissions.PermissionStatus {
        if #available(iOS 13.1, tvOS 13.1, *) {
            switch CBCentralManager.authorization {
            case .allowedAlways: return .authorized
            case .notDetermined: return .notDetermined
            case .restricted: return .denied
            case .denied: return .denied
            @unknown default: return .denied
            }
        } else if #available(iOS 13.0, tvOS 13.0, *) {
            switch CBCentralManager().authorization {
            case .allowedAlways: return .authorized
            case .notDetermined: return .notDetermined
            case .restricted: return .denied
            case .denied: return .denied
            @unknown default: return .denied
            }
        } else {
            switch CBPeripheralManager.authorizationStatus() {
            case .authorized: return .authorized
            case .denied: return .denied
            case .restricted: return .denied
            case .notDetermined: return .notDetermined
            @unknown default: return .denied
            }
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        SPPermissionBluetoothHandler.shared.completion = completion
        SPPermissionBluetoothHandler.shared.reqeustUpdate()
    }
}

#endif

