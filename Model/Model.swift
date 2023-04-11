//
//  Model.swift
//  SnapShare
//
//  Created by Rabin on 28/03/23.
//

import Foundation

class Datas {
    let id: String?
    let image: String?
    let likes: Int?
    let tags: [String]?
    let text: String?
    let publishDate: String?
    var owner: Owners?

    init(fromData: [String: Any]) {
        self.id = fromData["id"] as? String
        self.image = fromData["image"] as? String
        self.likes = fromData["likes"] as? Int
        self.tags = fromData["tags"] as? [String]
        self.text = fromData["text"] as? String
        self.publishDate = fromData["publishDate"] as? String

        if let ownerrr = fromData["owner"] as? [String: Any]{
            self.owner = Owners(fromData: ownerrr)

        }
    }
}

class Owners {
    let id: String?
    let title: String?
    let firstName: String?
    let lastName: String?
    let picture: String?

    init(fromData: [String: Any]) {
        self.id = fromData["id"] as? String
        self.title = fromData["title"] as? String
        self.firstName = fromData["firstName"] as? String
        self.lastName = fromData["lastName"] as? String
        self.picture = fromData["picture"] as? String
    }
}



//
////    enum Title: String {
////        case miss = "miss"
////        case mr = "mr"
////        case mrs = "mrs"
////        case ms = "ms"
////    }
//



//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let model = try? JSONDecoder().decode(Model.self, from: jsonData)
//
//import Foundation
//
//// MARK: - Model
//class Model: Codable {
//    let data: [Datum]
//    let total, page, limit: Int
//
//    init(data: [Datum], total: Int, page: Int, limit: Int) {
//        self.data = data
//        self.total = total
//        self.page = page
//        self.limit = limit
//    }
//}
//
//// MARK: - Datum
//class Datum: Codable {
//    let id: String
//    let image: String
//    let likes: Int
//    let tags: [String]
//    let text, publishDate: String
//    let owner: Owner
//
//    init(id: String, image: String, likes: Int, tags: [String], text: String, publishDate: String, owner: Owner) {
//        self.id = id
//        self.image = image
//        self.likes = likes
//        self.tags = tags
//        self.text = text
//        self.publishDate = publishDate
//        self.owner = owner
//    }
//}
//
//// MARK: - Owner
//class Owner: Codable {
//    let id: String
//    let title: Title
//    let firstName, lastName: String
//    let picture: String
//
//    init(id: String, title: Title, firstName: String, lastName: String, picture: String) {
//        self.id = id
//        self.title = title
//        self.firstName = firstName
//        self.lastName = lastName
//        self.picture = picture
//    }
//}
//
//enum Title: String, Codable {
//    case miss = "miss"
//    case mr = "mr"
//    case mrs = "mrs"
//    case ms = "ms"
//}
