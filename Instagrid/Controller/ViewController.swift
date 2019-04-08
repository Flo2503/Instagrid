//
//  ViewController.swift
//  Instagrid
//
//  Created by Flo on 18/03/2019.
//  Copyright © 2019 Flo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonView: ButtonView!
    @IBOutlet weak var firstGrid: FirstGrid!
    @IBOutlet weak var secondGrid: SecondGrid!
    @IBOutlet weak var thirdGrid: ThirdGrid!


    private var imagePicker = UIImagePickerController()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(selectPicLibrary), name: NSNotification.Name("tapOnGridButtons"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sharePics), name: NSNotification.Name("swipeToShare"), object: nil)
    }
    

    @IBAction func didTapFirstGridButton(_ sender: Any) {
        buttonView.style = .firstButton
        firstGrid.isHidden = false
        secondGrid.isHidden = true
        thirdGrid.isHidden = true
        
    }
    
    @IBAction func didTapSecondGridButton(_ sender: Any) {
        buttonView.style = .secondButton
        firstGrid.isHidden = true
        secondGrid.isHidden = false
        thirdGrid.isHidden = true
    }
    
    @IBAction func didTapThirdGridButton(_ sender: Any) {
        buttonView.style = .thirdButton
        firstGrid.isHidden = true
        secondGrid.isHidden = true
        thirdGrid.isHidden = false
    }
 
    
    
//Access photo library
    @objc private func selectPicLibrary() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
//Share photos
    @objc private func sharePics() {
        if let image = firstGrid.bottomLetftImage.image {
            let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            switch buttonView.style {
            case .firstButton:
                firstGrid.currentImageView?.image = image
                break
            case .secondButton:
                secondGrid.currentImageView?.image = image
                break
            case .thirdButton:
                thirdGrid.currentImageView?.image = image
                break
                
            }

    }
        
        dismiss(animated: true, completion: nil)
    }
    
}





