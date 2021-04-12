//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Satya Prakash Sahu on 06/04/21.
//

import Foundation

extension Bundle    {
    func decode<T: Codable>(_ file : String) -> T {
        // 1. Locare the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // 2. Create a property for the data.
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // 3. Create the decoder.
        let decoder = JSONDecoder()
        
        
        // 4. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data)
            else {
                fatalError("Error")
        }
        
        // 5. Return the ready to use data.
        return loaded
        
        
    }
}
