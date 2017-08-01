//
//  VideosViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 13/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit

class VideosViewController: UIViewController {

    @IBOutlet weak var VideoWebView: UIWebView!
    
    @IBOutlet weak var hud: UIActivityIndicatorView!
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        hud.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
         hud.stopAnimating()
    }
    override func viewDidLoad()
    {
        
        
        super.viewDidLoad()
        
        
       
        
    let ref = "https://www.google.com"
        
        let url = NSURL(string: ref)
        
        let requestObject = NSURLRequest(url: url as! URL)
        
        
       VideoWebView.loadRequest(requestObject as URLRequest)
        
        hud.stopAnimating()
        
        
        
        
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButton(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }

   
}
