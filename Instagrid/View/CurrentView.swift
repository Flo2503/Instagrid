//
//  CurrentView.swift
//  Instagrid
//
//  Created by Flo on 22/04/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import Foundation
import  UIKit

class CurrentView: UIView {
    

    @IBOutlet weak var firstGrid: FirstGrid!
    @IBOutlet weak var secondGrid: SecondGrid!
    @IBOutlet weak var thirdGrid: ThirdGrid!
    
    private var currentView = GridView()
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

// Listeners. Call the right grid according to the selected button
    private func setUp() {
        NotificationCenter.default.addObserver(self, selector: #selector(firstButtonClick), name: NSNotification.Name("firstButtonClick"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(secondButtonClick), name: NSNotification.Name("secondButtonClick"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(thirdButtonClick), name: NSNotification.Name("thirdButtonClick"), object: nil)
        
    }
    
    @objc func firstButtonClick() {
        currentView = firstGrid
        firstGrid.isHidden = false
        secondGrid.isHidden = true
        thirdGrid.isHidden = true
    }
    
    @objc func secondButtonClick() {
        currentView = secondGrid
        firstGrid.isHidden = true
        secondGrid.isHidden = false
        thirdGrid.isHidden = true
    }
    
    @objc func thirdButtonClick() {
        currentView = thirdGrid
        firstGrid.isHidden = true
        secondGrid.isHidden = true
        thirdGrid.isHidden = false
    }
    
    func setImage(image: UIImage) {
        currentView.setImage(image: image)
    }
    
    func isAllImageSelected() -> Bool {
        return currentView.isAllImageSelected()
    }
}
