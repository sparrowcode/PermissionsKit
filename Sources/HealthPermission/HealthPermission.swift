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

#if os(iOS) && PERMISSIONSKIT_HEALTH
import Foundation
import HealthKit

public extension Permission {
    
    static var health: HealthPermission {
        return HealthPermission()
    }
}

public class HealthPermission: Permission {
    
    open override var kind: Permission.Kind { .health }
    
    open var readingUsageDescriptionKey: String? { "NSHealthUpdateUsageDescription" }
    open var writingUsageDescriptionKey: String? { "NSHealthShareUsageDescription" }
    
    public static func status(for type: HKObjectType) -> Permission.Status {
        switch HKHealthStore().authorizationStatus(for: type) {
        case .sharingAuthorized: return .authorized
        case .sharingDenied: return .denied
        case .notDetermined: return .notDetermined
        @unknown default: return .denied
        }
    }
    
    public static func request(forReading readingTypes: Set<HKObjectType>, writing writingTypes: Set<HKSampleType>, completion: @escaping (() -> Void)) {
        HKHealthStore().requestAuthorization(toShare: writingTypes, read: readingTypes) { _, _ in
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    public override var canBePresentWithCustomInterface: Bool { false }
    
    // MARK: - Locked
    
    @available(*, unavailable)
    open override var authorized: Bool { fatalError() }
    
    @available(*, unavailable)
    open override var denied: Bool { fatalError() }
    
    @available(*, unavailable)
    open override var notDetermined: Bool { fatalError() }
    
    @available(*, unavailable)
    public override var status: Permission.Status { fatalError() }
    
    @available(*, unavailable)
    open override func request(completion: @escaping ()->Void) { fatalError() }
}
#endif
