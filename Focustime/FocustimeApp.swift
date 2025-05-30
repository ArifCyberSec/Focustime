//
//  FocustimeApp.swift
//  Focustime
//
//  Created by Ahmad Arif on 03.04.25.
//

//  FocustimeApp.swift
//  Focustime

import SwiftUI
import AVFoundation        // ← brauchen wir für AudioSession-Setup

@main
struct FocustimeApp: App {
    init() {
       
        try? AVAudioSession.sharedInstance().setCategory(.playback, options: [.mixWithOthers])
        try? AVAudioSession.sharedInstance().setActive(true)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    
                    AudioManager.shared.playBackgroundMusic(
                        filename: "music",
                        fileExtension: "mp3"
                    )
                }
                .onDisappear {
                 
                    AudioManager.shared.stopBackgroundMusic()
                }
        }
    }
}
