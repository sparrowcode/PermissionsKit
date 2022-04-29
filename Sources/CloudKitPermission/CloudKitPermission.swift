//
//  CloudKitPermission.swift
//  
//
//  Created by Mohammad Yasir on 29/04/22.
//

import Foundation
import CloudKit


public class CloudKitPermission: Permission {
    
    override init() {
        super.init()
        self.getStatus()
    }
    
    open override var kind: Permission.Kind { .cloudKit }
    
    public override var status: Permission.Status {
        switch cloudStatus {
        case .couldNotDetermine:
            return .notDetermined
        case .available:
            return .authorized
        case .restricted:
            return .denied
        case .noAccount:
            return .denied
        case .temporarilyUnavailable:
            return .denied
        @unknown default: return .denied
            
        }
    }
    
    private var cloudStatus: CKAccountStatus = .couldNotDetermine
    
    private func getStatus() -> Void {
        let container = CKContainer.default()
        
        container.accountStatus() { accountStatus, error in
            self.cloudStatus = accountStatus
        }
    }

}
