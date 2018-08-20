//
//  Parser.swift
//  Random User
//
//  Created by Артём Гуральник on 8/19/18.
//  Copyright © 2018 ArtemGuralny. All rights reserved.
//


import Foundation

typealias JSONDict = [String: Any]

extension Dictionary where Key == String {
    
    func string(_ key: String) -> String? {
        
        if let value = self[key] as? String {
            
            return value
        } else {
            
            print("No parameter '\(key)'")
            return nil
        }
    }
    
    func array(_ key: String) -> [JSONDict] {
        
        if let value = self[key] as? [JSONDict] {
            
            return value
        } else {
            
            print("No parameter '\(key)'")
            return []
        }
    }
    
    func dict(_ key: String) -> JSONDict? {
        
        if let value = self[key] as? JSONDict{
            
            return value
        } else {
            
            print("No parameter '\(key)'")
            return nil
        }
    }
}
