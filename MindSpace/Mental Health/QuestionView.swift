//
//  QuestionView.swift
//  Mental health Screen
//
//  Created by Umang Dhingra on 8/1/24.
//
import SwiftUI

struct QuestionView: View {
    let question: SurveyQuestion
    let onOptionSelected: (Int) -> Void
    
    var body: some View {
        ZStack {
            Image("bg 3")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .offset(y: 150)
            VStack {
                Text(question.text)
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hex: "573353"))
                    .font(.custom("Klasik Regular", size: 25))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20.0)
                
                ForEach(0..<question.options.count, id: \.self) { index in
                    Button(action: {
                        onOptionSelected(index)
                    }) {
                        Text(question.options[index])
                            .frame(width: 300)
                            .padding()
                            .background(Color(hex: "FDA758"))
                            .cornerRadius(8)
                            .padding(.bottom, 10)
                            .foregroundColor(Color(hex: "573353"))
                            .font(.custom("Klasik Regular", size: 15))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20.0)
                    }
                }
            }
            .padding()
        }
        .background(Color(hex: "FFF2E9"))
        .edgesIgnoringSafeArea(.all)
    }
}
