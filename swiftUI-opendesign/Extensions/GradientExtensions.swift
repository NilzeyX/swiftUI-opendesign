import SwiftUI

extension LinearGradient {
    /// Creates a gradient resembling a smooth transition from purple to white to teal with a noise overlay
    /// - Parameters:
    ///   - startPoint: The start point of the gradient, defaults to .topLeading
    ///   - endPoint: The end point of the gradient, defaults to .bottomTrailing
    ///   - noiseOpacity: The opacity of the noise overlay, defaults to 0.1
    /// - Returns: A View containing the gradient with a noise overlay
    static func noisyPurpleTeal(
        startPoint: UnitPoint = .topLeading,
        endPoint: UnitPoint = .bottomTrailing,
        noiseOpacity: Double = 0.2
    ) -> some View {
        LinearGradient(
            stops: [
                .init(color: Color(red: 1.0, green: 1.0, blue: 1.0), location: 0.0), // White
                .init(color: Color(red: 0.7, green: 0.5, blue: 0.8), location: 0.4), // Light purple
                .init(color: Color(red: 0.8, green: 0.5, blue: 0.9), location: 0.5), // Light purple
                .init(color: Color(red: 0.2, green: 0.5, blue: 0.5), location: 1.0), // Deep teal
            ],
            startPoint: startPoint,
            endPoint: endPoint
        )
        .withNoise(opacity: noiseOpacity)
    }
}
