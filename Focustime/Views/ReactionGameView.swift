//
//  ReactionGameView.swift
//  Focustime
//
//  Created by Ahmad Arif on 04.04.25.
//

import Foundation
import SwiftUI

struct ReactionDot: Identifiable {
    let id = UUID()
    let position: CGPoint
}

struct ReactionGameView: View {
    @StateObject var highscoreManager = HighscoreManager()
    @State private var dots: [ReactionDot] = []
    @State private var score: Int = 0
    @State private var timeRemaining: Int = 30
    @State private var gameRunning = false
    @State private var timer: Timer?

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            // Punkte anzeigen
            ForEach(dots) { dot in
                Circle()
                    .fill(Color.red)
                    .frame(width: 50, height: 50)
                    .position(dot.position)
                    .onTapGesture {
                        remove(dot)
                    }
                    .transition(.scale)
            }

            // Overlay UI
            VStack {
                HStack {
                    Text("⏱️ Zeit: \(timeRemaining)s")
                        .font(.headline)
                    Spacer()
                    Text("🏆 Punkte: \(score)")
                        .font(.headline)
                }
                .padding()
                
                Spacer()

                if !gameRunning {
                    Button("▶️ Spiel starten") {
                        startGame()
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
        .navigationTitle("⚡ Reaktionsspiel")
    }

    // Startet das Spiel
    func startGame() {
        score = 0
        timeRemaining = 30
        dots = []
        gameRunning = true

        spawnDot()

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
                spawnDot()
            } else {
                timer?.invalidate()
                gameRunning = false

                //  Highscore speichern
                highscoreManager.addScore(game: "Reaktion", score: score)
            }
        }
    }

    // Dot entfernen und Punkt zählen
    func remove(_ dot: ReactionDot) {
        if let index = dots.firstIndex(where: { $0.id == dot.id }) {
            dots.remove(at: index)
            score += 1
        }
    }

    // Neuen Punkt zufällig platzieren
    func spawnDot() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let x = CGFloat.random(in: 50...(screenWidth - 50))
        let y = CGFloat.random(in: 150...(screenHeight - 150)) // Abstand zum UI

        let newDot = ReactionDot(position: CGPoint(x: x, y: y))
        dots.append(newDot)
    }
}

#Preview {
    ReactionGameView()
}
