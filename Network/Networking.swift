//
//  Networking.swift
//  SnapShare
//
//  Created by Rabin on 28/03/23.
//

import Foundation
import Alamofire

class Networking: NSObject {
    static let networking = Networking()
    
  static func getData(url: String, complition: @escaping(Data?, Bool, String) -> Void) {
        AF.request(url, method: .get, headers: ["app-id":"624eb2a77de5e39312837605"]).responseData { response in
            switch response.result {
                
            case .success(let success):
                complition(success,true,"success")
            case .failure(_):
                complition(nil,false,"Failed")
            }
        }
    }
}
