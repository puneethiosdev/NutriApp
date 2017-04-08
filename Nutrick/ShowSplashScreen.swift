//
//  ShowSplashScreen.swift
//  Nutrick
//
//  Created by Puneet JR on 15/03/17.
//  Copyright © 2017 nutrick. All rights reserved.
//

import UIKit

class ShowSplashScreen: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        perform(#selector(ShowSplashScreen.showNavController), with: nil, afterDelay: 2)
    }

    func showNavController() {
        performSegue(withIdentifier: "showSplashScreen", sender: self)
    }

}
