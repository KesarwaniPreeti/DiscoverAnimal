//
//  VideoTableViewCell.swift
//  animalapp
//
//  Created by Preeti Kesarwani on 7/30/23.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    
    @IBOutlet var animalImg: UIImageView!
    
    
    @IBOutlet var animalName: UILabel!
    
    @IBOutlet var animalHeadlie: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
