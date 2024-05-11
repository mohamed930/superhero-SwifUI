//
//  PlaySound.swift
//  Superhero
//
//  Created by Mohamed Ali on 10/05/2024.
//

import Foundation
import AVFoundation

class PlaySound {
    static let shared = PlaySound()
    
    var fileName: String = ""
    var fileType: String = ""
    
    private var avplayer: AVAudioPlayer?
    
    func setData(fileName: String,fileType: String) {
        self.fileName = fileName
        self.fileType = fileType
    }
    
    func playSound() {
        
        guard let bundle = Bundle.main.path(forResource: fileName, ofType: fileType) else { return }
        
        do {
            avplayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bundle))
            avplayer?.play()
        }
        catch {
            print("Error to get file")
        }
    }
}
