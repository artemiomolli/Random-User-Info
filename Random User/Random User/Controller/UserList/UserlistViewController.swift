//
//  UserlistViewController.swift
//  Random User
//
//  Created by Артём Гуральник on 8/19/18.
//  Copyright © 2018 ArtemGuralny. All rights reserved.
//

import UIKit
import SVProgressHUD

class UserlistViewController:UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var usersData: [UserInfo]!
    
    // MARK: - View life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.isHidden = true
        
        registerNibs()
        
        SVProgressHUD.show()
        
        ApiManager.sharedInstanse.getUserList { (users: [UserInfo]?, error: Error?) in
            
            if let data = users {
                
                self.usersData = data
                
                self.tableView.isHidden = false
                self.tableView.reloadData()
            }
            
            if let error = error {
                
                SVProgressHUD.dismiss()
                print(error.localizedDescription)
            }
        }
    
    }
    
      // MARK: - Logic
    
    func registerNibs()  {
        
        let userCell = UINib(nibName: "UserTableViewCell", bundle: nil)
        
        tableView.register(userCell, forCellReuseIdentifier: "currentUser")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationController = segue.destination as? InfoViewController {
            
            destinationController.userData = usersData[(tableView.indexPathForSelectedRow?.section)!]
        }
    }
}

extension UserlistViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "currentUser") as! UserTableViewCell
        
        cell.populateCell(userData: self.usersData[indexPath.section])
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if usersData != nil {

            SVProgressHUD.dismiss()
            
            return usersData.count
        } else {
            
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showUserInfo", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.tableView.bounds.size.height / 5
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
}

