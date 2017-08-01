//
//  AboutClubViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 26/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit

class AboutClubViewController: UITabBarController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        
        
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.init(red: 49/255, green: 195/255, blue: 231/255, alpha: 1.0)], for: .selected)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)

        UITabBar.appearance().tintColor = UIColor.init(red: 49/255, green: 195/255, blue: 231/255, alpha: 1.0)
        
        self.tabBar.isTranslucent = false
        
        self.tabBar.barTintColor = UIColor.init(red: 3/255, green: 70/255, blue: 148/255, alpha: 1.0)
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
