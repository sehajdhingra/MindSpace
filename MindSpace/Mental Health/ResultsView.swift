import SwiftUI
import AVKit
struct ResultsView: View {
    let responses: [Int]
    let onRetake: () -> Void
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .frame(width: 430, height: 932)
                .opacity(0.3)
            
            VStack {
                Text("Results")
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hex: "573353"))
                    .font(.custom("Klasik Regular", size: 35))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20.0)
                
                Text(feedbackMessage())
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
    
    
    
    func feedbackMessage() -> String {
        let panicCount = responses.filter { $0 == 2 }.count
        let anxietyCount = responses.filter { $0 == 1 }.count
        
        if panicCount > 1 {
            return  """
    You might be experiencing symptoms of a panic attack. Consider seeking professional help. Take a quick breather and follow along these steps -\n
    4-7-8 Breathing Exercise\n
    1. Find a Comfortable Position:\nSit or lie down in a comfortable position. You can close your eyes if it helps you relax.\n
    2. Inhale:\nClose your mouth and inhale quietly through your nose for a count of 4.\n
    3. Hold Your Breath:\nHold your breath for a count of 7.\n
    4. Exhale:\nExhale completely through your mouth, making a whooshing sound, for a count of 8.\n
    5. Repeat:\nRepeat the cycle 3-4 times, or until you start feeling more relaxed.\n\n
    Steps Recap:\n
    1. Inhale through the nose for 4 seconds.\n
    2. Hold your breath for 7 seconds.\n
    3. Exhale through the mouth for 8 seconds.\n
    4. Repeat 3-4 times.
    """
            
        } else if anxietyCount > 1 {
            return """
    You might be experiencing anxiety. It may be helpful to explore stress management techniques or consult a professional. Follow along these steps to calm yourself down:\n
    Box Breathing technique\n
    1. Find a Comfortable Position:\nSit in a comfortable chair with your feet flat on the floor and your hands resting on your lap. You can close your eyes if you prefer.\n
    2. Inhale:\nInhale slowly and deeply through your nose for a count of 4.\n
    3. Hold:\nHold your breath for a count of 4.\n
    4. Exhale:\nExhale slowly through your mouth for a count of 4.\n
    5. Hold:\nHold your breath for a count of 4 before beginning the next inhale.\n
    6. Repeat:\nRepeat the cycle 4-5 times, or until you feel more relaxed.\n\n
    Steps Recap:\n
    1. Inhale through the nose for 4 seconds.\n
    2. Hold your breath for 4 seconds.\n
    3. Exhale through the mouth for 4 seconds.\n
    4. Hold your breath for 4 seconds.\n
    5. Repeat 4-5 times.
    """
        } else {
            return """
    Your responses suggest that you are managing well, but if you experience any troubling symptoms, consider seeking support. Anyways, here is a quick video for you to follow.\n
    5-5-5 Breathing Technique\n
    1. Find a Comfortable Position:\nSit or lie down comfortably. You can close your eyes if it helps you focus.\n
    2. Inhale:\nInhale slowly and deeply through your nose for a count of 5.\n
    3. Hold:\nHold your breath for a count of 5.\n
    4. Exhale:\nExhale completely and slowly through your mouth for a count of 5.\n
    5. Repeat:\nRepeat this process 3-4 times, or until you feel more at ease.\n\n
    Steps Recap:\n
    1. Inhale through the nose for 5 seconds.\n
    2. Hold your breath for 5 seconds.\n
    3. Exhale through the mouth for 5 seconds.\n
    4. Repeat 3-4 times.
    """
        }
    }
    
}


