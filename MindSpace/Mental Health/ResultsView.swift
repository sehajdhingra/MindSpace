import SwiftUI
import AVKit
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
            return  "You might be experiencing symptoms of a panic attack. Consider seeking professional help. Take a quick breather and follow along this video"
            
        } else if anxietyCount > 1 {
            return "You might be experiencing anxiety. It may be helpful to explore stress management techniques or consult a professional. Follow along these steps to calm yourself down"
        } else {
            return "Your responses suggest that you are managing well, but if you experience any troubling symptoms, consider seeking support. Anyways here is a quick video for you to follow."
        }
    }
    func videoForResult() -> String {
        let panicCount = responses.filter { $0 == 2 }.count
        let anxietyCount = responses.filter { $0 == 1 }.count
        
        if panicCount > 1 {
            return "PanickAttackVid"
        } else if anxietyCount > 1 {
            return "anxiety_video"
        } else {
            return "normal_video"
        }
        
    }
    
}


