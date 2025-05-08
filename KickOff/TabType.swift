//
//  TabType.swift
//  KickOff
//
//  Created by Mararanje, Nyaradzo on 12/1/24.
//

import Foundation
import SwiftUI

enum TabType: Int, CaseIterable {
    case teams, players, settings, appInfo
        
        var title: String {
            switch self {
            case .teams: return "Competitions"
            case .players: return "Players"
            case .settings: return "Settings"
            case .appInfo: return "App Info"
            }
        }
        
    
    var image: String {
        switch self {
        case .teams: "house"
        case .players: "person.2.fill"
        case .settings: "gearshape.fill"
        case .appInfo: "house"
        }
    }
}
