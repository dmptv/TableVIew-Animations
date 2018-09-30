//
//  FloatingActionButton.swift
//  TableVIew-Animations
//
//  Created by 123 on 29.09.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import UIKit

class FloatingActionButton: UIButtonX {

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        UIView.animate(withDuration: 0.3) {
            if self.transform == .identity {
                self.transform = CGAffineTransform(rotationAngle: 45 * (.pi / 180))
                self.backgroundColor = Colors.fabdarkColor
            } else {
                self.transform = .identity
                self.backgroundColor = Colors.fabviewColor
            }
        }
        
        return super.beginTracking(touch, with: event)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
       super.endTracking(touch, with: event)
    }
    

}
