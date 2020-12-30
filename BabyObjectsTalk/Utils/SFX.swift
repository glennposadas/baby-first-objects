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
    
    private func playFile(_ fileName: String, shouldPlayOnSilent: Bool = true) {
        let soundFilePath = "\(Bundle.main.resourcePath ?? "")/\(fileName)"
        let soundFileURL = URL(fileURLWithPath: soundFilePath)
        
        if shouldPlayOnSilent {
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback)
            } catch(let error) {
                print(error.localizedDescription)
            }
        }
        
        player = try? AVAudioPlayer(contentsOf: soundFileURL)
        player?.volume = 1.0
        player?.play()
    }
    
    // MARK: - Public
    
    func playUKEnglishSettings() {
        playFile("UK_Settings.mp3")
    }
    
    func playUSEnglishSettings() {
        playFile("US_Settings.mp3")
    }
    
    func playWord(_ word: Word) {
        let countryPrefix = AppDefaults.getObjectWithKey(.useUSEnglish, type: Bool.self) == true ? "US" : "UK"
        playFile("\(countryPrefix)_\(word.stringValue).mp3")
    }
}
