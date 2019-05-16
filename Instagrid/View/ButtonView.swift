//
//  ButtonView.swift
//  Instagrid
//
//  Created by Flo on 27/03/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import UIKit

class ButtonView: UIView {

    
    // MARK: - Outlets
    @IBOutlet weak var firstIconCorrect: UIView!
    @IBOutlet weak var secondIconCorrect: UIView!
    @IBOutlet weak var thirdIconCorrect: UIView!
    
    // MARK: - Actions
    @IBAction func firstButtonClick(_ sender: Any) {
        style = .firstButton
        NotificationCenter.default.post(name: Notification.Name(rawValue: "firstButtonClick"), object: nil)
    }
    @IBAction func secondButtonClick(_ sender: Any) {
        style = .secondButton
        NotificationCenter.default.post(name: Notification.Name(rawValue: "secondButtonClick"), object: nil)
    }
    @IBAction func thirdButtonClick(_ sender: Any) {
        style = .thirdButton
        NotificationCenter.default.post(name: Notification.Name(rawValue: "thirdButtonClick"), object: nil)
    }
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private enum ButtonStyle {
        case firstButton, secondButton, thirdButton
    }
    
    private var style: ButtonStyle = .firstButton {
        didSet {
            setStyle(style)
        }
    }
    
    //MARK: - Method Button style
    private func setStyle(_ style: ButtonStyle) {
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
    
    


