//
//  PicViewPageViewController.swift
//  SnapShare
//
//  Created by Rabin on 24/03/23.
//

import UIKit

class PicViewPageViewController: UIViewController {

    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var imagelike: UIImageView!
    
    var imageselect = String()
    var onClickLike = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageBackground.kf.setImage(with: URL(string: imageselect))
//        imageBackground.image = UIImage(named: imageselect)
    }
    
    @IBAction func buttonLike(_ sender: UIButton) {
        if onClickLike == true {
            imagelike.image = UIImage(named: "like")
        }else {
            imagelike.image = UIImage(named: "unlikeOutline")
        }
        onClickLike = !onClickLike
    }
    
    @IBAction func buttonActionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
