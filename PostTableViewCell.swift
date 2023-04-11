//
//  PostTableViewCell.swift
//  SnapShare
//
//  Created by Rabin on 17/03/23.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    @IBOutlet weak var btnUserProfile: UIButton!
    @IBOutlet weak var ownerImg: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var imageLike: UIImageView!
    @IBOutlet weak var buttonLike: UIButton!
    @IBOutlet weak var txtPublishdate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

 
    
}
