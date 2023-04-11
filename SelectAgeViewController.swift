//
//  SelectAgeViewController.swift
//  SnapShare
//
//  Created by RP-14 on 07/03/23.
//

import UIKit

class SelectAgeViewController: UIViewController {

    @IBOutlet weak var viewBelow13: UIView!
    @IBOutlet weak var view1319: UIView!
    @IBOutlet weak var view2035: UIView!
    @IBOutlet weak var view3560: UIView!
    @IBOutlet weak var viewAbove60: UIView!
    @IBOutlet weak var lblBelow13: UILabel!
    @IBOutlet weak var lbl1319: UILabel!
    @IBOutlet weak var lbl2035: UILabel!
    @IBOutlet weak var lbl3560: UILabel!
    @IBOutlet weak var lblAbove60: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBelow13.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.1294117647, blue: 0.4862745098, alpha: 1)
        lblBelow13.textColor = .white
    }
    
    func setClearClrView() {
        viewBelow13.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9137254902, blue: 0.9490196078, alpha: 1)
        view1319.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9137254902, blue: 0.9490196078, alpha: 1)
        view2035.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9137254902, blue: 0.9490196078, alpha: 1)
        view3560.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9137254902, blue: 0.9490196078, alpha: 1)
        viewAbove60.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9137254902, blue: 0.9490196078, alpha: 1)
        lblBelow13.textColor = .black
        lbl1319.textColor = .black
        lbl2035.textColor = .black
        lbl3560.textColor = .black
        lblAbove60.textColor = .black
    }
    
    @IBAction func buttonActionNext(_ sender: UIButton) {
        let addInterestsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddInterestsViewController") as! AddInterestsViewController
        self.navigationController?.pushViewController(addInterestsVC, animated: true)
    }
    
    @IBAction func buttonActionAge(sender: UIButton) {
        if sender.tag == 0 {
            setClearClrView()
            lblBelow13.textColor = .white
            viewBelow13.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.1294117647, blue: 0.4862745098, alpha: 1)
        }else if sender.tag == 1 {
            setClearClrView()
            lbl1319.textColor = .white
            view1319.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.1294117647, blue: 0.4862745098, alpha: 1)
        }else if sender.tag == 2 {
            setClearClrView()
            lbl2035.textColor = .white
            view2035.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.1294117647, blue: 0.4862745098, alpha: 1)
        }else if sender.tag == 3 {
            setClearClrView()
            lbl3560.textColor = .white
            view3560.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.1294117647, blue: 0.4862745098, alpha: 1)
        }else {
            setClearClrView()
            lblAbove60.textColor = .white
            viewAbove60.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.1294117647, blue: 0.4862745098, alpha: 1)
        }
    }
}

