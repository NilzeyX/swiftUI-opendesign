import SwiftUI

struct AuthenticationView: View {
    // Track elapsed time for the shader animation
    // @State is a property wrapper that allows SwiftUI to track and manage state changes
    @State private var startTime = Date()

    var body: some View {
        // ZStack allows us to layer views on top of each other
        ZStack {
            // TimelineView is a special view that updates its contents with each animation frame
            TimelineView(.animation) { timeline in
                // Create a full-screen rectangle that will serve as our animated background
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea() // Make it extend into the safe area
                    // Apply a custom shader effect to create the wave animation
                    .colorEffect(
                        ShaderLibrary.sinewave(
                            // Pass the screen dimensions as a float2 (vector with 2 components)
                            .float2(UIScreen.main.bounds.size),
                            // Pass the elapsed time since startTime for animation
                            .float(timeline.date.timeIntervalSince(startTime))
                        )
                    )
            }

            // VStack arranges its children vertically
            VStack {
                // Main title text
                Text("Authentication")
                    .font(.largeTitle) // Use large title font size
                    .foregroundColor(.white) // Set text color to white
                    .shadow(radius: 5) // Add a subtle shadow for better visibility
            }
        }
        // This modifier is called when the view appears on screen
        .onAppear {
            // Reset the start time to ensure smooth animation when view reappears
            startTime = Date()
        }
    }
}

// Preview provider for SwiftUI canvas
// This allows us to see the view in Xcode's preview canvas
#Preview {
    AuthenticationView()
}
