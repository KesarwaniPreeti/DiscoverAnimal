//
//  WatchTableViewController.swift
//  animalapp
//
//  Created by Preeti Kesarwani on 7/30/23.
//

import UIKit
import AVKit

class WatchTableViewController: UITableViewController {
    
    
    
    var videoModel : [VideoModel] =  Bundle.main.decode("animals", "json")
    
    @IBOutlet var watchAnimal: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videoModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = watchAnimal.dequeueReusableCell(withIdentifier: "watch", for: indexPath) as! VideoTableViewCell
        
        
        cell.animalImg.image =  UIImage(named: videoModel[indexPath.row].id)
        cell.animalName.text = videoModel[indexPath.row].name
        cell.animalHeadlie.text = videoModel[indexPath.row].headline
        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let video : VideoViewController = (storyboard?.instantiateViewController(withIdentifier: "video") as? VideoViewController)!
        video.videoSelected = videoModel[indexPath.row].id
        navigationController?.pushViewController(video, animated: true)
       
        
    }
    
   
    
    
}
