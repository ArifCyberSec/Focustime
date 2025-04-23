//
//  HighscoreView.swift
//  Focustime
//
//  Created by Ahmad Arif on 17.04.25.
//

import Foundation
import SwiftUI

struct HighscoreView: View {
    @ObservedObject var highscoreManager = HighscoreManager()

    var body: some View {
        VStack(spacing: 10) {
            Text("🏆 Highscores")
                .font(.largeTitle)
                .bold()
                .padding(.top)

            if highscoreManager.scores.isEmpty {
                Text("Noch keine Highscores gespeichert.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List(highscoreManager.scores.sorted(by: { $0.date > $1.date })) { entry in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("🕹️ \(entry.gameName)")
                            .font(.headline)
                        Text("📈 Punkte: \(entry.score)")
                        if let time = entry.timeInSeconds {
                            Text("⏱️ Zeit: \(String(format: "%.1f", time))s")
                        }
                        Text("📅 \(entry.date.formatted(date: .abbreviated, time: .shortened))")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
            }

            Spacer()
        }
        .padding()
    }
}
