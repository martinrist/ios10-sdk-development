//
//  EpisodeListViewController.swift
//  PragmaticPodcasts
//
//  Created by Martin Rist on 01/10/2017.
//  Copyright © 2017 Martin Rist. All rights reserved.
//

import UIKit

class EpisodeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var table: UITableView!
 
    var feeds : [PodcastFeed] = [] {
        didSet {
            // since this touches UIKit, it needs to do so on
            // the main queue
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds[section].episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let episode = feeds[indexPath.section].episodes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as! EpisodeCell
        cell.titleLabel.text = episode.title
        cell.durationLabel.text = episode.iTunesDuration
        
        cell.artworkImageView.image = nil
        if let url = episode.iTunesImageURL {
            cell.loadingImageURL = url
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: url) {
                dataMb, responseMb, errorMb in
                if let data = dataMb, url == cell.loadingImageURL {
                    DispatchQueue.main.async {
                        cell.artworkImageView.image = UIImage(data: data)
                    }
                }
            }
            dataTask.resume()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let feed = feeds[section]
        return feed.title
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlayer",
            let playerVC = segue.destination as? PlayerViewController,
            let indexPath = table.indexPathForSelectedRow {
            let episode = feeds[indexPath.section].episodes[indexPath.row]
            playerVC.episode = episode
        }
    }
    
    @IBAction func unwindToEpisodeList(_ segue: UIStoryboardSegue) {
        if let addPodcastVC = segue.source as? AddPodcastViewController,
            let urlText = addPodcastVC.urlField.text,
            let url = URL(string: urlText) {
            let parser = PodcastFeedParser(contentsOf: url)
            parser.onParserFinished = {
                [weak self] in
                if let feed = parser.currentFeed {
                    self?.feeds.append(feed)
                }
            }
        }
    }
}
