//
//  VideoViewController.swift
//  animalapp
//
//  Created by Preeti Kesarwani on 7/30/23.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {
    
    @IBOutlet var animalTitle: UILabel!
    

    
    
    var videoSelected : String = ""
    //var VideoTilte : String = ""
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //animalTitle.text = VideoTilte
      
        
        //playVideo(fileName: videoSelected, FileFormat: "mp4")
  

        
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource:videoSelected , ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(layer)
        player.play()
    }
   

    }

    
    





