//
//  Third Grid.swift
//  Instagrid
//
//  Created by Flo on 02/04/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import UIKit

class ThirdGrid: GridView {
    
    var currentImageView: UIImageView?

    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    
    @IBOutlet weak var bottomRightImage: UIImageView!
    @IBOutlet weak var bottomLeftImage: UIImageView!
    @IBOutlet weak var topLeftImage: UIImageView!
    @IBOutlet weak var topRightImage: UIImageView!

   
    @IBAction func didTapButtonTL(_ sender: UIButton) {
        currentImageView = topLeftImage
        NotificationCenter.default.post(name: Notification.Name(rawValue: "tapOnGridButtons"), object: nil)
    }
    
    @IBAction func didTapButtonTR(_ sender: UIButton) {
        currentImageView = topRightImage
        NotificationCenter.default.post(name: Notification.Name(rawValue: "tapOnGridButtons"), object: nil)
    }
    
    @IBAction func didTapButttonBL(_ sender: UIButton) {
        currentImageView = bottomLeftImage
        NotificationCenter.default.post(name: Notification.Name(rawValue: "tapOnGridButtons"), object: nil)
    }
    
    @IBAction func didTapButtonBR(_ sender: UIButton) {
        currentImageView = bottomRightImage
        NotificationCenter.default.post(name: Notification.Name(rawValue: "tapOnGridButtons"), object: nil)
    }

    override func isAllImageSelected() -> Bool {
        return bottomRightImage.image != nil && bottomLeftImage.image != nil && topLeftImage.image != nil && topRightImage.image != nil
    }
    
    override func setImage(image: UIImage) {
        currentImageView?.image = image
    }

}
