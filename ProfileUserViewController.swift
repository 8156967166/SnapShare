//
//  ProfileUser.swift
//  SnapShare
//
//  Created by Rabin on 04/04/23.
//

import UIKit
import Kingfisher

//https://dummyapi.io/data/v1/user/60d0fe4f5311236168a109ca
//https://dummyapi.io/data/v1/user/60d0fe4f5311236168a109ca/post?limit=10

class ProfileUserViewController: UIViewController {
    
    @IBOutlet weak var labelAbout: UILabel!
    @IBOutlet weak var collctnView: UICollectionView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var labelDOB: UILabel!
    @IBOutlet weak var imageProfileCover: UIImageView!
    
    var recieveid : String?
    var dateArry = [Character]()
    var userModel = [Datas]()
    var selected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserProfile()
        getUserImages()
        print("recieveid -- \(recieveid)")
        imageProfileCover.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageProfileCover.layer.cornerRadius = 10
    }
    
    @IBAction func buttonActionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProfileUserViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileUsercollectionCell", for: indexPath) as! ProfileUsercollectionCell
        cell.imageUserPost.kf.setImage(with: URL(string: userModel[indexPath.item].image ?? ""))
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 2
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let picViewPageVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "PicViewPageViewController") as! PicViewPageViewController
        picViewPageVC.imageselect = userModel[indexPath.item].image ?? ""
        self.navigationController?.pushViewController(picViewPageVC, animated: true)
        collctnView.reloadData()
    }
   
}

extension ProfileUserViewController {
    func getUserImages() {
        let url = ApiList.apilist.fullUserProfile + (recieveid ?? "") + "/" + ApiList.apilist.post
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
//                                    print("i ----> \(i)")
//                                    print(i)
                                    self.userModel.append(Datas(fromData: i))
                                    
                                   
                                }
                                self.labelAbout.text = "\(self.userModel[1].text ?? "")"
                                print("==========>",self.userModel[1].owner?.title)
                                
                                self.collctnView.reloadData()
                            }
                        }
                    }catch {
                        print("Error")
                    }
                }
            }
        }
    }
    func getUserProfile() {
        let url = ApiList.apilist.fullUserProfile + (recieveid ?? "")
        Networking.getData(url: url) { response, isSuccess, message in
            if isSuccess == true {
                if let data = response {
                    print(data)
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
//                        print(json)
                        if let value = json as? [String: Any] {
                            
                            print(value)
                            self.labelName.text = "\(value["title"] ?? "").\(value["firstName"] ?? "") \( value["lastName"] ?? "" )"
                            let dob = value["dateOfBirth"] as! String
                            for i in dob {
                                if self.dateArry.count < 10 {
                                    self.dateArry.append(i)
                                }
                            }
                            let stringRepresentation = String(self.dateArry)
                            self.labelDOB.text = "\(stringRepresentation)"
                            self.imageProfile.kf.setImage(with: URL(string: value["picture"] as? String ?? "" ))
                          
                        }
                        
                    }catch {
                        print("error")
                    }
                }
            }
        }
    }
    
}
