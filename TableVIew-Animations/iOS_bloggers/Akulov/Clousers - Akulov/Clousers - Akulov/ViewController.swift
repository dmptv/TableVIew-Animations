//
//  ViewController.swift
//  Clousers - Akulov
//
//  Created by 123 on 15.11.17.
//  Copyright © 2017 123. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        // instead of - &&
        if case let controller as SecondViewController = segue.destination,
            segue.identifier == "segue" {
            
            // get clouser 
            controller.completion = { [unowned self] text in
                self.label.text = text
            }
        }
    }
   


}

