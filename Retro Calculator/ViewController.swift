//
//  ViewController.swift
//  Retro Calculator
//
//  Created by Marc Aupont on 1/20/16.
//  Copyright © 2016 Digimark Technical Solutions. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var outputLabel: UILabel!
    
    @IBAction func numberPressed(btn: UIButton!) {
        
        btnSound.play()
        
    }
    
    var btnSound:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Path of Audio file(btn.wav)
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            
            btnSound.prepareToPlay()
            
        } catch let error as NSError{
            
            print(error.debugDescription)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

