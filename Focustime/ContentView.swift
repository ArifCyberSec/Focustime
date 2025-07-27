//
//  ContentView.swift
//  Focustime
//
//  Created by Ahmad Arif on 03.04.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                
                PlayfulBackgroundView()

                VStack(spacing: 25) {
                    Text("FocusTime")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)

                    NavigationLink(destination: GameSelectionView()) {
                        Text("▶️ Start")
                            .font(.title2)
                            .frame(width: 250, height: 60)
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }

                    NavigationLink(destination: HighscoreView()) {
                        Text("🏆 Highscore")
                            .font(.title2)
                            .padding()
                            .frame(width: 250, height: 60)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }

                    Button(action: {
                        exit(0)
                    }) {
                        Text("❌ Quit")
                            .font(.title2)
                            .frame(width: 250, height: 60)
                            .background(Color.white)
                            .foregroundColor(.red)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
