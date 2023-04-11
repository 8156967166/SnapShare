//
//  AddProfilePhotoViewController.swift
//  SnapShare
//
//  Created by RP-14 on 03/03/23.
//

import UIKit

class AddProfilePhotoViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageProfile: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
    }
    
    @IBAction func buttonActionImage(_ sender: UIButton) {
        present(imagePicker, animated: true) {
            
        }
    }
    
    @IBAction func buttonActionNext(_ sender: UIButton) {
        let selctAgeVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectAgeViewController") as! SelectAgeViewController
        self.navigationController?.pushViewController(selctAgeVc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageProfile.image = image
        self.dismiss(animated: true, completion: nil)
    }
}
