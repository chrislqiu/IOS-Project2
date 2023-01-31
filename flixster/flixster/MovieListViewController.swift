//
//  MovieListViewController.swift
//  flixster
//
//  Created by Chris Qiu on 1/20/23.
//

import UIKit
import Nuke

class MovieListViewController: UIViewController,
                                UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movieView = movie[indexPath.row]
        cell.configure(with: movieView)
        return cell
    }
    
    //var movies: [Movie] = [Movie]()
    var movie: [Movie] = [];
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        movies = MoviesResponse.loadJson()
//
//        for movie in movies {
//            print(movie.original_title)
//        }
        
        movie = Movie.movieList
        print(movie)
        tableView.dataSource = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            print("WORKS")
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = tableView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {
            
            // Use the index path to get the associated movie
            let mov = movie[indexPath.row]
            
            // Set the movie on the detail view controller
            detailViewController.movie = mov
        }

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {

            // Deselect the row at the corresponding index path
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
