//
//  gridView.swift
//  Instagrid
//
//  Created by Flo on 31/03/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import UIKit

class FirstGrid: GridView {
    
    //MARK: - Outlets
    @IBOutlet weak var topCenterImage: UIImageView!
    @IBOutlet weak var bottomLetftImage: UIImageView!
    @IBOutlet weak var bottomRightImage: UIImageView!

    //MARK: - Actions
    @IBAction func didTapButtonTC(_ sender: UIButton) {
        currentImageView = topCenterImage
        NotificationCenter.default.post(name: Notification.Name(rawValue: "tapOnGridButtons"), object: nil)
    }
    @IBAction func didTapButtonBR(_ sender: UIButton) {
        currentImageView = bottomRightImage
        NotificationCenter.default.post(name: Notification.Name(rawValue: "tapOnGridButtons"), object: nil)
    }
    @IBAction func didTapButtonBL(_ sender: UIButton) {
        currentImageView = bottomLetftImage
        NotificationCenter.default.post(name: Notification.Name(rawValue: "tapOnGridButtons"), object: nil)
    }
    
    //MARK: - Properties
    var currentImageView: UIImageView?
    
    override func isAllImageSelected() -> Bool {
        return topCenterImage.image != nil && bottomLetftImage.image != nil && bottomRightImage.image != nil
    }
    
    override func setImage(image: UIImage) {
        currentImageView?.image = image
    }
}
