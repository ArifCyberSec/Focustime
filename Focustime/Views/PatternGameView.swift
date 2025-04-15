//
//  PatternGameView.swift
//  Focustime
//
//  Created by Ahmad Arif on 04.04.25.
//

import Foundation
import SwiftUI

struct PatternGameView: View {
    @State private var currentSequence: [Int] = []
    @State private var correctAnswer: Int = 0
    @State private var userAnswer: String = ""
    @State private var score: Int = 0
    @State private var showGameOver = false

    var body: some View {
        VStack(spacing: 30) {
            Text("🧠 Zahlenmuster erkennen")
                .font(.largeTitle)
                .bold()

            Text("Punkte: \(score)")
                .font(.title2)

            Text("Was kommt als nächstes?")
                .font(.headline)

            HStack(spacing: 10) {
                ForEach(currentSequence, id: \.self) { num in
                    Text("\(num)")
                        .font(.title)
                        .frame(width: 50, height: 50)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                }
                Text("?")
                    .font(.title)
                    .frame(width: 50, height: 50)
                    .background(Color.yellow.opacity(0.4))
                    .cornerRadius(10)
            }

            TextField("Deine Antwort", text: $userAnswer)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)

            Button("✅ Überprüfen") {
                checkAnswer()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            Button("🔁 Neutart") {
                startNewRound()
            }
            .foregroundColor(.red)

            Spacer()
        }
        .padding()
        .onAppear(perform: startNewRound)
        .alert(isPresented: $showGameOver) {
            Alert(title: Text("❌ Falsch!"),
                  message: Text("Richtige Antwort war: \(correctAnswer)"),
                  dismissButton: .default(Text("OK"), action: {
                      score = 0
                      startNewRound()
                  }))
        }
    }

    func startNewRound() {
        userAnswer = ""
        let patternType = Int.random(in: 0...3)

        var sequence: [Int] = []

        switch patternType {
        case 0: // +n
            let start = Int.random(in: 1...10)
            let step = Int.random(in: 1...5)
            sequence = (0..<4).map { start + $0 * step }
            correctAnswer = start + 4 * step

        case 1: // -n
            let start = Int.random(in: 30...50)
            let step = Int.random(in: 2...6)
            sequence = (0..<4).map { start - $0 * step }
            correctAnswer = start - 4 * step

        case 2: // ×n
            let start = Int.random(in: 1...3)
            let factor = Int.random(in: 2...3)
            sequence = (0..<4).map { start * Int(pow(Double(factor), Double($0))) }
            correctAnswer = start * Int(pow(Double(factor), 4))

        case 3:
            let first = Int.random(in: 1...5)
            let second = Int.random(in: 1...5)
            sequence = [first, second]
            for _ in 0..<2 {
                sequence.append(sequence[sequence.count - 1] + sequence[sequence.count - 2])
            }
            correctAnswer = sequence[3] + sequence[2]

        default:
            break
        }

        currentSequence = sequence
    }

    func checkAnswer() {
        guard let answer = Int(userAnswer) else { return }
        if answer == correctAnswer {
            score += 1
            startNewRound()
        } else {
            showGameOver = true
        }
    }
}
