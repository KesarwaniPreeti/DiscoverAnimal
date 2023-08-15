//
//  Extension.swift
//  animalapp
//
//  Created by Preeti Kesarwani on 7/26/23.
//

import Foundation
import UIKit

extension Bundle {
    func decode<T: Codable>(_ file : String , _ FileExtension : String) -> T{
        guard let url = url(forResource: file, withExtension: FileExtension) else {
            fatalError("error")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("data error")
        }
        let decoded = JSONDecoder()
        guard let loaded = try? decoded.decode(T.self, from: data) else {
            fatalError("failed to decoded")
        }
        return loaded
    }
}
