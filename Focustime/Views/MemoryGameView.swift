//
//  MemoryGameView.swift
//  Focustime
//
//  Created by Ahmad Arif on 04.04.25.
//

import Foundation
import SwiftUI

struct MemoryCard: Identifiable {
    let id = UUID()
    let symbol: String
    var isFlipped: Bool = false
    var isMatched: Bool = false
}

struct MemoryGameView: View {
    @StateObject var highscoreManager = HighscoreManager()
    @State private var startTime: Date?
    @State private var timeElapsed: Double = 0
    @State private var cards: [MemoryCard] = []
    @State private var firstFlippedIndex: Int? = nil
    @State private var attempts: Int = 0

    let symbols = ["🍎", "🚀", "🐶", "🌈", "🎩", "⚽️", "🎮", "🧠"]

    var body: some View {
        VStack {
            Text("🧠 Memory")
                .font(.largeTitle)
                .bold()
                .padding()

            Text("Versuche: \(attempts)")
                .font(.headline)
                .padding(.bottom)

            // Kartenraster
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
                ForEach(cards.indices, id: \.self) { index in
                    let card = cards[index]
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(card.isMatched ? Color.green.opacity(0.5) : Color.blue.opacity(0.7))
                            .frame(height: 80)

                        if card.isFlipped || card.isMatched {
                            Text(card.symbol)
                                .font(.largeTitle)
                        } else {
                            Image(systemName: "questionmark")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                    .onTapGesture {
                        flipCard(at: index)
                    }
                    .animation(.easeInOut, value: card.isFlipped)
                }
            }
            .padding()

            Button("🔁 Neu starten") {
                startNewGame()
            }
            .padding(.top, 20)
        }
        .onAppear {
            startNewGame()
        }
        .navigationTitle("Memory")
    }

    // Neue Karten mischen
    func startNewGame() {
        startTime = Date()
        timeElapsed = 0
        var newCards = (symbols + symbols).shuffled().map { MemoryCard(symbol: $0) }
        cards = newCards
        firstFlippedIndex = nil
        attempts = 0
    }

    // Spiel-Logik
    func flipCard(at index: Int) {
        guard !cards[index].isFlipped && !cards[index].isMatched else { return }

        cards[index].isFlipped = true

        if let firstIndex = firstFlippedIndex {
            attempts += 1
            if cards[firstIndex].symbol == cards[index].symbol {
                // Match
                cards[firstIndex].isMatched = true
                cards[index].isMatched = true

                // Check: Sind alle Karten gematcht?
                if cards.allSatisfy({ $0.isMatched }) {
                    if let start = startTime {
                        timeElapsed = Date().timeIntervalSince(start)
                    }
                    
                    // Zeit speichern im Highscore
                    highscoreManager.addScore(game: "Memory", score: attempts, timeInSeconds: timeElapsed)
                }

            } else {
                // Kein Match → zurückdrehen
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    cards[firstIndex].isFlipped = false
                    cards[index].isFlipped = false
                }
            }
            firstFlippedIndex = nil
        } else {
            firstFlippedIndex = index
        }
    }
}

#Preview {
    MemoryGameView()
}
