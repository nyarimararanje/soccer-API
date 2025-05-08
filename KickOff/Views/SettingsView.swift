//
//  SettingsView.swift
//  KickOff
//
//  Created by Mararanje, Nyaradzo on 12/1/24.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("notificationsEnabled") private var notificationsEnabled = false
     @AppStorage("selectedTheme") private var selectedTheme = "Light"
     @AppStorage("language") private var selectedLanguage = "English"
    
    var body: some View {
        NavigationView {
              Form {
                  // Notifications Section
                  Section(header: Text("Notifications")) {
                      Toggle("Enable Notifications", isOn: $notificationsEnabled)
                  }

                  // Theme Section
                  Section(header: Text("Appearance")) {
                      Picker("Theme", selection: $selectedTheme) {
                          Text("Light").tag("Light")
                          Text("Dark").tag("Dark")
                          Text("System Default").tag("System")
                      }
                      .pickerStyle(SegmentedPickerStyle())
                  }

//                  // Language Section
//                  Section(header: Text("Language")) {
//                      Picker("Language", selection: $selectedLanguage) {
//                          Text("English").tag("English")
//                          Text("French").tag("French")
//                      }
//                  }

                  // Reset or Other Actions
                  Section {
                      Button(action: resetSettings) {
                          Text("Reset Settings")
                              .foregroundColor(.red)
                      }
                  }
              }
              .navigationTitle("Settings")
              .navigationBarTitleDisplayMode(.inline)
          }
    }

// Reset Settings Action
   private func resetSettings() {
       notificationsEnabled = false
       selectedTheme = "Light"
       selectedLanguage = "English"
   }
}

#Preview {
    SettingsView()
}
