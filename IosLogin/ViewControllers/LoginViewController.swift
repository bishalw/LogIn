//
//  LoginViewController.swift
//  IosLogin
//
//  Created by Bishal Wagle on 2/3/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, StoryBoardInitializeable {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
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
            Utilities.styleFilledButton(loginButton)
           

       }
    // Login Pressed Takes you to HomeViewController
    @IBAction func logInButtonPressed(){
        let vc = HomeViewController.initFromStoryBoard()
               
               
        self.navigationController?.pushViewController(vc, animated: true)
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
