//
//  CommentaryViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 13/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CommentaryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var commentaryTableView: UITableView!
    
    let reference = Database.database().reference(fromURL: "https://chelsea-news-3f908.firebaseio.com/Chelsea/TextCommentary/Commentary")
    
    var handle :DatabaseHandle?
    
    var itemsFromCommentary = [CommentaryItems]()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var abc = reference.observe(.value, with: { (DataSnapshot) in
            
            print(DataSnapshot)
        })
        
        
        navigationItem.title = "Commentary"
        
        commentaryTableView.delegate = self
        
        commentaryTableView.dataSource = self
        
        commentaryTableView.rowHeight = UITableViewAutomaticDimension
        
        commentaryTableView.estimatedRowHeight = 50
        
        fetchFromDb()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return itemsFromCommentary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as UITableViewCell
        
        if cell == nil
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            
            
        }
        
        
        
        cell.textLabel?.numberOfLines = 0
        
        cell.layer.borderColor = UIColor.init(red: 49/255, green: 195/255, blue: 231/255, alpha: 1.0).cgColor
        
        cell.layer.borderWidth = 2.0
        
         cell.textLabel?.text = itemsFromCommentary[indexPath.row].live
        
        return cell
    }
  
    func fetchFromDb()
    {
        handle = reference.observe(.childAdded, with: { (DataSnapshot) in
            
            if let dictionary = DataSnapshot.value as? [String:AnyObject]
            {
                print(dictionary)
                
                let itemsFromDatabase = CommentaryItems()
                
                itemsFromDatabase.setValuesForKeys(dictionary)
                
                self.itemsFromCommentary.append(itemsFromDatabase)
                
                print(self.itemsFromCommentary)
                
                self.commentaryTableView.reloadData()
                
                
                
            }
            
            
        })
    }
   
    @IBAction func backButton(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
  
}
