//
//  ContactInput.swift
//  Contacts
//
//  Created by Ali Alsayed on 9/15/14.
//  Copyright (c) 2014 Ali Alsayed. All rights reserved.
//

import UIKit

protocol dataUpdated: NSObjectProtocol {
    
    func didUpdateContact(senderClass: AnyObject, aName: String, aPhoneNumber: String)
}


class ContactInput: UIViewController, UITextFieldDelegate {
    
    //properties
    var name = ""
    var phoneNumber = ""
    var delegate: dataUpdated?
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    
    //Textfield delegates
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        if textField.tag == 1 {
            
            self.name = textField.text
        }
            
        else {
            
            self.phoneNumber = textField.text
        }
        
        
        
        println("Name: \(self.name), Phone: \(self.phoneNumber)")
      
        
        textField.resignFirstResponder()
        
        return true
        
        
        
    }
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameField.delegate = self
        self.phoneField.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        if name != "" && phoneNumber != "" {
        
        self.delegate!.didUpdateContact(self, aName: self.name, aPhoneNumber: self.phoneNumber)
        }
    }
    

    
}
