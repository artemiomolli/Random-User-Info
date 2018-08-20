//
//  User.swift
//  Random User
//
//  Created by Артём Гуральник on 8/19/18.
//  Copyright © 2018 ArtemGuralny. All rights reserved.
//

import Foundation

struct UserInfo {
    
    let firstName: String
    let lastName: String
    let genderTitle: String
    let state: String
    let city: String
    let userName: String
    let userImageURL: String
    
    
    init?(json: [String: Any]) {
        
        guard let nameUser = json.dict("name") else {
            
            return nil
        }
        
        guard let firstNameUset = nameUser.string("first") else {
            
            return nil
        }
        
        guard let lastNameUser = nameUser.string("last") else {
            
            return nil
        }
        
        guard let usersImage = json.dict("picture")?.string("large") else {
            
            return nil
            
        }
        
        guard let gender = nameUser.string("title") else {
       
            return nil
        }
        
        guard let stateData = json.dict("location")?.string("state") else {
            
            return nil
            
        }
        
        
        guard let cityData = json.dict("location")?.string("city") else {
            
            return nil
            
        }
        
        guard let loginUsername = json.dict("login")?.string("username") else {
            
            return nil
            
        }
        self.firstName = firstNameUset
        self.lastName = lastNameUser
        self.genderTitle = gender
        self.state = stateData
        self.city = cityData
        self.userName = loginUsername
        self.userImageURL = usersImage
    }
}
