//
//  EpisodeCell.swift
//  PragmaticPodcasts
//
//  Created by Martin Rist on 01/10/2017.
//  Copyright © 2017 Martin Rist. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet var artworkImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    
    var loadingImageURL : URL?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
