//
//  MovieViewController.swift
//  ios8_rotten_tomatoes
//
//  Created by Stanley Ng on 9/12/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("MovieViewController - viewDidLoad")
        dump(movie);
        
        // nav title
        if movie != nil {
            self.navigationItem.title = movie.title
        }
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
