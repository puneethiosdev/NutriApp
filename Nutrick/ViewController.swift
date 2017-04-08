//
//  ViewController.swift
//  Nutrick
//
//  Created by Puneet JR on 15/03/17.
//  Copyright © 2017 nutrick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
 
    @IBOutlet weak var mobileNumberTxt: UITextField!
    @IBOutlet weak var countryCode: UITextField!
    @IBOutlet weak var requestCode: UIButton!
    @IBOutlet weak var activationCodeLbl: UILabel!
    
    
    let limitLength = 12 // mobile number text limit
    let otpLimitLength = 4 //OTP text limit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mobileNumberTxt.delegate = self
    }


    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= limitLength
    }
    
//    func checkMaxLength(textField: UITextField!, maxLength: Int) {
//        if (countElements(textField.text!) > maxLength) {
//            textField.deleteBackward()
//        }
//    }
    
    
    @IBAction func requestCodeBtn(_ sender: Any) {
        
        SendOTP()
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "activationCode") as! SignUpViewController
        self.present(nextViewController, animated:true, completion:nil)
        
        
        
//        var inputTextField: UITextField?
        
//        //Create the AlertController
//        let actionSheetController: UIAlertController = UIAlertController(title: "Verify OTP", message: "Enter OTP for your mobile number", preferredStyle: .alert)
//        
//        //Create and add the Cancel action
//        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
//            //Do some stuff
//        }
//        actionSheetController.addAction(cancelAction)
//        //Create and an option action
//        let nextAction: UIAlertAction = UIAlertAction(title: "verify", style: .default) { action -> Void in
//            //Do some other stuff
//        }
//        actionSheetController.addAction(nextAction)
//        //Add a text field
//        //        actionSheetController.addTextField { textField -> Void in
//        //            // you can use this text field
//        //            inputTextField = textField
//        //        }
//        
//        actionSheetController.addTextField { (textFieldOTP) in
//            textFieldOTP.placeholder = "Enter OTP"
//            textFieldOTP.keyboardType = .numberPad
//            inputTextField = textFieldOTP
//        }
//        
//        //Present the AlertController
//        self.present(actionSheetController, animated: true, completion: nil)
        
        
        
        
        //        // Create the alert controller
        //        let alertController = UIAlertController(title: "OTP", message: "Enter OTP", preferredStyle: .alert)
        //
        //        // Create the actions
        //        let VerifyAction = UIAlertAction(title: "Verify", style: UIAlertActionStyle.default) {
        //            UIAlertAction in
        //            NSLog("Verify Button Pressed")
        //        }
        //        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
        //            UIAlertAction in
        //            NSLog("Cancel Button Pressed")
        //        }
        //
        //        // Add the actions
        //        alertController.addAction(VerifyAction)
        //        alertController.addAction(cancelAction)
        //
        //        // Present the controller
        //        self.present(alertController, animated: true, completion: nil)
        
        

        
    }
    
    
    func SendOTP() {
    
        let parameters = ["phone_number": mobileNumberTxt.text] as! Dictionary<String, String>
        
        //create the url with URL
        let url = URL(string: "http://35.167.26.174:81/users/api/v0/user_create/")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
        request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    // handle json...
                    

                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    func verifyOTP() {
        
        let parameters = ["phone_number": mobileNumberTxt.text] as! Dictionary<String, String>
        
        //create the url with URL
        let url = URL(string: "/users/api/v0/user_verify/{phone_number}/")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "PUT" //set http method as PUT
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    // handle json...
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
}





