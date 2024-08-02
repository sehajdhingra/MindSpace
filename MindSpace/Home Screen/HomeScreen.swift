//
//  HomeScreen.swift
//  FinalProject
//
//  Created by SriSai on 7/30/24.
//
import SwiftUI
struct HomeScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    // Title
                    Text("Welcome to MindSpace")
                        .fontWeight(.bold)
                        .font(.custom("Klasik Regular", size: 40))
                        .foregroundColor(Color(hex: "573353"))
                        .multilineTextAlignment(.center)
                        .padding(.top, 100)
                        .offset(y: 30)
                    
                    Spacer()
                    
                    // Buttons
                    HStack(spacing: 20) {
                        // Journal Button
                        NavigationLink(destination: Journal()) {
                            Text("Journal")
                                .fontWeight(.bold)
                                .frame(width: 160, height: 45)
                                .background(Color(hex: "FDA758"))
                                .foregroundColor(Color(hex: "573353"))
                                .cornerRadius(5)
                        }
                        
                        // Tasks Button
                        NavigationLink(destination: Tasks()) {
                            Text("Tasks")
                                .fontWeight(.bold)
                                .frame(width: 160, height: 45)
                                .background(Color(hex: "FDA758"))
                                .cornerRadius(5)
                                .foregroundColor(Color(hex: "573353"))
                        }
                    }
                    .offset(y: 200)
                    Spacer()
                }
                .padding()
            }
        }
    }
}
// Allows the usage of hex codes, this subroutine is not mine.
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        var rgb: UInt64 = 0
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            Scanner(string: hexColor).scanHexInt64(&rgb)
        } else {
            Scanner(string: hex).scanHexInt64(&rgb)
        }
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
#Preview {
    HomeScreen()
}
