//
//  SignUpViewController.swift
//  IosLogin
//
//  Created by Bishal Wagle on 2/3/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController, StoryBoardInitializeable {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
  
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
  
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpElements()
     

        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        
        Utilities.styleTextField(firstNameTextField)
        
        Utilities.styleTextField(lastNameTextField)
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
        

    }
    
    //check the fields and validatee that the data is correct. If everything is coorect, this method returns nil. Otherwise it returns the error message
    
    func validateFields()-> String?{
        //check all fields filled in
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        // check if password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false  {
            return "Please make sure your password is atleast 8 characters, contains a special character and a number."
        }
        return nil
    }
    
        
    // SignUp button pressed takees you to LoginViewController
    @IBAction func  signUpButtonPressed() {
        
        // validate
        let error = validateFields()
        
        if error != nil {
            // Theres something wrong with the fields, show error message
            
            showError(error!)
            
        }else{
            
            // Create cleaned versionas of the data
            
            let firstName  = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName  = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email  = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password  = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if  err != nil{
                    // There was an error creating the user
                    
                    self.showError("Error creating user")
                }else{
                    //user created sucessfull, storethe first and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname": lastName, "uid": result!.user.uid]) { (error)  in
                    if error != nil {
                        self.showError("Error saving user data ")
                    }
                    
                }
                let vc = LoginViewController.initFromStoryBoard()
                
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
           
        }
        
    
        
        
    }
    }
    func showError(_ message:String){
               errorLabel.text = message
               errorLabel.alpha = 1
           }
    
          

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    }

