//
//  VerifyYourEmailViewController.swift
//  SnapShare
//
//  Created by RP-14 on 09/03/23.

import UIKit

class VerifyYourEmailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtFieldFirst: UITextField!
    @IBOutlet weak var txtFieldSecond: UITextField!
    @IBOutlet weak var txtFieldThird: UITextField!
    @IBOutlet weak var txtFieldFourth: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFieldFirst.delegate = self
        txtFieldSecond.delegate = self
        txtFieldThird.delegate = self
        txtFieldFourth.delegate = self
        txtFieldFirst.addTarget(self, action: #selector(VerifyYourEmailViewController.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        txtFieldSecond.addTarget(self, action: #selector(VerifyYourEmailViewController.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        txtFieldThird.addTarget(self, action: #selector(VerifyYourEmailViewController.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        txtFieldFourth.addTarget(self, action: #selector(VerifyYourEmailViewController.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                           replacementString string: String) -> Bool
    {
        let maxLength = 1
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString

        return newString.length <= maxLength
    }
    
    @objc func textFieldDidChange(textField: UITextField){

        if textField == txtFieldFirst {
            if (textField.text?.count)! >= 1 {
                txtFieldSecond.becomeFirstResponder()
            }
        }else if textField == txtFieldSecond {
            if (textField.text?.count)! >= 1 {
                txtFieldThird.becomeFirstResponder()
            }
            if (textField.text?.count) == 0 {
                txtFieldFirst.becomeFirstResponder()
            }
        }else if textField == txtFieldThird {
            if (textField.text?.count)! >= 1 {
                txtFieldFourth.becomeFirstResponder()
            }
            if (textField.text?.count) == 0 {
                txtFieldSecond.becomeFirstResponder()
            }
        }else if textField == txtFieldFourth {
            if (textField.text?.count)! >= 1 {
                txtFieldFourth.resignFirstResponder()
            }
            if (textField.text?.count) == 0 {
                txtFieldThird.becomeFirstResponder()
            }
        }
    }
    
    @IBAction func buttonVerify(_ sender: UIButton) {
        let resetPasswordVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
        self.navigationController?.pushViewController(resetPasswordVc, animated: true)
    }
    
    @IBAction func buttonBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
