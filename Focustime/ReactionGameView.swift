//
//  ReactionGameView.swift
//  Focustime
//
//  Created by Ahmad Arif on 04.04.25.
//

import Foundation
import SwiftUI

struct ReactionGameView: View {
    var body: some View {
        VStack {
            Text("⚡ Reaktions-Spiel")
                .font(.largeTitle)
                .bold()
                .padding()
            Text("Hier kommt dein Reaktionsspiel hin.")
        }
        .navigationTitle("Reaktion")
    }
}

#Preview {
    ReactionGameView()
}
