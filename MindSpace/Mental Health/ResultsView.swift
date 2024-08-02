import SwiftUI

struct ResultsView: View {
    let responses: [Int]
    let onRetake: () -> Void
    
    var body: some View {
        VStack {
            Text("Results")
                .font(.headline)
                .padding(.bottom, 20)
            
            Text(feedbackMessage())
                .padding()
            
         
          
        }
    }
    
    func feedbackMessage() -> String {
        let panicCount = responses.filter { $0 == 2 }.count
        let anxietyCount = responses.filter { $0 == 1 }.count
        
        if panicCount > 1 {
            return "You might be experiencing symptoms of a panic attack. Consider seeking professional help."
        } else if anxietyCount > 1 {
            return "You might be experiencing anxiety. It may be helpful to explore stress management techniques or consult a professional."
        } else {
            return "Your responses suggest that you are managing well, but if you experience any troubling symptoms, consider seeking support."
        }
    }
}




