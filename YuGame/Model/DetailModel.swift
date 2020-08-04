//
//  DetailModel.swift
//  YuGame
//
//  Created by MacBook Pro on 04/08/20.
//  Copyright © 2020 KaryaLokalStudio. All rights reserved.
//

import Foundation

struct DetailModel: Decodable {
    let name: String
    let rating: Double
    let background_image: String
    let description_raw: String
}
