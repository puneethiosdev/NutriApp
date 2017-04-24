//
//  CreateNewGroupViewController.swift
//  Nutrick
//
//  Created by Puneet JR on 09/04/17.
//  Copyright © 2017 nutrick. All rights reserved.
//

import UIKit

class CreateNewGroupViewController: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var groupProfileImage: UIImageView!
    @IBOutlet weak var groupName: UITextField!
    @IBOutlet weak var separato1: UILabel!
    @IBOutlet weak var contactsTitle: UILabel!
    @IBOutlet weak var separator2: UILabel!
    @IBOutlet weak var groupContactsTableView: UITableView!
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var createGroupBtn: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backActionBtn(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let createNewGroupViewController = storyBoard.instantiateViewController(withIdentifier: "addGroupContacts") as! AddGroupContactsViewController
        self.present(createNewGroupViewController, animated:true, completion:nil)
    }
    
    @IBAction func createGroupActionBtn(_ sender: Any) {
    }
    
}
