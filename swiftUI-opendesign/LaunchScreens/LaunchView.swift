//
//  LaunchView.swift
//  swiftUIanimations
//
//  Created by Niles Boyes on 3/1/25.
//
import SwiftUI

struct LaunchView: View {
    @ObservedObject private var viewModel = LaunchViewModel()

    var body: some View {
        ZStack {
            LinearGradient.noisyPurpleTeal()
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                Image(systemName: "circles.hexagonpath.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.3) // 30% of screen width
                    .foregroundStyle(.white)
                    .shadow(radius: 2, x: 0, y: 0)
                    .rotationEffect(.degrees(viewModel.isLoading ? 360 : 0))
                    .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: viewModel.isLoading)
                    .onAppear { viewModel.startLoading() }

                Text("Noisy Gradient with simple Reactive Elements")
                    .font(.system(size: UIScreen.main.bounds.width * 0.05).bold()) // 5% of screen width
                    .multilineTextAlignment(.center)
                    .shadow(radius: 5, x: 0, y: 1)
            }
        }
    }
}

#Preview {
    LaunchView()
        .preferredColorScheme(.dark)
}
