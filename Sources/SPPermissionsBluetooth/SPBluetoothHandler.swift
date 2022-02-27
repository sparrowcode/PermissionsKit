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

#if SPPERMISSIONS_BLUETOOTH

import Foundation
import CoreBluetooth

class SPPermissionBluetoothHandler: NSObject, CBCentralManagerDelegate {
    
    var completion: ()->Void = {}
    
    // MARK: - Init
    
    static let shared: SPPermissionBluetoothHandler = .init()
    
    override init() {
        super.init()
    }
    
    // MARK: - Manager
    
    var manager: CBCentralManager?
    
    func reqeustUpdate() {
        if manager == nil {
            self.manager = CBCentralManager(delegate: self, queue: nil, options: [:])
        } else {
            completion()
        }
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if #available(iOS 13.0, tvOS 13, *) {
            switch central.authorization {
            case .notDetermined:
                break
            default:
                self.completion()
            }
        } else {
            switch CBPeripheralManager.authorizationStatus() {
            case .notDetermined:
                break
            default:
                self.completion()
            }
        }
    }
}

#endif
