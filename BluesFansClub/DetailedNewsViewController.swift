//
//  DetailedNewsViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 12/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit

class DetailedNewsViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
  
    @IBOutlet weak var newsContent: UITextView!
    
    @IBOutlet weak var newstitle: UILabel!
    
    var newstitleFromDb :String?
    
    var newsContentFromDb :String?
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        newsContent.setContentOffset(CGPoint.zero, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newstitle.drawText(in: CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.width))
        
        newstitle.text = newstitleFromDb
        
        newsContent.text = newsContentFromDb
        
        
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backbutton(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }

}
