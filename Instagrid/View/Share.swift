//
//  Share.swift
//  Instagrid
//
//  Created by Flo on 07/04/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import UIKit

class Share: UIView {

//Outlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var swipeIcon: UIImageView!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!

//Sender swipe to share
    @IBAction func swipeToShare(_ sender: UISwipeGestureRecognizer) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "swipeToShare"), object: nil)
        
    }
    
//Swipe label, icon label and swipe direction actualize according to the orientation of the device
    func swipeOrientation() {
        if UIDevice.current.orientation.isLandscape {
            label.text = "Swipe left to share"
            swipeIcon.image = UIImage(named: "arrow left")
            swipeGesture.direction = .left
        } else if UIDevice.current.orientation.isPortrait {
            label.text = "Swipe up to share"
            swipeIcon.image = UIImage(named: "arrow up")
            swipeGesture.direction = .up
        }
    }
    
        
}

