//
//  UserViewController.swift
//  SnapShare
//
//  Created by RP-14 on 10/03/23.
//

import UIKit

class UserListViewController: UIViewController {

    @IBOutlet weak var viewGlobal: UIView!
    @IBOutlet weak var viewUserList: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonActionUserNear(_ sender: UIButton) {
        viewGlobal.backgroundColor = #colorLiteral(red: 0.9226158261, green: 0.8848357797, blue: 1, alpha: 1)
        viewUserList.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.1294117647, blue: 0.4862745098, alpha: 1)
    }
    
    @IBAction func buttonActionGlobal(_ sender: UIButton) {
        viewGlobal.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.1294117647, blue: 0.4862745098, alpha: 1)
        viewUserList.backgroundColor = #colorLiteral(red: 0.9226158261, green: 0.8848357797, blue: 1, alpha: 1)
    }
    
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as! UserListTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}



class UserListTableViewCell: UITableViewCell {
    
}
