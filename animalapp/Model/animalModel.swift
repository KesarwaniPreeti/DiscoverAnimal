//
//  animalModel.swift
//  animalapp
//
//  Created by Preeti Kesarwani on 7/25/23.
//

import Foundation

struct animalModel  : Codable{
    
    let id : String
    let name: String
    let headline : String
    let description : String
    let link : String
    let image : String
    let gallery : [String]
    let fact : [String]
}
