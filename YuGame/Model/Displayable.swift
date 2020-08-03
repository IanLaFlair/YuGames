//
//  Displayable.swift
//  YuGame
//
//  Created by MacBook Pro on 03/08/20.
//  Copyright © 2020 KaryaLokalStudio. All rights reserved.
//

import Foundation

protocol Displayable{
    var idGame: Int {get}
    var titleGame: String {get}
    var imageGame: String {get}
    var releaseGame: String {get}
    var ratingGame: Double {get}
}
