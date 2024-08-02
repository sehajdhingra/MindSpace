//
//  MentalHealth.swift
//  MindSpaceProject
//
//  Created by Umang Dhingra on 8/1/24.
//

import SwiftUI

struct Mental: View {
    var body: some View {
        ZStack {
            Image("bg 3")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .offset(y: -30)
            VStack {
                Image("campfire")
                Text("Hi, How are you feeling today? Let us know your mood right now by take the quiz below.")
                    .foregroundColor(Color(hex: "573353"))
                    .font(.custom("Klasik Regular", size: 20))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20.0)
                
                NavigationLink(destination: MentalHealthScreen()) {
                    Text("Get Started")
                        .padding()
                        .background(Color(hex: "FDA758"))
                        .foregroundColor(Color(hex: "573353"))
                        .font(.custom("Klasik Regular", size: 18))
                        .cornerRadius(8)
                        .padding(.top, 10)
                }
            } //.offset(y: 200)
            
        }
    }
}

    #Preview {
        Mental()
    }

