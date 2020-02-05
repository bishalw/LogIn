//
//  Utilities.swift
//  IosLogin
//
//  Created by Bishal Wagle on 2/4/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//


import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 92/255, green: 203/255, blue: 207/255, alpha: 1).cgColor
        
        //UIColor red: 92/255.0, green: 203/255.0, blue: 207/255.0, alpha: 1.0,
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor =  UIColor( red: CGFloat(92/255.0), green: CGFloat(203/255.0), blue: CGFloat(207/255.0), alpha: CGFloat(1.0) )
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor( red: CGFloat(92/255.0), green: CGFloat(203/255.0), blue: CGFloat(207/255.0), alpha: CGFloat(1.0) )
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
}
