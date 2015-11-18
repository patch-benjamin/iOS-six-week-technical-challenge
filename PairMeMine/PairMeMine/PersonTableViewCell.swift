//
//  PersonTableViewCell.swift
//  PairMeMine
//
//  Created by Benjamin Patch on 11/18/15.
//  Copyright © 2015 PatchWork. All rights reserved.
//

import UIKit

protocol personTableViewCellDelegate {
    func userEditButtonTapped(index: Int?)
}

class PersonTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var index: Int? = nil
    
    var delegate: personTableViewCellDelegate?
    
    // MARK: Outlets
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    @IBAction func editButtonTapped(sender: UIButton) {
        delegate?.userEditButtonTapped(index)
    }
    
    
    
    

}
