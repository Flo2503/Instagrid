//
//  Share.swift
//  Instagrid
//
//  Created by Flo on 07/04/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import UIKit

class Share: UIView {

    
    
    @IBAction func swipeToShare(_ sender: UISwipeGestureRecognizer) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "swipeToShare"), object: nil)
        
    }
    
   
    
    
    
    
}

