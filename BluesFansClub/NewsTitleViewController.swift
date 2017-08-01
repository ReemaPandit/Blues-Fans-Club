//
//  NewsTitleViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 12/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit
import FirebaseDatabase

class NewsTitleViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var hud: UIActivityIndicatorView!

    @IBOutlet weak var newsTitleTableView: UITableView!
    
let reference = Database.database().reference(fromURL: "https://chelsea-news-3f908.firebaseio.com/Chelsea/Post/News")
    
    let limit = Database.database().reference(fromURL: "https://chelsea-news-3f908.firebaseio.com/Chelsea/Post/News").queryLimited(toFirst: 3).observe(.childAdded, with: { (DataSnapshot) in
        
        print(DataSnapshot)
    })

    var handle :DatabaseHandle?
    
    var newsItemsLoaded = [NewsItems]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navigationItem.title = "News"
        
        newsTitleTableView.delegate = self
        newsTitleTableView.dataSource = self
        
        newsTitleTableView.rowHeight = UITableViewAutomaticDimension
        
        newsTitleTableView.estimatedRowHeight = 10.0
        
        
        let data = reference.observe(.childAdded, with: { (DataSnapshot) in
            
            print(DataSnapshot)
        })
        
        
       
        
        fetchFromDatabse()
        
        Database.database().reference().keepSynced(true)
   
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
        return newsItemsLoaded.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = Bundle.main.loadNibNamed("NewsTableViewCell", owner: self, options: nil)?.first as! NewsTableViewCell
        
        cell.layer.borderColor = UIColor.init(red: 49/255, green: 195/255, blue: 231/255, alpha: 1.0).cgColor
        
        cell.layer.borderWidth = 2.0
        
        cell.newsTitle.text = newsItemsLoaded[indexPath.row].title
        
        cell.layer.cornerRadius = 5.0
        
        cell.layer.masksToBounds = true
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0
    }
    
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            if true
            {
                if let indexpath = newsTitleTableView.indexPathForSelectedRow 
                {
                    let source = self.storyboard?.instantiateViewController(withIdentifier: "DetailedNewsViewController")as! DetailedNewsViewController
                    
                    self.navigationController?.pushViewController(source, animated: true)
                    
                    source.newstitleFromDb = newsItemsLoaded[indexPath.row].title
                    
                    source.newsContentFromDb = newsItemsLoaded[indexPath.row].content
                }
            }
        }

  func fetchFromDatabse()
  {
    
 //queryLimited(toFirst:3) for limiting the queries upto to desired value
    
    handle = reference.queryLimited(toFirst: 20).observe(.childAdded, with: { (DataSnapshot) in
        
        if let dictionary = DataSnapshot.value as? [String:AnyObject]
        {
            print(dictionary)
            
            let itemsFromDatabase = NewsItems()
            
            itemsFromDatabase.setValuesForKeys(dictionary)
            
            self.newsItemsLoaded.append(itemsFromDatabase)
            
            self.newsTitleTableView.reloadData()
            
            
        }
    })
    
    }
    
    @IBAction func backButton(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
}
