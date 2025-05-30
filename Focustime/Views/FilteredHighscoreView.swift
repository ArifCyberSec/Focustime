//
//  FilteredHighscoreView.swift
//  Focustime
//
//  Created by Ahmad Arif on 23.04.25.
//

import Foundation
import SwiftUI

struct FilteredHighscoreView: View {
    let gameName: String

    @ObservedObject var highscoreManager = HighscoreManager()
    @State private var filteredScores: [HighscoreEntry] = []
    @State private var showDeleteAlert = false

    var body: some View {
        VStack {
            Text("🏆 Highscores – \(gameName)")
                .font(.largeTitle)
                .bold()
                .padding(.top)

            if !filteredScores.isEmpty {
                List(filteredScores, id: \.id) { entry in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("📈 Punkte: \(entry.score)")
                        if let time = entry.timeInSeconds {
                            Text("⏱️ Zeit: \(String(format: "%.1f", time)) s")
                                .font(.caption)
                                .foregroundColor(.blue)
                        }
                        Text("📅 \(entry.date.formatted(date: .abbreviated, time: .shortened))")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
                .listStyle(.insetGrouped)
            }

            Spacer()

            Button("🗑️ \(gameName)-Highscores löschen") {
                showDeleteAlert = true
            }
            .foregroundColor(.red)
            .padding(.bottom)
            .alert("Wirklich alle \(gameName)-Highscores löschen?", isPresented: $showDeleteAlert) {
                Button("Ja, löschen", role: .destructive) {
                    highscoreManager.deleteScores(for: gameName)
                    updateScores()
                }
                Button("Nein", role: .cancel) { }
            }
        }
        .padding()
        .onAppear {
            updateScores()
        }
    }

    /// Filtert und sortiert die Scores neu
    private func updateScores() {
        filteredScores = highscoreManager.scores
            .filter { $0.gameName == gameName }
            .sorted { $0.date > $1.date }
    }
}
