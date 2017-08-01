//
//  ViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 12/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
    
{
    @IBOutlet weak var aboutClubRoundButton: UIButton!
    
  
    @IBOutlet weak var chantsRoundButton: UIButton!

    
    @IBOutlet weak var videosRoundButton: UIButton!
    
    @IBOutlet weak var navigationTableView: UITableView!

    @IBOutlet weak var navigationDrawer: UIView!

    @IBOutlet weak var newsRoundButton: UIButton!
    
    @IBOutlet weak var fixtureRoundButton: UIButton!
    
    @IBOutlet var RightSwipe: UISwipeGestureRecognizer!
    
    @IBOutlet var LeftSwipe: UISwipeGestureRecognizer!
    
    @IBOutlet weak var NavigationDrawerTableView: UITableView!
    
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var commentaryRoundButton: UIButton!
    
    var isNavigationDrawerOff = true
   
    @IBOutlet var tap: UITapGestureRecognizer!
    
    
    let arrayOfSection = ["","More info"]
    
    let arrayOfNavigationContent = [["Check update","Share","Help","About Us","Rate Us","Feedback"],["App Version","Privacy Policy","Terms and Conditions"]]
    
    let imagesOfcells = [["checkUpdate","share","help","aboutUs","rate","feedback"],["appversion","pp","tnc"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Git Setting Up")
        
        navigationTableView.delegate = self
        
        navigationTableView.dataSource = self
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white] //for the title color
        
      

        
        self.navigationController?.navigationBar.isTranslucent = true
        
        newsRoundButton.layer.borderWidth = 2.0
        newsRoundButton.layer.borderColor = UIColor.init(red: 99/225, green: 181/225, blue: 220/225, alpha: 1.0).cgColor
        
        fixtureRoundButton.layer.borderWidth = 2.0
        fixtureRoundButton.layer.borderColor = UIColor.init(red: 99/225, green: 181/225, blue: 220/225, alpha: 1.0).cgColor
        

        
        commentaryRoundButton.layer.borderWidth = 2.0
        commentaryRoundButton.layer.borderColor = UIColor.init(red: 99/225, green: 181/225, blue: 220/225, alpha: 1.0).cgColor
        

        chantsRoundButton.layer.borderWidth = 2.0
        chantsRoundButton.layer.borderColor = UIColor.init(red: 99/225, green: 181/225, blue: 220/225, alpha: 1.0).cgColor
        
        videosRoundButton.layer.borderWidth = 2.0
        videosRoundButton.layer.borderColor = UIColor.init(red: 99/225, green: 181/225, blue: 220/225, alpha: 1.0).cgColor
        
        aboutClubRoundButton.layer.borderWidth = 2.0
        aboutClubRoundButton.layer.borderColor = UIColor.init(red: 99/225, green: 181/225, blue: 220/225, alpha: 1.0).cgColor
        

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews()
    {
        newsRoundButton.layer.cornerRadius =
            (newsRoundButton.frame.size.width)/2.0
        
        fixtureRoundButton.layer.cornerRadius =
            (fixtureRoundButton.frame.size.width)/2.0
        
        videosRoundButton.layer.cornerRadius = (videosRoundButton.frame.size.width)/2.0
        
        commentaryRoundButton.layer.cornerRadius = (commentaryRoundButton.frame.size.width)/2.0
        
        aboutClubRoundButton.layer.cornerRadius = (aboutClubRoundButton.frame.size.width)/2.0
        
       chantsRoundButton.layer.cornerRadius = (chantsRoundButton.frame.size.width)/2.0
        
    }
    
    @IBAction func newsButton(_ sender: UIButton)
    {
        let source = self.storyboard?.instantiateViewController(withIdentifier: "NewsTitleViewController")as! NewsTitleViewController
        
        self.navigationController?.pushViewController(source, animated: true)
        
    
    }
    
    @IBAction func fixturesButton(_ sender: UIButton)
    {
        let source = self.storyboard?.instantiateViewController(withIdentifier: "FixturesViewController")as! FixturesViewController
        
        self.navigationController?.pushViewController(source, animated: true)
        
    }
    
    @IBAction func videoButton(_ sender: UIButton)
    {
        let source = self.storyboard?.instantiateViewController(withIdentifier: "VideosViewController")as! VideosViewController
        
        self.navigationController?.pushViewController(source, animated: true)
        
    }
    
    
    @IBAction func commentaryButton(_ sender: UIButton)
    {
        let source = self.storyboard?.instantiateViewController(withIdentifier: "CommentaryViewController")as! CommentaryViewController
        
        self.navigationController?.pushViewController(source, animated: true)
        
    }
    
    @IBAction func aboutClubButton(_ sender: UIButton)
    {
        let source = self.storyboard?.instantiateViewController(withIdentifier: "AboutClubViewController")as! AboutClubViewController
        
        self.navigationController?.pushViewController(source, animated: true)
    }
    

    @IBAction func chantsButton(_ sender: UIButton)
    {
        let source = self.storyboard?.instantiateViewController(withIdentifier: "ChantsViewController")as! ChantsViewController
        
        self.navigationController?.pushViewController(source, animated: true)
    }


    @IBAction func RightSwipe(_ sender: UISwipeGestureRecognizer)
    {
        leftConstraint.constant = 0
        
        UIView.animate(withDuration: 0.3)
        {
            self.view.layoutIfNeeded()
        }
        
        isNavigationDrawerOff = false
    }

    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer)
    {
        leftConstraint.constant = -220
        
        UIView.animate(withDuration: 0.3)
        {
           self.view.layoutIfNeeded()
        }
        
        isNavigationDrawerOff = true
    }
    @IBAction func tap(_ sender: UITapGestureRecognizer)
    {
        leftConstraint.constant = -220
        
        UIView.animate(withDuration: 0.3)
        {
            self.view.layoutIfNeeded()
        }
        
        isNavigationDrawerOff = true
        
    }
    @IBAction func navigateButton(_ sender: UIButton)
    {
        if isNavigationDrawerOff
        {
            leftConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.view.layoutIfNeeded()
            })
            
            isNavigationDrawerOff = false
        }
            
        else
        {
            leftConstraint.constant = -220
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.view.layoutIfNeeded()
            })
            
            isNavigationDrawerOff = true
        }
    }
    @IBAction func navigate(_ sender: UIBarButtonItem)
    {
        if isNavigationDrawerOff
        {
            leftConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.view.layoutIfNeeded()
            })
            
            isNavigationDrawerOff = false
        }
        
        else
        {
            leftConstraint.constant = -220
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.view.layoutIfNeeded()
            })
            
            isNavigationDrawerOff = true
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return arrayOfSection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return self.arrayOfSection [section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.arrayOfNavigationContent[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as UITableViewCell
        
        if cell == nil
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
       
        
        cell.imageView?.image = UIImage(named: imagesOfcells[indexPath.section][indexPath.row])
        
        cell.textLabel?.text = self.arrayOfNavigationContent[indexPath.section][indexPath.row]
        
        cell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 15.0)
        
        let bgColorView = UIView()
        
        bgColorView.backgroundColor = UIColor.white
        
        cell.selectedBackgroundView = bgColorView

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50.0
    
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)//for changing the color of the header that is the section of tableview
    {
        
        view.tintColor = UIColor.init(red: 3/255, green: 70/255, blue: 148/255, alpha: 1.0)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.section == 0 && indexPath.row == 3
        {
            let source = self.storyboard?.instantiateViewController(withIdentifier: "AboutUsViewController")as! AboutUsViewController
            
            self.navigationController?.pushViewController(source, animated: true)
            
            source.id = "AboutUs"
           
        }
        
        else if indexPath.section == 0 && indexPath.row == 1
        {
            let textToShare = "Swift is awesome!  Check out this website about it!"
            
            if let myWebsite = NSURL(string: "http://www.codingexplorer.com/")
            {
                let objectsToShare = [textToShare, myWebsite] as [Any]

                
               let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                
                activityViewController.excludedActivityTypes = [UIActivityType.addToReadingList]
                
                present(activityViewController, animated: true, completion: nil)
            }
        }
        
       else if indexPath.section == 0 && indexPath.row == 2
        {
            let source = self.storyboard?.instantiateViewController(withIdentifier: "HelpViewController")as! HelpViewController
            
            self.navigationController?.pushViewController(source, animated: true)
            
        }
            
        else if indexPath.section == 0 && indexPath.row == 5
        {
            let source = self.storyboard?.instantiateViewController(withIdentifier: "FeedbackViewController")as! FeedbackViewController
            
            self.navigationController?.pushViewController(source, animated: true)
        }
        else if indexPath.section == 0 && indexPath.row == 0
        {
           let bundleId = "id469863705"
            //
//            = Bundle.main.bundleIdentifier
            
            print(bundleId)
            
            
            let appID = "959379869"
            let reviewString = "https://itunes.apple.com/us/app/id\(bundleId)?ls=1&mt=8&action=write-review"
            
            if let checkURL = URL(string: "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=\(bundleId)")
            {
                open(url: checkURL)
            } else {
                print("invalid url")
            }
            
          
            
     
            
//            guard let url = URL(string : "itms-apps://itunes.apple.com/app/" + bundleId) else
//            {
//                completion(false)
//                
//                return
//            }
//            guard #available(iOS 10, *) else {
//                
//                completion(UIApplication.shared.openURL(url))
//                return
//            }
//            UIApplication.shared.open(url, options: [:], completionHandler: completion)

            
            
        }
        
        else if indexPath.section == 1 && indexPath.row == 0
        {
            let appInfo = Bundle.main.infoDictionary as! Dictionary<String,AnyObject>
            
            let shortVersionString = appInfo["CFBundleShortVersionString"] as! String
            
            let bundleVersion      = appInfo["CFBundleVersion"] as! String
            
            print(appInfo)
            
            print(shortVersionString)
            
            print(bundleVersion)
            
            let alert = UIAlertController(title: "App Version", message: "The present App version is : " + shortVersionString, preferredStyle:.actionSheet)//.alert
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                print(shortVersionString)
            }))
            
            present(alert, animated: true, completion: nil)
      
        }
        
            
        else if indexPath.section == 1 && indexPath.row == 1
        {
            let source = self.storyboard?.instantiateViewController(withIdentifier: "AboutUsViewController")as! AboutUsViewController
            
            self.navigationController?.pushViewController(source, animated: true)
            
            source.id = "PrivacyPolicy"
            
        }
        
            
        else if indexPath.section == 1 && indexPath.row == 2
        {
            let source = self.storyboard?.instantiateViewController(withIdentifier: "AboutUsViewController")as! AboutUsViewController
            
            self.navigationController?.pushViewController(source, animated: true)
            
            source.id = "TermsAndConditions"
        }
    
    }
    func open(url: URL) {
        if #available(iOS 10, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                print("Open \(url): \(success)")
            })
        }
        else
            {
                print("Open \(url)")
            }
        }
    
    
    }



