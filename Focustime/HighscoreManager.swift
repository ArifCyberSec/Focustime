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
    let date: Date
}

class HighscoreManager: ObservableObject {
    @Published var scores: [HighscoreEntry] = []

    private let key = "highscores"

    init() {
        load()
    }

    func addScore(game: String, score: Int) {
        let newEntry = HighscoreEntry(gameName: game, score: score, date: Date())
        scores.append(newEntry)
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
