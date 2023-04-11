//
//  DownLoadViewController.swift
//  SnapShare
//
//  Created by RP-14 on 10/03/23.
//

import UIKit

class DownLoadViewController: UIViewController {

    @IBOutlet weak var collctnView: UICollectionView!
    @IBOutlet weak var viewSelectAll: UIView!
    
    var imageArray = ["img1","img2","img3","img4","img5","img6"]
    var emptyArry = [String]()
    var onClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewSelectAll.isHidden = true
    }
    
    
    
    @IBAction func buttonActionDelete(_ sender: UIButton) {
        if emptyArry.count >= 0 {
            for i in imageArray {
                if emptyArry.contains(i) {
                    let indxss = imageArray.lastIndex(of: i)
                    imageArray.remove(at: indxss ?? 0)
                }
            }
        }
        collctnView.reloadData()
    }
    
    @IBAction func buttonActionSelectAll(_ sender: Any) {
        
        for i in imageArray{
            if !emptyArry.contains(i){
                emptyArry.append(i)
            }
        }
       
        collctnView.reloadData()

    }
}

extension DownLoadViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DownloadCollectionViewCell", for: indexPath) as! DownloadCollectionViewCell
        cell.imageDownloads.image = UIImage(named: imageArray[indexPath.row])
       
        if emptyArry.contains(imageArray[indexPath.row]) {
            
            cell.imageSelect.image = UIImage(named: "tik")
        }else {
            cell.imageSelect.image = UIImage(named: "")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        viewSelectAll.isHidden = false
        if !emptyArry.contains(imageArray[indexPath.row]) {
            emptyArry.append(imageArray[indexPath.row])
        }else {
            var indxs = emptyArry.lastIndex(of: imageArray[indexPath.row])
            emptyArry.remove(at: indxs ?? 0)
        }
        print(emptyArry)
        collctnView.reloadData()
    }
}
