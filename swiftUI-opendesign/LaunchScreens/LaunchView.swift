//
//  LaunchView.swift
//  swiftUIanimations
//
//  Created by Niles Boyes on 3/1/25.
//
import SwiftUI

struct LaunchView: View {
    // @ObservedObject connects to a ViewModel that manages the view's state
    @ObservedObject private var viewModel = LaunchViewModel()

    var body: some View {
        // ZStack allows layering of views
        ZStack {
            // Create a custom gradient background that covers the entire screen
            LinearGradient.noisyPurpleTeal()
                .edgesIgnoringSafeArea(.all) // Extend into safe areas

            // VStack arranges child views vertically with spacing between them
            VStack(spacing: 20) {
                // System image from SF Symbols
                Image(systemName: "circles.hexagonpath.fill")
                    .resizable() // Make image resizable
                    .scaledToFit() // Maintain aspect ratio
                    .frame(width: UIScreen.main.bounds.width * 0.3) // Set width to 30% of screen
                    .foregroundStyle(.white) // White color
                    .shadow(radius: 2) // Add subtle shadow
                    // Rotate the image when loading
                    .rotationEffect(.degrees(viewModel.isLoading ? 360 : 0))
                    // Add continuous rotation animation
                    .animation(
                        .linear(duration: 2)
                            .repeatForever(autoreverses: false),
                        value: viewModel.isLoading
                    )
                    // Start loading when the view appears
                    .onAppear { viewModel.startLoading() }

                // Title text
                Text("Noisy Gradient with simple Reactive Elements")
                    .font(.system(size: UIScreen.main.bounds.width * 0.05).bold()) // 5% of screen width
                    .foregroundStyle(.white) // White text color
                    .multilineTextAlignment(.center) // Center text alignment
                    .shadow(radius: 5, x: 0, y: 1) // Add shadow for depth
            }
        }
    }
}

#Preview {
    LaunchView()
        .preferredColorScheme(.dark) // Force dark mode for preview
}
