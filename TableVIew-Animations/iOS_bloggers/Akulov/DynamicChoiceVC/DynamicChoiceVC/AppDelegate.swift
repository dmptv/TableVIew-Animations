//
//  AppDelegate.swift
//  DynamicChoiceVC
//
//  Created by Alexey Efimov on 24.08.2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

let primaryColor = UIColor(red: 210/255, green: 109/255, blue: 128/255, alpha: 1)
let secondaryColor = UIColor(red: 107/255, green: 148/255, blue: 230/255, alpha: 1)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        Switcher.choiceRootVC()
        
        return true
    }

//    private func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        
//        Switcher.choiceRootVC()
//        
//        return true
//    }
}

