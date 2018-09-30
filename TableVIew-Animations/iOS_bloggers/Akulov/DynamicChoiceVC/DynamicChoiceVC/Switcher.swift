//
//  Switcher.swift
//  DynamicChoiceVC
//
//  Created by Alexey Efimov on 28.08.2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

class Switcher {
    
    static func choiceRootVC() {
        
        let loggedIn = UserDefaults.standard.bool(forKey: "Logged In")
        var rootVC: UIViewController
        
        if loggedIn {
            rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        } else {
            rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        
    }
}
