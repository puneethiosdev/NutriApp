//
//  SignUpViewController.swift
//  Nutrick
//
//  Created by Puneet JR on 16/03/17.
//  Copyright © 2017 nutrick. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate{

    
    @IBOutlet weak var signUpScrollView: UIScrollView!
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var emailIDText: UITextField!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var createProfile: UIButton!
    
    
    
    var activeField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == passwordText) {
            signUpScrollView.setContentOffset(CGPoint(x: 0, y: 250), animated: true)
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        signUpScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        
        
    }
    
    
    @IBAction func createProfileBtn(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let addGroupViewController = storyBoard.instantiateViewController(withIdentifier: "addGroupContacts") as! AddGroupContactsViewController
        self.present(addGroupViewController, animated:true, completion:nil)
    }


}





    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        //move text fields up
//        let myScreenRect :CGRect = UIScreen.main.bounds
//        let keyboardHeight: CGFloat = 216
//        
//        UIView.beginAnimations("animateView", context: nil)
////        var movementDuration:NSTimeInterval = 0.35
//        var needToMove: CGFloat = 0
//        
//        var frame : CGRect = self.view.frame
//        if (textField.frame.origin.y + textField.frame.size.height + UIApplication.shared.statusBarFrame.size.height > (myScreenRect.size.height - keyboardHeight)) {
//            
//            needToMove = (textField.frame.origin.y + textField.frame.size.height + UIApplication.shared.statusBarFrame.size.height) - (myScreenRect.size.height - keyboardHeight);
//            
//        }
//        
//        frame.origin.y = -needToMove
//        self.view.frame = frame
//        UIView.commitAnimations()
//    }
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        //move textfields back down
//        UIView.beginAnimations( "animateView", context: nil)
////        var movementDuration:NSTimeInterval = 0.35
//        
//        var frame : CGRect = self.view.frame
//        frame.origin.y = 0
//        self.view.frame = frame
//        UIView.commitAnimations()
//    }
//
//    
//    func registerForKeyboardNotifications()
//    {
//        //Adding notifies on keyboard appearing
//        NotificationCenter.default.addObserver(self, selector: #selector(SignUpViewController.keyboardWasShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(SignUpViewController.keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
//    }
//
//
//    func deregisterFromKeyboardNotifications()
//    {
//        //Removing notifies on keyboard appearing
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidShow, object: nil)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidHide, object: nil)    }
//
//    func keyboardWasShown(notification: NSNotification)
//    {
//        //Need to calculate keyboard exact size due to Apple suggestions
//        self.signUpScrollView.isScrollEnabled = true
//        
//        let info : NSDictionary = notification.userInfo! as NSDictionary
//        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
//        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
//
//        self.signUpScrollView.contentInset = contentInsets
//        self.signUpScrollView.scrollIndicatorInsets = contentInsets
//
//        var aRect : CGRect = self.view.frame
//        aRect.size.height -= keyboardSize!.height
//        if activeField != nil
//        {
//            if (!aRect.contains(activeField!.frame.origin))
//            {
//                self.signUpScrollView.scrollRectToVisible(activeField!.frame, animated: true)
//            }
//        }
//    }
//
//
//    func keyboardWillBeHidden(notification: NSNotification)
//    {
//        //Once keyboard disappears, restore original positions
//        let info : NSDictionary = notification.userInfo! as NSDictionary
//        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
//        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, -keyboardSize!.height, 0.0)
//        self.signUpScrollView.contentInset = contentInsets
//        self.signUpScrollView.scrollIndicatorInsets = contentInsets
//        self.view.endEditing(true)
//        self.signUpScrollView.isScrollEnabled = false
//
//    }
//
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        activeField = textField
//        return true
//    }
//    
//
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        activeField = nil
//        
//        return false
//    }
    
