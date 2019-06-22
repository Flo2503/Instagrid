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
    
    //MARK: - Outlets
    @IBOutlet weak var firstGrid: FirstGrid!
    @IBOutlet weak var secondGrid: SecondGrid!
    @IBOutlet weak var thirdGrid: ThirdGrid!
    
    //MARK: - Properties
    private var currentView = GridView()
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        setUpObserver()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpObserver()
    }

    //MARK: - Methods - Listeners. Call the right grid according to the selected button
    private func setUpObserver() {
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
    
    //Set current image
    func setImage(image: UIImage) {
        currentView.setImage(image: image)
    }
    
    //Return if all image are selected in the grid
    func isAllImageSelected() -> Bool {
        return currentView.isAllImageSelected()
    }
}
