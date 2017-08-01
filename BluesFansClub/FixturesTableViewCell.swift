//
//  FixturesTableViewCell.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 13/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit

class FixturesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var team1: UILabel!
    
    @IBOutlet weak var team2: UILabel!
    
    @IBOutlet weak var league: UILabel!
    
    @IBOutlet weak var score: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
