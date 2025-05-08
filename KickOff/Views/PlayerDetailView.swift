////
////  PlayerDetailView.swift
////  KickOff
////
////  Created by Mararanje, Nyaradzo on 12/4/24.
////
//
import SwiftUI
//
//// Detail View for Player
//struct PlayerDetailView: View {
//    let player: Player
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            Text(player.name)
//                .font(.largeTitle)
//                .fontDesign(.serif)
//                .fontWeight(.bold)
//                .foregroundColor(.accentColor)
//            
//            Text("Position: \(String(describing: player.position))")
//                .font(.title2)
//                .foregroundColor(.colorSet)
//            
//            Text("Nationality: \(player.nationality)")
//                .font(.title2)
//                .foregroundColor(.colorSet)
//            
//            Text("Date of birth: \(player.dateOfBirth)")
//                .font(.title2)
//            
//            if let shirtNumber = player.shirtNumber {
//                Text("Shirt Number: \(shirtNumber)")
//                    .font(.title2)
//                    .foregroundColor(.colorSet)
//            }
//        }
//        .padding()
//        .navigationTitle("Player Details")
//    }
//}

struct PlayerDetailView: View {
    let player: Player
    @State private var isFavorite =  false
    
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.yellow.opacity(0.6)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                // Player Card
                VStack(spacing: 16) {
                    Text(player.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.center)
                        .fontDesign(.serif)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(.white)
                            Text("Position: \(String(describing: player.position))")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        HStack {
                            Image(systemName: "flag.fill")
                                .foregroundColor(.white)
                            Text("Nationality: \(player.nationality)")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(.white)
                            Text("Date of Birth: \(player.dateOfBirth)")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        if let shirtNumber = player.shirtNumber {
                            HStack {
                                Image(systemName: "number.circle.fill")
                                    .foregroundColor(.white)
                                Text("Shirt Number: \(shirtNumber)")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            
                        }
                    }
                }
                .padding()
                .background(Color.black.opacity(0.6))
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                
                //VStack for showing if its a favorite player or not
                VStack {
                    Button(action: {
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .animation(.easeInOut, value: isFavorite)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Player Details")
    }
}
