//
//  PatternGameView.swift
//  Focustime
//
//  Created by Ahmad Arif on 04.04.25.
//

import Foundation
import SwiftUI

struct PatternGameView: View {
    var body: some View {
        VStack {
            Text("🔍 Muster-Spiel")
                .font(.largeTitle)
                .bold()
                .padding()
            Text("Hier kommt dein Mustererkennungs-Spiel hin.")
        }
        .navigationTitle("Muster")
    }
}

#Preview {
    PatternGameView()
}
