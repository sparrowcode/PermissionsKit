import SwiftUI

import PermissionsKit
import CameraPermission
import PhotoLibraryPermission
import NotificationPermission
import MicrophonePermission
import CalendarPermission
import ContactsPermission
import RemindersPermission
import SpeechRecognizerPermission
import LocationWhenInUsePermission
import LocationAlwaysPermission
import MotionPermission
import MediaLibraryPermission
import BluetoothPermission
import TrackingPermission

struct ContentView: View {
    
    @State private var showingPermisionsController = false
    
    var body: some View {
        Button("Show Request") {
            self.showingPermisionsController = true
        }
        .padding()
        .sheet(isPresented: $showingPermisionsController) {
            PermissionsList(permissions: [.camera, .contacts])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
