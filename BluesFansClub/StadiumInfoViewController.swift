//
//  StadiumInfoViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 26/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit
import FirebaseDatabase

class StadiumInfoViewController: UIViewController {

    
    @IBOutlet weak var stadiumInfoText: UITextView!
    
    var reference = Database.database().reference(fromURL:  "https://chelsea-news-3f908.firebaseio.com/Chelsea/StaticText/aboutclub")
    
    var handle :DatabaseHandle?
    
    var itemFromStadiumInfo = [StadiumInfo]()
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        stadiumInfoText.setContentOffset(CGPoint.zero, animated: false)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       fetchStadium()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchStadium()
    {
      
        
        handle = reference.child("stadium").observe(.value, with: { (DataSnapshot) in
            
            if var dictionary = DataSnapshot.value as? [String:AnyObject]
            {
                var item = StadiumInfo()
                
                item.setValuesForKeys(dictionary)
                
                self.itemFromStadiumInfo.append(item)
                
                print(dictionary)
                
                
                for(a,b) in dictionary{
                    
                    print(b)
                    
                    self.stadiumInfoText.text = b as! String
                }

                
            }
            
        })
    }
    @IBAction func backButton(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
