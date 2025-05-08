//
//  CompetitionView.swift
//  KickOff
//
//  Created by Mararanje, Nyaradzo on 12/1/24.
//

import SwiftUI

struct CompetitionView: View {
    
    @State private var competitions: [KickOffInfo] = [] // Holds fetched competitions
    @State private var isLoading = true                 // Tracks loading state
    
    
    var body: some View {
        NavigationView {
            if isLoading {
                ProgressView("Loading Competitions...")
            } else {
                List(competitions, id: \.id) { competition in
                    VStack(alignment: .leading) {
                        Text(competition.name)
                            .font(.headline)
                        Text("Area: \(competition.area.name)")
                        
                        if let season = competition.season {
                            Text("Season Start: \(season.startDate)")
                            Text("Season End: \(season.endDate)")
                        } else {
                            Text("Season information not available")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 5)
                }

                .navigationTitle("Competitions")
            }
        }
        .onAppear {
            fetchCompetitions()
        }
    }
    
    // Fetch competitions using the helper function
    private func fetchCompetitions() {
        Task {
            do {
                let helper = KickOffHelper()
                let data = try await helper.fetchCompetitions()
                DispatchQueue.main.async {
                    self.competitions = data
                    self.isLoading = false
                }
            } catch {
                print("Error fetching competitions: \(error)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }
    
}

#Preview {
    CompetitionView()
}
