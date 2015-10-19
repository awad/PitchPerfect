//
//  PlayAudioViewController.swift
//  PitchPerfect
//
//  Created by Amit Wadhwa on 10/6/15.
//  Copyright © 2015 Amit Wadhwa. All rights reserved.
//

import UIKit
import AVFoundation

class PlayAudioViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    @IBOutlet weak var stopButton: UIButton!
    var receivedAudio: RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.hidden = true
//        if let filePath = NSBundle.mainBundle().pathForResource("AppDelegate", ofType: "mp3"){
//        let filePathUrl = NSURL.fileURLWithPath(filePath);
//        audioPlayer = try!
//            AVAudioPlayer(contentsOfURL: filePathUrl);
//        audioPlayer.enableRate = true
//        }
//        else{
//            print("error opening file")
//        }
        
        audioPlayer = try! AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        audioPlayer.enableRate = true;
        // Do any additional setup after loading the view.
        let audioSession: AVAudioSession = AVAudioSession.sharedInstance();
        
        do{
            try audioSession.overrideOutputAudioPort(AVAudioSessionPortOverride.Speaker)
            try audioSession.setActive(true)
        }
        catch let error as NSError{
            print(error.description)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playFast(sender: UIButton) {
        stopButton.hidden = false
        audioPlayer.rate = 1.5
        audioPlayer.play()
    }
    @IBAction func playSlow(sender: UIButton) {
        stopButton.hidden = false
        audioPlayer.rate = 0.5
        audioPlayer.play()
    }


    @IBAction func stopAudio(sender: UIButton) {
        audioPlayer.currentTime = 0
        audioPlayer.stop()
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
