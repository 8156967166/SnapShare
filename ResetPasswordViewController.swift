//
//  ResetPasswordViewController.swift
//  SnapShare
//
//  Created by RP-14 on 09/03/23.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldConfirmPassword: UITextField!
    @IBOutlet weak var passwordErrorHeight: NSLayoutConstraint!
    @IBOutlet weak var confirmPassErrorHeight: NSLayoutConstraint!
    @IBOutlet weak var labelConfirmPassword: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordErrorHeight.constant = 0
        confirmPassErrorHeight.constant = 0
        txtFieldPassword.isSecureTextEntry = true
        txtFieldConfirmPassword.isSecureTextEntry = true
    }
    
    @IBAction func buttonBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func buttonConfirmPassShow(_ sender: UIButton) {
        if txtFieldConfirmPassword.isSecureTextEntry == true {
            txtFieldConfirmPassword.isSecureTextEntry = false
        }else {
            txtFieldConfirmPassword.isSecureTextEntry = true
        }
    }
    
    @IBAction func buttonActionPasswordShow(_ sender: Any) {
        if  txtFieldPassword.isSecureTextEntry == true {
            txtFieldPassword.isSecureTextEntry = false
        }else {
            txtFieldPassword.isSecureTextEntry = true
        }
    }
    
    @IBAction func buttonActionContinue(_ sender: UIButton) {
        if txtFieldPassword.text == "" {
            passwordErrorHeight.constant = 15
        }else {
            passwordErrorHeight.constant = 0
        }
        
        if txtFieldConfirmPassword.text == "" {
            confirmPassErrorHeight.constant = 15
        }else {
            if txtFieldPassword.text == txtFieldConfirmPassword.text {
                confirmPassErrorHeight.constant = 0
            }else {
                confirmPassErrorHeight.constant = 15
                labelConfirmPassword.text = "Don't match password"
            }
        }
    }
}
