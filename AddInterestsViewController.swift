//
//  AddInterestsViewController.swift
//  SnapShare
//
//  Created by RP-14 on 07/03/23.
//

import UIKit

class AddInterestsViewController: UIViewController {
    
    @IBOutlet weak var buttonMoreLess: UIButton!
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    @IBOutlet weak var collectnView: UICollectionView!
    
    var h = 0
    var interestArray = ["Nature", "Fashion", "Photojournalism", "Event", "Portrait", "Fine art", "Traval", "Architecture", "Advertising", "Sports", "Pet Photography", "Wedding"]
    var onClickMoreLess = true
    var emptyArry = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectnView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionHeight.constant = 130
    }
    
    @IBAction func buttonActionMoreLess(_ sender: UIButton) {
        if onClickMoreLess == true {
            collectionHeight.constant = 300
            buttonMoreLess.setTitle("Less", for: .normal)
        }else {
            collectionHeight.constant = 130
            buttonMoreLess.setTitle("More", for: .normal)
        }
       onClickMoreLess = !onClickMoreLess
        
    }
    
    @IBAction func buttonActionNext(_ sender: UIButton) {
        let accountCreatedVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AccountCreatedViewController") as! AccountCreatedViewController
        self.navigationController?.pushViewController(accountCreatedVC, animated: true)
    }
}


extension AddInterestsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interestArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddInterestsCollectionViewCell", for: indexPath) as! AddInterestsCollectionViewCell
        cell.lblInterest.text = interestArray[indexPath.row]
        self.h = Int(cell.frame.height)
        if emptyArry.contains(interestArray[indexPath.row]) {
            cell.viewInCell.backgroundColor = #colorLiteral(red: 0.3135073185, green: 0.203864783, blue: 0.5600011349, alpha: 1)
            cell.lblInterest.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }else {
            cell.viewInCell.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9137254902, blue: 0.9490196078, alpha: 1)
            cell.lblInterest.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !emptyArry.contains(interestArray[indexPath.row]) {
            emptyArry.append(interestArray[indexPath.row])
        }else {
            var indxs = emptyArry.lastIndex(of: interestArray[indexPath.row])
            emptyArry.remove(at: indxs ?? 0)
        }
        print(emptyArry)
        collectnView.reloadData()
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddInterestsCollectionViewCell", for: indexPath) as! AddInterestsCollectionViewCell
//        let width = cell.lblInterest.frame.size.width
//        return CGSize(width: width, height: 45)
//    }
}
