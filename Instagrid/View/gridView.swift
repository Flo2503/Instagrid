//
//  gridView.swift
//  Instagrid
//
//  Created by Flo on 31/03/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import UIKit

class gridView: UIView {

    
    
    @IBOutlet weak var topLeft: UIButton!
    @IBOutlet weak var topCenter: UIButton!
    @IBOutlet weak var bottomCenter: UIButton!
    @IBOutlet weak var bottomRight: UIButton!
    @IBOutlet weak var bottomLeft: UIButton!
    @IBOutlet weak var topRight: UIButton!
    
    enum Style {
        case firstGrid, secondGrid, thirdGrid
    }
    
    
    var style: Style = .firstGrid {
        didSet {
            setStyle(style)
        }
    }
    
    private func setStyle(_ style: Style) {
        switch style {
        case .firstGrid:
            topLeft.isHidden = true
            topRight.isHidden = true
            topCenter.isHidden = false
            bottomLeft.isHidden = false
            bottomRight.isHidden = false
            bottomCenter.isHidden = true
        case .secondGrid:
            topLeft.isHidden = false
            topRight.isHidden = false
            topCenter.isHidden = true
            bottomLeft.isHidden = true
            bottomRight.isHidden = true
            bottomCenter.isHidden = false
        case .thirdGrid:
            topLeft.isHidden = false
            topRight.isHidden = false
            topCenter.isHidden = true
            bottomLeft.isHidden = false
            bottomRight.isHidden = false
            bottomCenter.isHidden = true
            
        }
    }
    
    

}
