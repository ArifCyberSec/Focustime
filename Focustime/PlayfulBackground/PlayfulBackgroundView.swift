//
//  PlayfulBackgroundView.swift
//  Focustime
//
//  Created by Ahmad Arif on 06.04.25.
//

import Foundation
import SwiftUI

struct PlayfulBackgroundView: View {
    var body: some View {
        ZStack {
            // Hintergrund-Farbverlauf
            LinearGradient(gradient: Gradient(colors: [.cyan.opacity(0.7), .blue.opacity(0.9)]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()

            
            AnimatedAnimalView(animationName: "bird")
                .frame(width: 120, height: 120)
                .offset(x: -130, y: -250)

            // Animierter Löwe rechts unten
            AnimatedAnimalView(animationName: "lion")
                .frame(width: 140, height: 140)
                .offset(x: 100, y: 200)
            
            // GreenBird – oben rechts
            AnimatedAnimalView(animationName: "greenbird")
                .frame(width: 100, height: 100)
                .offset(x: 130, y: -300) // nach oben rechts

            
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 180, height: 100)
                .foregroundColor(.white.opacity(0.3))
                .offset(x: 150, y: -200)

            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 140, height: 80)
                .foregroundColor(.white.opacity(0.2))
                .offset(x: -180, y: -120)
        }
    }
}

#Preview {
    PlayfulBackgroundView()
}
