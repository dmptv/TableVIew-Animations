//
//  WelcomeViewController.swift
//  DynamicChoiceVC
//
//  Created by Alexey Efimov on 24.08.2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the background gradient
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        setLoginButton()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
}

extension WelcomeViewController {
    
    private func setLoginButton() {
        let loginButton = UIButton()
        loginButton.backgroundColor = UIColor(hexValue: "#3B5999", alpha: 1)
        loginButton.setTitle("Log In", for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.frame = CGRect(x: 32,
                                   y: 320,
                                   width: view.frame.width - 64,
                                   height: 50)
        loginButton.layer.cornerRadius = 4
        loginButton.addTarget(self,
                              action: #selector(openHomeViewController),
                              for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    @objc private func openHomeViewController() {
        
        UserDefaults.standard.set(true, forKey: "Logged In")
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = storyBoard.instantiateViewController(
            withIdentifier: "HomeViewController") as! HomeViewController
        
        present(homeViewController, animated: true, completion: nil)
    }
}
