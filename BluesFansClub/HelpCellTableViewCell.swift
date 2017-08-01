//
//  HelpCellTableViewCell.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 24/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit

class HelpCellTableViewCell: UITableViewCell {

    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var answer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        question.numberOfLines = 0 //any number of lines can be adjusted
        
        answer.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
