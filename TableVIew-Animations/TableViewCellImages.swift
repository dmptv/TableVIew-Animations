//
//  TableViewCellImages.swift
//  TableVIew-Animations
//
//  Created by 123 on 02.10.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import UIKit

class TableViewCellImages: UITableViewCell, CellWithSetup {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var data1Label: UILabel!
    @IBOutlet weak var data2Label: UILabel!
    @IBOutlet weak var profileStackview: UIStackView!
    @IBOutlet weak var placeHoldeImageview: UIImageViewX?
    
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
        
        if let placeHoldeImageview = placeHoldeImageview {
            profileStackview.removeArrangedSubview(placeHoldeImageview)
            placeHoldeImageview.removeFromSuperview()
            self.placeHoldeImageview = nil
        }
                
        if model.images.count > 0 {
            model.images.forEach {
                let imageView = UIImageViewX(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
                imageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
                imageView.image = $0
                imageView.layer.borderColor = UIColor.lightGray.cgColor
                imageView.layer.borderWidth = 1
                imageView.layer.cornerRadius = 18
                imageView.layer.masksToBounds = true
                profileStackview.addArrangedSubview(imageView)
            }
        }
    }

}
