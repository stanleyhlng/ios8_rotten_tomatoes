//
//  BoxOfficeMovieTableViewCell.swift
//  ios8_rotten_tomatoes
//
//  Created by Stanley Ng on 9/13/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class BoxOfficeMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
