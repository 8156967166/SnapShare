//
//  ViewController.swift
//  SnapShare
//
//  Created by RP-14 on 14/02/23.


import UIKit

class LoginInViewController: UIViewController {

    @IBOutlet weak var lblPasswordErrorHeight: NSLayoutConstraint!
    @IBOutlet weak var lblEmailErrorHeight: NSLayoutConstraint!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblEmailErrorHeight.constant = 0
        lblPasswordErrorHeight.constant = 0
        txtFieldPassword.isSecureTextEntry = true
    }
    
    @IBAction func buttonShowPassword(_ sender: UIButton) {
        if txtFieldPassword.isSecureTextEntry == true {
            txtFieldPassword.isSecureTextEntry = false
        }else {
            txtFieldPassword.isSecureTextEntry = true
        }
    }
    
    @IBAction func buttonActionSignIn(_ sender: UIButton) {
//        if (txtFieldEmail.text?.isValidEmail())! {
//            lblEmailErrorHeight.constant = 0
//        }else {
//            lblEmailErrorHeight.constant = 15
//        }
//
//        if txtFieldPassword.text == "" {
//            lblPasswordErrorHeight.constant = 15
//
//        }else {
//            lblPasswordErrorHeight.constant = 0
//        }
        
//        if txtFieldEmail.text?.isValidEmail() == true{
//            if txtFieldPassword.text != "" {
                let tabVc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                self.navigationController?.pushViewController(tabVc, animated: true)
//            }
//        }
    }
    
    @IBAction func buttonActionForgotPassword(_ sender: UIButton) {
        let forgotPassVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        self.navigationController?.pushViewController(forgotPassVC, animated: true)
    }
    
    @IBAction func buttonActionSignUp(_ sender: UIButton) {
        let regVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(regVc, animated: true)
    }
}


