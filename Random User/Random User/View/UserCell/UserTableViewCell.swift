//
//  UserTableViewCell.swift
//  Random User
//
//  Created by Артём Гуральник on 8/19/18.
//  Copyright © 2018 ArtemGuralny. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func populateCell(userData: UserInfo) {
        
        let url = NSURL(string: userData.userImageURL)
        let data = NSData(contentsOf: url! as URL)
        
        userName.text = userData.userName
        userImage.image = UIImage(data: data! as Data)
    }
}
