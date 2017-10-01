//
//  PodcastFeedParser.swift
//  PragmaticPodcasts
//
//  Created by Martin Rist on 24/09/2017.
//  Copyright © 2017 Martin Rist. All rights reserved.
//

import Foundation

class PodcastFeedParser {
    
    init(contentsOf url: URL) {
        // The default configuration puts network requests on the background
        // queue, which means we can't do any UI updating code in it
        let urlSession = URLSession(configuration: .default)

        let dataTask = urlSession.dataTask(with: url)
        { dataMb, responseMb, errorMb in
            if let data = dataMb {
                if let dataString = String(data: data, encoding: .utf8) {
                    print ("PodcastFeedParser got data \(dataString)")
                }
            }
        }
        
        dataTask.resume()
    }
}
