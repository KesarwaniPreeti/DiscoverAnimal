//
//  Video.swift
//  animalapp
//
//  Created by Preeti Kesarwani on 7/30/23.
//

import Foundation
import AVKit

var videoPlayer : AVPlayer?

func playVideo(fileName  : String ,FileFormat : String) -> AVPlayer {
    if Bundle.main.url(forResource: fileName, withExtension: FileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: FileFormat)!)
        videoPlayer?.play()
        
    }
    return videoPlayer!
}
