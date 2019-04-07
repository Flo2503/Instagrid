//
//  gridView.swift
//  Instagrid
//
//  Created by Flo on 31/03/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import UIKit

class FirstGrid: UIView {
    
    

    @IBOutlet weak var topCenterButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    
    @IBOutlet weak var topCenterImage: UIImageView!
    @IBOutlet weak var bottomLetftImage: UIImageView!
    @IBOutlet weak var bottomRightImage: UIImageView!

    @IBAction func didTapButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "tapOnGridButtons"), object: nil)
    }
    
  
    
}
