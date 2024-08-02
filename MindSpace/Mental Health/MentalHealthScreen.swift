import SwiftUI

struct MentalHealthScreen: View {
    @State private var currentQuestionIndex = 0
    @State private var responses: [Int] = []
    @State private var showResults = false
    
    let questions: [SurveyQuestion] = [
        SurveyQuestion(text: "How have you been sleeping lately?",
                       options: ["I sleep well through the night and wake up feeling rested.",
                                 "I have trouble falling or staying asleep and often wake up feeling tired.",
                                 "I have sudden, intense awakenings in the middle of the night feeling panicked."]),
        SurveyQuestion(text: "Have you noticed any changes in your appetite or eating habits?",
                       options: ["My appetite and eating habits have been normal.",
                                 "I have been eating more or less than usual and not feeling hungry or overly hungry.",
                                 "I lose my appetite completely during intense, sudden episodes of fear."]),
        SurveyQuestion(text: "How do you feel about your ability to manage daily tasks and responsibilities?",
                       options: ["I feel capable and on top of my tasks and responsibilities.",
                                 "I sometimes struggle to manage my tasks and feel overwhelmed.",
                                 "I feel completely unable to manage tasks due to sudden overwhelming fear or terror."]),
        SurveyQuestion(text: "How often do you feel tense, nervous, or on edge throughout the day?",
                       options: ["Rarely, I generally feel calm and relaxed.",
                                 "Occasionally, I feel tense or nervous but can manage it.",
                                 "Frequently, I feel sudden, intense fear that peaks within minutes."])
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                if !showResults {
                    if currentQuestionIndex < questions.count {
                        QuestionView(question: questions[currentQuestionIndex],
                                     onOptionSelected: { index in
                                        responses.append(index)
                                        currentQuestionIndex += 1
                                        if currentQuestionIndex == questions.count {
                                            showResults = true
                                        }
                                     })
                    }
                } else {
                    ResultsView(responses: responses, onRetake: {
                        responses = []
                        currentQuestionIndex = 0
                        showResults = false
                    })
                }
            }
            .padding()
        }
    }
}

struct MentalHealthScreen_Previews: PreviewProvider {
    static var previews: some View {
        MentalHealthScreen()
    }
}


