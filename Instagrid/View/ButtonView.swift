//
//  ButtonView.swift
//  Instagrid
//
//  Created by Flo on 27/03/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import UIKit

class ButtonView: UIView {

   
    
    
    @IBOutlet weak var firstIconCorrect: UIView!
    @IBOutlet weak var secondIconCorrect: UIView!
    @IBOutlet weak var thirdIconCorrect: UIView!
   
    
    enum Style {
        case firstButton, secondButton, thirdButton
    }
    
    var style: Style = .firstButton {
        didSet {
            setStyle(style)
        }
    }
    
    private func setStyle(_ style: Style) {
        switch style {
            case .firstButton:
                firstIconCorrect.isHidden = false
                secondIconCorrect.isHidden = true
                thirdIconCorrect.isHidden = true
            case .secondButton:
                firstIconCorrect.isHidden = true
                secondIconCorrect.isHidden = false
                thirdIconCorrect.isHidden = true
            case .thirdButton:
                firstIconCorrect.isHidden = true
                secondIconCorrect.isHidden = true
                thirdIconCorrect.isHidden = false
        }
    }


}
    
    


