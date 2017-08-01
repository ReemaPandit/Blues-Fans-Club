//
//  MainTableTableViewCell.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 21/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit

class MainTableTableViewCell: UITableViewCell {

    @IBOutlet weak var heading: UILabel!
    
    @IBOutlet weak var detail: UILabel!
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        detail.numberOfLines = 0
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
