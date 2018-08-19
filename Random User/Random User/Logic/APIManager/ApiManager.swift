//
//  ApiManager.swift
//  Random User
//
//  Created by Артём Гуральник on 8/19/18.
//  Copyright © 2018 ArtemGuralny. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

typealias CompletionBlock = (JSON?, Error?) -> Void


class ApiManager {
    
    //MARK: - Helpers
    
    private func performRequest(url: String, method: HTTPMethod, params: Parameters?, headers: HTTPHeaders?, completion: @escaping CompletionBlock) {
        
        Alamofire.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in

            switch response.result {

            case .success(let value):
                let json = JSON(value)
                completion(json, nil)

            case .failure(let error):
                completion(nil,error)
            }
        }
    }
}
