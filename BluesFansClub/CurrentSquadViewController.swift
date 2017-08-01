//
//  CurrentSquadViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 18/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CurrentSquadViewController: UIViewController {

    @IBOutlet weak var currentSquad: UITextView!
    
    
    let reference = Database.database().reference(fromURL: "https://chelsea-news-3f908.firebaseio.com/Chelsea/StaticText/aboutclub")
    
    var handle :DatabaseHandle?
    
    var itemfromcurrentSquad = [CurrentSquad]()
   
    
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        currentSquad.setContentOffset(CGPoint.zero, animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
       fetchCurrentSquad()
        
      


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func fetchCurrentSquad()
    {
        
        handle = reference.child("squad").observe(.value, with: { (DataSnapshot) in
            
            if var dictionary = DataSnapshot.value as? [String:AnyObject]
            {
                var item = CurrentSquad()
                
                item.setValuesForKeys(dictionary)
                
                self.itemfromcurrentSquad.append(item)
                
                print(dictionary)
                
                for(a,b) in dictionary{
                    
                    print(b)
                  
                    self.currentSquad.text = b as! String
                    
                }
                
            }
            
        })
    }
    @IBAction func backButton(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }

}
