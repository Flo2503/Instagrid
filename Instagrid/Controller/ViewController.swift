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
    
    @IBOutlet var firstGridImages: [UIImageView]!
    

    private var imagePicker = UIImagePickerController()
    private var currentView = UIView()
        

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(chooseImage), name: NSNotification.Name("tapOnGridButtons"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(shareGrid), name: NSNotification.Name("swipeToShare"), object: nil)
        didTapFirstGridButton(self)
    }
    

    @IBAction func didTapFirstGridButton(_ sender: Any) {
        buttonView.style = .firstButton
        currentView = firstGrid
        firstGrid.isHidden = false
        secondGrid.isHidden = true
        thirdGrid.isHidden = true
        
    }
    
    @IBAction func didTapSecondGridButton(_ sender: Any) {
        buttonView.style = .secondButton
        currentView = secondGrid
        firstGrid.isHidden = true
        secondGrid.isHidden = false
        thirdGrid.isHidden = true
    }
    
    @IBAction func didTapThirdGridButton(_ sender: Any) {
        buttonView.style = .thirdButton
        currentView = thirdGrid
        firstGrid.isHidden = true
        secondGrid.isHidden = true
        thirdGrid.isHidden = false
    }
    
    
    
//Alert to display source choice : camera or library
    @objc func chooseImage() {
        let alert = UIAlertController(title: "Photo Source", message: "Please choose a source", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera 📷", style: .default, handler: { _ in
            self.cameraAccess()
        }))
        alert.addAction(UIAlertAction(title: "Library 🗂️", style: .default, handler: { _ in
            self.libraryAccess()
        }))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
//Photo library access
    @objc private func libraryAccess() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
  
//Camera access (Bonus)
    @objc func cameraAccess() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
        }else {
            let alert = UIAlertController(title: "Sorry !", message: "Camera not available, select image in Library", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "I got it 👌", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    
//Convert UIView to UIImage
    func convertUIV(with view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext() {
            view.layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image
        }
        return nil
    }
    
    
    
//Share photos
    @objc private func shareGrid() {
        if let image = convertUIV(with: currentView) {
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





