import SwiftUI

extension LinearGradient {
    static func noisyPurpleTeal(
        startPoint: UnitPoint = .topLeading, // Default settings but can be changed
        endPoint: UnitPoint = .bottomTrailing, // Default settings but can be changed
        noiseOpacity: Double = 0.2 // sets the level of noise, defaults to 0.1
    ) -> some View { // returns a view with the noised gradient already made
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
        .withNoise(opacity: noiseOpacity) // called from NoiseGenerator extension
    }
}
