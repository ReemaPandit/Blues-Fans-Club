//
//  ChantsViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 26/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ChantsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var chantsTable: UITableView!
    
    var reference = Database.database().reference(fromURL:  "https://chelsea-news-3f908.firebaseio.com/Chelsea/StaticText/aboutclub")
    
    var handle :DatabaseHandle?
    
    var itemFromChants = [Chants]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chantsTable.delegate = self
        
        chantsTable.dataSource = self
        
        chantsTable.estimatedRowHeight = 100
        
        chantsTable.rowHeight = UITableViewAutomaticDimension
        
        fetchChants()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return itemFromChants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = Bundle.main.loadNibNamed("MainTableTableViewCell", owner: self, options: nil)?.first as! MainTableTableViewCell
      
            
            
            cell.heading.text = itemFromChants[indexPath.row].chant_title
            
            cell.detail.text = itemFromChants[indexPath.row].chant_message
            
            return cell
        

    }
    
    
    func fetchChants()
    {
        handle = reference.child("chants").observe(.childAdded, with: { (DataSnapshot) in
            
            if var dictionary = DataSnapshot.value as? [String:AnyObject]
            {
                var item = Chants()
                
                item.setValuesForKeys(dictionary)
                
                self.itemFromChants.append(item)
                
                print(dictionary)
                
                self.chantsTable.reloadData()
                self.chantsTable.setContentOffset(CGPoint.zero, animated: false)
            }
            
        })
    }
    @IBAction func backButton(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
