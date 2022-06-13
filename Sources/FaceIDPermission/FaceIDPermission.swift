// The MIT License (MIT)
// Copyright © 2022 Sparrow Code LTD (https://sparrowcode.io, hello@sparrowcode.io)
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

#if PERMISSIONSKIT_SPM
import PermissionsKit
#endif

#if os(iOS) && PERMISSIONSKIT_FACEID
import Foundation
import LocalAuthentication

public extension Permission {
    
    static var faceID: FaceIDPermission {
        return FaceIDPermission()
    }
}

public class FaceIDPermission: Permission {
    
    open override var kind: Permission.Kind { .faceID }
    open var usageDescriptionKey: String? { "NSFaceIDUsageDescription" }
    
    public override var status: Permission.Status {
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
