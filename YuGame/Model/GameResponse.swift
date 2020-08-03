//
//  GameResponse.swift
//  YuGame
//
//  Created by MacBook Pro on 01/08/20.
//  Copyright © 2020 KaryaLokalStudio. All rights reserved.
//

import Foundation

struct GameResponse: Decodable{
    let count: Int
    let list: [GameModel]
    
    enum CodingKeys: String, CodingKey{
        case count
        case list = "results"
    }
}
