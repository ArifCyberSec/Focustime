//
//  AudioManager.swift
//  Focustime
//
//  Created by Ahmad Arif on 23.04.25.
//

import Foundation
import AVFoundation


class AudioManager {
    static let shared = AudioManager()
    private var player: AVAudioPlayer?

   
    func playBackgroundMusic(filename: String, fileExtension: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: fileExtension) else {
            print("🔊 AudioManager: Datei nicht gefunden: \(filename).\(fileExtension)")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1       // Endlosschleife
            player?.volume = 1.0             // Lautstärke (0.0–1.0)
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("🔊 AudioManager: Kann Player nicht erstellen: \(error)")
        }
    }

    /// Stoppt die Wiedergabe
    func stopBackgroundMusic() {
        player?.stop()
    }
}
