//
//  BoxOfficeViewController.swift
//  ios8_rotten_tomatoes
//
//  Created by Stanley Ng on 9/12/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class BoxOfficeViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var refreshControl = UIRefreshControl()
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("BoxOfficeViewController - viewDidLoad")
    
        // setup table view
        tableView.rowHeight = 120
        tableView.dataSource = self
        tableView.delegate = self
        
        // setup table view's refresh control
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: "doRefresh:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
        
        // setup search bar
        searchBar.delegate = self
        
        // setup rotten tomatoes client
        var client = RottenTomatoesClient()
        var params = ["limit": "10"]
        client.boxOfficeWithParams(params,
            success: { (operation, response) -> Void in
                self.movies = response as [Movie]
                println("movies.count = \(self.movies.count)")
                self.tableView.reloadData()
            },
            failure: { (operation, error) -> Void in
                println("err")
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doRefresh(sender: AnyObject) {
        println("BoxOfficeViewController - doRefresh")
        var client = RottenTomatoesClient()
        var params = ["limit": "10"]
        client.boxOfficeWithParams(params,
            success: { (operation, response) -> Void in
                self.movies = response as [Movie]
                println("movies.count = \(self.movies.count)")
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            },
            failure: { (operation, error) -> Void in
                println("err")
        })
    }
    
    func doSearch(sender: AnyObject, terms: String) {
        println("BoxOfficeViewController - doSearch. terms: \(terms)")
        var client = RottenTomatoesClient()
        var params = ["limit": "10", "q": terms]
        client.searchWithParams(params,
            success: { (operation, response) -> Void in
                self.movies = response as [Movie]
                println("movies.count = \(self.movies.count)")
                self.tableView.reloadData()
            },
            failure: { (operation, error) -> Void in
                println("err")
        })
    }
    
    // MARK: - UISearchBarDelegate

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        println("BoxOfficeViewController - searchBarSearchButtonClicked")
        
        searchBar.resignFirstResponder()
        doSearch(self, terms: searchBar.text)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        println("BoxOfficeViewController - searchBarCancelButtonClicked")
        searchBar.resignFirstResponder()
        doRefresh(self)
    }
    
    // MARK: - UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //println("BoxOfficeViewController - cellForRowAtIndexPath: \(indexPath.row)")

        //let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        let cell = tableView.dequeueReusableCellWithIdentifier("BoxOfficeMovieCell") as BoxOfficeMovieTableViewCell
        cell.movie = movies[indexPath.row] as Movie
        cell.configure()
        
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("BoxOfficeViewController - didSelectRowAtIndexPath: indexPath.row = \(indexPath.row)")
        
        // Push to Movie view
        performSegueWithIdentifier("MovieFromBoxOffice", sender: self)

        // Deselect selected row
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let indexPath = tableView.indexPathForSelectedRow()
        println("BoxOfficeViewController - prepareForSegue: indexPath.row = \(indexPath!.row)")
        
        var destinationViewController = segue.destinationViewController as MovieViewController
        var movie = self.movies[indexPath!.row]
        destinationViewController.movie = movie
    }
}
