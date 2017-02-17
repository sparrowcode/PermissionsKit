// The MIT License (MIT)
// Copyright © 2017 Ivan Vorobei (hello@ivanvorobei.by)
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

import Foundation

public enum SPRequestPermissionType {
    case Camera
    case PhotoLibrary
    case Notification
}

class SPPermissionsManagerBase: SPPermissionManagerInterface {
    
    func isAuthorizedPermission(_ permission: SPRequestPermissionType) -> Bool {
        let manager = self.getManagerForPermission(permission)
        return manager.isAuthorized()
    }
    
    func requestPermission(_ permission: SPRequestPermissionType, withComlectionHandler complectionHandler: @escaping ()->()) {
        let manager = self.getManagerForPermission(permission)
        manager.request(withComlectionHandler: {
            complectionHandler()
        })
    }

    private func getManagerForPermission(_ permission: SPRequestPermissionType) -> SPPermissionInterface {
        switch permission {
        case .Camera:
            return SPCameraPermission()
        case .PhotoLibrary:
            return SPPhotoLibraryPermission()
        case .Notification:
            return SPNotificationPermission()
        }
    }
}

protocol SPPermissionInterface {
    
    func isAuthorized() -> Bool
    
    func request(withComlectionHandler complectionHandler: @escaping ()->()?)
}

