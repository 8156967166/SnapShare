//
//  SearchImageTableViewCell.swift
//  SnapShare
//
//  Created by Rabin on 24/03/23.
//

import UIKit

protocol ImagePassToVc {
    func userHasChosen(image: String)
}
class SearchImageTableViewCell: UITableViewCell {

    @IBOutlet weak var collectnVew: UICollectionView!
    // var delegate: ImagePassToVc?
    var delegate: ImagePassToVc!
    var imageArry = ["dogImg1", "dogImg2", "dogImg3", "dogImg4", "dogImg5", "dogImg6", "dogImg2", "dogImg1", "dogImg5", "dogImg4"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension SearchImageTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchImagesCollectionViewCell", for: indexPath) as! SearchImagesCollectionViewCell
        cell.imageSearch.image = UIImage(named: imageArry[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.userHasChosen(image: imageArry[indexPath.item] )
        collectnVew.reloadData()
        
//        if (delegate != nil) {
//            self.delegate!.userHasChosen(image: cell.imageSearch.image!)
//        }
    }
}
