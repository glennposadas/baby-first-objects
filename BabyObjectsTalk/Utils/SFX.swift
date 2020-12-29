//
//  SFX.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/17/20.
//

import AVFoundation
import Foundation

class SFX {
    
    // MARK: - Properties

    static let shared = SFX()
    private var bgPlayer: AVAudioPlayer?
    private var player: AVAudioPlayer?
    
    // MARK: - Overrides
    // MARK: Functions
    
    private init() { }
    
    private func playFile(_ fileName: String) {
        let soundFilePath = "\(Bundle.main.resourcePath ?? "")/\(fileName)"
        let soundFileURL = URL(fileURLWithPath: soundFilePath)
        
        player = try? AVAudioPlayer(contentsOf: soundFileURL)
        player?.volume = 1.0
        player?.play()
    }
    
    // MARK: - Public
    
    func playUKEnglishSettings() {
        playFile("UK_Settings")
    }
    
    func playUSEnglishSettings() {
        playFile("US_Settings")
    }
}
