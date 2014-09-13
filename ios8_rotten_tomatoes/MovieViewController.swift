//
//  MovieViewController.swift
//  ios8_rotten_tomatoes
//
//  Created by Stanley Ng on 9/12/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("MovieViewController - viewDidLoad")
        dump(movie);
        
        if movie != nil {

            // nav.title
            //navigationItem.title = movie.title
            
            // content.title
            titleLabel.text = movie.title
            titleLabel.sizeToFit()
            println("titleLabel.frame.size = \(titleLabel.frame.size)")
            
            // content.synopsis
            synopsisLabel.text = movie.synopsis
            synopsisLabel.sizeToFit()
            synopsisLabel.frame.origin.y = titleLabel.frame.origin.y
                + titleLabel.frame.size.height
                + 50
            println("synopsisLabel.frame.size = \(synopsisLabel.frame.size)")
            
            // content
            contentView.sizeToFit()
            println("contentView.frame.size = \(contentView.frame.size)")
        }

        // current screen size
        var bounds = UIScreen.mainScreen().bounds
        
        // configure scroll view
        var insetTop = bounds.height - titleLabel.frame.height - 80
        scrollView.contentInset = UIEdgeInsetsMake(insetTop, 0, 0, 0)
        scrollView.contentSize = contentView.frame.size
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
