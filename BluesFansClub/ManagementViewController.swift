//
//  ManagementViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 26/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ManagementViewController: UIViewController {

    
    @IBOutlet weak var managementText: UITextView!
    
    var reference = Database.database().reference(fromURL:  "https://chelsea-news-3f908.firebaseio.com/Chelsea/StaticText/aboutclub")
    
    var handle :DatabaseHandle?
    
    var itemFromManagement = [Management]()
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        managementText.setContentOffset(CGPoint.zero, animated: false)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchManagement()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func fetchManagement()
    {
        
        handle = reference.child("management").observe(.value, with: { (DataSnapshot) in
            
            if var dictionary = DataSnapshot.value as? [String:AnyObject]
            {
                var item = Management()
                
                item.setValuesForKeys(dictionary)
                
                self.itemFromManagement.append(item)
                
                print(dictionary)
                
                
                for(a,b) in dictionary{
                    
                    print(b)
                    
                    self.managementText.text = b as! String
                }

            }
            
        })
    }
    @IBAction func backButton(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
