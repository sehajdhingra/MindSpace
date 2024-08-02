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
        VStack {
            Text(question.text)
                .font(.headline)
                .padding(.bottom, 20)
            
            ForEach(0..<question.options.count, id: \.self) { index in
                Button(action: {
                    onOptionSelected(index)
                }) {
                    Text(question.options[index])
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.bottom, 10)
                }
            }
        }
    }
}


