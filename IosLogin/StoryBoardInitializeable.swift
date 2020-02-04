//
//  StoryBoardInitializer.swift
//  IosLogin
//
//  Created by Bishal Wagle on 2/3/20.
//  Copyright © 2020 Bishal Wagle. All rights reserved.
//

import Foundation
import UIKit

protocol StoryBoardInitializeable {
    static var storyboardName: String { get }
    static var storybaordID: String { get }
    static func initFromStoryBoard() -> Self
    
}



extension StoryBoardInitializeable where Self: UIViewController {
    
    static var storyboardName: String {
        return "Main"
    }
    
    static var storybaordID: String {
        return String(describing: self)
    }
    
    static func initFromStoryBoard() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: storybaordID) as? Self {
            return vc
        } else {
            print("[StoryboardInitializable]  [ERROR]  Cannot cast vc properly ID Mismatch")
            fatalError()
        }
    }
}
