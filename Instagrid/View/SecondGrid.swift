//
//  SecondGrid.swift
//  Instagrid
//
//  Created by Flo on 02/04/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import UIKit

class SecondGrid: UIView {

    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var bottomCenterButton: UIButton!
    
    @IBOutlet weak var topLeftImage: UIImageView!
    @IBOutlet weak var bottomCenterImage: UIImageView!
    @IBOutlet weak var topRightImage: UIImageView!

    @IBAction func didTapButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "tapOnGridButtons"), object: nil)
    }


}
