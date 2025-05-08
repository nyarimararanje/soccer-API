//
//  PlayerView.swift
//  KickOff
//
//  Created by Mararanje, Nyaradzo on 12/1/24.
//

import SwiftUI

struct PlayerView: View {
    
    let teamId: Int                                     // ID of the selected team
    @State private var players: [Player] = []           // Holds fetched players
    @State private var filteredPlayers: [Player] = []   // Holds filtered players for search
    @State private var isLoading = true                 // Tracks loading state
    @State private var searchText: String = ""          // Tracks the search text
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                SearchBar(text: $searchText)
                    .padding(.top)
                
                if isLoading {
                    ProgressView("Loading Players...")
                        .padding(.top)
                } else {
                    // Show filtered list of players
                    if filteredPlayers.isEmpty {
                        Text("No players found matching '\(searchText)'")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        List(filteredPlayers, id: \.name) { player in
                            NavigationLink(destination: PlayerDetailView(player: player)) {
                                Text(player.name) // Only show the player name here
                                    .font(.headline)
                                    .padding(.vertical, 5)
                                // .padding(.vertical, 5)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Players")
            .onAppear {
                fetchPlayers()
            }
            .onChange(of: searchText) { _ in
                filterPlayers()
            }
        }
    }
    
    // Fetch players using the helper function
    private func fetchPlayers() {
        Task {
            do {
                let helper = KickOffHelper()
                let defaultTeamId = 64
                let data = try await helper.fetchPlayers(teamId: defaultTeamId)
                DispatchQueue.main.async {
                    self.players = data
                    self.filteredPlayers = data
                    self.isLoading = false
                }
            } catch {
                print("Error fetching players: \(error)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }
    
    // Filter players based on the search query
    private func filterPlayers() {
        if searchText.isEmpty {
            filteredPlayers = players
        } else {
            filteredPlayers = players.filter { player in
                player.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

// Custom Search Bar View
struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search for a player", text: $text)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(7)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}


//#Preview {
//    PlayerView()
//}
