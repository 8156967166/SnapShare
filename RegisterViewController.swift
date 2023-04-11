//
//  RegisterViewController.swift
//  SnapShare
//
//  Created by RP-14 on 03/03/23.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtFieldName: UITextField!
    @IBOutlet weak var lblNameHeight: NSLayoutConstraint!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var lblEmailHeight: NSLayoutConstraint!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var lblPasswordHeight: NSLayoutConstraint!
    @IBOutlet weak var txtFieldConfirmPassword: UITextField!
    @IBOutlet weak var lblConfirmPassword: UILabel!
    @IBOutlet weak var lblConfirmPassHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFieldPassword.isSecureTextEntry = true
        txtFieldConfirmPassword.isSecureTextEntry = true
        lblNameHeight.constant = 0
        lblEmailHeight.constant = 0
        lblPasswordHeight.constant = 0
        lblConfirmPassHeight.constant = 0
    }
    
    @IBAction func buttonPasswordShow(_ sender: UIButton) {
        if txtFieldPassword.isSecureTextEntry == true {
            txtFieldPassword.isSecureTextEntry = false
        }else {
            txtFieldPassword.isSecureTextEntry = true
        }
    }
   
    @IBAction func buttonSignIn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonConfirmPassShow(_ sender: UIButton) {
        if  txtFieldConfirmPassword.isSecureTextEntry == true {
            txtFieldConfirmPassword.isSecureTextEntry = false
        }else {
            txtFieldConfirmPassword.isSecureTextEntry = true
        }
    }
    
    @IBAction func buttonActionSignUp(_ sender: UIButton) {
        if (txtFieldName.text?.isValidName())! {
            lblNameHeight.constant = 0
        }else {
            lblNameHeight.constant = 14
        }
        if (txtFieldEmail.text?.isValidEmail())! {
            lblEmailHeight.constant = 0
        }else {
            lblEmailHeight.constant = 14
        }
        if txtFieldPassword.text == "" {
            lblPasswordHeight.constant = 14
        }else {
            lblPasswordHeight.constant = 0
        }
        if txtFieldConfirmPassword.text == "" {
            lblConfirmPassHeight.constant = 14
            
        }else {
            if txtFieldPassword.text == txtFieldConfirmPassword.text {
                lblConfirmPassHeight.constant = 0
            }else {
                lblConfirmPassword.text = "Don't match password"
            }
        }
        
        if ((txtFieldName.text?.isValidName())! && ((txtFieldEmail.text?.isValidEmail()) != nil) && txtFieldPassword.text != "" && txtFieldConfirmPassword.text != "") {
            if txtFieldPassword.text == txtFieldConfirmPassword.text {
                let addProfilePhotoVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddProfilePhotoViewController") as! AddProfilePhotoViewController
                self.navigationController?.pushViewController(addProfilePhotoVc, animated: true)
            }
        }
        
    }
}
