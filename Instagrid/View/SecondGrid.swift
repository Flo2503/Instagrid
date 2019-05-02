//
//  SecondGrid.swift
//  Instagrid
//
//  Created by Flo on 02/04/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import UIKit

class SecondGrid: GridView {
    
    var currentImageView: UIImageView?

    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var bottomCenterButton: UIButton!
    
    @IBOutlet weak var topLeftImage: UIImageView!
    @IBOutlet weak var bottomCenterImage: UIImageView!
    @IBOutlet weak var topRightImage: UIImageView!

    @IBAction func didTapButtonTL(_ sender: UIButton) {
        currentImageView = topLeftImage
        NotificationCenter.default.post(name: Notification.Name(rawValue: "tapOnGridButtons"), object: nil)
    }
    
    @IBAction func didTapButtonTR(_sender: UIButton) {
        currentImageView = topRightImage
        NotificationCenter.default.post(name: Notification.Name(rawValue: "tapOnGridButtons"), object: nil)
    }

    @IBAction func didTapButtonBC(_sender: UIButton) {
        currentImageView = bottomCenterImage
        NotificationCenter.default.post(name: Notification.Name(rawValue: "tapOnGridButtons"), object: nil)
    }
    
    override func isAllImageSelected() -> Bool {
        return topLeftImage.image != nil && bottomCenterImage.image != nil && topRightImage.image != nil
    }
    
    override func setImage(image: UIImage) {
        currentImageView?.image = image
    }

}
