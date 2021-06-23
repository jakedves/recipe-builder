//
//  DataSaver.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 02/06/2021.
//

import Foundation

class DataSaver {
    static let encoder = JSONEncoder()
    static let defaults = UserDefaults.standard
    
    private init() {}
    
    static func encode<T: Encodable>(_ item: T) {
        if let encodedItem = try? encoder.encode(item) {
            defaults.set(encodedItem, forKey: "recipe")
        }
    }
}
