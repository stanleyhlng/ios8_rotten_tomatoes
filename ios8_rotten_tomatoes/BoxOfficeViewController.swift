//
//  BoxOfficeViewController.swift
//  ios8_rotten_tomatoes
//
//  Created by Stanley Ng on 9/12/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class BoxOfficeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("BoxOfficeViewController - viewDidLoad")
    
        // configure table view
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "com.stanleyhlng.demo.cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("BoxOfficeViewController - cellForRowAtIndexPath: \(indexPath.row)")

        //let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        let cell = tableView.dequeueReusableCellWithIdentifier("com.stanleyhlng.demo.cell") as UITableViewCell
        cell.textLabel?.text = "Hello" as NSString
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
        
        var movie = Movie()
        movie.title = "Guardians of the Galaxy \(indexPath!.row)"
        movie.synopsis = "From Marvel, the studio that brought you the global blockbuster franchises of Iron Man, Thor, Captain America and The Avengers, comes a new team-the Guardians of the Galaxy. An action-packed, epic space adventure, Marvel's \"Guardians of the Galaxy\" expands the Marvel Cinematic Universe into the cosmos, where brash adventurer Peter Quill finds himself the object of an unrelenting bounty hunt after stealing a mysterious orb coveted by Ronan, a powerful villain with ambitions that threaten the entire universe. To evade the ever-persistent Ronan, Quill is forced into an uneasy truce with a quartet of disparate misfits-Rocket, a gun-toting raccoon, Groot, a tree-like humanoid, the deadly and enigmatic Gamora and the revenge-driven Drax the Destroyer. But when Quill discovers the true power of the orb and the menace it poses to the cosmos, he must do his best to rally his ragtag rivals for a last, desperate stand-with the galaxy's fate in the balance. (C) Walt Disney"
        movie.posters["thumbnail"] = "http://content8.flixster.com/movie/11/17/80/11178082_tmb.jpg"
        movie.posters["profile"] = "http://content8.flixster.com/movie/11/17/80/11178082_pro.jpg"
        movie.posters["detailed"] = "http://content8.flixster.com/movie/11/17/80/11178082_tmb.jpg"
        movie.posters["original"] = "http://content8.flixster.com/movie/11/17/80/11178082_ori.jpg"
        
        var destinationViewController = segue.destinationViewController as MovieViewController
        destinationViewController.movie = movie
    }

}
