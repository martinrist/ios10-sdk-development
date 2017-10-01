//
//  PodcastFeed.swift
//  PragmaticPodcasts
//
//  Created by Martin Rist on 01/10/2017.
//  Copyright © 2017 Martin Rist. All rights reserved.
//

import Foundation

struct PodcastFeed {
    
    var title : String?
    var link : URL?
    var description : String?
    var iTunesAuthor : String?
    var iTunesImageURL : URL?
    var episodes : [PodcastEpisode] = []
}
