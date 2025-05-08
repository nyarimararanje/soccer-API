//
//  KickOffHelper.swift
//  KickOff
//
//  Created by Mararanje, Nyaradzo on 12/1/24.
//

import Foundation

class KickOffHelper: ObservableObject {
    private let baseUrl = "https://api.football-data.org/v4/"
    private let apiKey = Keys.apiKey // Replace with your actual API key
    
    // Constructs the URL for the API request
    private func constructUrl(endpoint: String, parameters: [String: String]? = nil) -> URL? {
        guard var components = URLComponents(string: baseUrl + endpoint) else { return nil }
        
        if let parameters = parameters {
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        return components.url
    }
    
    func fetchCompetitions() async throws -> [KickOffInfo] {
        guard let url = constructUrl(endpoint: "competitions") else {
            print("Error: Bad URL")
            throw URLError(.badURL)
        }
        
        print("Fetching competitions from URL: \(url.absoluteString)")
        
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Auth-Token")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Response status code: \(httpResponse.statusCode)")
                if httpResponse.statusCode != 200 {
                    throw URLError(.badServerResponse)
                }
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase // Convert snake_case keys automatically
            do {
                let competitionsResponse = try decoder.decode(CompetitionsResponse.self, from: data)
                print("Successfully fetched competitions: \(competitionsResponse.competitions.count) items")
                return competitionsResponse.competitions
            } catch {
                print("Error decoding competitions: \(error)")
                throw error
            }
        } catch {
            print("Error fetching competitions: \(error)")
            throw error
        }
    }


    // Create a struct for decoding the competitions response
    struct CompetitionsResponse: Codable {
        let competitions: [KickOffInfo]
    }

    // Fetch Players for a Team
    // Updated method to correctly parse the players data
    func fetchPlayers(teamId: Int) async throws -> [Player] {
        guard let url = constructUrl(endpoint: "teams/\(teamId)") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Auth-Token")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        do {
            let teamResponse = try decoder.decode(TeamResponse.self, from: data)
            return teamResponse.squad
        } catch {
            print("Error decoding players: \(error)")
            throw error
        }
    }

    // Create a struct for decoding the team response
    struct TeamResponse: Codable {
        let squad: [Player]
    }

}

