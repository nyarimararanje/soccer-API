//
//  KickOffInfo.swift
//  KickOff
//
//  Created by Mararanje, Nyaradzo on 12/1/24.
//

import Foundation

//struct KickOffInfo: Codable {
//    let id: Int
//    let name: String
//    let area: Area
//    let season: Season
//    
//    struct Area: Codable{
//        let name: String
//    }
//    
//    struct Season: Codable {
//        let startDate: String
//        let endDate: String
//        let currentMatchday: Int?
//    }
//}

struct KickOffInfo: Codable {
    let id: Int
    let name: String
    let area: Area
    let season: Season? // Mark as optional
    
    struct Area: Codable {
        let name: String
    }
    
    struct Season: Codable {
        let startDate: String
        let endDate: String
        let currentMatchday: Int?
    }
}


struct Player: Codable {
    let id: Int
    let name: String
    let position: String?
    let dateOfBirth: String
    let nationality: String
    let shirtNumber: Int?
}
