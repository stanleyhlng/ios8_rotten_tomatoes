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
    @IBOutlet weak var posterImageView: UIImageView!
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Do any additional setup after loading the view.
        println("MovieViewController - viewDidLoad")
        dump(movie);
        
        if movie != nil {

            // nav.title
            //navigationItem.title = movie.title
            
            // movie.title
            titleLabel.text = "》" + movie.title + "．"
            titleLabel.sizeToFit()
            println("titleLabel.frame.size = \(titleLabel.frame.size)")
            
            // movie.synopsis
            synopsisLabel.text = movie.synopsis
            synopsisLabel.sizeToFit()
            synopsisLabel.frame.origin.y = titleLabel.frame.origin.y
                + titleLabel.frame.size.height
                + 50
            println("synopsisLabel.frame.size = \(synopsisLabel.frame.size)")
            
            // content
            contentView.sizeToFit()
            println("contentView.frame.size = \(contentView.frame.size)")
            
            // movie.poster
            /*
            var posters = [
                "lo_res": NSURL(string: movie.posters["profile"]!),
                "hi_res": NSURL(string: movie.posters["original"]!)
                ]
            //posterImageView.setImageWithURL(posters["lo_res"])
            //posterImageView.setImageWithURLRequest(NSURLRequest(URL: posters["lo_res"]!), placeholderImage: UIImage(named: "movie-image-placeholder"), success: , failure: nil)
            posterImageView.setImageWithURLRequest(NSURLRequest(URL: posters["lo_res"]!), placeholderImage: UIImage(named: "movie-image-placeholder"), success: { (request:NSURLRequest!, response: NSHTTPURLResponse!, image: UIImage!) -> Void in
                
                    println("success")
                    self.posterImageView.image = image!
                    
                    // hi-res
                    var hiResUrl = (self.movie.posters["original"]! as String).stringByReplacingOccurrencesOfString("_tmb.jpg", withString: "_ori.jpg", options: NSStringCompareOptions.LiteralSearch, range: nil)

                    let url = NSURL.URLWithString(hiResUrl)
                    let imageData: NSData = NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: nil)

                    //self.posterImageView.alpha = 0
                    self.posterImageView.image = UIImage(data: imageData)
                    //UIView.animateWithDuration(0.4, animations: { () -> Void in
                    //    self.posterImageView.alpha = 1
                    //})
                
                }, failure: { (request: NSURLRequest!, response: NSHTTPURLResponse!, error: NSError!) -> Void in
                println("fail")
            })
            */
            var url = NSURL.URLWithString(self.movie.posters["profile"]!)
            var imageData: NSData = NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: nil)
            
            self.posterImageView.alpha = 0
            self.posterImageView.image = UIImage(data: imageData)
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                self.posterImageView.alpha = 1

            }, completion: { (Bool) -> Void in

                // Load hi-resolution poster
                var hiResUrl = (self.movie.posters["original"]! as String).stringByReplacingOccurrencesOfString("_tmb.jpg", withString: "_ori.jpg", options: NSStringCompareOptions.LiteralSearch, range: nil)
                url = NSURL.URLWithString(hiResUrl)
                imageData = NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: nil)
                self.posterImageView.image = UIImage(data: imageData)

            })
            
            self.contentView.alpha = 0
            UIView.animateWithDuration(1.0, delay: 2.5, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                self.contentView.alpha = 0.8
            }, completion: nil)
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
