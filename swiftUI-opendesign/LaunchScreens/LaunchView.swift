//
//  LaunchView.swift
//  swiftUIanimations
//
//  Created by Niles Boyes on 3/1/25.
//
import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack {
            LinearGradient.noisyPurpleTeal()
                .edgesIgnoringSafeArea(.all)

            VStack (spacing: 20){
                Image(systemName: "ev.plug.ac.gb.t.fill")
                    .resizable()
                    .rotationEffect(.degrees(180))
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.4) // 40% of screen width
                    .foregroundStyle(.white)
                
                Text("Noisy Gradient with simple Reactive Elements")
                    .font(.system(size: UIScreen.main.bounds.width * 0.05).bold()) // 5% of screen width
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    LaunchView()
        .preferredColorScheme(.dark)
}
