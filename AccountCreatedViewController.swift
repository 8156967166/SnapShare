//
//  AccountCreatedViewController.swift
//  SnapShare
//
//  Created by RP-14 on 10/03/23.
//

import UIKit

class AccountCreatedViewController: UIViewController {

    @IBOutlet weak var imageGif: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage.gifImageWithName("gifImg")
        imageGif.image = image
        
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let tabVc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
            self.navigationController?.pushViewController(tabVc, animated: true)
        }
    }

}
