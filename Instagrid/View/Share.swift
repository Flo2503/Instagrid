//
//  Share.swift
//  Instagrid
//
//  Created by Flo on 07/04/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import UIKit

class Share: UIView {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var swipeIcon: UIImageView!
    
    @IBAction func swipeToShare(_ sender: UISwipeGestureRecognizer) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "swipeToShare"), object: nil)
        
    }
    
    
    
    func swipeOrientation() {
        if UIDevice.current.orientation.isLandscape {
            label.text = "Swipe left to share"
            swipeIcon.image = UIImage(named: "arrow left")
        } else if UIDevice.current.orientation.isPortrait {
            label.text = "Swipe up to share"
            swipeIcon.image = UIImage(named: "arrow up")
        }
    }
   
    
    
    
}

