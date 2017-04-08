//
//  ActivationCodeViewController.swift
//  Nutrick
//
//  Created by Puneet JR on 09/04/17.
//  Copyright © 2017 nutrick. All rights reserved.
//

import UIKit

class ActivationCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let codeInputView = CodeInputView(frame: CGRect(x: (view.frame.width-215)/2, y: 242, width: 215, height: 60))
        codeInputView.delegate = self
        codeInputView.tag = 17
        view.addSubview(codeInputView)
        
        codeInputView.becomeFirstResponder()
    }
    
    func codeInputView(codeInputView: CodeInputView, didFinishWithCode code: String) {
        let title = code == "1234" ? "Correct!" : "Wrong!"
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel) { _ in
            (self.view.viewWithTag(17)! as! CodeInputView).clear()
        })
        presentViewController(alert, animated: true, completion: nil)
    }

}
