//
//  AboutOwnerViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 26/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AboutOwnerViewController: UIViewController {

    
  
    @IBOutlet weak var aboutOwnertext: UITextView!
    
    var reference = Database.database().reference(fromURL:  "https://chelsea-news-3f908.firebaseio.com/Chelsea/StaticText/aboutclub")
    
    var handle :DatabaseHandle?
    
    var itemFromOwner = [Owner]()
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        aboutOwnertext.setContentOffset(CGPoint.zero, animated: false)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchOwner()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchOwner()
    {
     
        
        handle = reference.child("owner").observe(.value, with: { (DataSnapshot) in
            
            if var dictionary = DataSnapshot.value as? [String:AnyObject]
            {
                var item = Owner()
                
                item.setValuesForKeys(dictionary)
                
                self.itemFromOwner.append(item)
                
                print(dictionary)
                
                
                for(a,b) in dictionary{
                    
                    print(b)
                    
                    self.aboutOwnertext.text = b as! String
                }
                
                
                
                
                
            }
            
        })
    }

    @IBAction func backButton(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }

}
