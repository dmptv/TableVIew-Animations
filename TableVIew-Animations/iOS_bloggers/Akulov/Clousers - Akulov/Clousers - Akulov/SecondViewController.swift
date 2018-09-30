//
//  SecondViewController.swift
//  Clousers - Akulov
//
//  Created by 123 on 15.11.17.
//  Copyright © 2017 123. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    var completion: ((String) -> ())?
    
    
    @IBAction func backPressed(sender: UIButton) {
        
        getDataAndBack()
    }
    
    private func getDataAndBack() {
        // 2 условия в guard
        guard let text = textfield.text, text != "" else {
            // pass data back via clouser
            completion?("No Data")
            navigationController?.popViewController(animated: true)
            return
        }
        completion?(text)
        navigationController?.popViewController(animated: true)
    }
    

}
