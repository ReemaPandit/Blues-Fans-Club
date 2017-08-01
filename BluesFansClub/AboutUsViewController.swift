//
//  AboutUsViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 17/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AboutUsViewController: UIViewController {
    
    @IBOutlet weak var aboutUsTextView: UITextView!
    
    @IBOutlet weak var headerTitle: UILabel!
    
    let reference = Database.database().reference(fromURL: "https://chelsea-news-3f908.firebaseio.com/Chelsea/StaticText")
    
    var handle : DatabaseHandle?
    
    var aboutUsItemloaded = [AboutUsItems]()
    
    var privacyPolicyItems = [PrivacyPolicy]()
    
    var termsNconditionItems = [TermsAndConditions]()
    
    var id :String?
    
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        if id == "AboutUs"
        {
            fetchFromAbout()
            print(aboutUsItemloaded)
        }
        
        if id == "PrivacyPolicy"
        {
           fetchFromPrivacyPolicy()
            print(privacyPolicyItems)
        }
        
        if id == "TermsAndConditions"
        {
            fetchFromTermsNCondition()
            print(termsNconditionItems)
        }
        
      
    
    
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchFromAbout()
    {
        handle = reference.child("/About/Community").observe(.value, with: { (DataSnapshot) in
            
            if let dictionary = DataSnapshot.value as? [String:AnyObject]
            {
                var itemsFromDb = AboutUsItems()
                
                print(dictionary)
                
                itemsFromDb.setValuesForKeys(dictionary)
                
                self.aboutUsItemloaded.append(itemsFromDb)
                
                for(a,b) in dictionary  //a = ctext thet is the item of dictionary , b = value of ctext,we need to print just the value
                {
                    
                    print(b)
                    
                    self.aboutUsTextView.text = b as! String
                    
                    self.headerTitle.text = "About Us"
                }

            }
        })
    }
    
    func fetchFromPrivacyPolicy()
    {
        handle = reference.child("privacypolicy").observe(.value, with: { (DataSnapshot) in
            
            if let dictionary = DataSnapshot.value as? [String:AnyObject]
            {
                var items = PrivacyPolicy()
                
                print(dictionary)
                
                items.setValuesForKeys(dictionary)
                
                self.privacyPolicyItems.append(items)
                
                for(a,b) in dictionary{
                    
                    print(b)
                    
                    self.aboutUsTextView.text = b as! String
                    
                    self.headerTitle.text = "Privacy Policy"
                }
                
            }
        })
    }
    func fetchFromTermsNCondition()
    {
        handle = reference.child("termsandcondition").observe(.value, with: { (DataSnapshot) in
            
           if let dictionary = DataSnapshot.value as? [String:AnyObject]
            {
                var items = TermsAndConditions()
                
                print(dictionary)
                
                items.setValuesForKeys(dictionary)
                
                self.termsNconditionItems.append(items)
                
                for(a,b) in dictionary{
                    
                    print(b)
                    
                    self.aboutUsTextView.text = b as! String
                    
                    self.headerTitle.text = "Terms & Conditions"
                }
                
            }
        })
    }

    @IBAction func backButton(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
