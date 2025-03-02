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

    static func liquidMetalBlue(
        startPoint _: UnitPoint = .topLeading,
        endPoint _: UnitPoint = .bottomTrailing,
        noiseOpacity: Double = 0.15
    ) -> some View {
        TimelineView(.animation) { timeline in
            let now = timeline.date.timeIntervalSinceReferenceDate
            let angle = Angle.degrees(now.remainder(dividingBy: 10) * 36)
            let xOffset = cos(angle.radians)
            let yOffset = sin(angle.radians)

            LinearGradient(
                stops: [
                    .init(color: Color(red: 0.1, green: 0.3, blue: 0.5), location: 0.0), // Deep metallic blue
                    .init(color: Color(red: 0.4, green: 0.6, blue: 0.8), location: 0.3), // Medium steel blue
                    .init(color: Color(red: 0.7, green: 0.8, blue: 0.9), location: 0.6), // Light metallic blue
                    .init(color: Color(red: 0.2, green: 0.4, blue: 0.6), location: 1.0), // Steel blue
                ],
                startPoint: UnitPoint(x: xOffset * 0.2 + 0.5, y: yOffset * 0.2 + 0.5),
                endPoint: UnitPoint(x: -xOffset * 0.2 + 0.5, y: -yOffset * 0.2 + 0.5)
            )
            .overlay(
                LinearGradient(
                    stops: [
                        .init(color: .white.opacity(0.2), location: 0.0),
                        .init(color: .clear, location: 0.5),
                        .init(color: .white.opacity(0.2), location: 1.0),
                    ],
                    startPoint: UnitPoint(x: xOffset * 0.5 + 0.5, y: yOffset * 0.5 + 0.5),
                    endPoint: UnitPoint(x: -xOffset * 0.5 + 0.5, y: -yOffset * 0.5 + 0.5)
                )
            )
        }
    }
}
