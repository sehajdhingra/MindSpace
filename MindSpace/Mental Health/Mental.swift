//
//  MentalHealth.swift
//  MindSpaceProject
//
//  Created by Umang Dhingra on 8/1/24.
//

import SwiftUI

struct Mental: View {
    var body: some View {VStack {
        Text("Hi, How are you feeling today? Let us know your mood right now by take the quiz below.")
        NavigationLink(destination: MentalHealthScreen()) {
            Text("Take the Quiz")
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.top, 10)
        }
    }
        
    }
}
    #Preview {
        Mental()
    }


