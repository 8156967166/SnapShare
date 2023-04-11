//
//  HomeViewController.swift
//  SnapShare
//
//  Created by RP-14 on 10/03/23.
//

import UIKit
import Kingfisher
class HomeViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    var likeArry = [Int]()
    var onClick = true
    var userModel = [Datas]()
    var dateArry = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNetwork()
    }
    
    func getNetwork() {
        let url = ApiList.apilist.baseurl + ApiList.apilist.post
        Networking.getData(url: url) { [self] Datass, isSuccess, message in
            if isSuccess == true {
                if let data = Datass {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
//                        print(json)
                        if let value = json as? [String: Any] {
                            if let subValue = value["data"] as? [[String: Any]] {
                                //print("++++++>",subValue,">>>>>>>>>")
                                for i in subValue {
//                                    print("i ----> \(i)")
//                                    print(i)
                                    self.userModel.append(Datas(fromData: i))
                                }
                                print("==========>",userModel[1].owner?.title)
                                tblView.reloadData()
                            }
                        }
                    }catch {
                        
                    }
                }
            }
        }
    }
    
    @IBAction func btnUserprofile(_ sender: UIButton) {
        let pass = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "ProfileUser") as! ProfileUserViewController
        pass.recieveid = userModel[sender.tag].owner?.id
        self.navigationController?.pushViewController(pass, animated: true)
    }
    
    @IBAction func buttonComment(_ sender: UIButton) {
        let commentVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
        self.navigationController?.pushViewController(commentVC, animated: false)
    }
    
    @IBAction func buttonSearch(_ sender: UIButton) {
        let searchVc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SearchPageViewController") as! SearchPageViewController
        self.navigationController?.pushViewController(searchVc, animated: true)
    }
    
    @IBAction func buttonActionLike(_ sender: UIButton) {
        print(likeArry)
        if !likeArry.contains(sender.tag){
            likeArry.append(sender.tag)
        }else{
            guard let index =  likeArry.lastIndex(of: sender.tag) else{
                return
            }
            likeArry.remove(at: index)
        }
       
        tblView.reloadData()
    }
    
    @IBAction func buttonActionProfile(_ sender: UIButton) {
        print("Profile pic clicked")
        self.tabBarController?.selectedIndex = 4
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return userModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            
            cell.btnUserProfile.tag = indexPath.row
            
            cell.lblName.text = "\(userModel[indexPath.row].owner?.title ?? ""). \(userModel[indexPath.row].owner?.firstName ?? "" ) \(userModel[indexPath.row].owner?.lastName ?? "" ))"
            cell.imagePost.kf.setImage(with: URL(string: userModel[indexPath.row].image  ?? ""))
            let publishDate = "\(userModel[indexPath.row].publishDate ?? "")"
            for i in publishDate {
                if self.dateArry.count < 10 {
                    self.dateArry.append(i)
                }
            }
            let stringRepresentation = String(self.dateArry)
            cell.txtPublishdate.text = "\(stringRepresentation)"
//            cell.txtPublishdate.text = "\(userModel[indexPath.row].publishDate ?? "")"
            cell.ownerImg.kf.setImage(with: URL(string: userModel[indexPath.row].owner?.picture ?? ""))
            
            
            cell.buttonLike.tag = indexPath.row
            
            if likeArry.contains(indexPath.row){
                cell.imageLike.image = UIImage(named: "like")
            }else{
                cell.imageLike.image = UIImage(named: "unlike")
                
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }else {
            return 400
        }
    }
}
