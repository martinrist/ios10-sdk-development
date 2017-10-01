//
//  ViewController.swift
//  PragmaticPodcasts
//
//  Created by Martin Rist on 22/09/2017.
//  Copyright © 2017 Martin Rist. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    // @IBOutlet denotes the outlets - links to UI components
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var logoView: UIImageView!
    @IBOutlet var timeLabel: UILabel!
    
    // We've made this optional, so we don't need to
    // init it if it's never clicked
    var player : AVPlayer?
    
    // This is used to hold the return from `addPeriodicTimeObserver`
    // so we can clean it up
    private var playerPeriodicObserver : Any?
    
    var episode : PodcastEpisode? {
        didSet {
            // We call this so that the view is loaded (and all its
            // outlets are available), even when this property is being
            // set by `prepare(for: sender:)` in a segue
            loadViewIfNeeded()
            titleLabel.text = episode?.title
            if let url = episode?.enclosureURL {
                set(url: url)
            }
            if let imageURL = episode?.iTunesImageURL {
                let session = URLSession(configuration: .default)
                let dataTask = session.dataTask(with: imageURL) {
                    dataMb, _, _ in
                    if let data = dataMb {
                        DispatchQueue.main.async {
                            self.logoView.image = UIImage(data: data)
                        }
                    }
                }
                dataTask.resume()
            }
        }
    }
    
    // We are responsible for removing any KVO observers when this
    // object is purged from memory
    deinit {
        player?.removeObserver(self, forKeyPath: "rate")
        if let oldObserver = playerPeriodicObserver {
            player?.removeTimeObserver(oldObserver)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // @IBAction denotes this as an action from the Interface Builder
    // _ supresses the external parameter name
    @IBAction func handlePlayPauseTapped(_ sender: Any) {
        print("handlePlayPauseTapped")
        
        // `?` is the 'optional-chaining operator', which only calls the method
        // if `player` is not `nil`
        //player?.play()
        
        if let player = player {
            if player.rate == 0 {
                print("Playing")
                player.play()
                player.volume = 1.0
            } else {
                print("Pausing")
                player.pause()
            }
        }
    }
    
    func set(url: URL) {
        player = AVPlayer(url: url)
        
        // This object (i.e. the ViewController) is registered as a KVO for the
        // player's `rate` property.  When it changes, `observeValue()` will be called
        player?.addObserver(self, forKeyPath: "rate", options: [], context: nil)
        
        let interval = CMTime(seconds: 0.25, preferredTimescale: 1000)
        
        // Note the use of 'trailing closure' syntax
        // Also, `weak self` is to make sure the closure doesn't prevent
        // the ViewController from being cleared up
        player?.addPeriodicTimeObserver(forInterval: interval,
                                        queue: nil)
                                        { [weak self] currentTime in
                                            self?.updateTimeLabel(currentTime)
                                        }
    }
    
    private func updateTimeLabel(_ currentTime: CMTime) {
        let totalSeconds = currentTime.seconds
        let minutes = Int(totalSeconds / 60)
        let seconds = Int(totalSeconds.truncatingRemainder(dividingBy: 60))
        
        let secondsString = seconds >= 10 ? "\(seconds)" : "0\(seconds)"
        timeLabel.text = "\(minutes):\(secondsString)"
    }
    
    // This is the KVO observer which upates the title of the Play / Pause button
    // based on observing the `AVPlayer`'s `rate` property
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "rate" {
            if let player = object as? AVPlayer {
                playPauseButton.setTitle(player.rate == 0 ? "Play" : "Pause", for: .normal)
            }
        }
    }
    
}

