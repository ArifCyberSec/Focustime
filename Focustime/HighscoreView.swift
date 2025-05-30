//
//  HighscoreView.swift
//  Focustime
//
//  Created by Ahmad Arif on 17.04.25.
//

import Foundation
import SwiftUI

struct HighscoreView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("🏆 Highscores")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)

                NavigationLink(destination: FilteredHighscoreView(gameName: "Memory")) {
                    highscoreButton(label: "🧠 Memory")
                }
   
                NavigationLink(destination: FilteredHighscoreView(gameName: "Reaktion")) {
                    highscoreButton(label: "⚡ Reaktion")
                }

                NavigationLink(destination: FilteredHighscoreView(gameName: "Zahlenmuster")) {
                    highscoreButton(label: "🔢 Zahlenmuster")
                }

                Spacer()
            }
            .padding()
        }
    }

    func highscoreButton(label: String) -> some View {
        Text(label)
            .font(.title2)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding(.horizontal)
    }
}
