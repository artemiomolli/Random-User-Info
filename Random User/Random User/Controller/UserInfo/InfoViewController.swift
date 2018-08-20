//
//  InfoViewController.swift
//  Random User
//
//  Created by Артём Гуральник on 8/19/18.
//  Copyright © 2018 ArtemGuralny. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var cityAndStateLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    
    var userData: UserInfo! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = userData.userName
        firstnameLabel.text = userData.firstName
        lastNameLabel.text = userData.lastName
        genderLabel.text = userData.genderTitle
        cityAndStateLabel.text = "\(userData.state), \(userData.city)"
        
        let url = NSURL(string: userData.userImageURL)
        let data = NSData(contentsOf: url! as URL)

        userImage.image = UIImage(data: data! as Data)
    }
}
