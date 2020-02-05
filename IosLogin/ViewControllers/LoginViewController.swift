//
//  LoginViewController.swift
//  IosLogin
//
//  Created by Bishal Wagle on 2/3/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class LoginViewController: UIViewController, StoryBoardInitializeable {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        
        // Do any additional setup after loading the view.
    }
    func setUpElements(){
        errorLabel.alpha = 0
           
           Utilities.styleTextField(emailTextField)
           
           Utilities.styleTextField(passwordTextField)
            Utilities.styleFilledButton(loginButton)
           

       }
    
    
    // Login Pressed Takes you to HomeViewController
    @IBAction func logInButtonPressed(){
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
       
        
        Auth.auth().signIn(withEmail: email, password: password){
            (result, error) in
            
            if error != nil {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1;
            }else{
                 let vc = HomeViewController.initFromStoryBoard()
                 self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
        }
        
        
               
       
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
