//
//  ContentView.swift
//  Focustime
//
//  Created by Ahmad Arif on 03.04.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {  // <-- WICHTIG!
            ZStack {
                
                PlayfulBackgroundView()

                VStack(spacing: 30) {
                    Text("FocusTime")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)

                    NavigationLink(destination: GameSelectionView()) {
                        Text("▶️ Start")
                            .font(.title2)
                            .frame(width: 200, height: 50)
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }

                    NavigationLink(destination: HighscoreView()) {
                        Text("🏆 Highscore anzeigen")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }

                    Button(action: {
                        exit(0)
                    }) {
                        Text("❌ Quit")
                            .font(.title2)
                            .frame(width: 200, height: 50)
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
