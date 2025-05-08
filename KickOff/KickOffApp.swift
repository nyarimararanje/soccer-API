//
//  KickOffApp.swift
//  KickOff
//
//  Created by Mararanje, Nyaradzo on 12/1/24.
//

import SwiftUI

@main
struct KickOffApp: App {
    
    @AppStorage("selectedTheme") private var selectedTheme = "Light"
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(
                    selectedTheme == "Light" ? .light :
                        selectedTheme == "Dark" ? .dark: nil
                )
        }
    }
}
