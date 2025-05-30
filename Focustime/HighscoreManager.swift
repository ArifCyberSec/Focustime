//
//  HighscoreManager.swift
//  Focustime
//
//  Created by Ahmad Arif on 17.04.25.
//

import Foundation
import Foundation

struct HighscoreEntry: Identifiable, Codable {
    let id = UUID()
    let gameName: String
    let score: Int
    let timeInSeconds: Double?
    let date: Date
}
class HighscoreManager: ObservableObject {
    @Published var scores: [HighscoreEntry] = []

    private let key = "highscores"

    init() {
        load()
    }

    func addScore(game: String, score: Int, timeInSeconds: Double? = nil) {
        let newEntry = HighscoreEntry(gameName: game, score: score, timeInSeconds: timeInSeconds, date: Date())
        scores.append(newEntry)
        save()
    }
    func deleteScores(for game: String) {
        scores.removeAll { $0.gameName == game }
        save()
    }
   

    private func save() {
        if let encoded = try? JSONEncoder().encode(scores) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([HighscoreEntry].self, from: data) {
            scores = decoded
        }
    }
}
