//
//  SignUpViewController.swift
//  IosLogin
//
//  Created by Bishal Wagle on 2/3/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, StoryBoardInitializeable {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
     

        // Do any additional setup after loading the view.
    }
    // SignUp button pressed takees you to LoginViewController
    @IBAction func  signUpButtonPressed() {
        let vc = LoginViewController.initFromStoryBoard()
        
        
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
