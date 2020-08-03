//
//  ViewController.swift
//  YuGame
//
//  Created by MacBook Pro on 25/07/20.
//  Copyright © 2020 KaryaLokalStudio. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var tableGame: UITableView!
    @IBOutlet weak var searchGame: UISearchBar!
    var items: [Displayable] = []
    var game: [GameModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getGame()
        searchGame.delegate = self
        tableGame.dataSource = self
        tableGame.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "GameCell")
    }
    
   override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension ViewController{
    func getGame(){
        AF.request("https://api.rawg.io/api/games?page_size=10")
            .validate()
            .responseDecodable(of: GameResponse.self){(response) in
                guard let games = response.value else {return}
                self.items = games.list
                self.game = games.list
                self.tableGame.reloadData()
        }
    }
    func searchGame(for name: String){
        let url = "https://api.rawg.io/api/games"
        let parameter: [String:String] = ["search":name]
        AF.request(url, parameters: parameter)
            .validate()
            .responseDecodable(of: GameResponse.self){(response) in
                guard let games = response.value else {return}
                self.items = games.list
                self.tableGame.reloadData()
        }
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let gameName = searchBar.text else {return}
        searchGame(for: gameName)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
      searchBar.text = nil
      searchBar.resignFirstResponder()
      items = game
      tableGame.reloadData()
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameTableViewCell
        let item = items[indexPath.row]
    
        cell.titleGame?.text = item.titleGame
        let ratingValue = item.ratingGame
        cell.ratingGame?.text = String(ratingValue)
        let url = URL(string: item.imageGame)
        cell.imageGame.kf.setImage(with: url)
        cell.releaseGame.text = "Release: \(item.releaseGame)"
        cell.imageGame.layer.cornerRadius = 16.0
        cell.imageGame.layer.masksToBounds = true
        cell.overlayBack.layer.cornerRadius = 16.0
        
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        UIView.animate(withDuration: 0.75){
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
        return cell
    }
}
