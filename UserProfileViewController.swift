//
//  ProfileViewController.swift
//  SnapShare
//
//  Created by RP-14 on 10/03/23.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.tabBar.isHidden = false

    }
    
    @IBAction func buttonActionAdd(_ sender: UIButton) {
        let addPhotoVc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "AddPhotosViewController") as! AddPhotosViewController
        self.navigationController?.pushViewController(addPhotoVc, animated: true)
    }
}

extension UserProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as! ProfileCollectionViewCell
        cell.imageUploaded.image = UIImage(named: "strybck")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3 - 0 , height: collectionView.frame.size.width/3)
    }

}
