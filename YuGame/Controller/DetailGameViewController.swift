//
//  DetailGameViewController.swift
//  YuGame
//
//  Created by MacBook Pro on 03/08/20.
//  Copyright © 2020 KaryaLokalStudio. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class DetailGameViewController: UIViewController {

    @IBOutlet weak var imgGameDetail: UIImageView!
    @IBOutlet weak var titleGameDetail: UILabel!
    @IBOutlet weak var ratingGameDetail: UILabel!
    @IBOutlet weak var descriptionGameDetail: UILabel!
    
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetail(for: id!)
        
    }

}

extension DetailGameViewController{
    func getDetail(for idGame: Int){
        AF.request("https://api.rawg.io/api/games/\(idGame)")
            .validate()
            .responseDecodable(of: DetailModel.self){(response) in
                guard let detail = response.value else {return}
                self.titleGameDetail.text = detail.name
                let rating = detail.rating
                self.ratingGameDetail.text = String(rating)
                self.descriptionGameDetail.text = detail.description_raw
                let url = URL(string: detail.background_image)
                self.imgGameDetail.kf.setImage(with: url)
        }
    }
}
