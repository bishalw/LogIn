//
//  ViewController.swift
//  IosLogin
//  Created by Bishal Wagle on 2/3/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iOSLogin"
        
        setUpElements()
        // Do any additional setup after loading the view.
    }
   
    func setUpElements(){
                Utilities.styleFilledButton(signUp)
                Utilities.styleHollowButton(login)
              
                 
             }
 
    
    // signupButtonPressed takes you to SignUpViewController Page
    @IBAction func  signUpButtonPressed() {
        let signUpViewController = SignUpViewController.initFromStoryBoard()
       
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    // loginButtonPressed takes you to LoginViewController Page
    @IBAction func loginButtonPressed(){
        let vc = LoginViewController.initFromStoryBoard()
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
   
       
    
  
     
    

}

