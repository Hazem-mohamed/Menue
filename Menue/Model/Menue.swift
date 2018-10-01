//
//  Menue.swift
//  Menue
//
//  Created by Hazem Mohammed on 9/26/18.
//  Copyright © 2018 Hazem Mohammed. All rights reserved.
//

import Foundation
//Hello
struct Menue: Decodable {
    
    let message: String
    let result: foodCategory
}

struct foodCategory: Decodable {


    let foodCategory: [mainCategory]
}

struct mainCategory: Decodable {
    
    let name: String
    let created_at: String
    let foods: [subCategory]
}

struct subCategory: Decodable {
    
    let name: String
    let price: String
}
