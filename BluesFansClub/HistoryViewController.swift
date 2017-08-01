//
//  HistoryViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 26/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HistoryViewController: UIViewController {

    
    @IBOutlet weak var historyText: UITextView!
    
    var reference = Database.database().reference(fromURL:  "https://chelsea-news-3f908.firebaseio.com/Chelsea/StaticText/aboutclub")
    
    var handle :DatabaseHandle?
    
    var itemFromHistory = [History]()
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        historyText.setContentOffset(CGPoint.zero, animated: false)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchHistory()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func fetchHistory()
    {
     
        
        handle = reference.child("history").observe(.value, with: { (DataSnapshot) in
            
            if var dictionary = DataSnapshot.value as? [String:AnyObject]
            {
                var item = History()
                
                item.setValuesForKeys(dictionary)
                
                self.itemFromHistory.append(item)
                
                print(dictionary)
                
                
                for(a,b) in dictionary{
                    
                    print(b)
                    
                    self.historyText.text = b as! String
                }

                
                
            }
            
        })
    }

    @IBAction func backButton(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
