//
//  FeedbackViewController.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 17/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FeedbackViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet weak var scrollOfFeedback: UIScrollView!
    @IBOutlet weak var query: UITextView!
    
    @IBOutlet weak var fullname: UITextField!
    
    @IBOutlet weak var emailAddress: UITextField!
    
    @IBOutlet var tap: UITapGestureRecognizer!
    
    var systemVersion :String?
    
    var deviceName :String?
    
    var modelName :String?
    
    let reference = Database.database().reference(fromURL: "https://chelsea-news-3f908.firebaseio.com/Chelsea/UserQuery/QueryData")
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        systemVersion = UIDevice.current.systemVersion
        
        deviceName = UIDevice.current.name
        
         modelName = UIDevice.current.modelName
        
     
        
        print(systemVersion)
        
        print(deviceName)
        
        print(modelName)


        query.layer.borderColor = UIColor.lightGray.cgColor
        
        query.layer.borderWidth = 2.0
        
        fullname.text = ""
        
        emailAddress.text = ""
        
        query.text = ""
        
        fullname.delegate = self
        
        emailAddress.delegate = self
        
        query.delegate = self
      
   
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sendButton(_ sender: UIButton)
    {

        if ((emailAddress.text == "") || (fullname.text == "" )||(query.text == ""))
        {
            let alertFilltheForm = UIAlertController(title: "Field is Empty", message: "Please fill all the fields!", preferredStyle: .alert)
            
            alertFilltheForm.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
                print("Alert Here")
            }))
            
            present(alertFilltheForm, animated: true, completion: nil)
            
        }
        
        else
        {
            
        let QueryData = reference.child("ios").childByAutoId()
        
        QueryData.child("device").setValue(modelName)
            
        QueryData.child("systemVersion").setValue(systemVersion)
        
        QueryData.child("mail").setValue(emailAddress.text)
        
        QueryData.child("msg").setValue(query.text)
        
        QueryData.child("name").setValue(fullname.text)
    
        let alert = UIAlertController(title: "Sent Successfully", message: "Your Feedback has been sent!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
            print("Alert Here")
        }))
            
        present(alert, animated: true, completion: nil)
        
        viewDidLoad()
            
        }
    
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        return
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return true
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer)
    {
        self.view.endEditing(true)
    }
    @IBAction func backButton(_ sender: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
}

public extension UIDevice // for getting the device name
{
    
    var modelName: String {
        
        var systemInfo = utsname()
        
        uname(&systemInfo)
        
        let machineMirror = Mirror(reflecting: systemInfo.machine)

        let identifier = machineMirror.children.reduce(""){ identifier, element in
            
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }

}
