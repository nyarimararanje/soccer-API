//
//  AppInfoView.swift
//  KickOff
//
//  Created by Mararanje, Nyaradzo on 12/2/24.
//

import SwiftUI

struct AppInfoView: View {
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.yellow.opacity(0.6)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                // App Icon
                if let appIcon = UIImage(named: "AppIcon") {
                    Image(uiImage: appIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
                // App Name
                Text(Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? "App Name")
                    .font(.title)
                    .fontWeight(.bold)
                
                // Version and Build Number
                Text("Version \(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "1.0") (\(Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "1"))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                // Copyright
                Text("© \(Calendar.current.component(.year, from: Date())) Nyaradzo Mararanje")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding()
            .navigationTitle("App Info")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AppInfoView()
}
