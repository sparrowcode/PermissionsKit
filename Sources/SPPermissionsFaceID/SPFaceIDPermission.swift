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

#if os(iOS) && SPPERMISSIONS_FACEID

import Foundation
import LocalAuthentication

public extension SPPermissions.Permission {

    static var faceID: SPFaceIDPermission {
        return SPFaceIDPermission()
    }
}

public class SPFaceIDPermission: SPPermissions.Permission {
    
    open override var type: SPPermissions.PermissionType { .faceID }
    open var usageDescriptionKey: String? { "NSFaceIDUsageDescription" }
    
    public override var status: SPPermissions.PermissionStatus {
        let context = LAContext()

        var error: NSError?
        let isReady = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        
        guard context.biometryType == .faceID else {
            return .notSupported
        }
        
        switch error?.code {
            case nil where isReady:
                return .notDetermined
            case LAError.biometryNotAvailable.rawValue:
                return .denied
            case LAError.biometryNotEnrolled.rawValue:
                return .notSupported
            default:
                return .notSupported
        }
    }
    
    public override func request(completion: @escaping () -> Void) {
        LAContext().evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: " ") { _, _ in
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}

#endif
