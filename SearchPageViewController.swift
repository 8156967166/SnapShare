//
//  SearchPageViewController.swift
//  SnapShare
//
//  Created by Rabin on 23/03/23.
//

import UIKit

class SearchPageViewController: UIViewController, ImagePassToVc {
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserImages()
    }
    
    func userHasChosen(image: String) {
        let picViewPageVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "PicViewPageViewController") as! PicViewPageViewController
        picViewPageVC.imageselect = image
        self.navigationController?.pushViewController(picViewPageVC, animated: true)
        tblView.reloadData()
    }

    @IBAction func buttonActionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SearchPageViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchImageTableViewCell", for: indexPath) as! SearchImageTableViewCell
            cell.delegate = self
            return cell
        }
      
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 250
        }else {
            return 400
        }
    }
}

extension SearchPageViewController {
    func getUserImages() {
        let url = ApiList.apilist.baseurl + ApiList.apilist.post
        Networking.getData(url: url) { dataResponse, isSuccess, messgae in
            if isSuccess == true {
                if let userPost = dataResponse {
                    print("userPost ---- > \(userPost)")
                    do {
                        let json = try JSONSerialization.jsonObject(with: userPost, options: [])
                        print("json ----> \(json)")
                        if let value = json as? [String: Any] {
                            if let subValue = value["data"] as? [[String: Any]] {
                                //print("++++++>",subValue,">>>>>>>>>")
                                for i in subValue {
                                    
                                }
                            }
                        }
                    }catch {
                        print("Error")
                    }
                }
            }
        }
    }
}
