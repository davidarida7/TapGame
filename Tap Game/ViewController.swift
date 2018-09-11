//
//  ViewController.swift
//  Tap Game
//
//  Created by David Arida on 1/21/17.
//  Copyright © 2017 David Arida. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    
    var audioPlayer = AVAudioPlayer()
    
    var playerOneTapCount = 0
    var playerTwoTapCount = 0
    var isGameStarted = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            
        }
        
        catch {
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func start(_ sender: Any) {
        self.isGameStarted = true
        playerOneTapCount = 0
        playerTwoTapCount = 0
        updateUI()
        audioPlayer.play()
        let _ = Timer.scheduledTimer(withTimeInterval:10, repeats: false) { (_) in
            //Stop game
            self.isGameStarted = false
            if self.playerOneTapCount > self.playerTwoTapCount {
                let alertController = UIAlertController(title: "Game Over!", message: "Hillary Clinton Wins! Click OK to exit and press START to play again.", preferredStyle: UIAlertControllerStyle.alert)
                
                // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                    (result : UIAlertAction) -> Void in
                    print("OK")
                }

                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            } else if self.playerOneTapCount == self.playerTwoTapCount {
                let alertController = UIAlertController(title: "Game Over!", message: "It's a tie! Click OK to exit and press START to play again.", preferredStyle: UIAlertControllerStyle.alert)
                
                // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                    (result : UIAlertAction) -> Void in
                    print("OK")
                }
                
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            } else {
                let alertController = UIAlertController(title: "Game Over!", message: "Donald Trump Wins! Click OK to exit and press START to play again.", preferredStyle: UIAlertControllerStyle.alert)
                
                // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                    (result : UIAlertAction) -> Void in
                    print("OK")
                }
                
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }

    @IBAction func playerOneTap(_ sender: Any) {
        playerOneTapCount += 1
        updateUI()
    }
    
    @IBAction func playerTwoTap(_ sender: Any) {
        playerTwoTapCount += 1
        updateUI()
    }
    
    func updateUI() {
        if isGameStarted {
            playerOneScore.text = "Hillary Clinton Score: \(playerOneTapCount)"
            playerTwoScore.text = "Donald Trump Score: \(playerTwoTapCount)"
        }
    }
    
}

