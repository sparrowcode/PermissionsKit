import SwiftUI

import SPPermissions
import SPPermissionsCamera
import SPPermissionsPhotoLibrary
import SPPermissionsNotification
import SPPermissionsMicrophone
import SPPermissionsCalendar
import SPPermissionsContacts
import SPPermissionsReminders
import SPPermissionsSpeechRecognizer
import SPPermissionsLocationWhenInUse
import SPPermissionsLocationAlways
import SPPermissionsMotion
import SPPermissionsMediaLibrary
import SPPermissionsBluetooth
import SPPermissionsTracking

struct ContentView: View {
    
    @State private var showingPermisionsController = false
    
    var body: some View {
        Button("Show Request") {
            self.showingPermisionsController = true
        }
        .padding()
        .sheet(isPresented: $showingPermisionsController) {
            SPPermissionsList(permissions: [.camera, .contacts])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
