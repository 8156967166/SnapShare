//
//  CommentViewController.swift
//  SnapShare
//
//  Created by Rabin on 28/03/23.
//

import UIKit

class CommentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonActionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
