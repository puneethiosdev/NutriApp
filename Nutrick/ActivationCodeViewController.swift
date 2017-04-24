//
//  ActivationCodeViewController.swift
//  Nutrick
//
//  Created by Puneet JR on 09/04/17.
//  Copyright © 2017 nutrick. All rights reserved.
//

import UIKit

class ActivationCodeViewController: UIViewController, CodeInputViewDelegate {
    @IBOutlet weak var activationCodeTitle: UILabel!
    @IBOutlet weak var enterOTPLbl: UILabel!
    @IBOutlet weak var noCodeLbl: UILabel!
    @IBOutlet weak var requestNewCodeBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let codeInputView = CodeInputView(frame: CGRect(x: (view.frame.width-215)/2, y: 230, width: 215, height: 60))
        codeInputView.delegate = self
        codeInputView.tag = 17
        view.addSubview(codeInputView)
        
        codeInputView.becomeFirstResponder()
    }
    
    func codeInputView(codeInputView: CodeInputView, didFinishWithCode code: String) {
        let title = code == "1234" ? "Verification Successful!" : "Verification Failed!"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel) { _ in
            if (title == "Verification Successful!") {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let profileCreateViewController = storyBoard.instantiateViewController(withIdentifier: "SignUpUserDetails") as! SignUpViewController
                self.present(profileCreateViewController, animated:true, completion:nil)
            } else {
                (self.view.viewWithTag(17)! as! CodeInputView).clear()
            }
        })
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func requestNewOTPBtn(_ sender: Any) {
        let firstViewController = ViewController()
        firstViewController.SendOTP()
    }
    

}
