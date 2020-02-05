//
//  ViewController.swift
//  IosLogin
//  Created by Bishal Wagle on 2/3/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer:AVPlayer?
    
    var videoPlayerLayer: AVPlayerLayer?

    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        setUpElements()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        // set up video in the backgroudnd
        setUpVideo()
        
        
        
    }
   
    func setUpElements(){
                Utilities.styleFilledButton(signUp)
                Utilities.styleHollowButton(login)
              
                 
             }
    func setUpVideo(){
        // get the path to the resource in the bundel
        
        let bundlePath = Bundle.main.path(forResource: "loginVid", ofType: "mov")
        
        //create a URL from it
        guard bundlePath != nil else{
            return
        }
        //create a url
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        
        //create video player item
        let item = AVPlayerItem(url: url)
        
    
        //create player
        
        videoPlayer = AVPlayer(playerItem: item)
        
        //create layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
 
        //adjust size
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0,
            width:self.view.frame.size.width*4, height:
            self.view.frame.size.height)
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        videoPlayer?.playImmediately(atRate: 0.3)
        //display and play it
        
        //add it to the view
        
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

