//
//  ShareYourSnapViewController.swift
//  SnapShare
//
//  Created by Rabin on 21/03/23.
//

import UIKit

class ShareYourSnapViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var collctnView: UICollectionView!
    var images = [UIImage]()
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if images.count <= 2{
                images.append(img)
            }else{
                print("sorry")
            }
            dismiss(animated: true)
            collctnView.reloadData()
        }
        
    }
    
    
}

extension ShareYourSnapViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return images.count
        }else{
            return 1
        }
       
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageAddCollectionViewCell", for: indexPath) as! ImageAddCollectionViewCell
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShareYourSnapCollectionViewCell", for: indexPath) as! ShareYourSnapCollectionViewCell
            return cell
        }
            
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        present(imagePicker, animated: true)
        
    }
}
