//
//  ContentView.swift
//  KickOff
//
//  Created by Mararanje, Nyaradzo on 12/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                
                // Players Tab
                PlayerView(teamId: 64) // Replace 64 with dynamic team ID if needed
                    .tabItem {
                        Label(TabType.players.title, systemImage: TabType.players.image)
                    }
                    .tag(TabType.players)
                
                // Competitions Tab
                CompetitionView()
                    .tabItem {
                        Label(TabType.teams.title, systemImage: TabType.teams.image)
                    }
                    .tag(TabType.teams)

                // Settings Tab
                SettingsView()
                    .tabItem {
                        Label(TabType.settings.title, systemImage: TabType.settings.image)
                    }
                    .tag(TabType.settings)
                // AppInfo Tab
               AppInfoView()
                    .tabItem {
                        Label(TabType.appInfo.title, systemImage: TabType.appInfo.image)
                    }
                    .tag(TabType.appInfo)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Add functionality for refresh or navigation
                    }, label: {
                        Image(systemName: "arrow.clockwise")
                    })
                }
            }
            .navigationBarTitle("KICKOFF")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    ContentView()
}
