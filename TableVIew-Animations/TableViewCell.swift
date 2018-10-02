//
//  TableViewCell.swift
//  MVC
//
//  Created by Mark Moeykens on 5/2/17.
//  Copyright © 2017 Moeykens. All rights reserved.
//

import UIKit

protocol CellWithSetup {
    func setup(model: Model)
}

class TableViewCell: UITableViewCell, CellWithSetup {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var data1Label: UILabel!
    @IBOutlet weak var data2Label: UILabel!
    
    func setup(model: Model) {
        titleLabel.text = model.title
        
        if model.subTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == " " {
            subtitleLabel.isHidden = true
        } else {
            subtitleLabel.isHidden = false
            subtitleLabel.text = model.subTitle
        }
        
        data1Label.text = model.data1
        data2Label.text = model.data2
    }
}
