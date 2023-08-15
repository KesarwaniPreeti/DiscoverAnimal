//
//  AnimalTableViewCell.swift
//  animalapp
//
//  Created by Preeti Kesarwani on 7/25/23.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var headline: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
