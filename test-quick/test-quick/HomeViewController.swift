//
//  HomeViewController.swift
//  test-quick
//
//  Created by HungNV on 3/18/20.
//  Copyright © 2020 HungNV. All rights reserved.
//

import UIKit

enum Genre: Int {
    case Animation
    case Action
    case None
}

struct Movie {
    var title: String
    var genre: Genre
    
    func genreString() -> String {
        switch genre {
        case .Action:
            return "Action"
        case .Animation:
            return "Animation"
        default:
            return "None"
        }
    }
}

class MoviesDataHelper {
    
    static func getMovies() -> [Movie] {
        return [
            Movie(title: "The Emoji Movie", genre: .Animation),
            Movie(title: "Logan", genre: .Action),
            Movie(title: "Wonder Woman", genre: .Action),
            Movie(title: "Zootopia", genre: .Animation),
            Movie(title: "The Baby Boss", genre: .Animation),
            Movie(title: "Despicable Me 3", genre: .Animation),
            Movie(title: "Spiderman: Homecoming", genre: .Action),
            Movie(title: "Dunkirk", genre: .Animation)
        ]
    }
}

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var movies: [Movie] {
        return MoviesDataHelper.getMovies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Table view data source
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell")

        let movie = movies[indexPath.row]
        cell?.textLabel?.text = movie.title
        cell?.detailTextLabel?.text = movie.genreString()

        return cell!
    }
}

