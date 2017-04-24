//
//  AddGroupContactsViewController.swift
//  Nutrick
//
//  Created by Puneet JR on 09/04/17.
//  Copyright © 2017 nutrick. All rights reserved.
//

import UIKit
import Contacts


class AddGroupContactsCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var checkBoxImage: UIImageView!
}
    
class AddGroupContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var contactsTableView: UITableView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var cancelBtn: UIBarButtonItem!
    @IBOutlet weak var addContactsBtn: UIBarButtonItem!

    var contactNames = ["Puneet", "Vijay", "VijayaLakshmi", "Swathi", "Vivek", "Naveen",
                       "Rahul", "Siddharth", "Momitha"]
    
//    var contactsWithPhoneNumber = [CNContact]()
//    
//    let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNPhoneNumber()] as [Any]
//    let store = CNContactStore()
//    let contacts = try self.store.unifiedContactsMatchingPredicate(CNContact.predicateForContactsMatchingName("Appleseed"), keysToFetch:[CNContactGivenNameKey, CNContactFamilyNameKey, CNPhoneNumber()])
    
//    let fetchRequest = CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey])
//    try! contactStore.enumerateContactsWithFetchRequest(fetchRequest) { contact, stop in
//    if contact.phoneNumbers.count > 0 {
//    contactsWithPhoneNumbers.append(contact)
//    }
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTableView.rowHeight = 50
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        self.contactsTableView.reloadData()

    }
    
    @IBAction func addGroupContacts(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let createNewGroupViewController = storyBoard.instantiateViewController(withIdentifier: "createNewGroup") as! CreateNewGroupViewController
        self.present(createNewGroupViewController, animated:true, completion:nil)
        
    }
    
    @IBAction func cancelActionBtn(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let cancelViewController = storyBoard.instantiateViewController(withIdentifier: "SignUpUserDetails") as! SignUpViewController
        self.present(cancelViewController, animated:true, completion:nil)
        
    }
    
    //MARK : UITableViewDatasource
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section) {
        case 0 : return "Nutrick User Contacts"
        case 1:return "Non Nutrick User Contacts"
            
        default :return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let title = self.tableView(tableView, titleForHeaderInSection: section)
        if (title == "") {
            return 0.0
        }
        return 40.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addGroupContactsCell", for: indexPath) as! AddGroupContactsCell
        
//        cell.accessoryType = (lastSelectedIndexPath?.row == indexPath.row) ? .checkmark : .none
        
        let contactName = contactNames[indexPath.row]
        cell.nameLbl.text = contactName
//        cell.checkBoxImage.image = UIImage(named: contactName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
    }
    
}
