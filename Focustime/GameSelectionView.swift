//
//  GameSelectionView.swift
//  Focustime
//
//  Created by Ahmad Arif on 04.04.25.
//

import Foundation

import SwiftUI

struct GameSelectionView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.indigo.opacity(0.8), .blue.opacity(0.6)]),
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Text("Wähle ein Spiel")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                NavigationLink(destination: MemoryGameView()) {
                    Text("🧠 Memory")
                        .font(.title2)
                        .frame(width: 220, height: 50)
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }

                NavigationLink(destination: ReactionGameView()) {
                    Text("⚡ Reaktion")
                        .font(.title2)
                        .frame(width: 220, height: 50)
                        .background(Color.white)
                        .foregroundColor(.purple)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }

                NavigationLink(destination: PatternGameView()) {
                    Text("🔍 Muster")
                        .font(.title2)
                        .frame(width: 220, height: 50)
                        .background(Color.white)
                        .foregroundColor(.orange)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
            }
        }
    }
}

#Preview {
    GameSelectionView()
}
