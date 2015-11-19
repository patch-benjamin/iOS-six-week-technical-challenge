//
//  PairedPeopleTableViewCell.swift
//  PairMeMine
//
//  Created by Benjamin Patch on 11/18/15.
//  Copyright © 2015 PatchWork. All rights reserved.
//

import UIKit

class PairedPeopleTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    // MARK: Outlets
    
    @IBOutlet weak var user1Label: UILabel!
    
    @IBOutlet weak var user2Label: UILabel!
    
    @IBOutlet weak var pairedWithLabel: UILabel!
    
    
    func fillLabels(user1: Person, user2: Person?, pairedWithString: String = "&") {

        user1Label.text = user1.name
        pairedWithLabel.text = pairedWithString
        
        if let user2 = user2 {
        
            user2Label.text = user2.name
        
        } else {
            
            user2Label.text = "Choose Your Pair!"
            
        }
        let randomColor = UIColor.randomColor()

        user1Label.textColor = randomColor
        pairedWithLabel.textColor = randomColor
        user2Label.textColor = randomColor
        
    }
}
