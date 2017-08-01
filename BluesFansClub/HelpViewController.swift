//
//  HelpViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 24/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HelpViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var helptable: UITableView!
    
    
    let reference = Database.database().reference(fromURL: "https://chelsea-news-3f908.firebaseio.com/Chelsea/StaticText/Issue/Help")
    
    var itemsOfHelp = [HelpItem]()
    
    var handle :DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helptable.rowHeight = UITableViewAutomaticDimension//for automatic dimension of the cell height of the table view
        
        helptable.estimatedRowHeight = 100//need to give a estimated height when we are setting autodimenesion height
        
        helptable.delegate = self
        
        helptable.dataSource = self
        
        fetchFromDb()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchFromDb()
    {
        handle = reference.observe(.childAdded, with: { (DataSnapshot) in
            
            if var dictionary = DataSnapshot.value as? [String:AnyObject]
            {
                let item = HelpItem()
                
                item.setValuesForKeys(dictionary)
                
                self.itemsOfHelp.append(item)
                
                print(dictionary)
                
                self.helptable.reloadData()

            }
            
        })
    }

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemsOfHelp.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = Bundle.main.loadNibNamed("HelpCellTableViewCell", owner: self, options: nil)?.first as! HelpCellTableViewCell
        
        cell.question.text = itemsOfHelp[indexPath.row].question
        
        cell.answer.text = itemsOfHelp[indexPath.row].answer
        
        return cell
        
    }
   
    @IBAction func backButton(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }

}
