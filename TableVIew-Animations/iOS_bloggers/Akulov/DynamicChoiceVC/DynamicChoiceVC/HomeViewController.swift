//
//  HomeViewController.swift
//  DynamicChoiceVC
//
//  Created by Alexey Efimov on 24.08.2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the background gradient
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        setLogoutButton()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
}

extension HomeViewController {
    
    private func setLogoutButton() {
        let logoutButton = UIButton()
        logoutButton.backgroundColor = UIColor(hexValue: "#3B5999", alpha: 1)
        logoutButton.setTitle("Log Out", for: .normal)
        logoutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.frame = CGRect(x: 32,
                                    y: view.frame.height - 128,
                                    width: view.frame.width - 64,
                                    height: 50)
        logoutButton.layer.cornerRadius = 4
        logoutButton.addTarget(self,
                               action: #selector(openToWelcomeVC),
                               for: .touchUpInside)
        view.addSubview(logoutButton)
    }
    
    @objc private func openToWelcomeVC() {
        UserDefaults.standard.set(false, forKey: "Logged In")
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let welcomeViewController = storyBoard.instantiateViewController(
            withIdentifier: "WelcomeViewController") as! WelcomeViewController
        
        present(welcomeViewController, animated: true, completion: nil)
    }
}
