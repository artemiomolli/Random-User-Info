//
//  ApiManager.swift
//  Random User
//
//  Created by Артём Гуральник on 8/19/18.
//  Copyright © 2018 ArtemGuralny. All rights reserved.
//

import Foundation


fileprivate enum RandomUserEndoints: String {
    
    case kBaseURL = "https://randomuser.me/api?results=20"
}

class ApiManager {
    
    static let sharedInstanse  = ApiManager()

    //MARK: - Public methods
    
    func getUserList(completion: @escaping ([UserInfo], Error?) -> Void) {
        

        let url = URL(string:RandomUserEndoints.kBaseURL.rawValue )!
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in

            var usersList = [UserInfo]()
            if let dataParse = data {
                
                usersList = self.parseUsersJSON(from: dataParse)
            }
            
            if let error = error {
                print(error)
            }
            
            completion(usersList, error)
        }
        
        task.resume()
    }

         //MARK: - Private methods
    
    
    private func parseUsersJSON(from data: Data) -> [UserInfo] {
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                
                var users = [UserInfo]()
                
                for userJSON in json.array("results") {
                    
                    if let user = UserInfo(json: userJSON) {
                        
                        users.append(user)
                    }
                }
                return users
            }
        } catch {
            
            print("Can`t parse JSON: \(error)")
            
            if let utf8String = String(data: data, encoding: String.Encoding.utf8) {
                
                print("Received: \(utf8String)")
            }
        }
        
        return []
    }
}
