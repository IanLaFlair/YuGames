//
//  GameTableViewCell.swift
//  YuGame
//
//  Created by MacBook Pro on 03/08/20.
//  Copyright © 2020 KaryaLokalStudio. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var imageGame: UIImageView!
    @IBOutlet weak var titleGame: UILabel!
    @IBOutlet weak var ratingGame: UILabel!
    @IBOutlet weak var releaseGame: UILabel!
    @IBOutlet weak var overlayBack: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
  
}
