//
//  FixturesViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 13/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FixturesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var fixturesTableView: UITableView!
    
    @IBOutlet weak var fixturesPresentTimeZone: UILabel!
    
    let reference = Database.database().reference(fromURL: "https://chelsea-news-3f908.firebaseio.com/Chelsea/StaticText/Game/Fixture")
    

    
    var handle :DatabaseHandle?
    
    var itemsFromFixtures = [fixturesItems]()
    
    var localdateCatcher : AnyObject?
    
    var arrayOfLocal :[AnyObject] = []
    
    
    var localTimeZoneName: String { return TimeZone.current.identifier } //gets the current time zone
    
   
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        print(localTimeZoneName) // "America/Sao_Paulo"
        
        navigationItem.title = "Fixture"
        
        fixturesPresentTimeZone.text = "All Match Fixtures are in Your Local Time: "+localTimeZoneName
        
        fixturesTableView.delegate = self
        
        fixturesTableView.dataSource = self
        
        fetchFromDb()
        
        

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
        return itemsFromFixtures.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = Bundle.main.loadNibNamed("FixturesTableViewCell", owner: self, options: nil)?.first as! FixturesTableViewCell
        
        print(arrayOfLocal)
        
        print(itemsFromFixtures)
        
        cell.time.text = arrayOfLocal[indexPath.row] as! String
        
       // let dict = itemsFromFixtures[indexPath.row].datetime
        
        cell.team1.text = itemsFromFixtures[indexPath.row].teamhome
        
        cell.team2.text = itemsFromFixtures[indexPath.row].teamaway
        
        cell.league.text = itemsFromFixtures[indexPath.row].leaguename
        
        cell.score.text = itemsFromFixtures[indexPath.row].score
        
        cell.layer.borderColor = UIColor.init(red: 49/255, green: 195/255, blue: 231/255, alpha: 1.0).cgColor
        
        cell.layer.borderWidth = 2.0
        
        return cell
        
        
    }

    func fetchFromDb()
    {
        handle = reference.observe(.childAdded, with: { (DataSnapshot) in
            
            if let dictionary = DataSnapshot.value as? [String:AnyObject]
            {
                print(dictionary)
                
                
                for var (item,val) in dictionary
                {
                    print("\(item)and \(val)")
                    
                    if item == "datetime"
                    {
                        
                        let value = String(describing: val)
                        
                        print("The date and time value is \(val)")
                        
                        print(value)

                     
                       let dateformatter = DateFormatter()
                        
                        dateformatter.dateFormat = "yyyy-MM-dd HH:mm"
                        
                        dateformatter.timeZone = NSTimeZone(name: "UTC") as! TimeZone
                        
                         var dateAsString = value //value is in String format so,dateAsString is a String
                        
                         var dateGenerated = dateformatter.date(from: dateAsString)//converting dateAsString into date format
                        
                         dateformatter.dateFormat = "yyyy-MM-dd HH:mm"
                        
                        //dateformatter.dateFormat = "EEE, MMM d, yyyy - h:mm a"
                        
                        dateformatter.timeZone = NSTimeZone.local //converting Date to local timezone
                        
                        //dateformatter.timeZone = TimeZone.autoupdatingCurrent
                       
                        let localDate = dateformatter.string(from: dateGenerated!)//converting dateGenerated into String format
                        
                        print(localDate)
                        
                      //  var aa = localDate+"hello"
                        
                        self.localdateCatcher = localDate as AnyObject //catches the date generated in Anyobject
                        
                        self.arrayOfLocal.append(self.localdateCatcher!)//appends the dates in the array
                
                    }
                }
                
                let itemsFromDatabase = fixturesItems()
                
                itemsFromDatabase.setValuesForKeys(dictionary)
                
                self.itemsFromFixtures.append(itemsFromDatabase)
                
                self.fixturesTableView.reloadData()
                
                
            }
        })
    }

    @IBAction func backButton(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    

}




