//
//  PragmaticPodcastsTests.swift
//  PragmaticPodcastsTests
//
//  Created by Martin Rist on 22/09/2017.
//  Copyright © 2017 Martin Rist. All rights reserved.
//

import XCTest
import CoreMedia


// The `@testable` annotation opens up the `internal` members (which would otherwise
// not be visible outside the module
@testable import PragmaticPodcasts

class PragmaticPodcastsTests: XCTestCase {
    
    // This has to be optional, because it's set up by `setUp()`, not by the class initialiser
    var playerVC : ViewController?
    
    // This is the test expectation that will be fulfilled when the player starts playing
    var startedPlayingExpectation : XCTestExpectation?
    
    // This is the timer we're going to use to periodically check whether playing has started
    var startedPlayingTimer : Timer?
    
    override func setUp() {
        super.setUp()
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let playerVC = storyBoard.instantiateViewController(withIdentifier: "PlayerViewController") as? ViewController
            else {
                return
        }
        
        playerVC.loadViewIfNeeded()
        self.playerVC = playerVC
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPlayerTitleLabel_WhenURLSet_ShowsCorrectFilename() {
        
        guard let playerVC = playerVC
            // This means `playerVC` wasn't set in the setup method, so just fail
            else {
                XCTFail("Couldn't load player scene")
                return
        }
        
        XCTAssertEqual("CocoaConf001.m4a", playerVC.titleLabel.text)
    }
    
    func testPlayerPlayPauseButton_WhenPlaying_ShowsPause() {
        guard let playerVC = playerVC
            else {
                XCTFail("Couldn't load player scene")
                return
        }
        
        playerVC.handlePlayPauseTapped(self)
        XCTAssertEqual("Pause", playerVC.playPauseButton.title(for: .normal))
    }
    
    func testPlayerCurrentTime_WhenPlaying_IsNonZero() {
        guard let playerVC = playerVC
            else {
                XCTFail("Couldn't load player scene")
                return
        }
        
        startedPlayingExpectation = XCTestExpectation(description: "Player starts playing when tapped")
        startedPlayingTimer = Timer.scheduledTimer(timeInterval: 1.0,
                                                   target: self,
                                                   selector: #selector(timedPlaybackChecker),
                                                   userInfo: nil,
                                                   repeats: true)
        playerVC.handlePlayPauseTapped(self)
        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func timedPlaybackChecker(timer : Timer) {
        if let player = playerVC?.player, player.currentTime().seconds > 0 {
            startedPlayingExpectation?.fulfill()
            startedPlayingTimer?.invalidate()
        }
    }
}
