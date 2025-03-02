//
//  authenticationView.swift
//  swiftUI-opendesign
//
//  Created by Niles Boyes on 3/1/25.
//
import SwiftUI

struct authenticationView: View {
    var body: some View {
        ZStack {
            LinearGradient.liquidMetalBlue()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    authenticationView()
        .preferredColorScheme(.dark)
}
