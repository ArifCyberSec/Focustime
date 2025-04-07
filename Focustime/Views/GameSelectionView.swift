//
//  GameSelectionView.swift
//  Focustime
//
//  Created by Ahmad Arif on 04.04.25.
//

import Foundation

import SwiftUI

struct GameSelectionView: View {
    @Environment(\.dismiss) var dismiss
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
                
                Button(action: {
                                    dismiss()
                                }) {
                                    Text("⬅️ Zurück")
                                        .font(.title3)
                                        .padding()
                                        .frame(width: 150)
                                        .background(Color.white.opacity(0.2))
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 3)
                                }
                                .padding(.top, 50)
            }
        }
    }
}

#Preview {
    GameSelectionView()
}
