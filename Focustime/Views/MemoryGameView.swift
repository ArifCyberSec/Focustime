//
//  MemoryGameView.swift
//  Focustime
//
//  Created by Ahmad Arif on 04.04.25.
//

import Foundation
import SwiftUI

struct MemoryGameView: View {
    var body: some View {
        VStack {
            Text("🧠 Memory-Spiel")
                .font(.largeTitle)
                .bold()
                .padding()
            Text("Hier kommt dein Memory-Game hin.")
        }
        .navigationTitle("Memory")
    }
}

#Preview {
    MemoryGameView()
}
