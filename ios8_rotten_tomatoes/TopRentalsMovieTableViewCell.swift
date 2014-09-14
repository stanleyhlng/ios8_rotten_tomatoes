//
//  TopRentalsMovieTableViewCell.swift
//  ios8_rotten_tomatoes
//
//  Created by Stanley Ng on 9/14/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class TopRentalsMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: Movie! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure() {
        if movie == nil {
            return
        }
        setupTitle()
        setupSynopsis()
        setupPoster()
    }
    
    func setupTitle() {
        titleLabel.text = movie.title
        titleLabel.sizeToFit()
    }
    
    func setupSynopsis() {
        synopsisLabel.text = movie.synopsis
        synopsisLabel.sizeToFit()
        //println(synopsisLabel.frame.size)
    }
    
    func setupPoster() {
        let posters = movie.posters as Dictionary<String, String>
        let url = NSURL.URLWithString(posters["profile"]!)
        let imageData: NSData = NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: nil)
        
        posterImageView.alpha = 0
        posterImageView.image = UIImage(data: imageData)
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.posterImageView.alpha = 1
        })
    }

}
