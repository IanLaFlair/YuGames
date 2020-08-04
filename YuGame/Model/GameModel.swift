//
//  GameModel.swift
//  YuGame
//
//  Created by MacBook Pro on 01/08/20.
//  Copyright © 2020 KaryaLokalStudio. All rights reserved.
//

import Foundation

struct GameModel: Decodable {
    let id: Int
    let name: String
    let released: String
    let rating: Double
    let background_image: String
    
}

extension GameModel: Displayable{
    var releaseGame: String{
        released
    }
    var ratingGame: Double {
        rating
    }
    
    var imageGame: String {
        background_image
    }
    var titleGame: String {
        name
    }
    var idGame: Int{
        id
    }
}

