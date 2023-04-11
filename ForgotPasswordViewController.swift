//
//  ForgotPasswordViewController.swift
//  SnapShare
//
//  Created by RP-14 on 09/03/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var emailErrorHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailErrorHeight.constant = 0
    }
    
    @IBAction func buttonBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonRecoverPassword(_ sender: UIButton) {
        if (txtFieldEmail.text?.isValidEmail())! {
            emailErrorHeight.constant = 0
            let verifyYourEmailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VerifyYourEmailViewController") as! VerifyYourEmailViewController
            self.navigationController?.pushViewController(verifyYourEmailVC, animated: true)
        }else {
            emailErrorHeight.constant = 15
        }
    }
}
